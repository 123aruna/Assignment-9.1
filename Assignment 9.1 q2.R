#2. Suppose p = the proportion of students who are admitted to the graduate school
#of the University of California at Berkeley, and suppose that a public relation
#officer boasts that UCB has historically had a 40% acceptance rate for its graduate
#school. Consider the data stored in the table UCBAdmissions from 1973. Assuming
#these observations constituted a simple random sample, are they consistent with the
#officerâ..s claim, or do they provide evidence that the acceptance
#rate was significantly less than 40%?
#Use an Î± = 0.01 significance level.
#Answer is 

#Our null hypothesis in this problem is 
#H0 : P=0.4
#And alternate hypothesis is 
#H1:p<0.4.
#Reject null hypothesis if p is too small that is if 
 # p^ - 0.4/sqrt(0.4(1-0.4)/n) < -z(alpha)

qnorm(0.99)
#[1] 2.326348

#our only remaining task is to find value of test statistic and see where it falls relative to critical value
#we can find number of people admitted and not admitted to ucb graduate school with following
ex<-as.data.frame(UCBAdmissions)

head(ex)
# Admit Gender Dept Freq
#1 Admitted   Male    A  512
#2 Rejected   Male    A  313
#3 Admitted Female    A   89
#4 Rejected Female    A   19
#5 Admitted   Male    B  353
#6 Rejected   Male    B  207
help(xtabs)
xtabs(Freq ~ Admit , data = ex)

#Admit
#Admitted Rejected 
#1755     2771 

#now calculate value of test stat
phat<- 1755/(1755+2771)
print(phat)
#[1] 0.3877596
(phat - 0.4)/sqrt(0.4*0.6/(1755 + 2771))
#[1] -1.680919

#conclusion
#our test stat is not less than -2.32 so it does not fall into critical region .Therefore we fail to reject null 
#hypothesis that the true proportion of students admitted into graduate school is less than 40% 
#and say that observed data are consistent with officers claim at alpha= 0.01 significance level