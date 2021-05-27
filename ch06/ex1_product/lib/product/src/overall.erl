-module(overall).

-export([product/1]).

product([]) -> 0; % in case the list is empty
product(List) -> product(List, 1).

product([], Product) -> Product;
product([Head | Tail], Product) ->
    product(Tail, Product * Head).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

check_test() ->
    ?assertEqual(30, (overall:product([1, 2, 3, 5]))).

-endif.
