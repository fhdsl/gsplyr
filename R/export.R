# Constructs a link to export an image file from a Google Slides
export_link <- function(id, page_id = NULL, type = "png") {
  url <- paste0("https://docs.google.com/presentation/d/",
                id, "/export/", type, "?id=", id)
  if (!is.null(page_id)) {
    url <- paste0(url, "&pageid=", page_id)
  }
  url
}

# Constructs an URL to export to PPTX
export_link_pptx <- function(id) {
  export_link(id, page_id = NULL, type = "pptx")
}

# Constructs an URL to export to PDF
export_link_pdf <- function(id) {
  export_link(id, page_id = NULL, type = "pdf")
}
