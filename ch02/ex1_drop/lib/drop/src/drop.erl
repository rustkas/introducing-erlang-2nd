-module(drop).

-export([fall_velocity/1, mps_to_mph/1, mps_to_kph/1]).

fall_velocity(Distance) ->
    math:sqrt(2 * 9.8 * Distance).

mps_to_mph(Mps) -> 2.23693629 * Mps.

mps_to_kph(Mps) -> 3.6 * Mps.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

basic_test_() ->
    ?_assertEqual(19.79898987322333,
                  (drop:fall_velocity(20))),
    ?_assertEqual(44.289078952755766,
                  (drop:mps_to_mph(drop:fall_velocity(20)))).

using_anonimus_functions_test_() ->
    F_v = fun drop:fall_velocity/1,
    ?_assertEqual(19.79898987322333, (F_v(20))).

-endif.
