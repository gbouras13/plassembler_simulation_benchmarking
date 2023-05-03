rule run_unicycler_8_threads_real:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        uni_fasta = os.path.join(UNICYCLER_OUTPUT_8_THREADS_REAL,"{sample}", "assembly.fasta")
    threads:
        8
    params:
        out_dir = os.path.join(UNICYCLER_OUTPUT_8_THREADS_REAL,"{sample}"),
        tp = TIME_PATH
    log:
        os.path.join(BENCHMARKS,"{sample}_unicycler_8_threads_real.txt")
    # benchmark:
    #     repeat(os.path.join(BENCHMARKS,"{sample}_unicycler_8_threads_real.txt"),2)
    resources:
        mem_mb=32000,
        time=300 # 300mins
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        {params.tp}/time  -f '%M %K %E %S %U'  -o {log}  unicycler -l {input.l} -1 {input.short_one} -2 {input.short_two} -o {params.out_dir} -t {threads} 
        '''



#### aggregation rule
rule aggr_unicycler_8_threads_real:
    """aggregate lr"""
    input:
        expand(os.path.join(UNICYCLER_OUTPUT_8_THREADS_REAL,"{sample}", "assembly.fasta"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "unicycler_8_threads_real_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """