#Author: Yu Han Daisy Wang
#Date: June 21 2020
#Description: runs feature table for all, then merges, they does analytics
#Note: this script should be run when there is an update in the metadata

source activate qiime2-2018.6

echo beginning metadata_change script

echo running feature_table
chmod +x feature_table.sh
./feature_table.sh

echo running merge_feature_table
chmod +x merge_feature_table.sh
./merge_feature_table.sh

echo running phylogenetic_tree
chmod +x phylogenetic_tree.sh
./phylogenetic_tree.sh

echo running analytics
chmod +x analytics.sh
./analytics.sh

echo metadata_change finished
