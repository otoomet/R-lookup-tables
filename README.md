# Different tests with R

## Lookup table efficiency in R

How to look up single values from large matrices where we have to
find matching column and row value.

Briefly: R's `match` is the slowest option, hashed environments are
the fastest for data sizes and structure I was testing.


## complex ordering of data using spark

Ordering a large amount of timestamped records by districts according
to daily counts breaking ties with monthly counts and total counts.
