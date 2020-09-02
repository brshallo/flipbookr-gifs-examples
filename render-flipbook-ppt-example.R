filepath <- fs::path_ext_remove("example-r4ds.Rmd")
filepath_pdf <- fs::path_ext_set(filepath, "pdf")
filepath_pptx <- fs::path_ext_set(filepath, "pptx")

pagedown::chrome_print(filepath) # run if have not already created pdf

screen_imgs <- pdftools::pdf_convert(pdf = filepath_pdf, format = "png", verbose = FALSE)

library(officer)
library(tidyverse)

doc <- read_pptx()
for (i in seq_along(screen_imgs)){
  doc <- doc %>%
    add_slide(layout = "Blank", master="Office Theme") %>% 
    ph_with(value = external_img(screen_imgs[[i]]), 
            location = ph_location_fullsize() ) 
}

print(doc, filepath_pptx) 
