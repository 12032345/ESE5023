# Libraries
library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(viridis)

# data
library(gapminder)
data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)

#plot
data %>%
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, fill=continent)) +
  geom_point(alpha=0.5, shape=21, color="black") +
  scale_size(range = c(.1, 21), name="Population (M)") 
  ylab("Life Expectancy") +
  xlab("Gdp per Capita") +
  theme(legend.position = "none")