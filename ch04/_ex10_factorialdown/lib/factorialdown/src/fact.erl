-module(fact).

-export([factorial/1]).

factorial(N) when N > 1 -> N * factorial(N - 1);
factorial(N) when N =< 1 -> 1.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() -> [{"Factorial 0", fun factorial_0/0}].

factorial_0() -> ?assertEqual(1, (factorial(0))).

-endif.
