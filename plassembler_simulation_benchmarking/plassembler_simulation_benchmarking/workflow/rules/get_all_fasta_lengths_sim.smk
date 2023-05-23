#### plassembler flye

### flye

rule get_flye_length_1_threads_SIM:
    input:
        os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_SIMULATED_FLYE,"{sample}", "flye_output", "assembly.fasta")
    output:
        os.path.join(FLYE_1_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
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

rule get_flye_length_8_threads_SIM:
    input:
        os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_SIMULATED_FLYE,"{sample}", "flye_output", "assembly.fasta")
    output:
        os.path.join(FLYE_8_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
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


rule get_flye_length_16_threads_SIM:
    input:
        os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_SIMULATED_FLYE,"{sample}", "flye_output", "assembly.fasta")
    output:
        os.path.join(FLYE_16_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
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

# plass with flye

rule get_plass_length_1_threads_SIM_flye:
    input:
        os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_SIMULATED_FLYE,"{sample}", "{sample}_plasmids.fasta")
    output:
        os.path.join(PLASSEMBLER_FLYE_1_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
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


rule get_plass_length_8_threads_SIM_flye:
    input:
        os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_SIMULATED_FLYE,"{sample}", "{sample}_plasmids.fasta")
    output:
        os.path.join(PLASSEMBLER_FLYE_8_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
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


rule get_plass_length_16_threads_SIM_flye:
    input:
        os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_SIMULATED_FLYE,"{sample}", "{sample}_plasmids.fasta")
    output:
        os.path.join(PLASSEMBLER_FLYE_16_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
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



#### plassembler raven

### raven

rule get_raven_length_1_threads_SIM:
    input:
        os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_SIMULATED_RAVEN,"{sample}", "raven_output", "assembly.fasta")
    output:
        os.path.join(RAVEN_1_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
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
        os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_SIMULATED_RAVEN,"{sample}", "raven_output", "assembly.fasta")
    output:
        os.path.join(RAVEN_8_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
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
        os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_SIMULATED_RAVEN,"{sample}", "raven_output", "assembly.fasta")
    output:
        os.path.join(RAVEN_16_THREADS_OUTPUT_LENGTHS,"{sample}.tsv")
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

# plass with raven

rule get_plass_length_1_threads_SIM_raven:
    input:
        os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_SIMULATED_RAVEN,"{sample}", "{sample}_plasmids.fasta")
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


rule get_plass_length_8_threads_SIM_raven:
    input:
        os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_SIMULATED_RAVEN,"{sample}", "{sample}_plasmids.fasta")
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


rule get_plass_length_16_threads_SIM_raven:
    input:
        os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_SIMULATED_RAVEN,"{sample}", "{sample}_plasmids.fasta")
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
        expand(os.path.join(FLYE_1_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(FLYE_8_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(FLYE_16_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(UNICYCLER_1_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(UNICYCLER_8_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(UNICYCLER_16_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(RAVEN_1_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(RAVEN_8_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(RAVEN_16_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(PLASSEMBLER_FLYE_1_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(PLASSEMBLER_FLYE_8_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
        expand(os.path.join(PLASSEMBLER_FLYE_16_THREADS_OUTPUT_LENGTHS,"{sample}.tsv"), sample = SAMPLES),
    output:
        os.path.join(FLAGS, "get_fasta_lengths_sim_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """

