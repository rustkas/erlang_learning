-module(fizzbuzz).
-export([run/0]).
-export([test/0]).

-spec test1() -> 'test_worked'.

test1()->
	Result = run(),
	io:format("~p~n",[Result]),
	test_worked.

-spec test() -> 'test_worked'.

test() ->
	test1(),
	
	test_worked.

-spec run() -> 'ok'.

run() -> 
	lists:foreach(fun(S) -> io:format("~s ", [S]) end, 
					run(1, [])),
	io:nl().

-spec run(SerialNumber :: pos_integer(),TempString :: [string()]) -> Result :: [string()].

run(N, Res) when N > 100 -> Res;
run(N, Res) when (N rem 3 =:= 0) and (N rem 5 =:= 0) -> 
	run(N + 1, Res ++ ["Fizzbuzz"] ++ ["("] ++ [integer_to_list(N)] ++ [")"] ++ ["\n"] );
run(N, Res) when N rem 3 =:= 0 -> 
	run(N + 1, Res ++ ["Fizz"]);
run(N, Res) when N rem 5 =:= 0 -> 
	run(N + 1, Res ++ ["Buzz"]);
run(N, Res) -> 
	run(N + 1, Res ++ [integer_to_list(N)]).

% c(fizzbuzz).
% c(fizzbuzz). fizzbuzz:test().
%
% typer fizzbuzz.erl
% dialyzer --no_check_plt --src fizzbuzz.erl