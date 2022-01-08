-module(filter).

-export([planemo/0, distance/0]).

planemo() -> 
	PlanemoIdString = chars(),
	{PlanemoId,_} = string:to_integer(PlanemoIdString),
	Planemo = planemo(PlanemoId),
  io:format("Selected planemo is \"~w\".~n", [Planemo]),
	Planemo.
	
planemo(1) -> earth;
planemo(2) -> moon;
planemo(3) -> mars;
planemo(_) -> 
	io:format("~nPlease, select a planemo.~n"),
	PlanemoIdString = chars(),
	{PlanemoId,_} = string:to_integer(PlanemoIdString),
	planemo(PlanemoId).
	
chars() ->
	io:format("Which planemo are you on?~n"),
	io:format(" 1. Earth ~n"),
	io:format(" 2. Earth's Moon~n"),
	io:format(" 3. Mars~n"),
	Result = io:get_chars("Which? > ",1),
	io:get_chars("",1),
	Result.	
	
distance() ->
  EnteredString = io:get_line("Enter distance > "),
	DistanceString = case EnteredString of
		{error, _} -> distance();
		_ -> EnteredString
		end,
	Distance = case string:to_integer(DistanceString) of 
			{error, _} -> distance();
			{DistanceValue,_} -> DistanceValue
			end,
	if 
		Distance < 0 -> distance();
		true -> Distance	end.