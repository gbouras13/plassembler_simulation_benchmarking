rule get_plasmids_1_threads_unicycler_SIM:
    input:
        os.path.join(UNICYCLER_OUTPUT_1_THREADS_SIMULATED,"{sample}", "assembly.fasta")
    output:
        os.path.join(UNICYCLER_PLASMIDS_ONLY_1_THREADS_SIM,"{sample}", "assembly.fasta")
    threads:
        1
    resources:
        mem_mb=1000,
        time=5
    params:
        chrom = get_length
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    script:
        '../scripts/get_plasmids_only_unicycler.py'

rule get_plasmids_8_threads_unicycler_SIM:
    input:
        os.path.join(UNICYCLER_OUTPUT_8_THREADS_SIMULATED,"{sample}", "assembly.fasta")
    output:
        os.path.join(UNICYCLER_PLASMIDS_ONLY_8_THREADS_SIM,"{sample}", "assembly.fasta")
    threads:
        1
    resources:
        mem_mb=1000,
        time=5
    params:
        chrom = get_length
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    script:
        '../scripts/get_plasmids_only_unicycler.py'

rule get_plasmids_16_threads_unicycler_SIM:
    input:
        os.path.join(UNICYCLER_OUTPUT_16_THREADS_SIMULATED,"{sample}", "assembly.fasta")
    output:
        os.path.join(UNICYCLER_PLASMIDS_ONLY_16_THREADS_SIM,"{sample}", "assembly.fasta")
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
        '../scripts/get_plasmids_only_unicycler.py'


#### aggregation rule
rule get_plasmids_aggr_sim:
    """aggregate sr"""
    input:
        expand(os.path.join(UNICYCLER_PLASMIDS_ONLY_16_THREADS_SIM,"{sample}", "assembly.fasta"), sample = SAMPLES),
        expand(os.path.join(UNICYCLER_PLASMIDS_ONLY_1_THREADS_SIM,"{sample}", "assembly.fasta"), sample = SAMPLES),
        expand(os.path.join(UNICYCLER_PLASMIDS_ONLY_8_THREADS_SIM,"{sample}", "assembly.fasta"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "get_plasmids_unicycler_sim_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """

