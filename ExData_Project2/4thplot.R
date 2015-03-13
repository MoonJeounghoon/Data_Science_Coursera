NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
scc_coal <- SCC[grep("[cC]oal", SCC$Short.Name), ]
nei_coal <- NEI[NEI$SCC %in% scc_coal$SCC, ]
total <- aggregate(nei_coal$Emissions, by=list(nei_coal$year), FUN=sum)
barplot(total$x, space=7, main = "Total emission", names.arg =total$Group.1, xlab="Year", axis.lty=1, ylim=c(0, 6e+05))
