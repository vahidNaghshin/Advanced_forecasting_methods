library(fpp2)
#Problem 11-1
retaildata <- readxl::read_excel("/Users/vnagh/Desktop/untitled_folder_4/retail.xlsx", skip=1)
myts <- ts(retaildata[,"A3349873A"],
           frequency=12, start=c(1982,4))
(lambda <- BoxCox.lambda(myts))
autoplot(BoxCox(myts,lambda))
myts.trans <- BoxCox(myts,lambda)
tbats(myts.trans) -> fit2
checkresiduals(fit2)
fc2 <- forecast(fit2, h=10)
autoplot(fc2, include=10)
#Problem 11-2
tbats(gasoline) -> fit
checkresiduals(fit)
fc <- forecast(fit, h=10)
autoplot(fc, include=10)
#Problem 11-3
fit <- nnetar(myts, lambda=BoxCox.lambda(myts))
autoplot(forecast(fit,h=30))
