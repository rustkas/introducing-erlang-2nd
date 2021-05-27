-module(explore_shell).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

calculation_1_test() ->
    ?assertEqual(4, 2 + 2),
    ?assertEqual(13, 27 - 14),
    ?assert(200 / 15 >= 1.33e+1),
    ?assertEqual(13, 200 div 15),
    ?assertEqual(5, 200 rem 15),
    ?assertEqual(57, 3 * (4 + 15)),
    ?assertEqual(13, round(200 / 15)).

function_1_test() ->
    ?assertEqual(0.0, math:sin(0)),
    ?assertEqual(-1.0,
                 math:cos(
                     math:pi())),
    ?assertEqual(1.0, math:cos(2 * math:pi())),
    ?assertEqual(6.5536e+4, math:pow(2, 16)).

big_numbers_1_test() ->
    ?assertEqual(3.48759834759834738842e+42, 3.48759834759834738842e+42),
    ?assertEqual(2.34324334543589362875e+6, 2.34324334543589362875e+6),
    ?assertEqual(2.34324324324322346055e-30, 2.34324324324322346055e-30),
    ?assertEqual(2.92299999999999996001e+127, 2.92299999999999996001e+127),
    ?assertEqual(7.6345435e-231, 7.6345435e-231),
    ?assertEqual(1.22464679914735320717e-16,
                 math:sin(
                     math:pi())).

number_view_1_test() ->
    ?assertEqual(87, 87),
    ?assertEqual(51966, 51966),
    ?assertEqual(51966, 51966),
    ?assertEqual(51966, 51966),
    ?assertEqual(1743080, 1743080),
    ?assertEqual(979209707, 979209707),
    ?assertEqual(-1234, -1234),
    ?assertEqual(-51966, -51966),
    ?assertEqual(-2.045234324e+6, -2.045234324e+6).

-endif.
