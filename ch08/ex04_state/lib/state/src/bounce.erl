-module(bounce).

-export([report/1]).

report(Count) ->
    NewCount = receive
                   X ->
                       io:format("Received #~p: ~p~n", [Count, X]),
                       Count + 1
               end,
    report(NewCount).

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

light_process1_test() ->
    GetBounce = whereis(bounce),
    if is_pid(GetBounce) -> unregister(bounce);
       true -> true
    end,
    Pid1 = spawn(bounce, report, [1]),
    try register(bounce, Pid1),
        bounce ! hello,
        ?assertEqual("Received #1: hello\n", (?capturedOutput)),
        bounce ! "Really?",
        ?assertEqual("Received #1: hello\nReceived #2: \"Really?\"\n",
                     (?capturedOutput))
    after
        unregister(bounce)
    end.

proccess_error_test() ->
    ?assertError(badarg, (zingo ! test)).

-endif.
