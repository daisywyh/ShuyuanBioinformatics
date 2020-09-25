#Author: Yu Han Daisy Wang
#Last Updated: 25 Sept 2020
#Description: merges all of the feature tables
#Note: this script must be used AFTER the feature_table.sh scripts, where the feature tables are generated

set -e
#do this so the script exists when there is an error

source activate qiime2-2018.6
#start qiime2

export LC_ALL=C.UTF-8
export LANG=C.UTF-8
#idk why but everytime we use qiime we have to do this or else it doesnt' work?

echo merging #whatever you want

qiime feature-table merge \
  --i-tables /file_pathway1/1table.qza \
  --i-tables /file_pathway2/2table.qza \
   --p-overlap-method sum \
    --o-merged-table /file_pathway/your_name_merged_table.qza

echo all merging is done
echo output files: merged_table.qza
