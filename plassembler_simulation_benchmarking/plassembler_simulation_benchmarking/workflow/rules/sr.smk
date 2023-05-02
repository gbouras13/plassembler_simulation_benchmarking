rule short_read_simulate:
    input:
        get_genome
    output:
        os.path.join(SR,"{sample}_R1.fastq.gz"),
        os.path.join(SR,"{sample}_R2.fastq.gz")
    threads:
        BigJobCpu
    resources:
        mem_mb=BigJobMem,
        time=BigTime
    params:
        get_length,
        os.path.join(SR,"{sample}")
    conda:
        os.path.join('..', 'envs','iss.yaml')
    shell:
        '''
        iss generate --genomes {input[0]} --cpus {threads} --model novaseq --compress --n_reads {params[0]} --output {params[1]}
        '''


#### aggregation rule
rule sr_aggr:
    """aggregate sr"""
    input:
        expand(os.path.join(SR,"{sample}_R2.fastq.gz"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "sr_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """



