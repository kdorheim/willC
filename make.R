library(drake)

# TODO things we may want to consider doing, include having the figures from the vis results as a png 
# move the markdown to a different directory. I am not a huge fan of having everythign in the root dir. 
plan <- drake_plan(
  # The post post processing script, this markdown does quality control and converts the data from 
  # to total flux in Pg C. 
  # TODO we might waant some method of having this pull a repo or pic? 
  postpic_processing = rmarkdown::render(knitr_in("post-pic-processing.Rmd"),
                                                output_file = file_out("post-pic-processing.nb.html"),
                                                quiet = TRUE), 
  # This script visulaizes the results. 
                   final_results = rmarkdown::render(knitr_in("vis-results.Rmd"),
                                                     output_file = file_out("vis-results.nb.html"),
                                                     quiet = TRUE))

make(plan)
