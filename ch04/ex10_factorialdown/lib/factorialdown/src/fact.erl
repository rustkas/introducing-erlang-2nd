-module(fact).

-export([factorial/1]).

factorial(N) when N > 1 -> N * factorial(N - 1);
factorial(N) when N =< 1 -> 1.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Factorial 0", fun factorial_0/0},
     {"Factorial 1", fun factorial_1/0},
     {"Factorial 2", fun factorial_2/0},
     {"Factorial 3", fun factorial_3/0},
     {"Factorial 4", fun factorial_4/0},
     {"Factorial 40", fun factorial_40/0}].

factorial_0() -> ?assertEqual(1, (factorial(0))).

factorial_1() -> ?assertEqual(1, (factorial(1))).

factorial_2() -> ?assertEqual(2, (factorial(2))).

factorial_3() -> ?assertEqual(6, (factorial(3))).

factorial_4() -> ?assertEqual(24, (factorial(4))).

factorial_40() ->
    ?assertEqual(815915283247897734345611269596115894272000000000,
                 (factorial(40))).

-endif.
