rule run_unicycler_8_threads_simulated:
    input:
        l = os.path.join(LR,"{sample}.fastq.gz"),
        short_one = os.path.join(SR,"{sample}_R1.fastq.gz"),
        short_two = os.path.join(SR,"{sample}_R2.fastq.gz")
    output:
        uni_fasta = os.path.join(UNICYCLER_OUTPUT_8_THREADS_SIMULATED,"{sample}", "assembly.fasta")
    threads:
        8
    params:
        out_dir = os.path.join(UNICYCLER_OUTPUT_8_THREADS_SIMULATED,"{sample}")
    benchmark:
        repeat(os.path.join(BENCHMARKS,"{sample}_unicycler_8_threads_simulated.txt"),2)
    resources:
        mem_mb=32000,
        time=300 # 300mins
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        unicycler -l {input.l} -1 {input.short_one} -2 {input.short_two} -o {params.out_dir} -t {threads}
        '''



#### aggregation rule
rule aggr_plassembler_8_threads_simulated:
    """aggregate lr"""
    input:
        expand(os.path.join(UNICYCLER_OUTPUT_8_THREADS_SIMULATED,"{sample}", "assembly.fasta"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "plassembler_8_threads_simulated_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """