# Plassembler Simulation & Benchmarking
Benchmarking and Simulation Scripts for Plassembler

This directory contains the pipeline used to benchmark [Plassembler](https://github.com/gbouras13/plassembler).

I used [Snaketool](https://github.com/beardymcjohnface/Snaketool) to make this, and would highly recommend it!

It should work 'out of the box' for the simulated reads. For the real read sets, you will need to change the `csv` input files in this directory with the correct FASTQ paths of the required files on your system. These FASTQ reads can be found in the Zenodo repository [here](https://doi.org/10.5281/zenodo.7996690), or by following the instructions outlined [here](https://github.com/gbouras13/plassembler/blob/main/docs/fastqs.md). 


# Download plassembler_simulation_benchmarking and install it in a conda env

```
# creates conda env
conda create -n plassembler_benchmarking pip
conda activate plassembler_benchmarking

# download the repository
git clone "https://github.com/gbouras13/plassembler_simulation_benchmarking"
cd plassembler_simulation_benchmarking

pip install -e .
plassembler_simulation_benchmarking --help
```

Wick _et al._, Houtak _et al._ and Mathers _et al._ simulated datasets (8 samples)
======

All outputs will be in a directory called `simulated_benchmarking`.

`simulated_benchmarking` will contain `SR` and `LR` directories for short and long simulated reads, and `SIMULATED` containing the Plassembler Flye and Raven and Unicycler outputs for each thread count.

It will also contain `BENCHMARKS` containing the time/memory etc benchmarks and `QUAST`, which will contain the Quast outputs comparing Plassembler and Unicycler to the ground truth plasmid assemblies.


### Simulate Reads 

```
# creates simulated read sets
plassembler_simulation_benchmarking simulate --input benchmarking_simulate.csv --output simulated_benchmarking --threads 16
```

### Assemble Simulated Reads

```
# assembles the simulated read sets
plassembler_simulation_benchmarking assemble-simulated --input benchmarking_simulate.csv --output simulated_benchmarking --threads 16
```

### Assess Simulated Read Outputs with Quast

```
 plassembler_simulation_benchmarking assess-simulated --input benchmarking_simulate.csv --output simulated_benchmarking --threads 16
```

Wick _et al._, real datasets (6 samples)
======

All outputs will be in a directory called `real_benchmarking`.

`real_benchmarking` will contain  `REAL` containing the Plassembler Flye and Raven and Unicycler outputs for each thread count.

It will also contain `BENCHMARKS` containing the time/memory etc benchmarks and `QUAST`, which will contain the Quast outputs comparing Plassembler and Unicycler to the ground truth plasmid assemblies.


### Assemble Real Reads

```
#### you will need to get the FASTQ files and modify benchmarking_real.csv ####
plassembler_simulation_benchmarking assemble-real --input benchmarking_real.csv  --output real_benchmarking --threads 16

```


### Assess Real Read Outputs with Quast

```
 plassembler_simulation_benchmarking assess-real --input benchmarking_real_quast.csv --output real_benchmarking --threads 16
```


De Maio _et al._ Simulated Dataset (12 samples)
======

All outputs will be in a directories called `simulated_benchmarking_de_maio`,

`simulated_benchmarking_de_maio` will contain `SR` and `LR` directories for short and long simulated reads, and `SIMULATED` containing the Plassembler Flye and Raven and Unicycler outputs for each thread count.


It will also contain `BENCHMARKS` containing the time/memory etc benchmarks and `QUAST`, which will contain the Quast outputs comparing Plassembler and Unicycler to the ground truth plasmid assemblies.


### Simulate Reads

```
plassembler_simulation_benchmarking simulate --input benchmarking_simulate_demaio.csv --output simulated_benchmarking_de_maio --threads 16
```

### Assemble Simulated Reads

```
plassembler_simulation_benchmarking assemble-simulated --input benchmarking_simulate_demaio.csv --output simulated_benchmarking_de_maio --threads 16
```


### Assess Simulated Read Outputs with Quast

```
 plassembler_simulation_benchmarking assess-simulated --input benchmarking_simulate_demaio.csv --output simulated_benchmarking_de_maio --threads 16
```



















