#Author: Yu Han Daisy Wang
#Last Updated: 25 Sept 2020
#Description: summarises and tabulates feature tables for all months

set -e
#do this so the script exists when there is an error

source activate qiime2-2018.6
#start qiime2

export LC_ALL=C.UTF-8
export LANG=C.UTF-8
#idk why but everytime we use qiime we have to do this or else it doesnt' work?

echo start feature table summarizing

qiime feature-table summarize \
  --i-table   /file_pathway/your_name_table.qza \
  --o-visualization /file_pathway/table.qzv \
  --m-sample-metadata-file /file_pathway/your_metadata.tsv

echo feature table summarizing done
echo output files: your_name_table.qzv

echo start feature table tabulating
qiime feature-table tabulate-seqs \
  --i-data /home/file_pathway/your_name_rep-seqs.qza \
  --o-visualization /home/file_pathway/your_name_rep-seqs.qzv

echo feature table tabulating done
echo output files: your_name_rep-seqs.qzv
