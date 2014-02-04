site <- "http://www1.appstate.edu/~arnholta/PASWR/CD/data/Poplar3.CSV"
poplar <- read.csv(file = site)
str(poplar)
summary(poplar)
poplarC <- read.csv(file = url(site), na.strings = "-99",
                    colClasses = c(rep("factor", 3), rep("numeric", 3), "factor"))
str(poplarC)
summary(poplarC)
plot(poplarC$Height,poplarC$Weight)
poplarC$Height[poplarC$Height < 2]
poplarC$Height[1:10]

