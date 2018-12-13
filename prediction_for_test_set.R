# prediction of software defects using multiple logistic regression

# reading the data into data frames

# load the non-binned training dataset pc1_training_set_non_binned.csv into this data frame
training_data <- read.csv(file.choose())

# load the non-binned test dataset pc1_test_set_non_binned.csv into this data frame
test_data <- read.csv(file.choose())

# creating a multiple logistic regression model
training_data$defects_level <- ifelse(training_data$defects == 'TRUE' , 1, 0)
m <- glm(training_data$defects_level ~ training_data$E+training_data$T+training_data$lOCode+training_data$lOComment+training_data$locCodeAndComment , family = binomial)
summary(m)


# storing the beta coefficients in coeff_vector
coeff_vector <- coef(m)
coeff_vector


# function to check the value
# will return 0 if the value is NULL else the value itself

checkval <- function(a){
  if(is.null(a))
    return(0)
  else
    return(a) 
}



# storing the beta coefficients


beta_0 = checkval(coeff_vector[1])
beta_1 = checkval(coeff_vector[2])
beta_2 = checkval(coeff_vector[3])
beta_3 = checkval(coeff_vector[4])
beta_4 = checkval(coeff_vector[5])
beta_5 = checkval(coeff_vector[6])


# storing the attributes in respective vectors

e <- test_data$E
t <- test_data$T
io_code <- test_data$lOCode
io_comment <- test_data$lOComment
io_code_and_comment <- test_data$locCodeAndComment


# number of rows in the test_data data frame

nrow(test_data)


# function to predict the class attribute 

predict <- function(e_, t_, io_code_, io_comment_, io_code_and_comment_){
  alpha = beta_0 + beta_1 * e_ + beta_2 * t_ + beta_3 * io_code_ + beta_4 * io_comment_ + beta_5 * io_code_and_comment_
  p = exp(alpha)/ (1 + exp(alpha))
  if (p <= 0.5)
    return("FALSE")
  else 
    return("TRUE")
}


# creating a new data frame to store the test_data attributes alongwith the class attribute

df <- data.frame(matrix(ncol = 6, nrow = 365))
x <- c("E", "T", "lOCode", "lOComment", "locCodeAndComment", "defects")
colnames(df) <- x

df$E <- e
df$T <- t
df$lOCode <- io_code
df$lOComment <- io_comment
df$locCodeAndComment <- io_code_and_comment


# vector to store the predicted class attributes

defects <- c()


for (i in 1:nrow(test_data)) {

  prediction <- predict(e[i], t[i], io_code[i], io_comment[i], io_code_and_comment[i])
  defects[i] <- prediction
  
}


# assigning the predicted class attributes to the df data frame

df$defects <- defects


# change the file path to where you want the resulting test dataset with class attribute predictions to be stored

write.csv(df, file = 'prediction_test_set_logistic_regression.csv', row.names = FALSE, col.names = TRUE)











