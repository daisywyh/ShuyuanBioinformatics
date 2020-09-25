#Author: Yu Han Daisy Wang
#Last Updated: 25 Sept 2020
#Description: demultiplexes all sequences as specified, then creates summary
#Note: this is designed to be used for Casava 1.8 paired-end demultiplexed fastq
#sequences, DO NOT USE FOR SINGLE-END READS

set -e
#do this so the script exists when there is an error

source activate qiime2-2018.6
#start qiime2

export LC_ALL=C.UTF-8
export LANG=C.UTF-8
#idk why but everytime we use qiime we have to do this or else it doesnt' work?

echo starting demultiplex
qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path /home/file_pathway \
  --source-format CasavaOneEightSingleLanePerSampleDirFmt \
  --output-path your_name_demux.qza
echo demultiplex finished

echo starting demultiplex summary
qiime demux summarize \
  --i-data your_name_demux.qza \
  --o-visualization your_name_demux.qzv
echo demultiplex summary finished

echo demultiplex.sh finished
echo demultiplex.sh output files: your_name_demux.qza, your_name_demux.qzv
