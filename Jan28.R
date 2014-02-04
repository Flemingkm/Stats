# DF = dataframe
#cutpoints <- quantile(DF$var10, probs = c(0, .25, .5, .75, 1)) # Gives the min, quantile 1,2,3 and max
#DF$var11 <- cut(DF$var10, cutpoints) # stores in new var in dataframe


# kg / (cm/100)^2 1/28/14
library(PASWR) # Loading PASWR package
EPIDURALf 

head(EPIDURALf)
str(EPIDURALf)
EPIDURALf$BMI <- EPIDURALf$kg/(EPIDURALf$cm/100)^2
head(EPIDURALf)
EPI <- EPIDURALf
tapply(EPI$BMI, EPI$Treatment, mean) #Three S's for distro - Shape(histrogram, densityplot)

library(ggplot2)
cutpoints <- quantile(EPI$BMI, probs = c(0, .25, .50, .75, 1))
EPI$Qu <- cut(EPI$BMI, cutpoints)

p <- ggplot(data = EPIDURALf, aes (x = cm, y = kg, color = Treatment))
p <- p + geom_point(size = 5)
p
p + geom_smooth(se = FALSE, size = 3)
p + facet_grid(Treatment~Qu) + geom_smooth()


p <- ggplot(data = EPI, aes(x = BMI))
p + geom_histogram()
p + geom_density() + facet_grid(Treatment~Doctor)

gp <- ggplot(data = EPI, aes(x = Treatment, y = BMI))
gp + geom_boxplot() + facet_grid(Doctor~Qu)
