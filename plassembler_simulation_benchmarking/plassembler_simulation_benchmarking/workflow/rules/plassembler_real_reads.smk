rule run_plassembler_8_threads:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_REAL,"{sample}", "{sample}_plasmids.fasta")
    threads:
        8
    params:
        bindir = PLASSEMBLER_BIN,
        db =PLASSEMBLER_DB,
        out_dir = os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_REAL,"{sample}"),
        chrom = get_length,
        tp = TIME_PATH
    log:
        os.path.join(BENCHMARKS,"{sample}_plassembler_8_threads_real.txt")
    # benchmark:
    #     repeat(os.path.join(BENCHMARKS,"{sample}_plassembler_8_threads_real.txt"),2)
    resources:
        mem_mb=32000,
        time=1000 # 300mins
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        {params.tp}/time -f '%M %K %E %S %U'  -o {log}  {params.bindir}/plassembler.py -l {input.l} -1 {input.short_one} -2 {input.short_two} \
        -o {params.out_dir} -t {threads} -p {wildcards.sample} -c {params.chrom} -d {params.db} -f 
        '''



#### aggregation rule
rule aggr_plassembler_8_threads:
    """aggregate lr"""
    input:
        expand(os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_REAL,"{sample}", "{sample}_plasmids.fasta"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "plassembler_8_threads_real_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """



