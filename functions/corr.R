source("complete.R")

corr <- function(directory, threshold = 0) {
    monitors <- list.files(directory)
    range <- 1:length(monitors)

    observations <- complete(directory, range)
    observationsAboveThreshold <- subset(observations, observations$nobs > threshold)

    correlation <- function(id) {
        monitor <- monitors[id]
        monitorFile <- file.path(directory, monitor)
        monitorData <- read.csv(monitorFile, header = TRUE)

        cor(monitorData$sulfate, monitorData$nitrate, use = "na.or.complete")
    }

    sapply(observationsAboveThreshold$id, correlation)
}