-module(combined).

-export([height_to_mph/1]).

-import(drop, [fall_velocity/1]).

-import(convert, [mps_to_mph/1]).

height_to_mph(Meters) ->
    convert:mps_to_mph(drop:fall_velocity(Meters)).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

basic_test_() ->
    ?_assertEqual(44.289078952755766,
                  (mps_to_mph(fall_velocity(20)))).

-endif.
