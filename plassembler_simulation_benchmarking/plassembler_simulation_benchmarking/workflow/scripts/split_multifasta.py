#!/usr/bin/env python3
from Bio import SeqIO


def get_plasmid(input_fasta, out_fasta, chrom_len):

    for dna_record in SeqIO.parse(input_fasta, "fasta"):

        if dna_record.len < chrom_len:
            with open(out_fasta, 'w') as nt_fa:
                SeqIO.write(dna_record, nt_fa, 'fasta')


get_plasmid(snakemake.input[0], snakemake.output[0], snakemake.params[0])