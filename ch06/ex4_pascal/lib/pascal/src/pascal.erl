-module(pascal).

-export([triangle/1, add_row/1]).

triangle(Rows) -> triangle([[0, 1, 0]], 1, Rows).

triangle(List, Count, Rows) when Count >= Rows ->
    lists:reverse(List);
triangle(List, Count, Rows) ->
    [Previous | _] = List,
    triangle([add_row(Previous) | List], Count + 1, Rows).

add_row(Initial) -> add_row(Initial, 0, []).

add_row([], 0, Final) -> [0 | Final];
add_row([H | T], Last, New) ->
    add_row(T, H, [Last + H | New]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

add_raw_test() ->
    Item1 = pascal:add_row([0, 1, 0]),
    ?assertEqual([0, 1, 1, 0], Item1),
    Item2 = pascal:add_row([0, 1, 1, 0]),
    ?assertEqual([0, 1, 2, 1, 0], Item2),
    Item3 = pascal:add_row([0, 1, 2, 1, 0]),
    ?assertEqual([0, 1, 3, 3, 1, 0], Item3).

triangle_test() ->
    ?assertEqual([[0, 1, 0],
                  [0, 1, 1, 0],
                  [0, 1, 2, 1, 0],
                  [0, 1, 3, 3, 1, 0]],
                 (pascal:triangle(4))),
    ?assertEqual([[0, 1, 0],
                  [0, 1, 1, 0],
                  [0, 1, 2, 1, 0],
                  [0, 1, 3, 3, 1, 0],
                  [0, 1, 4, 6, 4, 1, 0],
                  [0, 1, 5, 10, 10, 5, 1, 0]],
                 (pascal:triangle(6))).

-endif.
