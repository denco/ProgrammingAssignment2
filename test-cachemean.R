source("cachemean.R")

## create test vector
testVector=rnorm(1234,mean=987,sd=1.2);
## cache mean of test vector
cacheVector = makeVector(testVector )

## print
cat("testVector:", testVector[1:6])

### calculate mean of vector
cachemean(cacheVector)

### get cache mean of vector
cachemean(cacheVector)
