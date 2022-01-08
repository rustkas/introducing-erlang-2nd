-module(ask).

-export([term/0]).

term() -> 
	Planemo = filter:planemo(),
	Distance = filter:distance(),
	FallVelocity = drop:fall_velocity({Planemo, Distance}),
	io:format("Fall velocity for \"~w\" with distance ~w is ~.2f~n", [Planemo, Distance, FallVelocity]).