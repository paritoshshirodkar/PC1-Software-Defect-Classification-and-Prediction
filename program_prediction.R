# prediction of software defects in the program using multiple logistic regression

# reading the data into data frames

# load the training dataset training_dataset.csv into this data frame
data <- read.csv(file.choose())

# load the attribute dataset attributes_program.csv into this data frame
# to obtain this data set first run the JAVA project GenerateMetrics
attriute_data <- read.csv(file.choose())


# creating a multiple logistic regression model
data$defects_level <- ifelse(data$defects == 'TRUE' , 1, 0)
m <- glm(data$defects_level ~ data$E+data$T+data$lOCode+data$lOComment+data$locCodeAndComment , family = binomial)
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


# predicting the class attribute 

alpha = beta_0 + beta_1 * attriute_data$E + beta_2 * attriute_data$T + beta_3 * attriute_data$lOCode + beta_4 * attriute_data$lOComment + beta_5 * attriute_data$locCodeAndComment
p = exp(alpha)/ (1 + exp(alpha))
p


# function to write the predicted class attribute in the attribute dataset
# change the file path to where you want the resulting attribute dataset with class attribute predictions to be stored


write_prediction <- function(p){
  if(p <= 0.5){
    attriute_data$defects = 'FALSE'
    write.csv(attriute_data, file = 'C:/Users/Paritosh/Desktop/prediction_program_logistic_regression.csv', row.names = FALSE, col.names = TRUE)
  }
  else{
    attriute_data$defects = 'TRUE'
    write.csv(attriute_data, file = 'C:/Users/Paritosh/Desktop/prediction_program_logistic_regression.csv', row.names = FALSE, col.names = TRUE)
  }
  
}

write_prediction(p)

