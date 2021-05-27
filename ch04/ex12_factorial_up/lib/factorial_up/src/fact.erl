-module(fact).

-export([factorial/1]).

factorial(N) -> factorial(1, N, 1).

factorial(Current, N, Result) when Current =< N ->
    NewResult = Result * Current,
    io:format("~w yields ~w!~n", [Current, NewResult]),
    factorial(Current + 1, N, NewResult);
factorial(_Current, _N, Result) ->
    io:format("Finished.~n"),
    Result.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Factorial 0", fun factorial_0/0},
     {"Factorial 1", fun factorial_1/0},
     {"Factorial 2", fun factorial_2/0},
     {"Factorial 3", fun factorial_4/0},
     {"Factorial 3", fun factorial_40/0}].

factorial_0() ->
    ?assertEqual(1, (factorial(0))),
    ?assertEqual("Finished.\n", (?capturedOutput)).

factorial_1() ->
    ?assertEqual(1, (factorial(1))),
    ?assertEqual("1 yields 1!\nFinished.\n",
                 (?capturedOutput)).

factorial_2() ->
    ?assertEqual(2, (factorial(2))),
    ?assertEqual("1 yields 1!\n2 yields 2!\nFinished.\n",
                 (?capturedOutput)).

factorial_3() -> ?assertEqual(6, (factorial(3))).

factorial_4() -> ?assertEqual(24, (factorial(4))).

factorial_40() ->
    ?assertEqual(815915283247897734345611269596115894272000000000,
                 (factorial(40))).

-endif.
