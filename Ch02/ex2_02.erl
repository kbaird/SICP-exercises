-module(ex2_02).
-author("Kevin C. Baird").
-purpose("SICP in Erlang: Exercise 2.2 - Represent line segments on a plane.").
-export([make_point/2, make_segment/2, x_point/1, y_point/1,
         start_segment/1, end_segment/1, midpoint_segment/1]).
-include_lib("records.hrl").

%% I'll keep this in module ex2_02 because of the pedagogical source,
%% but I'd be inclined to use separate Point and Segment modules as in
%% the Elixir and CoffeeScript for production code.

% creators
make_point(X, Y) -> #point{x=X, y=Y}.

make_segment(#point{x=X1, y=Y1},
             #point{x=X2, y=Y2}) ->
    #segment{start_pt=make_point(X1, Y1),
               end_pt=make_point(X2, Y2)}.

% extractors
x_point(#point{x=X}) -> X.
y_point(#point{y=Y}) -> Y.

start_segment(#segment{start_pt=P}) -> P.
end_segment(#segment{end_pt=P})     -> P.

midpoint_segment(#segment{start_pt=#point{x=X1, y=Y1},
                          end_pt=#point{x=X2, y=Y2}}) ->
    make_point(average(X1, X2), average(Y1, Y2)).

% hidden helpers
average(X1, X2) -> (X1+X2) / 2.

