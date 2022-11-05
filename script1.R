library(readr)

str1 = capture.output(getwd()) #workspace directory
str2 = "/Dinic_1.txt" #filename

path = paste(str1, str2)
path = gsub("\"", "", path)
path = gsub(" ", "", path)
path = substring(path, 4)

d <- read_lines(path)
y <- as.numeric( d[seq(2,length(d),2)])

x <- expand.grid(seq(10, 100, by=10), 1:10) # (10, 1) (20, 1) (30, 1) ... (90, 10) (100, 10)

fit <- lm(y ~ x[,1] + x[,2])


# Plot the linear model
plot(y ~ x[,1] + x[,2], data = data.frame(y, x), pch = 19, cex = 2, col = "blue")


# s <- paste(d[seq(1,length(d),2)],)
# data <- read.table(header=F, stringsAsFactors=F, text=s)

# fit <- lm(data[,2] ~ data[,1])

# plot(fit)

# plot(data[,1], data[,2], xlab="Maximum Flow Found", ylab="Tempo")

# abline(fit, col="red")

