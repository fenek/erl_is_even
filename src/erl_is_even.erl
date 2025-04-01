-module(erl_is_even).

-include_lib("eunit/include/eunit.hrl").
-include_lib("stdlib/include/assert.hrl").

-export([is_even/1]).

is_even(Integer) when is_integer(Integer) ->
    Integer rem 2 == 0;
is_even(MaybeBinInteger) when is_binary(MaybeBinInteger) ->
    is_even(binary_to_integer(MaybeBinInteger));
is_even(MaybeStringInteger) when is_list(MaybeStringInteger) ->
    is_even(list_to_integer(MaybeStringInteger)).

is_even_test() ->
    ?assert(is_even(0)),
    ?assert(is_even(2)),
    ?assertNot(is_even(1)),

    ?assert(is_even("0")),
    ?assert(is_even("2")),
    ?assertNot(is_even("1")),

    ?assert(is_even(<<"0">>)),
    ?assert(is_even(<<"2">>)),
    ?assertNot(is_even(<<"1">>)).
