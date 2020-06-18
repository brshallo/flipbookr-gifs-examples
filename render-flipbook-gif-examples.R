flipbook_to_gif <- function(flipbook_filepath_rmd, 
                            density = 100,
                            delay = 1){
  
  filepath <- fs::path_ext_remove(flipbook_filepath_rmd)
  filepath_pdf <- fs::path_ext_set(filepath, "pdf")
  filepath_gif <- fs::path_ext_set(filepath, "gif")
  
  pagedown::chrome_print(flipbook_filepath_rmd)
  images <- magick::image_read_pdf(filepath_pdf, density = density)
  
  magick::image_write_gif(images,
                          filepath_gif,
                          delay = delay)
}

# create gif of example from R for Data Science book
flipbook_to_gif(here::here("example-r4ds.Rmd"))

# create gif of flipbook of visual made in prior blog
flipbook_to_gif(here::here("example-riddler-solution.Rmd"))

