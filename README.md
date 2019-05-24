# Solo Project - Enumerable Methods
Custom built enumerable ruby methods to find what makes enumerable so magical. 

## List of Enumerable methods with its functionality from [APIdock](https://apidock.com/ruby).

1. each() - Calls the given block once for each element in self, passing that element as a parameter. Returns the array itself.If no block is given, an Enumerator is returned.

2. each_with_index() Same as Enumerator#with_index(0), i.e. there is no starting offset. If no block is given, a new Enumerator is returned that includes the index.

3. select() Returns a new array containing all elements of ary for which the given block returns a true value.

4. all? Passes each element of the collection to the given block. The method returns true if the block never returns false or nil. If the block is not given, Ruby adds an implicit block of { |obj| obj } which will cause #all? to return true when none of the collection members are false or nil.

5. any>=? Passes each element of the collection to the given block. The method returns true if the block ever returns a value other than false or nil. If the block is not given, Ruby adds an implicit block of { |obj| obj } that will cause #any? to return true if at least one of the collection members is not false or nil.

6. none? Passes each element of the collection to the given block. The method returns true if the block never returns true for all elements. If the block is not given, none? will return true only if none of the collection members is true.

7. count(p1) Returns the number of items in enum through enumeration. If an argument is given, the number of items in enum that are equal to item are counted. If a block is given, it counts the number of elements yielding a true value.

8. map() Returns a new array with the results of running block once for every element in enum.

9. inject(p1 = v1, p2 = v2) Combines all elements of enum by applying a binary operation, specified by a block or a symbol that names a method or operator. The inject and reduce methods are aliases. There is no performance benefit to either.

