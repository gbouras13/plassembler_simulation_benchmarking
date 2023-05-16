rule run_raven_1_thread:
    input:
        l = get_long
    output:
        gfa = os.path.join(RAVEN_OUTPUT_1_THREADS_REAL,"{sample}", "{sample}.gfa"),
        fasta = os.path.join(RAVEN_OUTPUT_1_THREADS_REAL,"{sample}", "{sample}.fasta")        
    threads:
        1
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_raven_1_threads_real.txt")
    resources:
        mem_mb=32000,
        time=1000 # 300mins
    conda:
        os.path.join('..', 'envs','raven.yaml')
    shell:
        '''
        raven -t {threads} {input.l} --graphical-fragment-assembly {output.gfa} > {output.fasta}
        '''

rule run_raven_4_thread:
    input:
        l = get_long
    output:
        gfa = os.path.join(RAVEN_OUTPUT_4_THREADS_REAL,"{sample}", "{sample}.gfa"),
        fasta = os.path.join(RAVEN_OUTPUT_4_THREADS_REAL,"{sample}", "{sample}.fasta")        
    threads:
        1
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_raven_4_threads_real.txt")
    resources:
        mem_mb=32000,
        time=1000 # 300mins
    conda:
        os.path.join('..', 'envs','raven.yaml')
    shell:
        '''
        raven -t {threads} {input.l} --graphical-fragment-assembly {output.gfa} > {output.fasta}
        '''

rule run_raven_8_thread:
    input:
        l = get_long
    output:
        gfa = os.path.join(RAVEN_OUTPUT_8_THREADS_REAL,"{sample}", "{sample}.gfa"),
        fasta = os.path.join(RAVEN_OUTPUT_8_THREADS_REAL,"{sample}", "{sample}.fasta")        
    threads:
        8
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_raven_8_threads_real.txt")
    resources:
        mem_mb=32000,
        time=1000 # 300mins
    conda:
        os.path.join('..', 'envs','raven.yaml')
    shell:
        '''
        raven -t {threads} {input.l} --graphical-fragment-assembly {output.gfa} > {output.fasta}
        '''

rule run_raven_16_thread:
    input:
        l = get_long
    output:
        gfa = os.path.join(RAVEN_OUTPUT_16_THREADS_REAL,"{sample}", "{sample}.gfa"),
        fasta = os.path.join(RAVEN_OUTPUT_16_THREADS_REAL,"{sample}", "{sample}.fasta")        
    threads:
        16
    benchmark:
        os.path.join(BENCHMARKS,"{sample}_raven_16_threads_real.txt")
    resources:
        mem_mb=32000,
        time=1000 # 300mins
    conda:
        os.path.join('..', 'envs','raven.yaml')
    shell:
        '''
        raven -t {threads} {input.l} --graphical-fragment-assembly {output.gfa} > {output.fasta}
        '''

#### aggregation rule
rule aggr_plassembler_real:
    """aggregate lr"""
    input:
        expand(os.path.join(RAVEN_OUTPUT_1_THREADS_REAL,"{sample}", "{sample}.fasta"), sample = SAMPLES),
        expand(os.path.join(RAVEN_OUTPUT_4_THREADS_REAL,"{sample}", "{sample}.fasta"), sample = SAMPLES),
        expand(os.path.join(RAVEN_OUTPUT_8_THREADS_REAL,"{sample}", "{sample}.fasta"), sample = SAMPLES),
        expand(os.path.join(RAVEN_OUTPUT_16_THREADS_REAL,"{sample}", "{sample}.fasta"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "raven_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """



