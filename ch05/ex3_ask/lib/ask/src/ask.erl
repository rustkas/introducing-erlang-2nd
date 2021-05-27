-module(ask).

-export([term/0]).

term() ->
    Input = io:read("What {planemo, distance} ? >>"),
    process_term(Input).

process_term({ok, Term}) when is_tuple(Term) ->
    Velocity = drop:fall_velocity(Term),
    io:format("Yields ~w. ~n", [Velocity]),
    term();
process_term({ok, quit}) ->
    io:format("Goodbye.~n"); %% does not call term() again
process_term({ok, _}) ->
    io:format("You must enter a tuple.~n"),
    term();
process_term({error, _}) ->
    io:format("You must enter a tuple with\r\ncorrect "
              "syntax.~n"),
    term().

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Entering correct data",
      fun input_correct_data/0}].    %   ,{"Is not tuple",  fun is_not_tuple/0}
                                     %   ,{"Is not correct syntax",  fun catch_error_tuple/0}
                                     %   ,{"Raise error",  fun raise_error/0}

input_correct_data() ->
    % Distance = 20,
    % spawn(fun() -> ?cmd("sleep 2 && echo quit") end),
    % ?cmd("echo \"quit\""),
    % term(),
    % ?assertCmd("echo {mars, 20}"),
    % process_term({ok, {mars, Distance}}),
    % ?assertEqual("Yields 12.181953866272849. \nok", ?capturedOutput)
    % ?assertEqual(19.79898987322333, process_term({ok, {earth, Distance}})),
    % ?assertEqual(8.0, process_term({ok, {moon, Distance}})),
    %?assertEqual(12.181953866272849, process_term({ok, {mars, Distance}}))
    ok.

% is_not_tuple()->
%   process_term({ok, "Test"}),
%   ?assertEqual("You must enter a tuple.\n", ?capturedOutput)
%   .

% catch_error_tuple()->

%   process_term(ok),
%   ?assertEqual("You must enter a tuple with correct syntax.\n", ?capturedOutput)
%   .

% raise_error() ->
%   ?assertError(undef, ask:process_term({ok, {ok, ok}}))
%   .

-endif.
