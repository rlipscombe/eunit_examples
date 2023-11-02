-module(calculator).
-export([
    add/2,
    subtract/2,
    multiply/2,
    divide/2
]).

add(L, R) -> L + R.
subtract(L, R) -> L - R.
multiply(L, R) -> L * R.
divide(L, R) -> L / R.

%% You can keep tests next to the code they're testing. There are a few times this makes sense:
%% - You want to test a private function. Try to avoid this.
%% - Your application is simple enough that having the tests next to the code is better. This is a matter of opinion.
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

subtract_test() ->
    ?assertEqual(12, subtract(18, 6)).
-endif.
