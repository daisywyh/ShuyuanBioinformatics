#Author: Yu Han Daisy Wang
#Last Updated: 25 Sept 2020
#Description: runs the full pipeline

source activate qiime2-2018.6
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

echo beginning from_the_top.sh

echo running demultiplex
chmod +x demultiplex.sh
./demultiplex.sh

echo running quality_control.sh
chmod +x quality_control.sh
./quality_control.sh

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

echo from_the_top.sh finished
echo congrats! you're either done, or something has gone horribly wrong and nothing is working!
