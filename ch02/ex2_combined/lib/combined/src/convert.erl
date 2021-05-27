-module(convert).

-export([mps_to_mph/1, mps_to_kph/1]).

mps_to_mph(Mps) -> 2.23693629 * Mps.

mps_to_kph(Mps) -> 3.6 * Mps.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

basic_test_() ->
    ?_assertEqual(44.289078952755766,
                  (convert:mps_to_mph(drop:fall_velocity(20)))).

-endif.
