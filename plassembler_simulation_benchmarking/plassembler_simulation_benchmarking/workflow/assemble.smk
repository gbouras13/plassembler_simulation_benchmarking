
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


# snakemake params 
MassiveJobMem = config["BigJobMem"]
BigJobMem = config["BigJobMem"]
BigJobCpu = config["BigJobCpu"]
SmallJobMem = config["SmallJobMem"]
SmallJobCpu = config["SmallJobCpu"]

SmallTime = config["SmallTime"]
BigTime = config["BigTime"]
MediumTime = config["MediumTime"]



# need to specify the reads directory
CSV = config['input']

# define functions
def get_input_lr_fastqs(wildcards):
    return dictReads[wildcards.sample]["LR"]


### DIRECTORIES
include: "rules/directories.smk"

# Parse the samples and read files
include: "rules/samples.smk"
dictReads = parseSamples(CSV)
SAMPLES = list(dictReads.keys())



# Import rules and functions
include: "rules/targets.smk"
include: "rules/qc.smk"
include: "rules/align.smk"
include: "rules/quantify.smk"
include: "rules/nanoreceptor.smk"

rule all:
    input:
        TargetFiles
        