-module(recursion).
-export([fac/1, len/1, tail_fac/1, tail_len/1, duplicate/2, tail_duplicate/2,
    tail_reverse/1, tail_zip/2, sublist/2, zip/2]).

%% fac(N) when N == 0 -> 1;
%% fac(N) when N >  0 -> N * fac(N-1).

%% can be refactored to:

fac(0) -> 1;
fac(N) when N >  0 -> N * fac(N-1).

%% and by using tail recursion, we now get:

tail_fac(N) -> tail_fac(N, 1).

tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when N > 0 -> tail_fac(N - 1, N * Acc).

%% This function will count how many elements a list contains

%% We need:
%% a) base case, b) recursive function, c) list to try function on

len([])  -> 0;                 %% Base Case
len([_|T]) -> 1 + len(T).      %% Recursion

%% and using tail recursion:

tail_len(L) -> tail_len(L,0).

tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T, Acc + 1).

%% now we duplicate/2, which takes an integer and then any other argument, returning
%% a list of as many copies of the term as specified by the integer

duplicate(0,_) ->
  [];
duplicate(N,Term) when N > 0 ->
  [Term|duplicate(N-1, Term)].

%% this can be refactored to a tail recursion by moving the list construction
%% into a temporary variable:

tail_duplicate(N, Term) ->
  tail_duplicate(N, Term, []).
tail_duplicate(0,_,List) ->
  List;
tail_duplicate(N,Term,List) when N > 0 ->
  tail_duplicate(N - 1, Term, [Term|List]).

%% lets make a function that uses recursion to reverse a list

reverse([]) -> [];                      % <-- base case
reverse([H|T]) -> reverse(T) ++ [H].

%% now the tail recursion:

tail_reverse(L) -> tail_reverse(L, []).

tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T, [H|Acc]).

%% lets write a function that takes a list and an integer and returns the first N elements

sublist(_,0) -> [];
sublist([],_) -> [];
sublist([H|T],N) when N > 0 -> [H|sublist(T,N - 1)].

%% now with tail recursion:

tail_sublist(L, N) -> reverse(tail_sublist(L, N, [])).

tail_sublist(_, 0, SubList) -> SubList;
tail_sublist([], _, SubList) -> SubList;
tail_sublist([H|T], N, SubList) when N > 0 ->
  tail_sublist(T, N-1, [H|SubList]).

%% A zipping function:

%% recursive:zip([a,b,c],[1,2,3]). should give us >> [{a,1},{b,2},{c,3}]

zip([],[]) -> [];
zip([X|Xs],[Y|Ys]) -> [{X,Y}|zip(Xs,Ys)].

%% taking a stab at tail recursion when zipping:

tail_zip(X, Y) -> reverse(tail_zip(X, Y, [])).

tail_zip([], [], Acc) -> Acc;
tail_zip([X|Xs], [Y|Ys], Acc) ->
  tail_zip(Xs,Ys, [{X,Y}|Acc]).
