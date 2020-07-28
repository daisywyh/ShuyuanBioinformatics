setwd("~/Desktop/STEM/HorseProject/qiime2r_testing")

library(tidyverse)
library(qiime2R)

metadata<-read_q2metadata("Sept17Oct17Nov17Dec17Jan18Feb18.tsv")
uwunifrac<-read_qza("weighted_unifrac_pcoa_results.qza")

uwunifrac$data$Vectors %>%
  select(SampleID, PC1, PC2) %>%
  left_join(metadata) %>%
  ggplot(aes(x=PC1, y=PC2, color=`oral`)) +
  geom_point(alpha=0.5) + #alpha controls transparency and helps when points are overlapping
  theme_q2r() + 
  scale_shape_manual(values=c(16,1), name="Antibiotic Usage") + #see http://www.sthda.com/sthda/RDoc/figure/graphs/r-plot-pch-symbols-points-in-r.png for numeric shape codes
  scale_color_manual(name ="oral",
    #breaks = c("?", "0", "1", "2", "3","4","5","6","7","8","9","control"),
                     values=c("white", "red","magenta","pink", "orange","yellow","greenyellow","green","blue","violet","purple","grey"))
  #scale_color_discrete(name="oral")
ggsave("PCoA.pdf", height=4, width=5, device="pdf") # save a PDF 3 inches by 4 inches