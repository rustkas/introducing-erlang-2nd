-module(mnesia_example).

-include_lib("eunit/include/eunit.hrl").

create_schema_test() ->
    CreatingResult = mnesia:create_schema([node()]),
    case CreatingResult of
        ok -> ?assertEqual(ok, CreatingResult);
        {error,
         {nonode@nohost, {already_exists, nonode@nohost}}} ->
            ?assertMatch({error, _}, CreatingResult)
    end,
    ?debugFmt("Created schema: ~n~p~n", [CreatingResult]),
    DeletingResult = mnesia:delete_schema([node()]),
    ?assertEqual(ok, DeletingResult),
    ?debugFmt("Deleting schema: ~n~p~n", [DeletingResult]).

start_test() ->
    mnesia:create_schema([node()]),
    ?assertEqual(ok, (mnesia:start())),
    ?assertEqual(ok, (mnesia:info())),
    % Prepare Mnesia report
    % OTP 20.0
    % PreparedString = string:split(?capturedOutput," \\n"),
    [String] = io_lib:format("~p", [?capturedOutput]),
    StringResult = string:split(String, "\\n", all),
    % NewStringResult = [string:join(string:split(NewString, ",", all),"") || NewString <- StringResult],
    NewStringResult = split(StringResult, []),
    ?debugFmt("StringResult:~n~p~n", [StringResult]),
    ?debugFmt("NewStringResult:~n~p~n", [NewStringResult]),
    % ?debugFmt("~n~p~n",[io_lib:format("~p",[PreparedString])]),
    % ?debugFmt("~p",[?capturedOutput]),
    % ,?assertEqual("On mars, a fall of 20 meters yields a velocity of 27.213504494952623 mph.\n", ?capturedOutput)
    ?assertEqual(stopped, (mnesia:stop())),
    mnesia:delete_schema([node()]).

% Util
split([Head | List], NewString) ->
    % ?debugFmt("~n~p~n",[Head]),
    split(List,
          [string:split(Head, ",", trailing) | NewString]);
split([], NewString) -> lists:reverse(NewString).
