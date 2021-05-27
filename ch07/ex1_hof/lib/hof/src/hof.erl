-module(hof).

-export([tripler/2]).

tripler(Value, Function) -> 3 * Function(Value).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

example1_test() ->
    Fall_velocity = fun (Distance) ->
                            math:sqrt(2 * 9.8 * Distance)
                    end,
    ?assertEqual(19.79898987322333, (Fall_velocity(20))),
    ?assertEqual(62.609903369994115, (Fall_velocity(200))).

example2_test() ->
    MyFunction = fun (Value) -> 20 * Value end,
    ?assertEqual(360, (hof:tripler(6, MyFunction))).

example3_test() ->
    MyFunction = fun () ->
                         X = 20,
                         MyFunction2 = fun (Value) -> X * Value end,
                         MyFunction2
                 end,
    ?assertEqual(360, (hof:tripler(6, MyFunction()))).

example4_test() ->
    Result = hof:tripler(math:pi(), fun math:cos/1),
    ?assertEqual((-3.0), Result).

example5_test() ->
    Print = fun (Value) -> ?debugFmt(" ~p~n", [Value]) end,
    List = [1, 2, 4, 8, 16, 32],
    lists:foreach(Print, List).

example6_test() ->
    Square = fun (Value) -> Value * Value end,
    List = [1, 2, 4, 8, 16, 32],
    Result = lists:map(Square, List),
    ?assertEqual([1, 4, 16, 64, 256, 1024], Result),
    NewList = [Square(Value) || Value <- List],
    ?assertEqual([1, 4, 16, 64, 256, 1024], Result),
    ?assertEqual([1, 4, 16, 64, 256, 1024],
                 [Value * Value || Value <- List]).

example7_filter_test() ->
    Four_bits = fun (Value) -> (Value >= 0) and (Value < 16)
                end,
    List = [1, 2, 4, 8, 16, 32],
    Result = lists:filter(Four_bits, List),
    ?assertEqual([1, 2, 4, 8], Result).

example8_check_test() ->
    List = [1, 2, 4, 8, 16, 32],
    IsInt = fun (Value) -> is_integer(Value) end,
    ?assert((lists:all(IsInt, List))),
    Compare = fun (Value) -> Value > 10 end,
    ?assertEqual(false, (lists:all(Compare, List))).

example9_test() ->
    List = [1, 2, 4, 8, 16, 32],
    Compare = fun (Value) -> Value > 10 end,
    ?assertEqual({[16, 32], [1, 2, 4, 8]},
                 (lists:partition(Compare, List))),
    Test = fun (Value) -> Value < 4 end,
    NewList = [1, 2, 4, 8, 4, 2, 1],
    ?assertEqual([4, 8, 4, 2, 1],
                 (lists:dropwhile(Test, NewList))),
    ?assertEqual([1, 2], (lists:takewhile(Test, NewList))).

example10_test() ->
    List = [1, 2, 4, 8, 16, 32],
    Divide = fun (Value, Accumulator) -> Value / Accumulator
             end,
    ?assertEqual(8.0, (lists:foldl(Divide, 1, List))),
    ?assertEqual(0.125, (lists:foldr(Divide, 1, List))).

-endif.
