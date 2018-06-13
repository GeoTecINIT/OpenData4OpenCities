
> rm(list = ls())

> Dataset <-read.table("/Users/lfsantag83/Desktop/Composite Indicators/workshop_Agile_12062018.txt", 
+   header=TRUE, sep="\t", na.strings="NA", dec=".", strip.white=TRUE)

> row.names(Dataset) <- as.character(Dataset$city)

> Dataset$city <- NULL

> numSummary(Dataset[,c("gdp", "inf_mort", "lif_exp_fem", "lif_exp_male", 
+   "n_hig_edu_insts", "n_hosp", "pm10", "unem_rate"), drop=FALSE], statistics=c("mean", 
+   "sd", "quantiles", "cv", "skewness", "kurtosis"), quantiles=c(0,1), type="2")
                       mean           sd         cv   skewness   kurtosis      0%   100%  n
gdp             39.09432692  17.32784006 0.44323157 -0.3275936 -0.4877458  0.5000  69.30 52
inf_mort         8.98028846  12.38886361 1.37956188  3.2248594 11.8258756  0.0350  69.00 52
lif_exp_fem     79.57673077   6.54686775 0.08227113 -2.0273715  4.3217582 57.0000  88.00 52
lif_exp_male    74.65346154   6.35579306 0.08513729 -1.8709156  3.5126388 53.0000  82.00 52
n_hig_edu_insts 40.17307692  47.60899616 1.18509708  2.9223122 10.1698423  2.0000 264.00 52
n_hosp          93.03846154 131.72356103 1.41579685  2.6259560  7.9295426  2.0000 658.00 52
pm10            46.69230769  38.61145744 0.82693401  2.0050463  4.2983292 12.0000 198.00 52
unem_rate        0.07961731   0.06288962 0.78989888  2.2376694  8.1304583  0.0004   0.37 52

> with(Dataset, Hist(inf_mort, scale="percent", breaks="Sturges", col="darkgray"))

> round(cor(Dataset[,c("gdp","inf_mort","lif_exp_fem","lif_exp_male","n_hig_edu_insts","n_hosp",
+   "pm10","unem_rate")], use="complete"),2)
                  gdp inf_mort lif_exp_fem lif_exp_male n_hig_edu_insts n_hosp  pm10
gdp              1.00    -0.54        0.66         0.58           -0.01   0.02 -0.74
inf_mort        -0.54     1.00       -0.78        -0.71           -0.05  -0.08  0.49
lif_exp_fem      0.66    -0.78        1.00         0.94           -0.12   0.16 -0.62
lif_exp_male     0.58    -0.71        0.94         1.00           -0.25   0.09 -0.51
n_hig_edu_insts -0.01    -0.05       -0.12        -0.25            1.00   0.40  0.22
n_hosp           0.02    -0.08        0.16         0.09            0.40   1.00  0.01
pm10            -0.74     0.49       -0.62        -0.51            0.22   0.01  1.00
unem_rate       -0.34     0.60       -0.47        -0.43           -0.32  -0.31  0.10
                unem_rate
gdp                 -0.34
inf_mort             0.60
lif_exp_fem         -0.47
lif_exp_male        -0.43
n_hig_edu_insts     -0.32
n_hosp              -0.31
pm10                 0.10
unem_rate            1.00

> scatterplot(inf_mort~lif_exp_fem, regLine=TRUE, smooth=FALSE, boxplots=FALSE, 
+   data=Dataset)

> scatterplotMatrix(~gdp+inf_mort+lif_exp_fem+lif_exp_male+n_hig_edu_insts+n_hosp+pm10+unem_rate,
+    regLine=TRUE, smooth=FALSE, diagonal=list(method="histogram"), data=Dataset)

> Dataset.PCA<-Dataset[, c("gdp", "unem_rate", "n_hig_edu_insts", "inf_mort", 
+   "lif_exp_male", "lif_exp_fem", "n_hosp", "pm10")]

> res<-PCA(Dataset.PCA , scale.unit=TRUE, ncp=5, graph = FALSE)

