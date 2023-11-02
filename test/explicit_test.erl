-module(explicit_test).

%%% This module demonstrates some of the things that eunit.hrl does for you automatically.

%% Usually, including eunit.hrl includes the ?assert macros indirectly, but you can do it explicitly:
-include_lib("stdlib/include/assert.hrl").

%% If you run eunit:test(Module), it looks for exported functions that match  '..._test()' and '..._test_()' and runs
%% them.

%% If you -include_lib("eunit/include/eunit.hrl"), those functions are automatically exported.
%% Since we're not including eunit.hrl, we have to export the functions ourselves.
-export([
    multiply_two_numbers_test/0,
    test/0
]).

multiply_two_numbers_test() ->
    ?assertEqual(6, mul(2, 3)).

%% For convenience, eunit.hrl also injects a test() function:
test() ->
    eunit:test(?MODULE).

%% This is the function under test.
mul(A, B) -> A * B.
