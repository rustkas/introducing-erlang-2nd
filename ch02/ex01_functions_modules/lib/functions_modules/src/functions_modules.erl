-module(functions_modules).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

% скорость падающего объекта на основе расстояния, которое он падает в метрах
%% calculates the velocity of a falling object based on the distance it drops in meters
fall_velocity_test() ->
    FallVelocity = fun (Distance) ->
                           math:sqrt(2 * 9.8 * Distance)
                   end,
    ?assertEqual(19.79898987322333, (FallVelocity(20))),
    ?assertEqual(62.609903369994115, (FallVelocity(200))),
    ?assertEqual(197.9898987322333, (FallVelocity(2000))).

% скорость не в метрах в секунду, а в милях в час
%% using meters per second in miles per hour
mps_to_mph_test() ->
    Mps_to_mph = fun (Mps) -> 2.23693629 * Mps end,
    ?assertEqual(44.289078952755766,
                 (Mps_to_mph(19.79898987322333))),
    ?assertEqual(140.05436496173314,
                 (Mps_to_mph(62.609903369994115))),
    ?assertEqual(442.89078952755773,
                 (Mps_to_mph(197.9898987322333))).

% скорость не в метрах в секунду, а в киллометрах в час
%% using meters per second in kilometers per hour
mps_to_kph_test() ->
    Mps_to_kph = fun (Mps) -> 3.6 * Mps end,
    ?assertEqual(71.27636354360399,
                 (Mps_to_kph(19.79898987322333))),
    ?assertEqual(71.27636354360399,
                 (Mps_to_kph(19.79898987322333))),
    ?assertEqual(225.3956521319788,
                 (Mps_to_kph(62.609903369994115))),
    ?assertEqual(712.76363543604,
                 (Mps_to_kph(197.9898987322333))).

% using sequence of functions
mps_to_mph_to_mph_test() ->
    FallVelocity = fun (Distance) ->
                           math:sqrt(2 * 9.8 * Distance)
                   end,
    Mps_to_kph = fun (Mps) -> 3.6 * Mps end,
    ?assertEqual(712.76363543604,
                 (Mps_to_kph(FallVelocity(2000)))).

-endif.
