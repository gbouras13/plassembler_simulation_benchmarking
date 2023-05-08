
# Concatenate Snakemake's own log file with the master log file
onsuccess:
    shell("cat {log} >> " + config['log'])

onerror:
    shell("cat {log} >> " + config['log'])

outTouch = os.path.join(config['output'], config['input'])

### DEFAULT CONFIG FILE
configfile: os.path.join(workflow.basedir, '../', 'config', 'config.yaml')


CSV = config['input']
OUTPUT = config['output']
THREADS = config['threads']


# need to specify the reads directory
CSV = config['input']
# genome dir 
GENOME = os.path.join(workflow.basedir, '../../', 'plasmid_genomes_for_quast')


### DIRECTORIES
include: "rules/directories.smk"

# Parse the samples and read files
include: "rules/samples.smk"
dictReads = parseSamplesReal(CSV)
SAMPLES = list(dictReads.keys())

# Import rules and functions
include: "rules/targets.smk"
include: "rules/generate_quast_reference_directory.smk"
include: "rules/quast_real.smk"


rule all:
    input:
        RealQuastTargetFiles
        