> res.hcpc<-HCPC(res ,nb.clust=0,consol=TRUE,min=3,max=10,graph=TRUE)
[1] "Click on the graph to cut the tree"

> res.hcpc$data.clust[,ncol(res.hcpc$data.clust),drop=F]
              clust
Amsterdam         5
Bangkok           3
Barcelona         5
Beijing           6
Berlin            5
Bogota            3
Boston            5
Brussels          5
Buenos Aires      3
Cairo             3
Chicago           5
Cologne           5
Copenhagen        5
Delhi             2
Dhaka             1
Dubai             3
Dublin            5
Frankfurt         5
Guangzhou         3
Helsinki          5
Hong Kong         5
Houston           5
Istanbul          3
Jakarta           3
Jerusalem         5
Johannesburg      1
Lima              3
Lisbon            5
London            7
Los Angeles       7
Madrid            5
Melbourne         5
Moscow            4
Mumbai            1
New York City     5
Oslo              5
Paris             5
Prague            5
Rome              5
San Francisco     7
Sao Paulo         3
Seoul             3
Shenzhen          3
Singapore         5
Stockholm         5
Sydney            7
Taipei            5
Tokyo             6
Vancouver         5
Vienna            5
Warsaw            5
Zurich            5

> plot.PCA(res, axes=c(1, 2), choix="var", new.plot=TRUE, col.var="black",

> col.quanti.sup="blue", label=c("var", "quanti.sup"), lim.cos2.var=0)

> plot.PCA(res, axes=c(1, 2), choix="var", new.plot=TRUE, col.var="black",col.quanti.sup="blue", label=c("var", "quanti.sup"), lim.cos2.var=0)

> summary(res, nb.dec = 3, nbelements=10, nbind = 10, ncp = 3, file="")

Call:
PCA(X = Dataset.PCA, scale.unit = TRUE, ncp = 5, graph = FALSE) 


Eigenvalues
                       Dim.1   Dim.2   Dim.3   Dim.4   Dim.5   Dim.6   Dim.7   Dim.8
Variance               3.933   1.710   0.807   0.705   0.361   0.289   0.154   0.040
% of var.             49.168  21.377  10.089   8.813   4.510   3.613   1.926   0.504
Cumulative % of var.  49.168  70.545  80.634  89.447  93.957  97.570  99.496 100.000

Individuals (the 10 first)
                    Dist    Dim.1    ctr   cos2    Dim.2    ctr   cos2    Dim.3    ctr
Amsterdam       |  1.230 |  0.837  0.342  0.463 | -0.596  0.400  0.235 | -0.150  0.054
Bangkok         |  1.931 | -0.811  0.321  0.176 |  0.975  1.068  0.255 | -0.411  0.402
Barcelona       |  1.838 |  0.399  0.078  0.047 | -1.329  1.988  0.523 | -0.055  0.007
Beijing         |  4.524 |  0.165  0.013  0.001 |  3.625 14.781  0.642 | -0.934  2.076
Berlin          |  2.270 |  1.026  0.515  0.204 | -0.960  1.037  0.179 | -0.084  0.017
Bogota          |  1.854 | -1.207  0.712  0.424 | -0.422  0.200  0.052 | -1.092  2.842
Boston          |  2.066 |  1.241  0.753  0.361 | -0.666  0.499  0.104 |  0.824  1.617
Brussels        |  1.668 |  0.475  0.110  0.081 | -1.172  1.544  0.494 |  0.457  0.498
Buenos Aires    |  1.037 | -0.181  0.016  0.030 | -0.095  0.010  0.008 | -0.496  0.587
Cairo           |  3.264 | -2.546  3.168  0.608 | -0.155  0.027  0.002 | -1.853  8.179
                  cos2  
Amsterdam        0.015 |
Bangkok          0.045 |
Barcelona        0.001 |
Beijing          0.043 |
Berlin           0.001 |
Bogota           0.347 |
Boston           0.159 |
Brussels         0.075 |
Buenos Aires     0.229 |
Cairo            0.322 |

