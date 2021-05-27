-module(drop).

-export([fall_velocity/2]).

fall_velocity(Planemo, Distance) when Distance >= 0 ->
    Gravity = case Planemo of
                  earth -> 9.8;
                  moon -> 1.6;
                  mars -> 3.71
              end,
    Velocity = math:sqrt(2 * Gravity * Distance),
    Description = if Velocity == 0 -> stable;
                     Velocity < 5 -> slow;
                     (Velocity >= 5) and (Velocity < 10) -> moving;
                     (Velocity >= 10) and (Velocity < 20) -> fast;
                     Velocity >= 20 -> speedy
                  end,
    if Velocity > 40 ->
           io:format("Look out below! ~w is too high.~n",
                     [Distance]);
       true -> true
    end,
    Description.

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

%% Check io:format output
fall_velocity_look_out( ) -> ?assertEqual( speedy , drop : fall_velocity( earth , 200 ) ) , ?assertEqual( "Look out below! 200 is too high on earth.\n" , ?capturedOutput ) , .

fall_velocity_calculation() ->
    ?assertEqual(fast, (drop:fall_velocity(earth, 20))),
    ?assertEqual(moving, (drop:fall_velocity(moon, 20))),
    ?assertEqual(fast, (drop:fall_velocity(mars, 20))).

check_upsent_platet() ->
    ?assertException(error, {case_clause, _},
                     (drop:fall_velocity(saturn, 20))).

check_wrong_distance() ->
    ?assertError(function_clause,
                 (drop:fall_velocity(earth, -1))).

-endif.
