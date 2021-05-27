-module(recordDrop).

-export([fall_velocity/1]).

-include("records.hrl").

fall_velocity(#tower{} = T) ->
    fall_velocity(T#tower.planemo, T#tower.height).

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

check01_test() ->
    Tower1 = #tower{},
    ?assertEqual((#tower{location = undefined, height = 20,
                         planemo = earth, name = undefined}),
                 Tower1),
    Tower2 = #tower{location = "Grand Canyon"},
    ?assertEqual((#tower{location = "Grand Canyon",
                         height = 20, planemo = earth, name = undefined}),
                 Tower2),
    Tower3 = #tower{location = "NYC", height = 241,
                    name = "Woolworth Building"},
    ?assertEqual((#tower{location = "NYC", height = 241,
                         planemo = earth, name = "Woolworth Building"}),
                 Tower3),
    Tower4 = #tower{location = "Rupes Altai 241",
                    height = 500, planemo = moon,
                    name = "Piccolomini View"},
    ?assertEqual((#tower{location = "Rupes Altai 241",
                         height = 500, planemo = moon,
                         name = "Piccolomini View"}),
                 Tower4),
    Tower5 = #tower{planemo = mars, height = 500,
                    name = "Daga Vallis", location = "Valles Marineris"},
    ?assertEqual((#tower{location = "Valles Marineris",
                         height = 500, planemo = mars, name = "Daga Vallis"}),
                 Tower5).

check02_test() ->
    Tower5 = #tower{planemo = mars, height = 500,
                    name = "Daga Vallis", location = "Valles Marineris"},
    ?assertEqual(mars, (Tower5#tower.planemo)),
    #tower{location = L5, height = H5} = Tower5,
    ?assertEqual("Valles Marineris", L5),
    ?assertEqual(500, H5).

check03_test() ->
    Tower5 = #tower{location = "Valles Marineris",
                    height = 500, planemo = mars, name = "Daga Vallis"},
    Tower5a = Tower5#tower{height = 512},
    ?assertEqual((#tower{location = "Valles Marineris",
                         height = 512, planemo = mars, name = "Daga Vallis"}),
                 Tower5a).

-endif.