Variables
                   Dim.1    ctr   cos2    Dim.2    ctr   cos2    Dim.3    ctr   cos2  
gdp             |  0.795 16.080  0.633 | -0.121  0.856  0.015 |  0.410 20.843  0.168 |
unem_rate       | -0.582  8.597  0.338 | -0.584 19.944  0.341 |  0.331 13.602  0.110 |
n_hig_edu_insts | -0.073  0.135  0.005 |  0.834 40.629  0.695 |  0.252  7.846  0.063 |
inf_mort        | -0.854 18.554  0.730 | -0.124  0.896  0.015 |  0.240  7.114  0.057 |
lif_exp_male    |  0.888 20.035  0.788 | -0.123  0.887  0.015 | -0.248  7.642  0.062 |
lif_exp_fem     |  0.945 22.707  0.893 | -0.039  0.089  0.002 | -0.104  1.341  0.011 |
n_hosp          |  0.157  0.630  0.025 |  0.710 29.462  0.504 |  0.289 10.344  0.083 |
pm10            | -0.722 13.261  0.522 |  0.352  7.236  0.124 | -0.502 31.267  0.252 |

> remove(Dataset.PCA)

> res$var$coord
                      Dim.1       Dim.2      Dim.3       Dim.4       Dim.5
gdp              0.79530713 -0.12099413  0.4101562 -0.23978640 -0.17544298
unem_rate       -0.58151235 -0.58401541  0.3313367  0.19920757  0.39753453
n_hig_edu_insts -0.07282457  0.83355228  0.2516565 -0.36697213  0.29274951
inf_mort        -0.85429783 -0.12380783  0.2396279  0.15785666 -0.18249036
lif_exp_male     0.88773426 -0.12317755 -0.2483541  0.22322452  0.12358889
lif_exp_fem      0.94508498 -0.03895879 -0.1040426  0.15483775  0.17695918
n_hosp           0.15747224  0.70981738  0.2889502  0.61088594 -0.06795649
pm10            -0.72222539  0.35177188 -0.5023590  0.03602609  0.04172349

> Dataset1=Dataset

> summary(powerTransform(Dataset1[,1]))
bcPower Transformation to Normality 
              Est Power Rounded Pwr Wald Lwr Bnd Wald Upr Bnd
Dataset1[, 1]    1.0164           1       0.6025       1.4303

Likelihood ratio test that transformation parameter is equal to 0
 (log transformation)
                           LRT df       pval
LR test, lambda = (0) 44.29979  1 2.8175e-11

Likelihood ratio test that no transformation is needed
                              LRT df    pval
LR test, lambda = (1) 0.006077443  1 0.93786

> summary(powerTransform(Dataset1[,2]))
bcPower Transformation to Normality 
              Est Power Rounded Pwr Wald Lwr Bnd Wald Upr Bnd
Dataset1[, 2]    0.4039         0.5       0.2031       0.6047

Likelihood ratio test that transformation parameter is equal to 0
 (log transformation)
                          LRT df         pval
LR test, lambda = (0) 20.4956  1 0.0000059768

Likelihood ratio test that no transformation is needed
                           LRT df          pval
LR test, lambda = (1) 25.64775  1 0.00000040977

> Dataset1[,2] <- with(Dataset1, sqrt(Dataset1[,2]))

> summary(powerTransform(Dataset1[,3]))
bcPower Transformation to Normality 
              Est Power Rounded Pwr Wald Lwr Bnd Wald Upr Bnd
Dataset1[, 3]   -0.0467           0      -0.2708       0.1775

Likelihood ratio test that transformation parameter is equal to 0
 (log transformation)
                            LRT df    pval
LR test, lambda = (0) 0.1655132  1 0.68413

Likelihood ratio test that no transformation is needed
                           LRT df       pval
LR test, lambda = (1) 71.33823  1 < 2.22e-16

> Dataset1[,3] <- with(Dataset1, log(Dataset1[,3]))

> summary(powerTransform(Dataset1[,4]))
bcPower Transformation to Normality 
              Est Power Rounded Pwr Wald Lwr Bnd Wald Upr Bnd
