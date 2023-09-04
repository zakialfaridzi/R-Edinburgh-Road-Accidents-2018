library(tidyverse)
library(dsbox)

glimpse(accidents)

accidents %>% 
  filter(vehicles >=2, urban_rural==1) %>% 
  nrow()

accidents %>%
  count(speed_limit, sort = TRUE)

accidents <- accidents %>%
  mutate(light = case_when(
    light == "Daylight" ~ "Daylight",
    light == "Darkness - lights lit"       ~ "Darkness, lights lit",
    light == "Darkness - lights unlit"     ~ "Darkness, lights unlit", 
    light == "Darkness - no lighting"      ~ "Darkness, no lighting", 
    light == "Darkness - lighting unknown" ~ "Darkness, lighting unknown"
  ))

ggplot(data=accidents)+
  geom_bar(mapping = aes(x=severity, fill=light), position = "fill")+
  coord_flip()+
  labs(
    y = "Proporsi Kejadian", x = "Keparahan Indiden",
    fill = "Kondisi Cahaya", 
    title = "Kondisi Cahaya and Keparahan Insiden") +
  scale_fill_viridis_d()


