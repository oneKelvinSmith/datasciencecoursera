complete <- function(directory, id = 1:332) {
    monitors = list.files(directory) 
    subsetOfMonitors = monitors[id]

    dataFrame = data.frame(id = numeric(0), nobs = numeric(0))
    colnames(dataFrame) = c("id", "nobs")
    for (index in 1:length(id)) {
        monitor = subsetOfMonitors[index]
        monitorId = id[index]
        monitorFile = file.path(directory, monitor)
        monitorData = read.csv(monitorFile, header = TRUE)

        sulfateObservations = sum(!is.na(monitorData$sulfate))
        nitrateObservations = sum(!is.na(monitorData$nitrate))
        completeObservations = min(sulfateObservations, nitrateObservations)
        dataFrame[index,] = c(monitorId, completeObservations)
    }

    dataFrame
}

# complete("specdata", 1)
# complete("specdata", c(2, 4, 8, 10, 12))
# complete("specdata", 30:25)
# complete('specdata', 3)
