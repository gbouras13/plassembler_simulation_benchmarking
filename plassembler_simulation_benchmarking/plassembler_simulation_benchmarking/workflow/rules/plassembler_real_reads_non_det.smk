rule run_plassembler_1_thread_real_non_det:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_NON_DET,"{sample}", "{sample}_plasmids.fasta")
    threads:
        1
    params:
        db =PLASSEMBLER_DB,
        out_dir = os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_NON_DET,"{sample}"),
        chrom = get_length
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_plassembler_1_threads_non_det.txt")
    resources:
        mem_mb=32000,
        time=1000 # 300mins
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        # using v 1.0.0 from bioconda
        plassembler.py -l {input.l} -1 {input.short_one} -2 {input.short_two} \
        -o {params.out_dir} -t {threads} -p {wildcards.sample} -c {params.chrom} -d {params.db} -f -r --no_subsample
        '''

rule run_plassembler_8_thread_real_non_det:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_NON_DET,"{sample}", "{sample}_plasmids.fasta")
    threads:
        8
    params:
        db =PLASSEMBLER_DB,
        out_dir = os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_NON_DET,"{sample}"),
        chrom = get_length
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_plassembler_8_threads_non_det.txt")
    resources:
        mem_mb=32000,
        time=1000 # 300mins
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        # using v 1.0.0 from bioconda
        plassembler.py -l {input.l} -1 {input.short_one} -2 {input.short_two} \
        -o {params.out_dir} -t {threads} -p {wildcards.sample} -c {params.chrom} -d {params.db} -f -r --no_subsample
        '''


rule run_plassembler_16_thread_real_non_det:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_NON_DET,"{sample}", "{sample}_plasmids.fasta")
    threads:
        16
    params:
        db =PLASSEMBLER_DB,
        out_dir = os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_NON_DET,"{sample}"),
        chrom = get_length
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_plassembler_16_threads_non_det.txt")
    resources:
        mem_mb=32000,
        time=1000 # 300mins
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        # using v 1.0.0 from bioconda
        plassembler.py -l {input.l} -1 {input.short_one} -2 {input.short_two} \
        -o {params.out_dir} -t {threads} -p {wildcards.sample} -c {params.chrom} -d {params.db} -f -r --no_subsample
        '''



#### aggregation rule
rule aggr_plassembler_non_det:
    """aggregate lr"""
    input:
        expand(os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_NON_DET,"{sample}", "{sample}_plasmids.fasta"), sample = SAMPLES),
        expand(os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_NON_DET,"{sample}", "{sample}_plasmids.fasta"), sample = SAMPLES),
        expand(os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_NON_DET,"{sample}", "{sample}_plasmids.fasta"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "plassembler_non_det_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """



