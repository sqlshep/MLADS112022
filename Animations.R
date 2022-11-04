#install.packages("animation")
library(animation)

kmeans.ani(x = cbind(X1 = runif(50), X2 = runif(50)), centers = 5,
           hints = c("Move centers!", "Find cluster?"), pch = 1:3, col = 1:3)



library(animation)
ani.options(interval = 1, nmax = 10)
cv.ani(main = "Demonstration of the k-fold Cross Validation", bty = "l")



library(modelr)
set.seed(1)  # Run to replicate this post
folds <- crossv_kfold(mtcars, k = 5)
folds

folds$test[[3]]
folds$train[[3]]

data(mtcars)


library(dplyr)
library(purrr)

folds <- crossv_kfold(mtcars, k = 5)
folds$train$'1'
folds$train$'2'
folds$train$'3'
folds$train$'4'
folds$train$'5'

folds$test$'1'
folds$test$'2'
folds$test$'3'
folds$test$'4'
folds$test$'5'


folds <- folds %>% mutate(model = map(train, ~ lm(mpg ~., data = .)))
folds
folds$model[[1]] %>% summary()
folds$model[[2]] %>% summary()
folds$model[[3]] %>% summary()
folds$model[[4]] %>% summary()
folds$model[[5]] %>% summary()


folds$model[[2]]$coefficients %>% summary()

