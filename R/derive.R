#' Derive the ID of a presentation from the URL
#'
#' @param link URL of Google Slides presentation
#' @return A character vector
#' @export
#'
#' @examples
#' link = paste0("https://docs.google.com/presentation/d/",
#' "1Tg-GTGnUPduOtZKYuMoelqUNZnUp3vvg_7TtpUPL7e8",
#' "/edit#slide=id.g154aa4fae2_0_58")
#' derive_presentation_id(link)
derive_presentation_id <- function(link) {
  link = sub(".*presentation/", "", link)
  # if you publish by accident
  link = sub("/d/e", "/d", link)
  link = sub("^(d|e)/", "", link)
  link = strsplit(link, "/")[[1]]
  link = link[ !grepl("^(edit|pub|export|png)", link)]
  link = link[ nchar(link) > 5]
  link
}

#' Derive Google Drive Folder ID
#'
#' @param link URL of Google Drive Folder
#' @return A character vector
#'
#' @export
#' @examples
#' x = "https://drive.google.com/drive/folders/1pXBQQdd1peI56GtQT-jEZ59xSmhqQlFC?usp=sharing"
#' derive_folder_id(x)
#' x = "1pXBQQdd1peI56GtQT-jEZ59xSmhqQlFC"
#' derive_folder_id(x)
derive_folder_id <- function(link) {
  res = httr::parse_url(link)
  link = res$path
  link = sub(".*folders/", "", link)
  link = sub("[?].*", "", link)
  link = link[ nchar(link) > 5]
  link = trimws(link)
  link
}
