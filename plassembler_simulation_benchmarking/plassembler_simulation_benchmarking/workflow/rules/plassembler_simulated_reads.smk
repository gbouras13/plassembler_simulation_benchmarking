rule run_plassembler_8_threads_simulated:
    input:
        l = os.path.join(LR,"{sample}.fastq.gz"),
        short_one = os.path.join(SR,"{sample}_R1.fastq.gz"),
        short_two = os.path.join(SR,"{sample}_R2.fastq.gz")
    output:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_SIMULATED,"{sample}", "{sample}_plasmids.fasta")
    threads:
        8
    params:
        bindir = PLASSEMBLER_BIN,
        db =PLASSEMBLER_DB,
        out_dir = os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_SIMULATED,"{sample}"),
        chrom = get_length
    benchmark:
        repeat(os.path.join(BENCHMARKS,"{sample}_plassembler_8_threads_simulated.txt"),2)
    resources:
        mem_mb=32000,
        time=1000 # 1000mins
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        time
        {params.bindir}/plassembler.py -l {input.l} -1 {input.short_one} -2 {input.short_two} -o {params.out_dir} -t {threads} -p {wildcards.sample} -c {params.chrom} -d {params.db} -f
        '''



#### aggregation rule
rule aggr_plassembler_8_threads_real:
    """aggregate lr"""
    input:
        expand(os.path.join(PLASSEMBLER_OUTPUT_8_THREADS,"{sample}", "{sample}_plasmids.fasta"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "plassembler_8_threads_simulated_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """



