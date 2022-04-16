#Loading R Packages
library(shiny)
#install.packages("shinydashboard")
library(shinydashboard)
library(dplyr)
library(ggplot2)

ui <- fluidPage(

  dashboardPage(
   dashboardHeader(title="NewYork Property Analysis", titleWidth = 450,
                   tags$li(class="dropdown",tags$a(href="https://www.linkedin.com/in/diksha-shrestha/" ,icon("linkedin"), "My Profile", target="_blank")),
                   tags$li(class="dropdown",tags$a(href="https://github.com/dikshashrestha?tab=repositories", icon("github"), "Source Code", target="_blank"))
   ),
 #),
#   
  dashboardSidebar(
      sidebarMenu(id = "sidebar",
                  menuItem("Analyzing the Trend", tabName = "Trend", icon = icon("chart-line")),
                  menuItem("Density", tabName = "Den", icon = icon("bar-chart-o")),
                  menuItem("Corelation Matrix", tabName = "Matrix", icon=icon("table")),
                  menuItem("Comparison of Units", tabName = "Unit", icon=icon("list-alt"))

      )
    ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "Trend",
            fluidRow(
              tabBox(width = 8,
              tabPanel(title = "Across Cities",status = "primary" , solidHeader = T, background = "aqua", plotOutput("line"), p("The above line graph shows the average sale price across citiies of NewYork from the year 2015 to 2019. We can see that in the year 2015, Manhattan has the highest average sale price
with around $24 mil in total which is then followed by Brons. Similarly, the lowest averge sale price among all is the city StatenIsland with an average sale price of $1 million. In the year 2016, Queen has a significant increase in the average sale price compared to the other cities. Similarly, in the year 2017,   
Queens shows an abrupt decrease in the sale price. StatenIsland city over the 5 years shows a constant sale price which is then followed by Broklyn.")),
              
              tabPanel(title = "Excluding the higher City", status = "warning", solidHeader = T, background = "aqua", plotOutput("linegraph"), p("This line graph shows the average sales price of four cities excluding the average price of Queens. Through this we can get a closer look at the averge sale price of the cities below $10 mil.
We can now see that Manhattan show a gradual decrease in the sale price from the year 2015 to 2018 which then increase to $16 mil in 2019. The city Bronx has a decreasing then increasing sale price over the 5 years.")
                       # imageOutput("linegraph"),
                       )

      )
            )
    ),
    

    tabItem(tabName = "Den",
            fluidRow(
              tabBox(width = 8,
                tabPanel(title = "Density of Sale Across Cities", status = "primary", solidHeader = T, background = "aqua", plotOutput("cityden"), p("Through the figure above, we see that the Broklyn city has the highest density of the sale as compared to the other cities of NewYork with the density value of 2.5.
                                                                                                                                                     It is then followed by Manhattan with the density of around 0.6. Similarly, Bronx and Queens shows a density of 0.6 and 0.4 respectively.
                                                                                                                                                     Lastly, StatenIsland has the least density value of 0.25.")),
                tabPanel(title = "Distribution of Sale Count", status = "warning", solidHeader = T, background = "aqua", plotOutput("dist"), p("The above histogram shows the distribution of the sale count over the 5 years from 2015 to 2019. The histogram shows a moderate sale count from 2015 to 2017.
                                                                                                                                               However, on 2018, there is a significant increase in the sale count with approximately 4800 sale. In 2019, the sale count dramatically decreased and was in
                                                                                                                                               constant with the sale count distribution as of other previous year.")),
                tabPanel(title = "Average Sale over the year", status = "warning", solidHeader = T, background = "aqua", plotOutput("pric"), p("To analyze the significant increase in the sale count during the year 2018, I performed a line graph that shows the average sale price across cities over the
                                                                                                                                               5 years period. Through the above line graph, we know the the reason for a significant sale in 2018 was due to the lowest sale price in 2018 which led to the sale count going higher."))
              )
            )),
  
  tabItem(tabName = "Matrix",
           fluidRow(
             tabBox(width =8,
                    tabPanel(title = "Correlation Matrix", status = "primary", solidHeader = T, background = "aqua", plotOutput("corr"), p("The correlation matrix shows the correlation coefficients between the different variables. Through the matrix, we can see that the correlation along the diagonal shows it as 1 which mean
                                                                                                                                           that each variable are correlaton with itself. Similarly, we can see a slightly correlation between the residential unit and the sale price with the correlation coefficinets value shows as 0.5.
                                                                                                                                           Also, the heat map color makes it easier for the users to easily read the data in the correlation matrix. We also know that apart from the sale price and residential units, there is no any correlation
                                                                                                                                           between the other variables.")))
           )),
  tabItem(tabName = "Unit",
          fluidRow(
            tabBox(width =8,
                   tabPanel(title = "Residential Units", status = "primary", solidHeader = T, background = "aqua", plotOutput("residen"), p("The above bar graph shows the number of reidential unit sold over the 5 years. Through the bar graph we can see that in year 2018, the sale count of residential unit is 10,000 which is due to the
                                                                                                                                            average sale price in 2018 being low. Also, from 2015 to 2017, we can see the decrease in the number of residential unit sold over the years and on 2019 it has the simialr unit sold as of 2017.")),
                   tabPanel(title = 'Commercial Units', status = "primary", solidHeader = T, background = "aqua", plotOutput("commer"), p("The bar graph shows the number of commercial unit sold over the 5 year. The year excet 2018 shows that the commercial unit sold was below 150, however, for the year 2018, the commercial unit sold
                                                                                                                                          around 1100. Also, 2019 shows the least number of commercial units sold over the 5 years data.")))
          #))
  
  ))

    
  )
)
))
            
    
      

       
  
      
      

  




  
  
  
  
  
  
