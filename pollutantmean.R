pollutantmean <- function(directory, pollutant, id = 1:332) {
    monitors = list.files(directory)
    subsetOfMonitors = monitors[id]
    pollutantData = numeric(0)

    for (monitor in subsetOfMonitors) {
        monitorFile = file.path(directory, monitor)
        monitorData = read.csv(monitorFile, header = TRUE)
        pollutantData = c(pollutantData, monitorData[[pollutant]])
    }

    mean(pollutantData, na.rm = TRUE)
}

# pollutantmean("specdata", "sulfate", 1:10)
# pollutantmean("specdata", "nitrate", 70:72)
# pollutantmean("specdata", "nitrate", 23)
