-module(simple).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

length_0_test() ->
    Size = length([1, 2, 4, 8, 16, 32]),
    ?assertEqual(6, Size).

get_variables_1_test() ->
    [1, X, 4, Y] = [1, 2, 4, 8],
    ?assertEqual(2, X),
    ?assertEqual(8, Y).

insert_test() ->
    Insert = [2, 4, 8],
    Full = [1, Insert, 16, 32],
    ?assertEqual([1, [2, 4, 8], 16, 32], Full),
    Neat = lists:flatten(Full),
    ?assertEqual([1, 2, 4, 8, 16, 32], Neat).

list_of_lists_test() ->
    A = [1, 2, 4],
    B = [8, 16, 32],
    ListOfLists = [A, B],
    ?assertEqual([[1, 2, 4], [8, 16, 32]], ListOfLists).

list_append_test() ->
    A = [1, 2, 4],
    B = [8, 16, 32],
    Combined1 = lists:append(A, B),
    ?assertEqual([1, 2, 4, 8, 16, 32], Combined1),
    Combined2 = A ++ B,
    ?assertEqual([1, 2, 4, 8, 16, 32], Combined2),
    C = [64, 128, 256],
    Combined4 = lists:append([A, B, C]),
    ?assertEqual([1, 2, 4, 8, 16, 32, 64, 128, 256],
                 Combined4).

head_tail_test() ->
    [Head | Tail] = [1, 2, 4],
    ?assertEqual(1, Head),
    ?assertEqual([2, 4], Tail).

list_tuple_test() ->
    List1 = [1, 2, 4, 8, 16],
    List2 = [a, b, c, d, e],
    TupleList = lists:zip(List1, List2),
    ?assertEqual([{1, a}, {2, b}, {4, c}, {8, d}, {16, e}],
                 TupleList),
    SeparateLists = lists:unzip(TupleList),
    ?assertEqual({[1, 2, 4, 8, 16], [a, b, c, d, e]},
                 SeparateLists).

list_tuple_keystore_test() ->
    Initial = [{1, tiger}, {3, bear}, {5, lion}],
    ?debugFmt("~w~n", [Initial]),
    Second = lists:keystore(7, 1, Initial, {7, panther}),
    ?debugFmt("~w~n", [Second]),
    Third = lists:keystore(7, 1, Second, {7, leopard}),
    ?debugFmt("~w~n", [Third]),
    ?assertEqual([{1, tiger},
                  {3, bear},
                  {5, lion},
                  {7, leopard}],
                 Third),
    Fourth = lists:keyreplace(6, 1, Third, {6, chipmunk}),
    ?assertEqual([{1, tiger},
                  {3, bear},
                  {5, lion},
                  {7, leopard}],
                 Fourth),
    Animal5 = lists:keyfind(5, 1, Third),
    ?assertEqual({5, lion}, Animal5).

-endif.
