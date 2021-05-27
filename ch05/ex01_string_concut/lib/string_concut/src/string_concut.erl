-module(string_concut).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Concat Eralng #1", fun concat_0/0},
     {"Concat Eralng #2", fun concat_1/0},
     {"Compare items", fun equal_1/0}].

concat_0() ->
    Erlang = "erl" ++ "ang",
    A = "ang",
    Erlang2 = "erl" ++ A,
    ?assertEqual(Erlang, Erlang2).

concat_1() ->
    Erlang = string:concat("erl", "ang"),
    N = "ang",
    Erlang2 = string:concat("erl", N),
    ?assertEqual(Erlang, Erlang2).

equal_1() ->
    ?assert(("erl" == "erl")),
    ?assert(("erl" =:= "erl")),
    ?assert((string:equal("erl", "erl"))),
    ?assertEqual(false, ("erl" == "ang")),
    G = "ang",
    ?assert((G == "ang")).

-endif.