Dataset1[, 4]    0.1418        0.14       0.0052       0.2784

Likelihood ratio test that transformation parameter is equal to 0
 (log transformation)
                           LRT df     pval
LR test, lambda = (0) 4.667473  1 0.030739

Likelihood ratio test that no transformation is needed
                          LRT df       pval
LR test, lambda = (1) 82.7025  1 < 2.22e-16

> Dataset1[,4] <- with(Dataset1, Dataset1[,4]^0.14)

> summary(powerTransform(Dataset1[,5]))
bcPower Transformation to Normality 
              Est Power Rounded Pwr Wald Lwr Bnd Wald Upr Bnd
Dataset1[, 5]    9.4917        9.49        5.822      13.1614

Likelihood ratio test that transformation parameter is equal to 0
 (log transformation)
                           LRT df       pval
LR test, lambda = (0) 39.08902  1 4.0491e-10

Likelihood ratio test that no transformation is needed
                           LRT df           pval
LR test, lambda = (1) 29.90819  1 0.000000045299

> summary(powerTransform(Dataset1[,6]))
bcPower Transformation to Normality 
              Est Power Rounded Pwr Wald Lwr Bnd Wald Upr Bnd
Dataset1[, 6]    9.0214        9.02       5.6794      12.3633

Likelihood ratio test that transformation parameter is equal to 0
 (log transformation)
                           LRT df       pval
LR test, lambda = (0) 40.43526  1 2.0324e-10

Likelihood ratio test that no transformation is needed
                           LRT df           pval
LR test, lambda = (1) 30.82181  1 0.000000028284

> summary(powerTransform(Dataset1[,7]))
bcPower Transformation to Normality 
              Est Power Rounded Pwr Wald Lwr Bnd Wald Upr Bnd
Dataset1[, 7]   -0.0154           0      -0.2036       0.1728

Likelihood ratio test that transformation parameter is equal to 0
 (log transformation)
                             LRT df    pval
LR test, lambda = (0) 0.02565001  1 0.87276

Likelihood ratio test that no transformation is needed
                           LRT df       pval
LR test, lambda = (1) 90.44312  1 < 2.22e-16

> Dataset1[,7] <- with(Dataset1, log(Dataset1[,7]))

> summary(powerTransform(Dataset1[,8]))
bcPower Transformation to Normality 
              Est Power Rounded Pwr Wald Lwr Bnd Wald Upr Bnd
Dataset1[, 8]   -0.4156        -0.5      -0.8138      -0.0173

Likelihood ratio test that transformation parameter is equal to 0
 (log transformation)
                           LRT df     pval
LR test, lambda = (0) 4.292003  1 0.038292

Likelihood ratio test that no transformation is needed
                           LRT df       pval
LR test, lambda = (1) 50.86919  1 9.8732e-13

> Dataset1[,8] <- with(Dataset1, 1/sqrt(Dataset1[,8]))

> numSummary(Dataset1[,c("gdp", "inf_mort", "lif_exp_fem", "lif_exp_male", 
+   "n_hig_edu_insts", "n_hosp", "pm10", "unem_rate"), drop=FALSE], statistics=c("mean", 
+   "sd", "cv", "skewness", "kurtosis"), quantiles=c(0,1), type="1")
                      mean          sd         cv    skewness   kurtosis  n
gdp             39.0943269 17.32784006 0.44323157 -0.31806705 -0.5553005 52
inf_mort         1.2710812  0.19320465 0.15200024  0.12642537  2.3539381 52
lif_exp_fem     79.5767308  6.54686775 0.08227113 -1.96841461  3.8040354 52
lif_exp_male    74.6534615  6.35579306 0.08513729 -1.81650850  3.0706493 52
n_hig_edu_insts  3.2394621  0.94101758 0.29048575  0.14590407  0.2949641 52
n_hosp           3.7585215  1.28760674 0.34258331  0.05020693 -0.3841216 52
pm10             0.1747114  0.05402128 0.30920296  0.03775801 -0.6210449 52
unem_rate        0.2622804  0.10506454 0.40058090  0.43835777  1.2590704 52

