# plassembler 
rule quast_8_threads_plassembler_simulated:
    input:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_8_THREADS_SIMULATED,"{sample}", "{sample}_plasmids.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_PLASSEMBLER_8_THREADS_SIMULATED,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_PLASSEMBLER_8_THREADS_SIMULATED,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''


rule quast_1_threads_plassembler_simulated:
    input:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_1_THREADS_SIMULATED,"{sample}", "{sample}_plasmids.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_PLASSEMBLER_1_THREADS_SIMULATED,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_PLASSEMBLER_1_THREADS_SIMULATED,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''


rule quast_16_threads_plassembler_simulated:
    input:
        plas_file = os.path.join(PLASSEMBLER_OUTPUT_16_THREADS_SIMULATED,"{sample}", "{sample}_plasmids.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_PLASSEMBLER_16_THREADS_SIMULATED,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_PLASSEMBLER_16_THREADS_SIMULATED,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''

# unicycler 



rule quast_8_threads_unicycler_simulated:
    input:
        plas_file = os.path.join(UNICYCLER_OUTPUT_8_THREADS_SIMULATED,"{sample}", "assembly.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_UNICYCLER_8_THREADS_SIMULATED,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_UNICYCLER_8_THREADS_SIMULATED,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''



rule quast_1_threads_unicycler_simulated:
    input:
        plas_file = os.path.join(UNICYCLER_PLASMIDS_ONLY_1_THREADS_SIM,"{sample}", "assembly.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_UNICYCLER_1_THREADS_SIMULATED,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_UNICYCLER_1_THREADS_SIMULATED,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''

rule quast_16_threads_unicycler_simulated:
    input:
        plas_file = os.path.join(UNICYCLER_PLASMIDS_ONLY_16_THREADS_SIM,"{sample}", "assembly.fasta"),
        reference = os.path.join(QUAST_REFS,"{sample}")
    output:
        quast_report = os.path.join(QUAST_UNICYCLER_16_THREADS_SIMULATED,"{sample}", "report.html")
    threads:
        1
    resources:
        mem_mb=4000,
        time=120 
    params:
        out_dir = os.path.join(QUAST_UNICYCLER_16_THREADS_SIMULATED,"{sample}")
    conda:
        os.path.join('..', 'envs','quast.yaml')
    shell:
        '''
        metaquast -r {input.reference} \
        -o {params.out_dir} \
        {input.plas_file}
        '''



#### aggregation rule
rule aggr_quast_simulated:
    """aggregate lr"""
    input:
        expand(os.path.join(QUAST_PLASSEMBLER_16_THREADS_SIMULATED,"{sample}", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_PLASSEMBLER_1_THREADS_SIMULATED,"{sample}", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_PLASSEMBLER_8_THREADS_SIMULATED,"{sample}", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_UNICYCLER_16_THREADS_SIMULATED,"{sample}", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_UNICYCLER_1_THREADS_SIMULATED,"{sample}", "report.html"), sample = SAMPLES),
        expand(os.path.join(QUAST_UNICYCLER_8_THREADS_SIMULATED,"{sample}", "report.html"), sample = SAMPLES),
    output:
        os.path.join(FLAGS, "quast_simulated_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """



