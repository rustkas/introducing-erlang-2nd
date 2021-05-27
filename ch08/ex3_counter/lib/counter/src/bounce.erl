-module(bounce).

-export([report/1]).

report(Count) ->
    receive
        X ->
            io:format("Received #~p: ~p~n", [Count, X]),
            report(Count + 1)
    end.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

report1_test() ->
    Pid = spawn(bounce, report, [1]),
    Pid ! 23,
    ?assertEqual("Received #1: 23\n", (?capturedOutput)),
    Pid ! message,
    ?assertEqual("Received #1: 23\nReceived #2: message\n",
                 (?capturedOutput)).

report2_test() ->
    Pid = spawn(bounce, report, [1]),
    Pid ! test,
    ?assertEqual("Received #1: test\n", (?capturedOutput)),
    Pid ! test2,
    ?assertEqual("Received #1: test\nReceived #2: test2\n",
                 (?capturedOutput)).

-endif.
