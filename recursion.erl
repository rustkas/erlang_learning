-module(recursion).
-export([fac/1, len/1]).

%% fac(N) when N == 0 -> 1;
%% fac(N) when N >  0 -> N * fac(N-1).

%% can be refactored to:

fac(0) -> 1;
fac(N) when N >  0 -> N * fac(N-1).

%% This function will count how many elements a list contains

%% We need:
%% a) base case, b) recursive function, c) list to try function on

len([])  -> 0;                 %% Bae Case
len([_|T]) -> 1 + len(T).      %% Recursion
