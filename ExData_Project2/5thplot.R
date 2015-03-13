NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
scc_motor <- SCC[grep("[Vv]ehicle", SCC$SCC.Level.Two), ]
nei_motor <- NEI[NEI$fips == "24510" & NEI$SCC %in% scc_motor$SCC, ]
total <- aggregate(nei_motor$Emissions, by=list(nei_motor$year), FUN=sum)
barplot(total$x, space=7, main = "Total emission", names.arg =total$Group.1, xlab="Year", axis.lty=1, ylim=c(0, 500))
