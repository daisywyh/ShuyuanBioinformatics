library(tidyverse)
library(qiime2R)

setwd("~/Desktop/STEM/HorseProject/qiime2r_testing")

metadata<-read_q2metadata("Sept17Oct17Nov17Dec17Jan18Feb18.tsv")
shannon<-read_qza("shannon_vector.qza")$data %>% rownames_to_column("SampleID") 

metadata<-
  metadata %>% 
  left_join(shannon)

level_order <- c("control", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9")

metadata %>%
  filter(!is.na(shannon)) %>%
  ggplot(aes(x=factor(oral, level=level_order), y=shannon, color=factor(oral, level=level_order))) + ylim(5, 10) +
  stat_summary(geom="errorbar", fun.data=mean_se, width=0) +
  stat_summary(geom="line", fun.data=mean_se) +
  stat_summary(geom="point", fun.data=mean_se) +
  ggtitle("Shannon Diversity in Months After Antibiotic Use") +
  xlab("Months after antibiotic use") +
  ylab("Shannon Diversity") +
  theme_q2r() + # try other themes like theme_bw() or theme_classic()
  scale_color_viridis_d(name="Months after antibiotic use") # use different color scale which is color blind friendly
ggsave("Shannon_by_antibiotics.pdf", height=3.5, width=5, device="pdf")