> with(Dataset1, Hist(inf_mort, scale="percent", breaks="Sturges", col="darkgray"))

> round(cor(Dataset1[,c("gdp","inf_mort","lif_exp_fem","lif_exp_male","n_hig_edu_insts","n_hosp",
+   "pm10","unem_rate")], use="complete"),2)
                  gdp inf_mort lif_exp_fem lif_exp_male n_hig_edu_insts n_hosp  pm10
gdp              1.00    -0.46        0.66         0.58            0.08   0.04  0.73
inf_mort        -0.46     1.00       -0.71        -0.66           -0.10  -0.12 -0.27
lif_exp_fem      0.66    -0.71        1.00         0.94            0.07   0.16  0.52
lif_exp_male     0.58    -0.66        0.94         1.00            0.00   0.05  0.46
n_hig_edu_insts  0.08    -0.10        0.07         0.00            1.00   0.29 -0.16
n_hosp           0.04    -0.12        0.16         0.05            0.29   1.00 -0.05
pm10             0.73    -0.27        0.52         0.46           -0.16  -0.05  1.00
unem_rate       -0.31     0.36       -0.37        -0.33           -0.45  -0.30 -0.11
                unem_rate
gdp                 -0.31
inf_mort             0.36
lif_exp_fem         -0.37
lif_exp_male        -0.33
n_hig_edu_insts     -0.45
n_hosp              -0.30
pm10                -0.11
unem_rate            1.00

> scatterplotMatrix(~gdp+inf_mort+lif_exp_fem+lif_exp_male+n_hig_edu_insts+n_hosp+pm10+unem_rate,
+    regLine=TRUE, smooth=FALSE, diagonal=list(method="histogram"), data=Dataset1)

> Dataset1.PCA<-Dataset1[, c("gdp", "unem_rate", "n_hig_edu_insts", "inf_mort", 
+   "lif_exp_male", "lif_exp_fem", "n_hosp", "pm10")]

> res<-PCA(Dataset1.PCA , scale.unit=TRUE, ncp=5, graph = FALSE)

> res.hcpc<-HCPC(res ,nb.clust=0,consol=TRUE,min=3,max=10,graph=TRUE)
[1] "Click on the graph to cut the tree"

> res.hcpc$data.clust[,ncol(res.hcpc$data.clust),drop=F]
              clust
Amsterdam         6
Bangkok           3
Barcelona         4
Beijing           7
Berlin            4
Bogota            3
Boston            6
Brussels          4
Buenos Aires      3
Cairo             3
Chicago           5
Cologne           4
Copenhagen        6
Delhi             2
Dhaka             1
Dubai             3
Dublin            5
Frankfurt         6
Guangzhou         7
Helsinki          6
Hong Kong         4
Houston           5
Istanbul          3
Jakarta           3
Jerusalem         4
Johannesburg      1
Lima              3
Lisbon            5
London            5
Los Angeles       5
Madrid            4
Melbourne         6
Moscow            2
Mumbai            1
New York City     5
Oslo              6
Paris             4
Prague            5
Rome              4
San Francisco     8
Sao Paulo         3
Seoul             7
Shenzhen          3
Singapore         6
Stockholm         6
Sydney            8
Taipei            4
Tokyo             7
Vancouver         6
Vienna            4
Warsaw            5
Zurich            6

> plot.PCA(res, axes=c(1, 2), choix="var", new.plot=TRUE, col.var="black",col.quanti.sup="blue", label=c("var", "quanti.sup"), lim.cos2.var=0)

> summary(res, nb.dec = 3, nbelements=10, nbind = 10, ncp = 3, file="")

Call:
PCA(X = Dataset1.PCA, scale.unit = TRUE, ncp = 5, graph = FALSE) 


Eigenvalues
                       Dim.1   Dim.2   Dim.3   Dim.4   Dim.5   Dim.6   Dim.7   Dim.8
