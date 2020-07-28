#Author: Yu Han Daisy Wang
#Date: June 21 2020
#Description: does "step 6" in the moving pictures tutorial for the merged stuff. Creates phylogenetic tree.
#note: this script must be used AFTER the merge.sh script, where all things have been properly merged.

set -e
#do this so the script exists when there is an error

source activate qiime2-2018.6
#start qiime2

export LC_ALL=C.UTF-8
export LANG=C.UTF-8
#idk why but everytime we use qiime we have to do this or else it doesnt' work?

echo generating tree for phylogenetic diversity analyses

echo alignment mafft
qiime alignment mafft \
  --i-sequences /file_pathway/rep-seqs.qza \
  --o-alignment /file_pathway/aligned-rep-seqs.qza

echo alightment mask
qiime alignment mask \
  --i-alignment /file_pathway/aligned-rep-seqs.qza \
  --o-masked-alignment /file_pathway/masked-aligned-rep-seqs.qza

echo phylogeny fasttree
qiime phylogeny fasttree \
  --i-alignment /file_pathway/masked-aligned-rep-seqs.qza \
  --o-tree /file_pathway/unrooted-tree.qza

echo phylogeny midpoint-root
qiime phylogeny midpoint-root \
  --i-tree /file_pathway/unrooted-tree.qza \
  --o-rooted-tree /file_pathway/rooted-tree.qza

echo merge_analytics.sh done
