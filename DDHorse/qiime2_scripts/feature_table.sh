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
  --i-table   /home/student/DD/nov_new/Nov17table.qza \
  --o-visualization /home/student/DD/nov_new/Nov17table.qzv \
  --m-sample-metadata-file /home/student/DD/nov_new/Nov17.tsv

echo feature table tabulating for november

  qiime feature-table tabulate-seqs \
  --i-data /home/student/DD/nov_new/Nov17rep-seqs.qza \
  --o-visualization /home/student/DD/nov_new/Nov17rep-seqs.qzv

echo feature table summarizing for sept

  qiime feature-table summarize \
    --i-table   /home/student/DD/qiimesept/Sept17table.qza \
    --o-visualization /home/student/DD/qiimesept/Sept17table.qzv \
    --m-sample-metadata-file /home/student/DD/qiimesept/Sept17.tsv

echo feature table tabulating for sept

  qiime feature-table tabulate-seqs \
  --i-data /home/student/DD/qiimesept/Sept17rep-seqs.qza \
  --o-visualization /home/student/DD/qiimesept/Sept17rep-seqs.qzv

echo feature table summarizing for oct

  qiime feature-table summarize \
  --i-table   /home/student/DD/oct_new/Oct17table.qza \
  --o-visualization /home/student/DD/oct_new/Oct17table.qzv \
  --m-sample-metadata-file /home/student/DD/oct_new/Oct17.tsv

echo feature table tabulating for oct

  qiime feature-table tabulate-seqs \
  --i-data /home/student/DD/oct_new/Oct17rep-seqs.qza \
  --o-visualization /home/student/DD/oct_new/Oct17rep-seqs.qzv

echo feature table summarizing for dec

  qiime feature-table summarize \
  --i-table   /home/student/DD/decqiime/Dec17table.qza \
  --o-visualization /home/student/DD/decqiime/Dec17table.qzv \
  --m-sample-metadata-file /home/student/DD/decqiime/Dec17.tsv

echo feature table tabulating for dec

  qiime feature-table tabulate-seqs \
  --i-data /home/student/DD/decqiime/Dec17rep-seqs.qza \
  --o-visualization /home/student/DD/decqiime/Dec17rep-seqs.qzv

echo feature table summarizing for jan

  qiime feature-table summarize \
  --i-table   /home/student/DD/janqiime/Jan18table.qza \
  --o-visualization /home/student/DD/janqiime/Jan18table.qzv \
  --m-sample-metadata-file /home/student/DD/janqiime/Jan18.tsv

echo feature table tabulating for jan

  qiime feature-table tabulate-seqs \
  --i-data /home/student/DD/janqiime/Jan18rep-seqs.qza \
  --o-visualization /home/student/DD/janqiime/Jan18rep-seqs.qzv

echo feature table summarizing for feb

  qiime feature-table summarize \
  --i-table   /home/student/DD/febqiime/Feb18table.qza \
  --o-visualization /home/student/DD/febqiime/Feb18table.qzv \
  --m-sample-metadata-file /home/student/DD/febqiime/Feb18.tsv

echo feature table tabulating for feb

  qiime feature-table tabulate-seqs \
  --i-data /home/student/DD/febqiime/Feb18rep-seqs.qza \
  --o-visualization /home/student/DD/febqiime/Feb18rep-seqs.qzv

echo all feature table stuff is done
