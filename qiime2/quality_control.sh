#Author: Yu Han Daisy Wang
#Last Updated: 25 Sept 2020
#Description: uses DADA2 to do quality control for demultiplex sequences
#Note: use after demultiplexing sequences, only for paired sequences

set -e
#do this so the script exists when there is an error

source activate qiime2-2018.6
#start qiime2

export LC_ALL=C.UTF-8
export LANG=C.UTF-8
#idk why but everytime we use qiime we have to do this or else it doesnt' work?

echo starting dada2
qiime dada2 denoise-paired \
  --i-demultiplexed-seqs your_name_demux.qza \
  --p-trim-left-f 17 \
  --p-trim-left-r 21 \
  --p-trunc-len-f 281 \
  --p-trunc-len-r 205 \
  --o-representative-sequences your_name_rep-seqs.qza \
  --o-table your_name_table.qza \
  --o-denoising-stats your_name_stats.qza

echo dada2 finished
echo quality_control.sh finished
echo quality_control.sh output files: your_name_rep-seqs.qza, your_name_table.qza, your_name_stats.qza
