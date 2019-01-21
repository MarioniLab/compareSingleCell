#' @importFrom callr r
#' @importFrom rmarkdown render
#' @importFrom methods is
.compile <- function(target) 
# Compiles all dependent workflows in an enslaved R session.
{
    if (!file.exists(paste0(target, ".html"))) {
        script <- paste0(target, ".Rmd")
        logfile <- tempfile(fileext=".log")

        E <- try(
            r(function(target) rmarkdown::render(target), args=list(target=script), stderr=logfile, stdout=logfile),
            silent=TRUE
        )

        if (is(E, "try-error")) {
            message(paste0(target, "> ", readLines(logfile), "\n"))
            stop(sprintf("failed to compile '%s'", script))
        }
    }
    invisible(NULL)
}
