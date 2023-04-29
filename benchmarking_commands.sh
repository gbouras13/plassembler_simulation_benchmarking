##### Plassembler Benchmarking v1.0.0

Simulations 

* Using [badread](https://github.com/rrwick/Badread) and [InSilicoSeq](https://github.com/HadrienG/InSilicoSeq)



conda activate insilicoseq 


iss generate --genomes fastas/C222_chromosome.fasta --cpus 8 --model novaseq --compress  --n_reads 1M --output C222_chromosome_short_reads

conda activate insilicoseq 

iss generate --genomes fastas/C222_plasmid.fasta --cpus 8 --model novaseq --compress  --n_reads 100000 --output C222_chromosome_plasmid_reads


cat C222_chromosome_short_reads_R1.fastq.gz  C222_chromosome_plasmid_reads_R1.fastq.gz > C222_R1.fastq.gz
cat C222_chromosome_short_reads_R2.fastq.gz  C222_chromosome_plasmid_reads_R2.fastq.gz > C222_R2.fastq.gz

 conda activate badread

 badread simulate --reference fastas/C222_chromosome.fasta --quantity 50x \
 --error_model nanopore2020 --qscore_model nanopore2020 --seed 43 --length 10000,5000  \
    | gzip > C222_chromosome_reads.fastq.gz



badread simulate --reference fastas/C222_plasmid.fasta --quantity 1500x \
 --error_model nanopore2020 --qscore_model nanopore2020 --seed 43 --length 1200,250  \
    | gzip > C222_plasmid_reads.fastq.gz


cat C222_chromosome_reads.fastq.gz  C222_plasmid_reads.fastq.gz > C222.fastq.gz



../plassembler/bin/plassembler.py -d ../plas_db -l C222.fastq.gz -1 C222_R1.fastq.gz -2 C222_R2.fastq.gz -o C222_plassembler_test -t 16 -f



### Anna genomes 

PacBio HGAP assemblies

https://www.ncbi.nlm.nih.gov/assembly?LinkName=bioproject_assembly_all&from_uid=246471

CAV17

https://journals.asm.org/doi/full/10.1128/AAC.01823-16

https://www.ncbi.nlm.nih.gov/assembly/GCF_001908715.1

# ground truth 

https://www.ncbi.nlm.nih.gov/nuccore/CP009465.1


hawkey 

https://genomemedicine.biomedcentral.com/articles/10.1186/s13073-022-01103-0#MOESM1

de maio 

https://pubmed.ncbi.nlm.nih.gov/31483244/

assemblies https://figshare.com/articles/dataset/Hybrid_Enterobacteriaceae_assemblies_using_PacBio_Illumina_or_ONT_Illumina_sequencing/7649051

fastqs https://www.ncbi.nlm.nih.gov/bioproject/PRJNA422511

###










* Firstly, I downloaded the 6 tarballs from this [link](https://bridges.monash.edu/articles/dataset/Small_plasmid_Nanopore_data/13543754). 

* These contained tech_rep_1_rapid_reads.fastq.gz, tech_rep_2_rapid_reads.fastq.gz, tech_rep_1_ligation_reads.fastq.gz, tech_rep_2_ligation_reads.fastq.gz, tech_rep_1_illumina_reads  and tech_rep_2_illumina_reads tarballs.

These are the barcodes linked to the species

* barcode01 == Acinetobacter_baumannii_J9
* barcode02 == Citrobacter_koseri_MINF_9D
* barcode03 ==  Enterobacter_kobei_MSB1_1B
* barcode04 == Haemophilus_unknown_M1C132_1
* barcode05 == Klebsiella_oxytoca_MSB1_2C
* barcode07 == Klebsiella_variicola_INF345
 
**Serratia Marscecens**

* barcode08 Serratia Marcescens was excluded from benchmarking due to how devilishly difficult it was for Ryan Wick to assemble it, even with Trycycler - see his [comments](https://github.com/rrwick/Small-plasmid-Nanopore/blob/main/method.md#Long-read). 
* I tried assembling it in different ways with different read subsets, but kept getting different results every time depending on what read subset I chose or even how I randomly sampled the reads, indicating there was enormous heterogeneity in this sample. Even when I used all reads (over 400x chromosome coverage), the Flye step in Plassembler could not resolve the 184447bp plasmid which was concerning! So I excluded it from the benchmarking.


#### Recovering Barcodes 

* These files contained the reads for all barcodes pooled together. The barcode was indicated in the FASTQ header. 
* Accordingly, I split the files using grep as follows - run from within the directory of each unzipped tarball:

```
### tech rep 1
# rapid
gunzip -c tech_rep_1_rapid_reads.fastq.gz | grep -A3 "barcode=barcode01"  | gzip >  barcode01.fastq.gz
gunzip -c tech_rep_1_rapid_reads.fastq.gz | grep -A3 "barcode=barcode02"   | gzip >  barcode02.fastq.gz
gunzip -c tech_rep_1_rapid_reads.fastq.gz | grep -A3 "barcode=barcode03"  | gzip >  barcode03.fastq.gz
gunzip -c tech_rep_1_rapid_reads.fastq.gz | grep -A3 "barcode=barcode04"  | gzip >  barcode04.fastq.gz
gunzip -c tech_rep_1_rapid_reads.fastq.gz | grep -A3 "barcode=barcode05" | gzip >  barcode05.fastq.gz
gunzip -c tech_rep_1_rapid_reads.fastq.gz | grep -A3 "barcode=barcode07" | gzip >  barcode07.fastq.gz


# ligation
gunzip -c tech_rep_1_ligation_reads.fastq.gz | grep -A3 "barcode=barcode01"  | gzip >  barcode01.fastq.gz
gunzip -c tech_rep_1_ligation_reads.fastq.gz | grep -A3 "barcode=barcode02"   | gzip >  barcode02.fastq.gz
gunzip -c tech_rep_1_ligation_reads.fastq.gz | grep -A3 "barcode=barcode03"  | gzip >  barcode03.fastq.gz
gunzip -c tech_rep_1_ligation_reads.fastq.gz | grep -A3 "barcode=barcode04"  | gzip >  barcode04.fastq.gz
gunzip -c tech_rep_1_ligation_reads.fastq.gz | grep -A3 "barcode=barcode05" | gzip >  barcode05.fastq.gz
gunzip -c tech_rep_1_ligation_reads.fastq.gz | grep -A3 "barcode=barcode07" | gzip >  barcode07.fastq.gz


### tech rep 2
# rapid
gunzip -c tech_rep_2_rapid_reads.fastq.gz | grep -A3 "barcode=barcode01" | gzip >  barcode01.fastq.gz
gunzip -c tech_rep_2_rapid_reads.fastq.gz | grep -A3 "barcode=barcode02" | gzip >  barcode02.fastq.gz
gunzip -c tech_rep_2_rapid_reads.fastq.gz | grep -A3 "barcode=barcode03" | gzip >  barcode03.fastq.gz
gunzip -c tech_rep_2_rapid_reads.fastq.gz | grep -A3 "barcode=barcode04" | gzip >  barcode04.fastq.gz
gunzip -c tech_rep_2_rapid_reads.fastq.gz | grep -A3 "barcode=barcode05" | gzip >  barcode05.fastq.gz
gunzip -c tech_rep_2_rapid_reads.fastq.gz | grep -A3 "barcode=barcode07" | gzip >  barcode07.fastq.gz


# ligation
gunzip -c tech_rep_2_ligation_reads.fastq.gz | grep -A3 "barcode=barcode01" | gzip >  barcode01.fastq.gz
gunzip -c tech_rep_2_ligation_reads.fastq.gz | grep -A3 "barcode=barcode02" | gzip >  barcode02.fastq.gz
gunzip -c tech_rep_2_ligation_reads.fastq.gz | grep -A3 "barcode=barcode03" | gzip >  barcode03.fastq.gz
gunzip -c tech_rep_2_ligation_reads.fastq.gz | grep -A3 "barcode=barcode04" | gzip >  barcode04.fastq.gz
gunzip -c tech_rep_2_ligation_reads.fastq.gz | grep -A3 "barcode=barcode05" | gzip >  barcode05.fastq.gz
gunzip -c tech_rep_2_ligation_reads.fastq.gz | grep -A3 "barcode=barcode07" | gzip >  barcode07.fastq.gz
```