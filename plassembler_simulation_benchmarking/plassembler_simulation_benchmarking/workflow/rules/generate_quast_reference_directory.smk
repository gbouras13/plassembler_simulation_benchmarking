rule split_reference:
    input:
        os.path.join(GENOME,"{sample}.fasta")
    output:
        os.path.join(QUAST_REFS,"{sample}")
    threads:
        1
    resources:
        mem_mb=1000,
        time=5
    conda:
        os.path.join('..', 'envs','scripts.yaml')
    script:
        '../scripts/split_multifasta.py'


#### aggregation rule
rule quast_aggr:
    """aggregate sr"""
    input:
        expand(os.path.join(QUAST_REFS,"{sample}"), sample = SAMPLES)
    output:
        os.path.join(FLAGS, "quast_ref_aggr.txt")
    threads:
        1
    shell:
        """
        touch {output[0]}
        """

