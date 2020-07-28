#Author: Yu Han Daisy Wang
#Date: June 21 2020
#Description: core metrics, alpha, beta analysis for merged

#exit when error removed so that i can run this while i sleep

source activate qiime2-2018.6
#start qiime2

export LC_ALL=C.UTF-8
export LANG=C.UTF-8
#idk why but everytime we use qiime we have to do this or else it doesnt' work?


#core metrics stuff-------------------------------------------------------------------------------------

echo starting core metrics
qiime diversity core-metrics-phylogenetic \
  --i-phylogeny /file_pathway/rooted-tree.qza \
  --i-table /file_pathway/table.qza \
  --p-sampling-depth #your desired depth \
  --m-metadata-file /file_pathway/your_metadata.tsv \
  --output-dir /file_pathway
#core metrics stuff-------------------------------------------------------------------------------------

#starting alpha group significance analysis-----------------------------------------------------
echo alpha group significance started
qiime diversity alpha-group-significance \
  --i-alpha-diversity /file_pathway/faith_pd_vector.qza \
  --m-metadata-file /file_pathway/your_metadata.tsv \
  --o-visualization /file_pathway/faith-pd-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity /file_pathway/faith_pd_vector.qza \
  --m-metadata-file /file_pathway/your_metadata.tsv \
  --o-visualization /file_pathway/evenness-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity /file_pathway/faith_pd_vector.qza \
  --m-metadata-file /file_pathway/your_metadata.tsv \
  --o-visualization /file_pathway/shannon_group-significance.qzv

echo alpha group significance analysis finished
#ending alpha group significance analysis-----------------------------------------------------

#beta group stuff now--------------------------------------------------------------------------
echo your_chosen_column_1
qiime diversity beta-group-significance \
  --i-distance-matrix /file_pathway/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file /file_pathway/your_metadata.tsv \
  --m-metadata-column your_chosen_column_1 \
  --o-visualization /file_pathway/unweighted-unifrac-your_chosen_column_1-significance.qzv \
  --p-pairwise

#repeat as needed for as many columns in the metadata as you want

echo beta analysis done
# beta analysis done ------------------------------------------------------------------------------------------------

#taxanomic classification time!--------------------------------------------------------------------------------------
echo taxa stuff start

echo tatxonomic classification
qiime feature-classifier classify-sklearn \
--i-classifier /home/glai/16Sdatabase/gg-13-8-99-515-806-nb-classifier.qza \
--i-reads /file_pathway/rep-seqs.qza \
--o-classification /file_pathway/taxonomy.qza

echo taxonomy qza to qzv
qiime metadata tabulate \
  --m-input-file /file_pathway/taxonomy.qza \
  --o-visualization /file_pathway/taxonomy.qzv

echo taxa barplots
qiime taxa barplot \
  --i-table /file_pathway/table.qza \
  --i-taxonomy /file_pathway/taxonomy.qza \
  --m-metadata-file /file_pathway/your_metadata.tsv \
  --o-visualization /file_pathway/taxa-bar-plots.qzv

echo taxa stuff done
#taxanomic classification done!--------------------------------------------------------------------------------------