Variance               3.635   1.658   0.844   0.756   0.484   0.366   0.208   0.049
% of var.             45.439  20.729  10.551   9.452   6.047   4.574   2.596   0.612
Cumulative % of var.  45.439  66.169  76.719  86.171  92.218  96.792  99.388 100.000

Individuals (the 10 first)
                    Dist    Dim.1    ctr   cos2    Dim.2    ctr   cos2    Dim.3    ctr
Amsterdam       |  1.661 |  0.614  0.200  0.137 |  0.900  0.940  0.294 |  0.037  0.003
Bangkok         |  2.337 | -1.055  0.589  0.204 | -1.804  3.774  0.596 |  0.011  0.000
Barcelona       |  2.154 |  0.010  0.000  0.000 |  1.407  2.297  0.427 | -0.689  1.081
Beijing         |  3.519 |  0.433  0.099  0.015 | -3.113 11.239  0.783 | -1.237  3.487
Berlin          |  2.298 |  1.019  0.549  0.197 |  0.491  0.279  0.046 | -0.741  1.252
Bogota          |  2.226 | -1.602  1.358  0.518 |  0.146  0.025  0.004 | -0.928  1.960
Boston          |  2.424 |  1.234  0.806  0.259 |  0.967  1.084  0.159 |  1.422  4.609
Brussels        |  1.533 |  0.363  0.070  0.056 |  0.831  0.801  0.294 | -0.107  0.026
Buenos Aires    |  1.015 | -0.537  0.153  0.280 | -0.436  0.221  0.185 | -0.191  0.083
Cairo           |  3.021 | -2.604  3.589  0.743 |  0.324  0.122  0.012 | -1.259  3.610
                  cos2  
Amsterdam        0.001 |
Bangkok          0.000 |
Barcelona        0.102 |
Beijing          0.124 |
Berlin           0.104 |
Bogota           0.174 |
Boston           0.344 |
Brussels         0.005 |
Buenos Aires     0.035 |
Cairo            0.174 |

Variables
                   Dim.1    ctr   cos2    Dim.2    ctr   cos2    Dim.3    ctr   cos2  
gdp             |  0.810 18.058  0.656 |  0.184  2.045  0.034 |  0.415 20.367  0.172 |
unem_rate       | -0.512  7.203  0.262 |  0.610 22.447  0.372 | -0.089  0.937  0.008 |
n_hig_edu_insts |  0.143  0.560  0.020 | -0.790 37.668  0.625 |  0.201  4.773  0.040 |
inf_mort        | -0.765 16.088  0.585 |  0.073  0.320  0.005 |  0.439 22.882  0.193 |
lif_exp_male    |  0.884 21.481  0.781 |  0.121  0.890  0.015 | -0.294 10.248  0.087 |
lif_exp_fem     |  0.935 24.049  0.874 |  0.053  0.169  0.003 | -0.200  4.731  0.040 |
n_hosp          |  0.182  0.911  0.033 | -0.637 24.442  0.405 |  0.138  2.247  0.019 |
pm10            |  0.651 11.650  0.423 |  0.446 12.019  0.199 |  0.534 33.815  0.285 |

> remove(Dataset1.PCA)

> res$var$coord
                     Dim.1       Dim.2       Dim.3       Dim.4       Dim.5
gdp              0.8102051  0.18416302  0.41461720 -0.06952242  0.07886880
unem_rate       -0.5117151  0.61011627 -0.08893343  0.25196075  0.54230042
n_hig_edu_insts  0.1427373 -0.79035660  0.20072102 -0.37027498  0.41058218
inf_mort        -0.7647270  0.07283749  0.43947445  0.01597111 -0.06723370
lif_exp_male     0.8836599  0.12148247 -0.29411346  0.01153974  0.03448303
lif_exp_fem      0.9349980  0.05293423 -0.19982501  0.06884214  0.08987651
n_hosp           0.1819843 -0.63666320  0.13770648  0.73585128  0.02290250
pm10             0.6507592  0.44644816  0.53424659  0.06430530 -0.02318972

