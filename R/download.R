#' Download Google Slides
#'
#' @param link Link to Google Slides presentation
#' @param type Type of file to download as output. Usually
#' `pdf` or `pptx`
#'
#' @note This downloads presentations if they are public and also try to make
#' sure it does not fail on large files
#' @return Downloaded file (in temporary directory)
#' @export
download = function(link, type = "pptx") {
  stopifnot(is.character(link))
  id = derive_presentation_id(link)
  # construct URL to export image file from Google Slides
  url = export_link(id = id, page_id = NULL, type = type)
  tmp = tempfile(fileext = paste0(".", type))

  # retrieve from url and write response to disk
  result = httr::GET(url, httr::write_disk(tmp))
  warn_user = FALSE
  fr_header = result$headers$`x-frame-options`
  if (!is.null(fr_header)) {
    if (all(fr_header == "DENY")) {
      warn_user = TRUE
    }
  }
  if (httr::status_code(result) >= 300) {
    warn_user = TRUE
  }
  # Don't write something if not really a pptx
  content_type = result$headers$`content-type`
  if (httr::status_code(result) >= 400 &&
      !is.null(content_type) && grepl("html", content_type)) {
    file.remove(tmp)
  }
  if (grepl("ServiceLogin", result$url)) {
    warn_user = TRUE
  }

  if (warn_user) {
    stop(
      paste("Is link sharing enabled?",
            "It's possible that this presentation isn't accessible."),
      call. = FALSE
    )
  }

  tmp
}
