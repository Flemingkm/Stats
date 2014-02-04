library(MASS)
Mdays <- quine$Days[quine$Sex == "M"]
Fdays <- quine$Days[quine$Sex == "F"]
mean(Mdays)
mean(Fdays)
Msldays <- quine$Days[quine$Sex == "M" & quine$Lrn == "SL"]
mean(Msldays)
tapply(quine$Days, list(quine$Sex, quine$Lrn), mean)
tapply(quine$Days, list(quine$Sex, quine$Lrn), median)
hist(Msldays, main = "Histogram of Days missed for Male Slow Learners", xlab = "Days Missed", col = "red")
plot(density(Msldays))
boxplot(Msldays, horizontal = TRUE, col = "000066", main = "Boxplot of UGH!", xlab = "Days Missed")
T1 <- table(quine$Lrn, quine$Sex)
barplot(T1, legend = TRUE, beside = TRUE, col = c("peachpuff2", "peru"))
library(lattice)
histogram(~Days | Sex*Age, data = quine, layout = c(4,2))
densityplot(~Days | Sex*Age, data = quine, layout = c(4,2))
bwplot(Sex~Days | Lrn, data = quine)
#
library(PASWR)
?EPIDURALf
xyplot(kg~cm | Treatment*Ease, data = EPIDURALf, type = c("p", "r"))
fl <- read.csv("http://www1.appstate.edu/~arnholta/Data/FlightDelays.csv")