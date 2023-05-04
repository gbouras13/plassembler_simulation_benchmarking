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



#### CAV17

https://journals.asm.org/doi/full/10.1128/AAC.01823-16

https://www.ncbi.nlm.nih.gov/assembly/GCF_001908715.1



# download the accessions 

conda activate ncbi-acc-download

# https://github.com/kblin/ncbi-acc-download

ncbi-acc-download --format fasta CP018676.1
ncbi-acc-download --format fasta CP018674.1
ncbi-acc-download --format fasta CP018672.1
ncbi-acc-download --format fasta CP018675.1
ncbi-acc-download --format fasta CP018673.1


conda activate insilicoseq 

iss generate --genomes cav1217_combined.fasta --cpus 8 --model novaseq --compress  --n_reads 5M --output cav1217_short_reads


 conda activate badread

 badread simulate --reference cav1217_combined.fasta --quantity 100x \
 --error_model nanopore2020 --qscore_model nanopore2020 --seed 43 --length 10000,5000  \
    | gzip > cav1217_combined_reads.fastq.gz

# need to put circular=true in teh headers



# ground truth 

https://www.ncbi.nlm.nih.gov/nuccore/CP009465.1


hawkey 

https://genomemedicine.biomedcentral.com/articles/10.1186/s13073-022-01103-0#MOESM1

- didnt put the Long read data in the NCBI - hence not using.

de maio 

https://pubmed.ncbi.nlm.nih.gov/31483244/

assemblies https://figshare.com/articles/dataset/Hybrid_Enterobacteriaceae_assemblies_using_PacBio_Illumina_or_ONT_Illumina_sequencing/7649051

fastqs https://www.ncbi.nlm.nih.gov/bioproject/PRJNA422511


conda activate fastq-dl

fastq-dl --cpus 8  PRJNA422511  



conda activate plassembler

PLASSEMBLER_DIR="/Users/a1667917/Documents/plassembler/bin"

PLASSEMBLER_DB="/Users/a1667917/Documents/Plassembler_DB"

$PLASSEMBLER_DIR/plassembler.py -d $PLASSEMBLER_DB -l  SRR8494912_1.fastq.gz -1 SRR8482586_1.fastq.gz -2 SRR8482586_2.fastq.gz -o pacbio_SAMN10819819 -c 4000000 -f


$PLASSEMBLER_DIR/plassembler.py -d $PLASSEMBLER_DB -l  SRR8494939_1.fastq.gz -1 SRR8482586_1.fastq.gz -2 SRR8482586_2.fastq.gz -o ont_SAMN10819819 -c 5000000 -f -r


SRR8482586
SRR8494912
SRR8494939

# no polishing
flye --nano-raw SRR8494939_1.fastq.gz --out-dir test_flye -t 16 --iterations 0



#### vibrio

conda activate fastq-dl

fastq-dl --cpus 8  PRJNA479421  

conda activate plassembler

PLASSEMBLER_DIR="/Users/a1667917/Documents/plassembler/bin"

PLASSEMBLER_DB="/Users/a1667917/Documents/Plassembler_DB"

$PLASSEMBLER_DIR/plassembler.py -d $PLASSEMBLER_DB -l  SRR8335319_1.fastq.gz -1 SRR8335320_1.fastq.gz -2 SRR8335320_2.fastq.gz -o vibrio -t 16 -s 100 -c 1500000 -f

# indeed, this has discovered a plasmid missed in the refseq assembly!

















