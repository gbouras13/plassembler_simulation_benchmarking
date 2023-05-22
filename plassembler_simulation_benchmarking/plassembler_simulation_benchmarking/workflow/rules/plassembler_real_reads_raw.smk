rule run_plassembler_1_thread_real:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_REAL,"{sample}", "{sample}_plasmids.fasta")
    threads:
        1
    params:
        bindir = PLASSEMBLER_BIN,
        db =PLASSEMBLER_DB,
        out_dir = os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_REAL,"{sample}"),
        chrom = get_length
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_plassembler_raven_1_threads_real.txt")
    resources:
        mem_mb=32000,
        time=1000 # 300mins
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        {params.bindir}/plassembler.py -l {input.l} -1 {input.short_one} -2 {input.short_two} \
        -o {params.out_dir} -t {threads} -p {wildcards.sample} -c {params.chrom} -d {params.db} -f -r
        '''

rule run_plassembler_8_threads_real:
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
        chrom = get_length
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_plassembler_raven_8_threads_real.txt")
    resources:
        mem_mb=32000,
        time=1000 # 300mins
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        {params.bindir}/plassembler.py -l {input.l} -1 {input.short_one} -2 {input.short_two} \
        -o {params.out_dir} -t {threads} -p {wildcards.sample} -c {params.chrom} -d {params.db} -f -r
        '''


rule run_plassembler_16_threads_real:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_REAL,"{sample}", "{sample}_plasmids.fasta")
    threads:
        16
    params:
        bindir = PLASSEMBLER_BIN,
        db =PLASSEMBLER_DB,
        out_dir = os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_REAL,"{sample}"),
        chrom = get_length
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_plassembler_raven_16_threads_real.txt")
    resources:
        mem_mb=32000,
        time=1000 # 300mins
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        {params.bindir}/plassembler.py -l {input.l} -1 {input.short_one} -2 {input.short_two} \
        -o {params.out_dir} -t {threads} -p {wildcards.sample} -c {params.chrom} -d {params.db} -f -r
        '''

rule run_plassembler_1_thread_real_flye:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_REAL_FLYE,"{sample}", "{sample}_plasmids.fasta")
    threads:
        1
    params:
        bindir = PLASSEMBLER_BIN,
        db =PLASSEMBLER_DB,
        out_dir = os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_REAL_FLYE,"{sample}"),
        chrom = get_length
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_plassembler_flye_1_threads_real.txt")
    resources:
        mem_mb=32000,
        time=1000 # 300mins
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        {params.bindir}/plassembler.py -l {input.l} -1 {input.short_one} -2 {input.short_two} \
        -o {params.out_dir} -t {threads} -p {wildcards.sample} -c {params.chrom} -d {params.db} -f  --use_flye  
        '''

rule run_plassembler_8_threads_real_flye:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_REAL_FLYE,"{sample}", "{sample}_plasmids.fasta")
    threads:
        8
    params:
        bindir = PLASSEMBLER_BIN,
        db =PLASSEMBLER_DB,
        out_dir = os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_REAL_FLYE,"{sample}"),
        chrom = get_length
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_plassembler_flye_8_threads_real.txt")
    resources:
        mem_mb=32000,
        time=1000 # 300mins
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        {params.bindir}/plassembler.py -l {input.l} -1 {input.short_one} -2 {input.short_two} \
        -o {params.out_dir} -t {threads} -p {wildcards.sample} -c {params.chrom} -d {params.db} -f  --use_flye  
        '''


rule run_plassembler_16_threads_real_flye:
    input:
        l = get_long,
        short_one = get_short_one,
        short_two = get_short_two
    output:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_REAL_FLYE,"{sample}", "{sample}_plasmids.fasta")
    threads:
        16
    params:
        bindir = PLASSEMBLER_BIN,
        db =PLASSEMBLER_DB,
        out_dir = os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_REAL_FLYE,"{sample}"),
        chrom = get_length
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_plassembler_flye_16_threads_real_flye.txt")
    resources:
        mem_mb=32000,
        time=1000 # 300mins
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        {params.bindir}/plassembler.py -l {input.l} -1 {input.short_one} -2 {input.short_two} \
        -o {params.out_dir} -t {threads} -p {wildcards.sample} -c {params.chrom} -d {params.db} -f  --use_flye  
        '''



#### aggregation rule
rule aggr_plassembler_real:
    """aggregate lr"""
    input:
        expand(os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_REAL,"{sample}", "{sample}_plasmids.fasta"), sample = SAMPLES),
        expand(os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_REAL,"{sample}", "{sample}_plasmids.fasta"), sample = SAMPLES),
        expand(os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_REAL,"{sample}", "{sample}_plasmids.fasta"), sample = SAMPLES),
        expand(os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_REAL_FLYE,"{sample}", "{sample}_plasmids.fasta"), sample = SAMPLES),
        expand(os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_REAL_FLYE,"{sample}", "{sample}_plasmids.fasta"), sample = SAMPLES),
        expand(os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_REAL_FLYE,"{sample}", "{sample}_plasmids.fasta"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "plassembler_real_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """



