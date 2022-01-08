-module(count).

-export([countdown/1, countup/1]).

countup(Limit) -> countup(1, Limit).

countup(Count, Limit) when Count =< Limit ->
    io:format("~w!~n", [Count]),
    io:format(countup(Count + 1, Limit));
countup(Count, Limit) when Count > Limit ->
    io:format("Finished.~n").

countdown(From) when From > 0 ->
    io:format("~w!~n", [From]),
    countdown(From - 1);
countdown(_From) when _From =< 0 ->
    io:format("blastoff!~n").

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Countdown. Side effect using 0 as input "
      "value",
      fun countdown_0/0},
     {"Countdown. Side effect using 1 as input "
      "value",
      fun countdown_1/0},
     {"Countdown. Side effect using 2 as input "
      "value",
      fun countdown_2/0},
     {"Countup. Side effect using 0 as input "
      "value",
      fun countup_0/0},
     {"Countup. Side effect using 1 as input "
      "value",
      fun countup_1/0},
     {"Countup. Side effect using 2 as input "
      "value",
      fun countup_2/0}].

countup_0() ->
    countup(0),
    ?assertEqual("Finished.\n", (?capturedOutput)).

countup_1() ->
    countup(1),
    ?assertEqual("1!\nFinished.\nok", (?capturedOutput)).

countup_2() ->
    countup(2),
    ?assertEqual("1!\n2!\nFinished.\nokok",
                 (?capturedOutput)).

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
