-module(drop).

-export([fall_velocity/2]).

fall_velocity(Planemo, Distance) when Distance >= 0 ->
    Gravity = case Planemo of
                  earth -> 9.8;
                  moon -> 1.6;
                  mars -> 3.71
              end,
    % note comma - function isn't done yet
    math:sqrt(2 * Gravity * Distance).

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
    ?assertEqual(19.79898987322333,
                 (drop:fall_velocity(earth, 20))),
    ?assertEqual(8.0, (drop:fall_velocity(moon, 20))),
    ?assertEqual(12.181953866272849,
                 (drop:fall_velocity(mars, 20))).

check_upsent_platet() ->
    ?assertException(error, {case_clause, _},
                     (drop:fall_velocity(saturn, 20))).

check_wrong_distance() ->
    ?assertError(function_clause,
                 (drop:fall_velocity(earth, -1))).

-endif.
