-module(drop).

-export([fall_velocity/2]).

fall_velocity(Planemo, Distance) when Distance >= 0 ->
    Gravity = case Planemo of
                  earth -> 9.8;
                  moon -> 1.6;
                  mars -> 3.71
              end,
    % note comma - function isn't done yet
    Velocity = math:sqrt(2 * Gravity * Distance),
    if Velocity == 0 -> stable;
       Velocity < 5 -> slow;
       Velocity >= 5, Velocity < 10 -> moving;
       Velocity >= 10, Velocity < 20 -> fast;
       Velocity >= 20 -> speedy
    end.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Check 3 atom value (earth, moon, mars) "
      "and calculation",
      fun fall_velocity_calculation/0},
     {"Check upsent planet", fun check_upsent_platet/0},
     {"Check wrong Distance", fun check_wrong_distance/0}].

fall_velocity_calculation() ->
    ?assertEqual(fast, (drop:fall_velocity(earth, 20))),
    ?assertEqual(moving, (drop:fall_velocity(moon, 20))),
    ?assertEqual(fast, (drop:fall_velocity(mars, 20))),
    ?assertEqual(speedy, (drop:fall_velocity(earth, 200))).

check_upsent_platet() ->
    ?assertException(error, {case_clause, _},
                     (drop:fall_velocity(saturn, 20))).

check_wrong_distance() ->
    ?assertError(error, {function_clause, _},
                 (drop:fall_velocity(earth, -1))).

-endif.
