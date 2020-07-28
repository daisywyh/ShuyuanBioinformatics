# QIIME2 Scripts - Daisy Dionne Horse Project
## Introduction
This is a folder with the QIIME2 scripts that Daisy and Dionne used for their horse project. 
As such, many of these scripts contain names that are specific to that project, and you should **change the names of files/folder paths before you use this script**. Any inqueries should be 
directed to Daisy at 0109024@student.isf.edu.hk or wangyhdaisy@gmail.com.

## Frequently Asked Questions
### How do I use these files?
#### Getting the files
Copy all the scripts either by cloning this folder or just straight up copying and pasting, then modify them (changing things like filename/file pathways/types of analysis you 
want) with whichever code editor you like best. I recommend Atom, but really even TextEdit is fine. Place the scripts into the place you want to run them.
#### Running the files
Copy and paste the following commands into your terminal. Do not copy and paste the $, it is a convention that simply means this code should be ran in a terminal. Change all filename.sh
things to whatever file you're trying to run.
##### 1. Giving permission to run the file
```
$ chmod +x filename.sh
```
If this is your first time runing the file, you have to run this line, or else you do not have permission to actually run the file.

##### 2. Run the file
```
./filename.sh
```
Yes it is literally that simple.

### Do I have to change the filenames and filepathways? 
Yes. Unless you want a complete repeat of Daisy and Dionne's project, please change the filenames propriately.

## Description of each script
### feature_table.sh
This script creates feature tables for each month of the project.
### merge_feature_table.sh
This script merges all of the feature tables created in the previous step.
### phylogenetic_tree.sh
This script creates a phylogenetic tree for the newly merged data. Note: this script DOES NOT visualise the phylogenetic tree, merely creates it for analysis purposes.
### analytics.sh
Runs alpha beta diversity analysis & taxanomic classification. 
### metadata_change.sh
Simply a script that runs feature_table, merge_feature_table, phylogenetic_tree, and analytics in order. Should be used when there is a change in metadata.
