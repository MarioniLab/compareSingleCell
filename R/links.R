#' @importFrom BiocStyle Biocpkg
.link <- function(vignette, section, label) 
# Define links between vignettes.
{
    if (!is.null(section)) {
        section <- gsub(" +", "-", tolower(section))
        vignette <- paste0(vignette, ".html#", section)
    } else {
        vignette <- paste0(vignette, ".html")
    }
    Biocpkg("simpleSingleCell", vignette=vignette, label=label)
}
