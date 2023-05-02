
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
def get_genome(wildcards):
    return dictReads[wildcards.sample]["genome"]

def get_length(wildcards):
    reads = dictReads[wildcards.sample]["total_length"]
    return int(reads)





### DIRECTORIES
include: "rules/directories.smk"

# Parse the samples and read files
include: "rules/samples.smk"
dictReads = parseSamplesSimulate(CSV)
SAMPLES = list(dictReads.keys())


# Import rules and functions
include: "rules/targets.smk"
include: "rules/sr.smk"
include: "rules/lr.smk"
include: "rules/targets.smk"

rule all:
    input:
        SimulateTargetFiles
        