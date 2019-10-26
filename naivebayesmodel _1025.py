#!/usr/bin/env python
# coding: utf-8

# ## Naive Bayes Classifier

# In[1]:


import numpy as np 
import pandas as pd 
import matplotlib.pyplot as plt
from scipy.stats import multivariate_normal as mvn  

get_ipython().run_line_magic('matplotlib', 'inline')


# In[ ]:





# In[2]:


def accuracy(y, y_hat):
    return np.mean(y == y_hat)


# In[3]:


class NaiveBayesClassifier():
    
    def fit(self, X, y):    
        self.likelihoods = dict()
        self.priors = dict()
        
        self.K = set(y)    
        
        for k in self.K:
            X_k = X[y == k]  
            self.likelihoods[k] = {"mu":X_k.mean(axis = 0), "SIGMA" :np.cov(X_k.T)}
            self.priors[k] = len(X_k)/len(X)   
        
        
    def predict(self, X):  
        
        P = np.zeros((len(X), len(self.K)))
        
        
        P[:,k] =mvn.logpdf(X, l["mu"], l["SIGMA"]) + np.log(self.priors[k]) 
        
        return P.argmax(axis = 1) 
            
        
        
        
        
    


# In[6]:


def main() :
    D = 2
    K = 3
    N = int(K*1e3)
    
    X0 = np.random.randn(N//K,D) + np.array([2,2])
    X1 = np.random.randn(N//K,D) + np.array([0,-2])
    X2 = np.random.randn(N//K,D) + np.array([-2,2])
    X = np.vstack((X0, X1, X2))
    
    y= np.array([0]*(N//K) + [1]*(N//K) + [2]*(N//K))
    
    plt.figure()
    plt.scatter(X[:,0], X[:,1], c = y, alpha=0.5)
    plt.show()
    
    nb = NaiveBayesClassifier()
    nb.fit(X,y)
    y_hat = nb.predict(X)
    
    
    print(f"Training Accuracy: {accuracy(y, y_hat):0.4f}")
    
    
    


# In[ ]:





# In[7]:


if __name__ =="__main__":
    main()
    print("Applie")
    
else:
    print("Not applied")

