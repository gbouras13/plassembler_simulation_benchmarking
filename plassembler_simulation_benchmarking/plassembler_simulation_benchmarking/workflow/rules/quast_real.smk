# plassembler 
rule quast_8_threads_plassembler_real:
    input:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_REAL,"{sample}", "{sample}_plasmids.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_PLASSEMBLER_8_THREADS_REAL,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_PLASSEMBLER_8_THREADS_REAL,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''


rule quast_1_threads_plassembler_REAL:
    input:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_REAL,"{sample}", "{sample}_plasmids.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_PLASSEMBLER_1_THREADS_REAL,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_PLASSEMBLER_1_THREADS_REAL,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''


rule quast_16_threads_plassembler_REAL:
    input:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_REAL,"{sample}", "{sample}_plasmids.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_PLASSEMBLER_16_THREADS_REAL,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_PLASSEMBLER_16_THREADS_REAL,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''

# unicycler 

rule quast_8_threads_unicycler_REAL:
    input:
        plas_file = os.path.join(UNICYCLER_OUTPUT_8_THREADS_REAL,"{sample}", "assembly.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_UNICYCLER_8_THREADS_REAL,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_UNICYCLER_8_THREADS_REAL,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''



rule quast_1_threads_unicycler_REAL:
    input:
        plas_file = os.path.join(UNICYCLER_OUTPUT_1_THREADS_REAL,"{sample}", "assembly.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_UNICYCLER_1_THREADS_REAL,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_UNICYCLER_1_THREADS_REAL,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''

rule quast_16_threads_unicycler_REAL:
    input:
        plas_file = os.path.join(UNICYCLER_OUTPUT_16_THREADS_REAL,"{sample}", "assembly.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_UNICYCLER_16_THREADS_REAL,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_UNICYCLER_16_THREADS_REAL,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''



#### aggregation rule
rule aggr_quast_REAL:
    """aggregate lr"""
    input:
        expand(os.path.join(QUAST_PLASSEMBLER_16_THREADS_REAL,"{sample}", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_PLASSEMBLER_1_THREADS_REAL,"{sample}", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_PLASSEMBLER_8_THREADS_REAL,"{sample}", "report.html"), sample = SAMPLES),
        #expand(os.path.join(QUAST_UNICYCLER_16_THREADS_REAL,"{sample}", "report.html"), sample = SAMPLES),
        #expand(os.path.join(QUAST_UNICYCLER_1_THREADS_REAL,"{sample}", "report.html"), sample = SAMPLES),
        #expand(os.path.join(QUAST_UNICYCLER_8_THREADS_REAL,"{sample}", "report.html"), sample = SAMPLES),
    output:
        os.path.join(FLAGS, "quast_real_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """



