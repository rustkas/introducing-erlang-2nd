-module(record_drop).

-export([fall_velocity/1]).

-include("records.hrl").

fall_velocity(#tower{planemo = Planemo,
                     height = Distance} =
                  T) ->
    io:format("From ~s's elevation of ~p meters on "
              "~p, the object will reach ~p m/s before "
              "crashing in ~s.~n",
              [T#tower.name,
               Distance,
               Planemo,
               fall_velocity(Planemo, Distance),
               T#tower.location]).

fall_velocity(earth, Distance) when Distance >= 0 ->
    math:sqrt(2 * 9.8 * Distance);
fall_velocity(moon, Distance) when Distance >= 0 ->
    math:sqrt(2 * 1.6 * Distance);
fall_velocity(mars, Distance) when Distance >= 0 ->
    math:sqrt(2 * 3.71 * Distance).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

check_tower5_test() ->
    Tower5 = #tower{planemo = mars, height = 500,
                    name = "Daga Vallis", location = "Valles Marineris"},
    record_drop:fall_velocity(Tower5),
    ?assertEqual((io_lib:format("From Daga Vallis's elevation of 500 "
                                "meters on mars, the object will reach "
                                "60.909769331364245 m/s before crashing "
                                "in Valles Marineris.~n",
                                [])),
                 (?capturedOutput)).

check_tower3_test() ->
    Tower3 = #tower{location = "NYC", height = 241,
                    name = "Woolworth Building"},
    record_drop:fall_velocity(Tower3),
    ?assertEqual((io_lib:format("From Woolworth Building's elevation "
                                "of 241 meters on earth, the object will "
                                "reach 68.72845116834803 m/s before crashing "
                                "in NYC.~n",
                                [])),
                 (?capturedOutput)).

-endif.
