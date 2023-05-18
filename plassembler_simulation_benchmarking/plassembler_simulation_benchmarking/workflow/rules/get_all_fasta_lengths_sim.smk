rule get_raven_length_1_threads_SIM:
    input:
        os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_SIMULATED,"{sample}", "raven_output", "assembly.fasta")
    output:
        os.path.join(PLASSEMBLER_RAVEN_1_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
    threads:
        1
    params:
        chrom = get_length
    resources:
        mem_mb=1000,
        time=5
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    script:
        '../scripts/get_fasta_lengths.py'

rule get_raven_length_8_threads_SIM:
    input:
        os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_SIMULATED,"{sample}", "raven_output", "assembly.fasta")
    output:
        os.path.join(PLASSEMBLER_RAVEN_8_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
    threads:
        1
    params:
        chrom = get_length
    resources:
        mem_mb=1000,
        time=5
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    script:
        '../scripts/get_fasta_lengths.py'


rule get_raven_length_16_threads_SIM:
    input:
        os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_SIMULATED,"{sample}", "raven_output", "assembly.fasta")
    output:
        os.path.join(PLASSEMBLER_RAVEN_16_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
    threads:
        1
    params:
        chrom = get_length
    resources:
        mem_mb=1000,
        time=5
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    script:
        '../scripts/get_fasta_lengths.py'

rule get_plass_length_1_threads_SIM:
    input:
        os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_SIMULATED,"{sample}", "{sample}_plasmids.fasta")
    output:
        os.path.join(PLASSEMBLER_1_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
    threads:
        1
    params:
        chrom = get_length
    resources:
        mem_mb=1000,
        time=5
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    script:
        '../scripts/get_fasta_lengths.py'


rule get_plass_length_8_threads_SIM:
    input:
        os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_SIMULATED,"{sample}", "{sample}_plasmids.fasta")
    output:
        os.path.join(PLASSEMBLER_8_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
    threads:
        1
    params:
        chrom = get_length
    resources:
        mem_mb=1000,
        time=5
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    script:
        '../scripts/get_fasta_lengths.py'


rule get_plass_length_16_threads_SIM:
    input:
        os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_SIMULATED,"{sample}", "{sample}_plasmids.fasta")
    output:
        os.path.join(PLASSEMBLER_16_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
    threads:
        1
    params:
        chrom = get_length
    resources:
        mem_mb=1000,
        time=5
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    script:
        '../scripts/get_fasta_lengths.py'



rule get_uni_length_1_threads_SIM:
    input:
        os.path.join(UNICYCLER_PLASMIDS_ONLY_1_THREADS_SIM,"{sample}", "assembly.fasta")
    output:
        os.path.join(UNICYCLER_1_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
    threads:
        1
    params:
        chrom = get_length
    resources:
        mem_mb=1000,
        time=5
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    script:
        '../scripts/get_fasta_lengths.py'


rule get_uni_length_8_threads_SIM:
    input:
        os.path.join(UNICYCLER_PLASMIDS_ONLY_8_THREADS_SIM,"{sample}", "assembly.fasta")
    output:
        os.path.join(UNICYCLER_8_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
    threads:
        1
    params:
        chrom = get_length
    resources:
        mem_mb=1000,
        time=5
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    script:
        '../scripts/get_fasta_lengths.py'



rule get_uni_length_16_threads_SIM:
    input:
        os.path.join(UNICYCLER_PLASMIDS_ONLY_16_THREADS_SIM,"{sample}", "assembly.fasta")
    output:
        os.path.join(UNICYCLER_16_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
    threads:
        1
    params:
        chrom = get_length
    resources:
        mem_mb=1000,
        time=5
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    script:
        '../scripts/get_fasta_lengths.py'





#### aggregation rule
rule get_raven_aggr_sim:
    """aggregate sr"""
    input:
        expand(os.path.join(PLASSEMBLER_RAVEN_1_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(PLASSEMBLER_RAVEN_8_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(PLASSEMBLER_RAVEN_16_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(PLASSEMBLER_1_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(PLASSEMBLER_8_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(PLASSEMBLER_16_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(UNICYCLER_1_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(UNICYCLER_8_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(UNICYCLER_16_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
    output:
        os.path.join(FLAGS, "get_fasta_lengths_sim_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """

