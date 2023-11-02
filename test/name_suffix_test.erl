-module(name_suffix_test).
-include_lib("eunit/include/eunit.hrl").

%% eunit looks for exported functions that match  '..._test()' and '..._test_()' and runs them.
%% Functions named '..._test()' are run directly.
simple_macro_test() ->
    ?assertEqual(42, calculator:multiply(6, 7)).

%% Note that you don't *have* to use the ?assert macros. Any error or exception in your test function is treated as a
%% failure.
simple_no_macro_test() ->
    42 =:= calculator:multiply(7, 6).

%% Functions named '..._test_()' are *test generator* functions. They return a *representation* of a *set of tests* to
%% be executed. The most basic representation of a test is an anonymous function that takes no arguments:
simple_generator_test_() ->
    fun() -> ?assertEqual(52, calculator:multiply(13, 4)) end.

%% Aside: while we're talking about test naming, rebar3 expects to find your test modules in either the 'src' directory
%% or the 'test' directory.
%% If you're using erlang.mk, you can change this, but that would be unusual, and thus surprising. Don't.
