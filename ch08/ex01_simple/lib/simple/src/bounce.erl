-module(bounce).

-export([report/0]).

report() ->
    receive X -> io:format("Received ~p~n", [X]) end.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

example1_test() ->
    ?assertEqual(test1, (self() ! test1)),
    Pid = self(),
    ?assertEqual(test2, (Pid ! test2)),
    self() ! test1,
    ?assertEqual(test2, (Pid ! test2)).

example2_test() ->
    self() ! test1,
    ?assertEqual(test1, receive X -> X end).

example3_test1() ->
    self() ! 23,
    ?assertEqual(46, receive Y -> 2 * Y end).

report_test() ->
    Pid = spawn(bounce, report, []),
    Pid ! 23,
    ?assertEqual("Received 23\n", (?capturedOutput)).

-endif.
