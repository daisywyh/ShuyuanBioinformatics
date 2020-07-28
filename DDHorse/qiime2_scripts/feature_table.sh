#Author: Yu Han Daisy Wang
#Date: June 21 2020
#Description: summarises and tabulates feature tables for all months

set -e
#do this so the script exists when there is an error

source activate qiime2-2018.6
#start qiime2

export LC_ALL=C.UTF-8
export LANG=C.UTF-8
#idk why but everytime we use qiime we have to do this or else it doesnt' work?

echo feature table summarizing for november

qiime feature-table summarize \
  --i-table   /file_pathway/table.qza \
  --o-visualization /file_pathway/table.qzv \
  --m-sample-metadata-file /file_pathway/your_metadata.tsv


echo all feature table stuff is done
