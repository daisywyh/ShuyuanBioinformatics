#Author: Yu Han Daisy Wang
#Date: June 21 2020
#Description: merges all of the feature tables
#Note: this script must be used AFTER the feature_table.sh scripts, where the feature tables are generated

set -e
#do this so the script exists when there is an error

source activate qiime2-2018.6
#start qiime2

export LC_ALL=C.UTF-8
export LANG=C.UTF-8
#idk why but everytime we use qiime we have to do this or else it doesnt' work?

echo merging sept and oct feature table

qiime feature-table merge \
  --i-tables /home/student/DD/qiimesept/Sept17table.qza \
  --i-tables /home/student/DD/oct_new/Oct17table.qza \
   --p-overlap-method sum \
    --o-merged-table /home/student/DD/merged/Sept17Oct17table.qza

echo merging sept and oct req-seqs

qiime feature-table merge-seqs \
  --i-data /home/student/DD/qiimesept/Sept17rep-seqs.qza \
  --i-data /home/student/DD/oct_new/Oct17rep-seqs.qza \
  --o-merged-data /home/student/DD/merged/Sept17Oct17rep-seqs.qza

echo merging sept17oct17 and nov feature table

qiime feature-table merge \
  --i-tables /home/student/DD/merged/Sept17Oct17table.qza \
  --i-tables /home/student/DD/nov_new/Nov17table.qza \
   --p-overlap-method sum \
    --o-merged-table /home/student/DD/merged/Sept17Oct17Nov17table.qza

echo merging sept17oct17 and nov17 req-seqs

qiime feature-table merge-seqs \
  --i-data /home/student/DD/merged/Sept17Oct17rep-seqs.qza \
  --i-data /home/student/DD/nov_new/Nov17rep-seqs.qza \
  --o-merged-data /home/student/DD/merged/Sept17Oct17Nov17rep-seqs.qza

echo merging sept17oct17nov17 and Dec17 feature table

qiime feature-table merge \
  --i-tables /home/student/DD/merged/Sept17Oct17Nov17table.qza \
  --i-tables /home/student/DD/decqiime/Dec17table.qza \
   --p-overlap-method sum \
    --o-merged-table /home/student/DD/merged/Sept17Oct17Nov17Dec17table.qza

echo merging sept17oct17nov17 and dec17 req-seqs

qiime feature-table merge-seqs \
  --i-data /home/student/DD/merged/Sept17Oct17Nov17rep-seqs.qza \
  --i-data /home/student/DD/decqiime/Dec17rep-seqs.qza \
  --o-merged-data /home/student/DD/merged/Sept17Oct17Nov17Dec17rep-seqs.qza

echo merging sept17oct17nov17Dec17 and jan18 feature table

qiime feature-table merge \
  --i-tables /home/student/DD/merged/Sept17Oct17Nov17Dec17table.qza \
  --i-tables /home/student/DD/janqiime/Jan18table.qza \
   --p-overlap-method sum \
    --o-merged-table /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18table.qza

echo merging sept17oct17nov17dec17 and jan18 req-seqs

qiime feature-table merge-seqs \
  --i-data /home/student/DD/merged/Sept17Oct17Nov17Dec17rep-seqs.qza \
  --i-data /home/student/DD/janqiime/Jan18rep-seqs.qza \
  --o-merged-data /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18rep-seqs.qza

echo merging sept17oct17nov17dec17jan18 and feb18 table

qiime feature-table merge \
  --i-tables /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18table.qza \
  --i-tables /home/student/DD/febqiime/Feb18table.qza \
   --p-overlap-method sum \
    --o-merged-table /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18table.qza

echo merging sept17oct17nov17dec17jan18 and feb18 req-seqs

qiime feature-table merge-seqs \
  --i-data /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18rep-seqs.qza \
  --i-data /home/student/DD/febqiime/Feb18rep-seqs.qza \
  --o-merged-data /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18rep-seqs.qza

echo all merging is done
