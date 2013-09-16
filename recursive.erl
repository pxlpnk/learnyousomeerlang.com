-module(recursive).
-export([fac/1,
         tail_fac/1,
         len/1,
         tail_len/1,
         duplicate/2,
         tail_duplicate/2,
         reverse/1,
         tail_reverse/1,
         sublist/2,
         tail_sublist/2,
         zip/2,
         tail_zip/2]).

fac(0) -> 1;
fac(N) when N >0 -> N*fac(N-1).

tail_fac(N) ->
     tail_fac(N,1).
tail_fac(0, Acc) ->
    Acc;
tail_fac(N, Acc) when N > 0 ->
    tail_fac(N-1, N * Acc).


len([]) ->
    0;
len([_|T]) ->
    1 + len(T).

tail_len(L) ->
    tail_len(L,0).

tail_len([], Acc) ->
    Acc;

tail_len([_|T], Acc) ->
    tail_len(T, Acc + 1).

duplicate(0, _) ->
    [];
duplicate(N, Term) when N > 0  ->
    [Term|duplicate(N-1, Term)].


tail_duplicate(N, Term) ->
    tail_duplicate(N,Term, []).

tail_duplicate(0, _, Acc) ->
    Acc;
tail_duplicate(N, Term, Acc) when N > 0 ->
    tail_duplicate(N - 1, Term, [Term|Acc]).


reverse([]) ->
    [];
reverse([H|T]) -> reverse(T) ++ [H].


tail_reverse(L) ->
    tail_reverse(L, []).

tail_reverse([], Acc) ->
    Acc;
tail_reverse([H|T], Acc) -> tail_reverse(T, [H] ++ Acc).


sublist([],_) ->
    [];
sublist(_, 0) ->
    [];
sublist([H|T], N) when N > 0 -> [H] ++ sublist(T, N -1).


tail_sublist(L, N) ->
    tail_sublist(L, N, []).

tail_sublist([], _, Acc ) ->
    Acc;
tail_sublist(_, 0, Acc) ->
    Acc;
tail_sublist([H|T], N, Acc) when N > 0 ->
    tail_sublist(T, N-1, Acc ++ [H]).


zip([], _) ->
    [];
zip(_, []) ->
    [];
zip([H1|T1], [H2|T2]) ->
    [{H1,H2}|zip(T1, T2)].


tail_zip(Xs, Ys) ->
    reverse(tail_zip(Xs, Ys, [])).

tail_zip([], _, Acc) -> Acc;
tail_zip(_, [], Acc) -> Acc;
tail_zip([X|Xs], [Y|Ys], Acc) ->
    tail_zip(Xs, Ys, [{X,Y}|Acc]).
