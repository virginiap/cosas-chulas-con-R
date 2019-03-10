# 1.- Text labels repel away from each other ------------------------------


library(ggplot2) ##
ggplot(mtcars, aes(wt, mpg, label = rownames(mtcars))) +
  geom_text() +
  geom_point(color = 'red') +
  theme_classic(base_size = 16)


library(ggrepel)
ggplot(mtcars, aes(wt, mpg, label = rownames(mtcars))) +
  geom_text_repel() +
  geom_point(color = 'red') +
  theme_classic(base_size = 16)





# 2.- Dependencies visuallization -----------------------------------------



require(DependenciesGraphs)

# Primero hay que cargar la librería
library(plyr, quietly = TRUE)

# Dependencias de "count"
plot(funDependencies("package:plyr","count"))

# Todas las dependencias
plot(envirDependencies("package:plyr"))


# 3.- fun library ---------------------------------------------------------

library(fun)


# Password whith 12 characters
random_password()
# Password whith 20 alphanumeric characters only
random_password(20, extended=FALSE)


# "Mine Sweeper" game
if (interactive()) {
  if (.Platform$OS.type == "windows")
    x11() else x11(type = "Xlib")
  mine_sweeper()
}



# Puzzle
if (interactive()) {
  if (.Platform$OS.type == "windows")
    x11() else x11(type = "Xlib")
  sliding_puzzle()
  sliding_puzzle(z = matrix(0:11, 3, 4))
}



# "Lights Out" game
if (interactive()) {
  if (.Platform$OS.type == "windows")
    x11() else x11(type = "Xlib")
  lights_out()
}


