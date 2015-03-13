NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
test <- aggregate(NEI$Emissions[NEI$fips ==24510], by=list(NEI$year[NEI$fips ==24510], NEI$type[NEI$fips ==24510]), FUN=sum)
type <- test$Group.2
qplot(test$Group.1, test$x, facets = type ~ .)
qplot(test$Group.1, test$x, facets = type ~ ., geom=c("point", "smooth"), method="lm", xlab="Year", ylab="Total emissions", se = FALSE)
