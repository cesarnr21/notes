import math
import numpy as np

# TODO: rewrite these functions to use numpy arrays as inputs and speed up the math

# Mean Average Error
def MAE(actual, predictions):
    n = len(actual)
    result = 0
    for i in range(n):
        val = abs(actual[i] -  predictions[i])
        result = result + val
    
    result = result / n
    return result


# Mean Average Percentage Error
def MAPE(actual, predictions):
    n = len(actual)
    result = 0
    for i in range(n):
        val = abs((actual[i] -  predictions[i]) / actual[i])
        result = result + val
    
    result = result / n
    return result


# Mean Squared Error
def MSE(actual, predictions):
    n = len(actual)
    result = 0
    for i in range(n):
        val = (actual[i] -  predictions[i]) ** 2
        result = result + val
    
    result = result / n
    return result


# Root Mean Squared Error
def RMSE(actual, predictions):
    n = len(actual)
    result = 0
    for i in range(n):
        val = (actual[i] -  predictions[i]) ** 2
        result = result + val
    
    result = math.sqrt(result / n)
    return result
