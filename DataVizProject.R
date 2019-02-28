# My attempt and The Economist data visualization project

#install.packages('ggplot2')
#install.packages('data.table')
df <- fread('Economist_Assignment_Data.csv', drop=1)



pl <- ggplot(df, aes(x = CPI, y = HDI)) + 
      geom_point(aes(color = Region), size = 2.5, shape = 21, stroke = 1.4) + # Lines 9-10 define the basic structure of our plot: a scatterplot with HDI on y and CPI on x with points colored by region.
      theme_minimal() + # Remove background color and changes grid lines slightly.
      scale_x_continuous(name = "Corruptions Perceptions Index, 2011 (10=least corrupt)",breaks=seq(1,10,by=1), limits = c(1,10)) + # Change x-axis title, create x tally marks, set x-axis limits.
      scale_y_continuous(name = "Human Development Index, 2011 (1=best)", breaks=seq(0.2,1.0, by=0.1), limits = c(0.2, 1.0)) + # change y-axis title, create y tally marks, set y-axis limits.
      ggtitle("Corruption and Human Development") + # Give the graph a title
      geom_smooth(aes(group = 1), se = F, method = lm, formula = y~log(x), color = 'red') + # get rid of confidence interval, use smooth withg custom model/formula, change color
print(pl)
