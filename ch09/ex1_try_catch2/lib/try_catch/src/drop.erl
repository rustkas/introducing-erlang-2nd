-module(drop).

-export([fall_velocity/2]).

fall_velocity(Planemo, Distance) ->
    try Gravity = case Planemo of
                      earth -> 9.8;
                      moon -> 1.6;
                      mars -> 3.71
                  end,
        math:sqrt(2 * Gravity * Distance)
    of
        Result -> Result
    catch
        error:Error -> {error, Error}
    end.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

check1_test() ->
    Result = try throw(my_exception) of
                 Result1 -> Result1
             catch
                 Exception -> {error, Error}
             end,
    ?debugFmt("~p~n",
              [Result]).  % ?assertEqual({throw, my_exception}, Result)

% check2_test() ->
%   Value10=10,
%   Result = try 1/(Value10-Value10)
%   catch
%     error:Error -> {found, Error};
%     throw:Exception -> {caught, Exception}
%   end,

%   ?assertEqual({found,badarith}, Result),
%   ?debugFmt("~p~n",[Result])
%   .

-endif.
