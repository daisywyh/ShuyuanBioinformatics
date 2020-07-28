#Author: Yu Han Daisy Wang
#Date: June 24 2020
#Description: automates draft genome sequencing
#Note: This code assumes that the filenames start from 1, and that there are no skips in file names
# (such as no 1, 2, 5). If your reads do not fit this, this script will NOT work
#If you have any questions about this code, please contact Daisy at 0109024@student.isf.edu.hk
#or at wangyhdaisy@gmail.com

set -e
#exit on error

echo please input all of the input the file name intros here
echo for example, for the filename 2_S2_L001_R1_001 and 2_S2_L001_R2_001, input 2
echo if the filename is ISF003_S3_L001_R1_001 and ISF003_S3_L001_R2_001, input ISF003
echo each individual input should be seperated with a single space, all input should be in one line
echo it is recommended that you type the filenames all elsewhere and paste them in
echo type all filenames then press enter when done

read -a names
#takes all of the user inputs and turns in into an array called names

#do not touch anything after this comment
#please
#do not
#touch

s="_S"
r1ending="_L001_R1_001"
r2ending="_L001_R2_001"
#setting the variables for the string concatenation of the file names

file_name_number=1
#used to increase the number stuff for the file names

sequencing () {
	local val1=$1
	read1=$val1$s$file_name_number$r1ending
	read2=$val1$s$file_name_number$r2ending
	sg=$val1$s$file_name_number
	#set the variables for the file name intros

	perl /home/glai/bin/prinseq-lite.pl -fastq ${read1}.fastq -out_format 1 -out_good ${read1}.fastq -out_bad null -min_len 250 -min_qual_mean 30 -ns_max_n 0 -derep 1 -line_width 0
	perl /home/glai/bin/prinseq-lite.pl -fastq ${read2}.fastq -out_format 1 -out_good ${read2}.fastq -out_bad null -min_len 250 -min_qual_mean 30 -ns_max_n 0 -derep 1 -line_width 0
	perl /home/glai/bin/combine_filtered_fastq_mates.pl ${read1}.fastq.fasta ${read2}.fastq.fasta ${sg}SG.fasta
	perl /home/glai/bin/extract_nonpair_fastq_mates.pl ${read1}.fastq.fasta ${read2}.fastq.fasta ${sg}SG.fasta
	runAssembly -o ${sg} ${sg}SG.fasta ${read1}.fastq.fasta.nonpair ${read2}.fastq.fasta.nonpair > ${sg}.log
	#do all the perl stuff with the assigned names

	file_name_number=$((file_name_number+1))
	#increase counter and the number used for the file names
}


for val1 in ${names[*]};
#loop through the user input in the array names
	do sequencing $val1
  #do the sequencing function, but each time use a new element from the array
done
