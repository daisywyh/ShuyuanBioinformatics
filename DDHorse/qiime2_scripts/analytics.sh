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
  --i-phylogeny /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18rooted-tree.qza \
  --i-table /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18table.qza \
  --p-sampling-depth 10000 \
  --m-metadata-file /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18.tsv \
  --output-dir /home/student/DD/merged/29_june_core_metrics
#core metrics stuff-------------------------------------------------------------------------------------

#starting alpha group significance analysis-----------------------------------------------------
echo alpha group significance started
qiime diversity alpha-group-significance \
  --i-alpha-diversity /home/student/DD/merged/29_june_core_metrics/alpha_diversity/faith_pd_vector.qza \
  --m-metadata-file /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18.tsv \
  --o-visualization /home/student/DD/merged/29_june_core_metrics/alpha_diversity/faith-pd-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity /home/student/DD/merged/29_june_core_metrics/alpha_diversity/evenness_vector.qza \
  --m-metadata-file /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18.tsv \
  --o-visualization /home/student/DD/merged/29_june_core_metrics/alpha_diversity/evenness-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity /home/student/DD/merged/29_june_core_metrics/alpha_diversity/shannon_vector.qza \
  --m-metadata-file /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18.tsv \
  --o-visualization /home/student/DD/merged/29_june_core_metrics/alpha_diversity/shannon_group-significance.qzv


echo alpha group significance analysis finished
#ending alpha group significance analysis-----------------------------------------------------

#beta group stuff now--------------------------------------------------------------------------
echo origin
qiime diversity beta-group-significance \
  --i-distance-matrix /home/student/DD/merged/29_june_core_metrics/alpha_diversity/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18.tsv \
  --m-metadata-column Origin \
  --o-visualization /home/student/DD/merged/29_june_core_metrics/unweighted-unifrac-Origin-significance.qzv \
  --p-pairwise

echo oral
qiime diversity beta-group-significance \
  --i-distance-matrix /home/student/DD/merged/29_june_core_metrics/alpha_diversity/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18.tsv \
  --m-metadata-column oral \
  --o-visualization /home/student/DD/merged/29_june_core_metrics/unweighted-unifrac-oral-significance.qzv \
  --p-pairwise

echo beta analysis done
# beta analysis done ------------------------------------------------------------------------------------------------

#taxanomic classification time!--------------------------------------------------------------------------------------
echo taxa stuff start

echo tatxonomic classification
qiime feature-classifier classify-sklearn \
--i-classifier /home/glai/16Sdatabase/gg-13-8-99-515-806-nb-classifier.qza \
--i-reads /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18rep-seqs.qza \
--o-classification /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18taxonomy.qza

echo taxonomy qza to qzv
qiime metadata tabulate \
  --m-input-file /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18taxonomy.qza \
  --o-visualization /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18taxonomy.qzv

echo taxa barplots
qiime taxa barplot \
  --i-table /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18table.qza \
  --i-taxonomy /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18taxonomy.qza \
  --m-metadata-file //home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18.tsv \
  --o-visualization /home/student/DD/merged/Sept17Oct17Nov17Dec17Jan18Feb18taxa-bar-plots.qzv

echo taxa stuff done
#taxanomic classification time!--------------------------------------------------------------------------------------
