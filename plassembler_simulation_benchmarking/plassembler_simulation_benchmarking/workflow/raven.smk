
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


# define functions


def get_long(wildcards):
    return dictReads[wildcards.sample]["LR"]


### DIRECTORIES
include: "rules/directories.smk"

# Parse the samples and read files
include: "rules/samples.smk"
dictReads = parseSamplesReal(CSV)
SAMPLES = list(dictReads.keys())


# Import rules and functions
include: "rules/targets.smk"
include: "rules/raven.smk"




rule all:
    input:
        RavenTargetFiles
        