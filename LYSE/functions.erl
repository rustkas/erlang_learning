-module(functions).
-compile(export_all). %% replace with -export()

head([H|_]) -> H.

second([_,X|_]) -> X.

same(X,X) ->
  true;
same(_,_) ->
  false.

valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
  io:format("The Date tuple (~p) says today is: ~p/~p/~p,~n",
    [Date, Y,M,D]),
  io:format("The time tuple(~p) indicates:~p:~p:~p.~n",
    [Time,H,Min,S]);
valid_time(_) ->
  io:format("Stop feeding me wrong data!~n").

%% right age to drive

old_enough(0) -> false;
old_enough(1) -> false;
old_enough(2) -> false;
old_enough(3) -> false;
old_enough(4) -> false;
old_enough(5) -> false;
old_enough(6) -> false;
%%         ...
old_enough(15) -> false;
old_enough(16) -> true;

%% or could be like:

old_enough(X) when X >= 16 -> true;
old_enough(_) -> false.

%% or if there is an upper limit too:

right_age(X) when X >= 16, X =< 104 ->
  true;
right_age(_) ->
  false.

%% expressed oppositely:

wrong_age(X) when X < 16; X > 104 ->
  true;
wrong_age(_) ->
  fasle.
