#Author: Yu Han Daisy Wang
#Last Updated: 25 Sept 2020
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
  --output-dir file_pathway
echo core metrics done
echo core metrics output files: all the core metrics stuff cannot be bothered to list it all sorry
#core metrics stuff-------------------------------------------------------------------------------------

#starting alpha group significance analysis-----------------------------------------------------
echo start alpha group significance
echo start alpha group significance faith pd group
qiime diversity alpha-group-significance \
  --i-alpha-diversity /file_pathway/faith_pd_vector.qza \
  --m-metadata-file /file_pathway/your_metadata.tsv \
  --o-visualization /file_pathway/faith-pd-group-significance.qzv
echo end alpha group significance faith pd group

echo start alpha group significance evenness
qiime diversity alpha-group-significance \
  --i-alpha-diversity /file_pathway/faith_pd_vector.qza \
  --m-metadata-file /file_pathway/your_metadata.tsv \
  --o-visualization /file_pathway/evenness-group-significance.qzv
echo end alpha alpha group significance evenness

echo start alpha group significance shannon
qiime diversity alpha-group-significance \
  --i-alpha-diversity /file_pathway/faith_pd_vector.qza \
  --m-metadata-file /file_pathway/your_metadata.tsv \
  --o-visualization /file_pathway/shannon_group-significance.qzv
echo end alpha group significance shannon

echo alpha group significance analysis finished
echo alpha group significance output files: faith-pd-group-significance.qzv, evenness-group-significance.qzv, shannon_group-significance.qzv
#ending alpha group significance analysis-----------------------------------------------------

#beta group stuff now--------------------------------------------------------------------------
echo start your_chosen_column_1
qiime diversity beta-group-significance \
  --i-distance-matrix /file_pathway/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file /file_pathway/your_metadata.tsv \
  --m-metadata-column your_chosen_column_1 \
  --o-visualization /file_pathway/unweighted-unifrac-your_chosen_column_1-significance.qzv \
  --p-pairwise
echo end your_chosen_column_1
#repeat as needed for as many columns in the metadata as you want

echo beta analysis done
echo beta analysis output files: unweighted-unifrac-your_chosen_column_1-significance.qzv
# beta analysis done ------------------------------------------------------------------------------------------------

# emperor plot start ________________________________________________________________________________________________
echo start emperor plots

echo start emperor plot unweighted unifrac
qiime emperor plot \
  --i-pcoa file_pathway/your_name_unweighted_unifrac_pcoa_results.qza \
  --m-metadata-file your-metadata.tsv \
  --p-custom-axes your_column_1 \
  --o-visualization file_pathway/unweighted-unifrac-emperor-your_column_1.qzv
echo end emperor plot unweighted unifrac

echo start emperor plot bray curtis
qiime emperor plot \
  --i-pcoa file_pathway/your_name_bray_curtis_pcoa_results.qza \
  --m-metadata-file your-metadata.tsv \
  --p-custom-axes your_column_1 \
  --o-visualization file_pathway/bray-curtis-emperor-your_column_1.qzv
echo end emperor plot bray curtis

echo end emperor plots
echo emperor plots output files: unweighted-unifrac-emperor-your_column_1.qzv, bray-curtis-emperor-your_column_1.qzv
# emperor plot end ________________________________________________________________________________________________

#taxanomic classification time!--------------------------------------------------------------------------------------
echo taxa stuff start

echo start tatxonomic classification
qiime feature-classifier classify-sklearn \
--i-classifier /home/glai/16Sdatabase/gg-13-8-99-515-806-nb-classifier.qza \
--i-reads /file_pathway/your_name_rep-seqs.qza \
--o-classification /file_pathway/your_name_taxonomy.qza
echo end tatxonomic classification


echo start taxonomy qza to qzv
qiime metadata tabulate \
  --m-input-file /file_pathway/your_name_taxonomy.qza \
  --o-visualization /file_pathway/your_name_taxonomy.qzv
echo end taxonomy qza to qzv

echo start taxa barplots
qiime taxa barplot \
  --i-table /file_pathway/your_name_table.qza \
  --i-taxonomy /file_pathway/your_name_taxonomy.qza \
  --m-metadata-file /file_pathway/your_metadata.tsv \
  --o-visualization /file_pathway/your_name_taxa-bar-plots.qzv
echo end taxa barplots

echo taxa stuff done
echo taxa stuff output files: your_name_taxonomy.qza, your_name_taxonomy.qzv, your_name_taxa-bar-plots.qzv
#taxanomic classification done!--------------------------------------------------------------------------------------
