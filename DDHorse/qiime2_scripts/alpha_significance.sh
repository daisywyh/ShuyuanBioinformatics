#Author: Yu Han Daisy Wang
#Date: June 21 2020
#Description: core metricss, alpha, beta analysis for merged

#exit when error removed so that i can run this while i sleep

source activate qiime2-2018.6
#start qiime2

export LC_ALL=C.UTF-8
export LANG=C.UTF-8
#idk why but everytime we use qiime we have to do this or else it doesnt' work?

qiime diversity alpha-group-significance \
  --i-alpha-diversity /file_pathway/faith_pd_vector.qza \
  --m-metadata-file /file_pathyway/your_metadata.tsv \
  --o-visualization /file_pathway/faith-pd-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity /file_pathway/evenness_vector.qza \
  --m-metadata-file /file_pathway/your_metadata.tsv \
  --o-visualization /file_pathway/evenness-group-significance.qzv
