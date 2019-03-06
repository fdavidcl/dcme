# dcme
## Overview
The `dcme` package provides functions to compute data complexity measures.

## Installation
`dcme` is under development and not yet available on CRAN. You can install the
development version using the `remotes` package as follows:

```r
# install.packages("remotes")
remotes::install_github("fdavidcl/dcme")
```

## Data Complexity Measures
The following complexity measures are currently implemented:

### Simple Measures
- `num_examples`: Number of Observations
- `num_features`: Number of Features
- `num_features_numeric`: Number of Numeric Features
- `num_features_binary`: Number of Binary Features
- `num_features_categorical`: Number of Categorical Features
- `num_classes`: Number of Classes
- `proportion_features_numeric`: Proportion of Numeric Features
- `proportion_features_binary`: Proportion of Binary Features
- `proportion_features_categorical`: Proportion of Categorical Features

### Statistical Measures
- `sd_ratio`: Geometric Mean Ratio of Standard Deviations
- `corr_abs`: Mean Absolute Correlation Coefficient

### Imbalance measures
- `num_examples_majority`: Number of Observations in the Majority Class
- `num_examples_minority`: Number of Observations in the Minority Class
- `proportion_examples_majority`: Proportion of Majority Examples
- `proportion_examples_minority`: Proportion of Minority Examples
- `IR`: Imbalance Ratio (binary)
- `C1`: Entropy of Class Proportions
- `C2`: Imbalance Ratio (multiclass)

`num_examples_majority`, `num_examples_minority`, `proportion_examples_majority`, `proportion_examples_minority`, and `IR` are defined only for binary data sets.

### Measures of Overlap of Individual Feature Values
- `F1`: Fisher's Discriminant Ratio
- `F2`: Volume of Overlap Region
- `F3`: Maximum Individual Feature Efficiency

Unfortunately these measures are implemented only for binary data
sets. 

Not implemented yet: F4 (Collective Feature Efficiency)

### Measures of Separability of Classes
- `N2`: Ratio of Average Intra/Inter Class 1-NN Distance
- `N3`: Error Rate of 1-NN Classifier

Not implemented yet: N1 (Fraction of Borderline Points)

### Measures of Geometry, Topology, and Density of Manifolds
- `N4`: Nonlinearity of the 1-NN Classifier

Not implemented yet: T1 (Fraction of Hyperspheres Covering Data)

### Dimensionality measures
- `T2`: Average Number of Points per Dimension
- `T3`: Average Number of Points per PCA Dimension
- `T4`: Ratio Between PCA Dimension and Original Dimension

### Network measures

Not implemented yet: Density, ClsCoef, Hubs

### Linearity measures

Not implemented yet: L1 (Sum of the Error Distance by Linear Programming), L2 (Error Rate of Linear Classifier), L3 (Non-Linearity of a Linear Classifier) 

## References
Definitions and explanations of most functions implemented in the `dcme`
package can be found in the following literature:

[1] Michie, D., Spiegelhalter, D. J., & Taylor, C. C. (1994). **Machine
learning, neural and statistical classification**.

[2] Ho, T. K., & Basu, M. (2002). **Complexity measures of supervised
classification problems**. _IEEE transactions on pattern analysis and machine
intelligence, 24_(3), 289-300.

[3] [Lorena, A. C., Garcia, L. P. F., Lehmann, J., Souto, M. C. P., Ho, T. K. (2018) **How Complex is your classification problem? A survey on measuring classification complexity**. arXiv:1808.03591](https://arxiv.org/abs/1808.03591).
