# Plassembler Simulation & Benchmarking
Benchmarking and Simulation Scripts for Plassembler

This directory contains the pipeline used to benchmark [Plassembler](https://github.com/gbouras13/plassembler).

I used [Snaketool](https://github.com/beardymcjohnface/Snaketool) to make this, and would highly recommend it!

It should work 'out of the box' for the simulated reads. For the real read sets, you will need to change the `csv` input files in this directory with the correct FASTQ paths of the required files on your system. These FASTQ reads can be found in the Zenodo repository [here](sfsdfg), or by following the instructions outlined [here](https://github.com/gbouras13/plassembler/blob/1.0.0/docs/fastqs.md). 


# Download plassembler_simulation_benchmarking and install it in a conda env

```
conda create -n plassembler_benchmarking pip
conda activate plassembler_benchmarking

# download the repository
git clone "https://github.com/gbouras13/plassembler_simulation_benchmarking"
cd plassembler_simulation_benchmarking

pip install -e .
plassembler_simulation_benchmarking --help
```

Wick _et al._, Houtak _et al._ and Mathers _et al._ datasets
======

All outputs will be in a directories called `simulated_benchmarking` and `real_benchmarking`.

`simulated_benchmarking` will contain `SR` and `LR` directories for short and long simulated reads, and `SIMULATED` containing the Plassembler and Unicycler outputs for each thread count.

`real_benchmarking` will contain  `REAL` containing the Plassembler and Unicycler outputs for each thread count.

Both will contain `BENCHMARKS` containing the time/memory etc benchmarks and `QUAST`, which will contain the Quast outputs comparing Plassembler and Unicycler to the ground truth plasmid assemblies.


### Simulate Reads 

```
plassembler_simulation_benchmarking simulate --input benchmarking_simulate.csv --output ../simulated_benchmarking --threads 16
```

### Assemble Simulated Reads

```
plassembler_simulation_benchmarking assemble-simulated --input benchmarking_simulate.csv --output ../simulated_benchmarking --threads 16
```

### Assemble Real Reads

```
plassembler_simulation_benchmarking assemble-real --input benchmarking_real.csv  --output ../real_benchmarking --threads 16
```

### Assess Simulated Read Outputs with Quast

```
plassembler_simulation_benchmarking assess-simulated --input benchmarking_simulate.csv --output ../simulated_benchmarking --threads 16
```

### Assess Real Read Outputs with Quast

```
plassembler_simulation_benchmarking assess-real --input benchmarking_real.csv --output ../real_benchmarking --threads 16
```

De Maio _et al._ Dataset
======

All outputs will be in a directories called `simulated_benchmarking_de_maio` and `real_benchmarking_de_maio`.

`simulated_benchmarking_de_maio` will contain `SR` and `LR` directories for short and long simulated reads, and `SIMULATED` containing the Plassembler and Unicycler outputs for each thread count.

`real_benchmarking_de_maio` will contain  `REAL` containing the Plassembler and Unicycler outputs for each thread count.

Both will contain `BENCHMARKS` containing the time/memory etc benchmarks and `QUAST`, which will contain the Quast outputs comparing Plassembler and Unicycler to the ground truth plasmid assemblies.


### Simulate Reads

```
plassembler_simulation_benchmarking simulate --input benchmarking_simulate_demaio.csv --output ../simulated_benchmarking_de_maio --threads 16
```

### Assemble Simulated Reads

```
plassembler_simulation_benchmarking assemble-simulated --input benchmarking_simulate_demaio.csv --output ../simulated_benchmarking_de_maio --threads 16
```

### Assemble Real Reads

```
plassembler_simulation_benchmarking assemble-real --input benchmarking_real_demaio.csv --output ../real_benchmarking_de_maio --threads 16
```

### Assess Simulated Read Outputs with Quast

```
plassembler_simulation_benchmarking assess-simulated --input benchmarking_simulate.csv --output ../simulated_benchmarking_de_maio --threads 16
```

### Assess Real Read Outputs with Quast

```
plassembler_simulation_benchmarking assess-real --input benchmarking_real.csv --output ../real_benchmarking_de_maio --threads 16
```
