-module(count).

-export([countdown/1]).

countdown(From) when From > 0 ->
    io:format("~w!~n", [From]),
    countdown(From - 1);
countdown(_From) -> io:format("blastoff!~n").

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Side effect using 0 as input value",
      fun countdown_0/0},
     {"Side effect using 1 as input value",
      fun countdown_1/0},
     {"Side effect using 2 as input value",
      fun countdown_2/0}].

countdown_0() ->
    countdown(0),
    ?assertEqual("blastoff!\n", (?capturedOutput)).

countdown_1() ->
    countdown(1),
    ?assertEqual("1!\nblastoff!\n", (?capturedOutput)).

countdown_2() ->
    countdown(2),
    ?assertEqual("2!\n1!\nblastoff!\n", (?capturedOutput)).

-endif.
