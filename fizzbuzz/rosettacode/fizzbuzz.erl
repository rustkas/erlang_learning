-module(fizzbuzz).
-export([get100/0, get_n/1]).
-export([test/0]).

-spec test1(Expected :: string()) -> 'test_worked'.

test1(Expected)->
	Result = get100(),
	Result = Expected,
	%io:format("~s~n",[Result]),
	test_worked.

-spec test2(Expected :: string()) -> 'test_worked'.

test2(Expected)->

	Result = get_n(100),
	Result = Expected,
	%io:format("~s~n",[Result]),
	test_worked.

-spec test() -> 'test_worked'.

test() ->
Expected = "12Fizz4BuzzFizz78FizzBuzz11Fizz1314FizzBuzz1617Fizz19BuzzFizz2223FizzBuzz26Fizz2829FizzBuzz3132Fizz34BuzzFizz3738FizzBuzz41Fizz4344FizzBuzz4647Fizz49BuzzFizz5253FizzBuzz56Fizz5859FizzBuzz6162Fizz64BuzzFizz6768FizzBuzz71Fizz7374FizzBuzz7677Fizz79BuzzFizz8283FizzBuzz86Fizz8889FizzBuzz9192Fizz94BuzzFizz9798FizzBuzz",

	test1(Expected),
	test2(Expected),	
	test_worked.

-spec get100() -> Result :: string().

get100() ->
    F = fun(N) when N rem 15 =:= 0 -> "FizzBuzz";
           (N) when N rem 3 =:= 0  -> "Fizz";
           (N) when N rem 5 =:= 0  -> "Buzz";
           (N) -> integer_to_list(N)
        end,
    lists:flatten([[F(N)] || N <- lists:seq(1,100)]).


-spec get_n(V :: non_neg_integer()) -> Result :: string().

get_n(V) when V =< 100 ->
    F = fun(N) when N rem 15 =:= 0 -> "FizzBuzz";
           (N) when N rem 3 =:= 0  -> "Fizz";
           (N) when N rem 5 =:= 0  -> "Buzz";
           (N) -> integer_to_list(N)
        end,
    lists:flatten([[F(N)] || N <- lists:seq(1,V)]).

	
% c(fizzbuzz).
% c(fizzbuzz). fizzbuzz:test().
%
% typer fizzbuzz.erl
% dialyzer --no_check_plt --src fizzbuzz.erl	