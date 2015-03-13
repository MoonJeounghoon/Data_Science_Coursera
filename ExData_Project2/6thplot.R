NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
scc_motor <- SCC[grep("[Vv]ehicle", SCC$SCC.Level.Two), ]
nei_motorB <- NEI[NEI$fips == "24510" & NEI$SCC %in% scc_motor$SCC, ]
nei_motorLA <- NEI[NEI$fips == "06037" & NEI$SCC %in% scc_motor$SCC, ]
totalB <- aggregate(nei_motorB$Emissions, by=list(nei_motorB$year), FUN=sum)
totalLA <- aggregate(nei_motorLA$Emissions, by=list(nei_motorLA$year), FUN=sum)
par(mfrow=c(1,2), bg="white")
barplot(totalB$x, space=7, main = "Baltimore City", names.arg =totalB$Group.1, xlab="Year", ylab="Emission from Vehicles", axis.lty=1, ylim=c(0, 500))
barplot(totalLA$x, space=7, main = "Los Angeles", names.arg =totalLA$Group.1, xlab="Year", ylab="Emission from Vehicles", axis.lty=1, ylim=c(0, 7500))
