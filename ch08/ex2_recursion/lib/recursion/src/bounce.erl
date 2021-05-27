-module(bounce).

-export([report/0]).

report() ->
    receive
        X ->
            io:format("Received ~p~n", [X]),
            report()
    end.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

report1_test() ->
    Pid = spawn(bounce, report, []),
    Pid ! 23,
    ?assertEqual("Received 23\n", (?capturedOutput)),
    Pid ! message,
    ?assertEqual("Received 23\nReceived message\n",
                 (?capturedOutput)).

-endif.
