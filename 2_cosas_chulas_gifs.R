# 1.- Make gifs -------------------------------------------------------------
# Example: # https://ropensci.org/blog/2017/08/15/magick-10/

## Gif: countdown from 10 to 1 and "GO!".

if(dir.exists("examples")){
  unlink("examples", recursive = TRUE)
  }
dir.create("examples")

png(file="examples/example%02d.png", width=200, height=200)
for (i in c(10:1, "G0!")){
  plot.new()
  text(.5, .5, i, cex = 6)
}
dev.off()
# brew install ImageMagick
system("convert -delay 80 examples/*.png examples/example_1.gif")




# 2.- Display progression of a long calculation at the R console ----------

require(svMisc)

## Gif count from 1 to 25

setwd("./examples")
file.remove(list.files( pattern="*.png"))

png(file="example%02d.png", width=200, height=200)

for (i in c(0:25)){
  
  progress(i, 25, progress.bar = TRUE)
  Sys.sleep(0.03)
  if (i == 25) cat("Done!")
  
  
  plot.new()
  text(.5, .5, i, cex = 6)
  
}
dev.off()
system("convert -delay 40 *.png example_2.gif")


## Gif: count from 1 to 100

file.remove(list.files( pattern="*.png"))

png(file="example%02d.png", width=200, height=200)

for (i in c(0:100)){

  progress(i, progress.bar = TRUE)
  Sys.sleep(0.03)
  if (i == 100) cat("Done!\n")
  
  plot.new()
  text(.5, .5, i, cex = 6)
}
dev.off()
system("convert -delay 10 *.png example_3.gif")
file.remove(list.files( pattern="*.png"))

