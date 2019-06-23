# Reliabilities for musical tests

This repository provides reliability information as a function of test length
for several of our adaptive musical tests.

## Tests

- [Computerised Adaptive Beat Alignment Test (CA-BAT)](
https://github.com/pmcharrison/cabat)

- [Melodic Discrimination Test (MDT)](
https://github.com/pmcharrison/mdt)

- [Mistuning Perception Test (MPT)](
https://github.com/pmcharrison/mpt)

- [Pitch Imagery Arrow Test (PIAT)](
https://github.com/pmcharrison/piat)

## Data

The reliability information is stored in the csv file `output/reliability.csv`.
Each row gives a particular reliability statistic for a particular
test configuration and participant group.
There are five columns:

- `test` - The test whose reliability is being examined (see above).
- `participants` - The participant group for which reliability was computed.
- `statistic` - The reliability statistic being reported.
- `num_items` - The number of items in the (simulated) test.
- `value` - The value of the reliability statistic.

The two main statistics are test-retest reliability and standard error of the mean (SEM).
Test-retest reliability is computed using Pearson correlations.
The standard error of the mean is computed using weighted maximum likelihood estimation,
averaged over all participants in the sample group.
See standard statistics references for more detailed definitions of these measures.

## Other files/folders

- `input/` stores raw data files
- `src/` stores data compilation code
