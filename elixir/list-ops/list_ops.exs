defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([_head | tail]) do
    1 + count(tail)
  end

  def count([]) do
    0
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reverse(l, [])
  end

  def reverse([head | tail], acc) do
    reverse(tail, [head | acc])
  end

  def reverse([], acc) do
    acc
  end

  @spec map(list, (any -> any)) :: list
  def map([head | tail], f) do
    [f.(head) | map(tail, f)]
  end

  def map([], _f) do
    []
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([head | tail], f) do
    if f.(head) do
      [head | filter(tail, f)]
    else
      filter(tail, f)
    end
  end

  def filter([], _f) do
    []
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([head | trail], acc, f) do
    reduce(trail, f.(head, acc), f)
  end

  def reduce([], acc, _f) do
    acc
  end

  @spec append(list, list) :: list
  def append([head | tail], acc) do
    [head | append(tail, acc)]
  end

  def append([], acc) do
    acc
  end

  def append(acc, []) do
    acc
  end

  @spec concat([[any]]) :: [any]
  def concat([head | tail]) do
    append(head, concat(tail))
  end

  def concat([]) do
    []
  end
end
