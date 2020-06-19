library(knitr)

# flipbook_filepath can be either the rmd or html location of the flipbook
flipbook_to_gif <- function(flipbook_filepath, 
                            density = 100,
                            delay = 1,
                            env_pdf = rlang::caller_env()){
  
  filepath <- fs::path_ext_remove(flipbook_filepath)
  filepath_pdf <- fs::path_ext_set(filepath, "pdf")
  filepath_gif <- fs::path_ext_set(filepath, "gif")
  
  env_pdf$flipbook_filepath <- flipbook_filepath
  with(env_pdf, pagedown::chrome_print(flipbook_filepath))
  
  images <- magick::image_read_pdf(filepath_pdf, density = density)
  magick::image_write_gif(images,
                          filepath_gif,
                          delay = delay)
}

# create gif of example from R for Data Science book
flipbook_to_gif(here::here("example-r4ds.Rmd"))

# create gif of flipbook of visual made in prior blog
flipbook_to_gif(here::here("example-riddler-solution.Rmd"))

# create gif of flipbook of visual made in prior blog
flipbook_to_gif(here::here("minimal-flipbook.Rmd"))