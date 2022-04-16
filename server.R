library(shiny)
library(shinydashboard)
library(DT)
library(readxl)
library(plotly)
library(tidyr)
library(ggplot2)
library(corrplot)
library(MASS)
library(corrr)
library(ggcorrplot)
library(gganimate)
function(input, output,session){
  
  
    
  #Line Graph across cities
  
  output$line <-renderPlot({
    my_data <- read.csv("Trend.csv")
    ggplot(my_data, aes(x=Year, y = Avg_Sale_Price, colour = City)) + 
      geom_line()+
      labs(y = 'Avg Sale Price(In Thousands)', title = 'Average Sale Price across cities')
    })
  
  #Line Graph of four cities escluding Queens

  output$linegraph <-renderPlot({
    Four_Cities <- read.csv("Four_Cities.csv")
    ggplot(Four_Cities, aes(x = Year, y = Avg_Sale_Price, colour = City))+
      geom_line()+
      labs(y = 'Avg Sale Price(In Thousands)', title = 'Average Sale Price of four cities excluding Queens')
    
  })
  
  
  # output$linegraph <-renderImage({
  #   Four_Cities <- read.csv(file ='Four_Cities.csv')
  # 
  #   outfile <- tempfile(fileext='.gif')
  #   q= ggplot(Four_Cities, aes(x = Year, y = Avg_Sale_Price, colour = City))+
  #     geom_line(stat='identity')+ theme_bw() + transition_reveal(Year)
  # 
  #   anim_save("linegraph.gif", animate(q,height=400,width=800,fps=20,duration=20,end_pause=60,res=120))
  #   list(src = "linegraph.gif",
  #        contentType = 'image/gif'
  # 
  #   )}, deleteFile = FALSE)
  
  
  
  #Across city density distribution
  output$cityden <- renderPlot({
    New_Data <- read.csv("New_Data.csv")
    City_Density <- New_Data%>% 
      dplyr::select(City) %>% 
      gather(metric, value) %>% 
      ggplot(aes(value, fill = metric)) + 
      geom_density(show.legend = FALSE) + 
      facet_wrap(~ metric, scales = "free")
    
    ggplot(New_Data, aes(x = City)) +
      geom_density(fill = 'cyan')+
      labs(title = 'Density of Sale Across cities of NewYork')
  })
  #Distribution of sale count each year

  output$dist <- renderPlot({
    Sale_Dist <- read.csv("Sale_Dist.csv")
    Histo <- ggplot(Sale_Dist, aes(x=Year)) + 
      geom_histogram(binwidth = 1, colour = "white", fill = "coral")+
      labs(title = 'Distribution of Sale count over the year')
    Histo
    
  })
  
  #Average sale over the year

  output$pric <- renderPlot({
    
    Price <- read.csv("Price.csv")
    
    ggplot(Price, aes(x=Year, y = Avg_Sale_Price)) + 
      geom_line(colour = "cornflowerblue")+
      labs(y = 'Avg Sale Price(In Thousands)', title = 'Average Sale Price across cities')
  })
  
  #Correlation Matrix
  Correl <- read.csv("Correl.csv")
  output$corr <- renderPlot({
    corelation=cor(Correl)
    corelation
    ggcorrplot(corelation)
    
    
    })
  #Number of Residential Unit sold
  Residential_Sum <- read.csv("Residential_Sum.csv")
  output$residen <- renderPlot({
    ggplot(Residential_Sum, aes(x = Year, y = Sum_Residential))+
      geom_bar(stat = "identity", fill = "aquamarine3")+
      labs(y = 'Residential Unit ', title = "Number of Residential Unit sold over the Year")
    
  })
  
  #Number of Commercial Unit sold
  Commercial_Sum <- read.csv("Commercial_Sum.csv")
  output$commer <- renderPlot({
    ggplot(Commercial_Sum, aes(x = Year, y = Sum_Commercial))+
      geom_bar(stat = "identity", fill = "deepskyblue3")+
      labs(y = ' Commercial Unit', title = "Number of Commercial Unit sold over the year")
  })
  
  
  
  
  
 }
  
  
    
  
  
  
  
