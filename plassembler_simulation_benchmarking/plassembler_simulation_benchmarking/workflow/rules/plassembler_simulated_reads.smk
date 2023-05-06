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
    log:
        os.path.join(BENCHMARKS,"{sample}_plassembler_8_threads_simulated.txt")
    resources:
        mem_mb=32000,
        time=1000 # 1000mins
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        time -h -l  -o {log} {params.bindir}/plassembler.py -l {input.l} -1 {input.short_one} \
         -2 {input.short_two} -o {params.out_dir} -t {threads} -p {wildcards.sample} -c {params.chrom} -d {params.db} -f
        '''


rule run_plassembler_1_threads_simulated:
    input:
        l = os.path.join(LR,"{sample}.fastq.gz"),
        short_one = os.path.join(SR,"{sample}_R1.fastq.gz"),
        short_two = os.path.join(SR,"{sample}_R2.fastq.gz")
    output:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_SIMULATED,"{sample}", "{sample}_plasmids.fasta")
    threads:
        1
    params:
        bindir = PLASSEMBLER_BIN,
        db =PLASSEMBLER_DB,
        out_dir = os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_SIMULATED,"{sample}"),
        chrom = get_length
    resources:
        mem_mb=32000,
        time=2000 # 2000mins
    log:
        os.path.join(BENCHMARKS,"{sample}_plassembler_1_threads_simulated.txt")
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        time -h -l  -o {log} {params.bindir}/plassembler.py -l {input.l} -1 {input.short_one} \
         -2 {input.short_two} -o {params.out_dir} -t {threads} -p {wildcards.sample} -c {params.chrom} -d {params.db} -f
        '''

rule run_plassembler_16_threads_simulated:
    input:
        l = os.path.join(LR,"{sample}.fastq.gz"),
        short_one = os.path.join(SR,"{sample}_R1.fastq.gz"),
        short_two = os.path.join(SR,"{sample}_R2.fastq.gz")
    output:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_SIMULATED,"{sample}", "{sample}_plasmids.fasta")
    threads:
        16
    params:
        bindir = PLASSEMBLER_BIN,
        db =PLASSEMBLER_DB,
        out_dir = os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_SIMULATED,"{sample}"),
        chrom = get_length
    resources:
        mem_mb=32000,
        time=2000 # 2000mins
    log:
        os.path.join(BENCHMARKS,"{sample}_plassembler_16_threads_simulated.txt")
    conda:
        os.path.join('..', 'envs','plassembler.yaml')
    shell:
        '''
        time -h -l  -o {log} {params.bindir}/plassembler.py -l {input.l} -1 {input.short_one} \
         -2 {input.short_two} -o {params.out_dir} -t {threads} -p {wildcards.sample} -c {params.chrom} -d {params.db} -f
        '''


#### aggregation rule
rule aggr_plassembler_simulated:
    """aggregate lr"""
    input:
        expand(os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_SIMULATED,"{sample}", "{sample}_plasmids.fasta"), sample = SAMPLES),
        expand(os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_SIMULATED,"{sample}", "{sample}_plasmids.fasta"), sample = SAMPLES),
        expand(os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_SIMULATED,"{sample}", "{sample}_plasmids.fasta"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "plassembler_simulated_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """



