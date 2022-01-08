-module(ask).

-export([term/0]).

term() ->
    Input = io:read("What {planemo, distance} ? >>"),
    term(Input).

term({ok, quit}) ->
	io:format("Goodbye.~n");
term(Input) ->
	process_term(Input),
	term().

process_term({ok, Term}) when is_tuple(Term) ->
    Velocity = drop:fall_velocity(Term),
    io:format("Yields ~w. ~n", [Velocity]);
process_term({ok, _}) ->
    io:format("You must enter a tuple.~n");
process_term({error, _}) ->
    io:format("You must enter a tuple with\r\ncorrect "
              "syntax.~n");
process_term(_) -> process_term({error, "wrong input"}).		

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [
		 {"Entering correct data", fun input_correct_data_earth/0},
		 {"Entering correct data", fun input_correct_data_moon/0},
		 {"Entering correct data", fun input_correct_data_mars/0},
     {"Is not tuple", fun is_not_tuple/0},
     {"Is not correct syntax", fun catch_error_tuple/0},
     {"Raise error", fun raise_error/0},
		 {"Entering quit", fun quit/0}
		 ].

input_correct_data_earth() ->
    Distance = 20,
		process_term({ok, {earth, Distance}}),
    ?assertEqual("Yields 19.79898987322333. \n",
			(?capturedOutput)).

input_correct_data_moon() ->
    Distance = 20,
		process_term({ok, {moon, Distance}}),
		?assertEqual("Yields 8.0. \n", (?capturedOutput)).
		
input_correct_data_mars() ->
    Distance = 20,
		process_term({ok, {mars, Distance}}),
		?assertEqual("Yields 12.181953866272849. \n", (?capturedOutput)).		
		

is_not_tuple() ->
    process_term({ok, "Test"}),
    ?assertEqual("You must enter a tuple.\n",
                 (?capturedOutput)).

catch_error_tuple() ->
    process_term(ok),
    ?assertEqual("You must enter a tuple with\r\ncorrect "
                 "syntax.\n",
                 (?capturedOutput)).

raise_error() ->
	?assertError(undef, (ask:process_term({ok, {ok, ok}}))).
		
quit() ->
	term({ok, quit}),
	?assertEqual("Goodbye.\n", (?capturedOutput)).
	
-endif.
