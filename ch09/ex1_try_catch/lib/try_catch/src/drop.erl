-module(drop).

-export([fall_velocity/2]).

fall_velocity(Planemo, Distance) ->
    Gravity = case Planemo of
                  earth -> 9.8;
                  moon -> 1.6;
                  mars -> 3.71
              end,
    % note comma - function isn't done yet
    try math:sqrt(2 * Gravity * Distance) of
        Result -> Result
    catch
        error:Error -> {found, Error}
    end.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

check_test() ->
    Result = drop:fall_velocity(earth, 20),
    ?assertEqual(19.79898987322333, Result).

check2_test() ->
    Result = drop:fall_velocity(earth, -20),
    ?assertEqual({found, badarith}, Result).

-endif.
