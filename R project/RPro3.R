library(networkD3)
library(igraph)
library(htmlwidgets)
library(magrittr)
library(webshot)

data <- data.frame(
  x = c("Madrid", "Madrid", "Barcelona", "Seville", "granada", "Seville",
        "Zaragoza","Barcelona", "granada", "Seville", "Valencia", "Madrid",
        "Albacete"),
  y = c("Barcelona", "Zaragoza", "Girona", "Madrid", "granada", "Madrid",
        "Barcelona","Vic", "Madrid", "granada", "Madrid", "Barcelona",
        "Valencia")
)
p <- simpleNetwork(data, height="100px", width="100px",        
                   Source = 1,                 
                   Target = 2,                 
                   linkDistance = 10,          
                   charge = -1000,               
                   fontSize = 18,               
                   fontFamily = "xkcd",       
                   linkColour = "black",   
                   nodeColour = "#eab676",     
                   opacity = 0.9,     
              
)
p
saveWidget(
  p,
  file = "E:/darsi/r/igraph3D.html",
  selfcontained = TRUE,
  libdir = NULL,
  background = "#873e23",
  knitrOptions = list()
)
webshot::install_phantomjs()
webshot("igraph3D.html","igraph.png", delay =5, vwidth = 800, vheight=450)
webshot("wordcloud.html","jdje.png", delay =5, vwidth = 800, vheight=450)
webshot("wordcloud.html","fig_1.pdf", delay =5, vwidth = 480, vheight=480)
