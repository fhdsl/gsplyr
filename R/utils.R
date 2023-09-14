#' @export
#' @rdname get_slide_id
make_slide_url <- function(x) {
  x = derive_presentation_id(x)
  x = paste0("https://docs.google.com/presentation/d/",x)
  x
}

# Check if vector of URLs is valid (Status Code = 200)
check_png_url <- function(urls) {
  res = vapply(urls, function(url) {
    tfile = tempfile(fileext = ".png")
    ret = httr::GET(url)
    httr::status_code(ret) == 200
  }, FUN.VALUE = logical(1))
  return(res)
}
