-module(functions).
%-compile(export_all). %% replace with -export()

-export([head/1]).
-export([test/0]).

-spec test_head_1() -> 'test_worked'.

test_head_1()->
	%Result = run(),
	%io:format("~p~n",[Result]),
	
	1 = head([1]),
	
	0.0 = head([ 0.0, 0.1 ]),
	
	"" = head([""]),
	"" = head(""),
	true = head([true]),
	% head(false) = not true,
	% not true = head([false]),
	false = head([not true]),
	<<5,10,20>> = head([<<5,10,20>>]),
	
	X = 100,
	Y = 20,
	Z = 255,
	
	Value = <<X:3, Y:7, Z:6>>,
	Value = head([<<X:3, Y:7, Z:6>>]),
	%<<X:3, Y:7, Z:6>> = head([<<X:3, Y:7, Z:6>>]),
	{} = head([{}]),
	
	% #{ a => 1, b => 2 } = head([#{ a => 1, b => 2 } ]),
	M = #{ a => 1, b => 2 },
	M = head([ #{ a => 1, b => 2 } ]),
	
	
	test_worked.

-spec test_same_1() -> 'test_worked'.

test_same_1()->
	X = 1,
	Y = 2,
	test_same(X,Y).

test_same_2()->
	X = 0.0,
	Y = 0.1,
	test_same(X,Y).

test_same_2_1()->
	X = 0.0,
	Y = 0.01,
	test_same(X,Y).

test_same_2_2()->
	X = 0.0,
	Y = 0.001,
	test_same(X,Y).

test_same_2_3()->
	X = 0.0,
	Y = 0.0001,
	test_same(X,Y).

test_same_2_4()->
	X = 0.0,
	Y = 0.00001,
	test_same(X,Y).

test_same_2_5()->
	X = 0.0,
	Y = 0.000001,
	test_same(X,Y).

test_same_2_6()->
	X = 0.0,
	Y = 0.0000001,
	test_same(X,Y).

test_same_2_7()->
	X = 0.0,
	Y = 0.00000001,
	test_same(X,Y).

test_same_2_8()->
	X = 0.0,
	Y = 0.000000001,
	test_same(X,Y).

test_same_3()->
	X = 100,
	Y = 20,
	Z = 255,
	
	Value1 = <<X:3, Y:7, Z:6>>,
	Value2 = <<X:3, Y:7, Z:5>>,
	test_same(Value1,Value2),
	test_worked.

test_same_4() ->
	X = "he" ++ "llo",
	Y = "h" ++ "ello",
	
	Expected = true,
	Result = try test_same(X, Y) 
	catch
		error:_X ->
			true
		end,
	%io:format("~p~n",[Result]),		
	Expected = Result,		
	
	test_worked.

test_same_5() ->
	X = {a,b},
	Y = {a,c},
	
	test_same(X, Y),
	
	test_worked.

test_same_5_1() ->
	X = {a,a,b},
	Y = {a,a,c},
	
	test_same(X, Y),
	
	test_worked.

test_same_6() ->
	X = #{ a => 1, b => 2 },
	Y = #{ a => 1, b => 3 },
	
	test_same(X, Y),
	
	test_worked.

	
	
-spec test_same(any(),any()) -> 'test_worked'.	

test_same(X,Y)->	
	true = same(X,X),
	true = same(Y,Y),
	false = same(X,Y),
	false = same(Y,X),
	
	test_worked.
	
-spec test() -> 'test_worked'.

test() ->
	test_head_1(),
	
	test_same_1(),
	test_same_2(),
	test_same_2_1(),
	test_same_2_2(),
	test_same_2_3(),
	test_same_2_4(),
	test_same_2_5(),
	test_same_2_6(),
	test_same_2_7(),
	test_same_2_8(),

	test_same_3(),
	
	test_same_4(),

	test_same_5(),
	test_same_5_1(),
	
	test_same_6(),
	
	test_worked.


head([] = X) when length(X) =:= 0 -> [];
head([H|_] = X) when length(X) >0 -> H.


same(X,X) ->
  true;
same(_,_) ->
  false.
  

% c(functions).
% c(functions). functions:test().
%
% typer functions.erl
% dialyzer --no_check_plt --src functions.erl
