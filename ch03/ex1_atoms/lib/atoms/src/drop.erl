-module(drop).

-export([fall_velocity/2]).

fall_velocity(earth, Distance) ->
    math:sqrt(2 * 9.8 * Distance);
fall_velocity(moon, Distance) ->
    math:sqrt(2 * 1.6 * Distance);
fall_velocity(mars, Distance) ->
    math:sqrt(2 * 3.71 * Distance).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

atoms_test() ->
    X1 = 1,
    Earth = earth,
    Moon = moon,
    Mars = mars,
    ?assertEqual(4.427188724235731,
                 (drop:fall_velocity(Earth, X1))),
    ?assertEqual(1.7888543819998317,
                 (drop:fall_velocity(Moon, X1))),
    ?assertEqual(2.723967694375247,
                 (drop:fall_velocity(Mars, X1))),
    X2 = 20,
    ?assertEqual(19.79898987322333,
                 (drop:fall_velocity(Earth, X2))),
    ?assertEqual(8.0, (drop:fall_velocity(Moon, X2))),
    ?assertEqual(12.181953866272849,
                 (drop:fall_velocity(Mars, X2))).

% try to use wrong input values in the input
unchecked_error_test() ->
    ?assertError(badarith,
                 (drop:fall_velocity(earth, -20))).

-endif.
