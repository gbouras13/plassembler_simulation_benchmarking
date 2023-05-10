# Plassembler Simulation & Benchmarking
Benchmarking and Simulation Scripts for Plassembler

This directory contains the pipeline used to benchmarking [Plassembler](https://github.com/gbouras13/plassembler).

It should work 'out of the box' for the simulated reads. For the real read sets, you will need to change the `csv` input files in this directory with the correct FASTQ paths of the required files on your system. These FASTQ reads can be found in the Zenodo repository [here](sfsdfg), or by following the instructions outlined [here](https://github.com/gbouras13/plassembler/blob/1.0.0/docs/fastqs.md). 


# Install the conda env

```
conda create -n plassembler_benchmarking pip
conda activate plassembler_benchmarking
pip install -e .
plassembler_simulation_benchmarking --help
plassembler_simulation_benchmarking simulate --help

```

Wick, Houtak and Mathers datasets
======

All outputs will be in a directories called `simulated_benchmarking` and `real_benchmarking`.

The first will contain `SR` and `LR` directories for short and long simulated reads. 

Both will contain `BENCHMARKS` containing the time/memory etc benchmarks, `SIMULATED` or `REAL` contain the Plassembler and Unicycler outputs for each thread count.

`QUAST` will contain the Quast outputs comparing Plassembler and Unicycler to the ground truth plasmid assemblies.


### Simulate reads 

```
cd plassembler_simulation_benchmarking
plassembler_simulation_benchmarking simulate --input benchmarking_simulate.csv --output ../simulated_benchmarking --threads 16
```

### Assemble simulations

```
plassembler_simulation_benchmarking assemble-simulated --input benchmarking_simulate.csv --output ../simulated_benchmarking --threads 16
```

### Assemble real

```
plassembler_simulation_benchmarking assemble-real --input benchmarking_real.csv  --output ../real_benchmarking --threads 16
```

### Assess simulations

```
plassembler_simulation_benchmarking assess-simulated --input benchmarking_simulate.csv --output ../simulated_benchmarking --threads 16
```

### assess real

```
plassembler_simulation_benchmarking assess-real --input benchmarking_real.csv --output ../real_benchmarking --threads 16
```

De Maio
======

All outputs will be in a directories called `simulated_benchmarking_de_maio` and `real_benchmarking_de_maio`.

The first will contain `SR` and `LR` directories for short and long simulated reads. 

Both will contain `BENCHMARKS` containing the time/memory etc benchmarks, `SIMULATED` or `REAL` contain the Plassembler and Unicycler outputs for each thread count.

`QUAST` will contain the Quast outputs comparing Plassembler and Unicycler to the ground truth plasmid assemblies.

### Simulate reads

```
cd plassembler_simulation_benchmarking
plassembler_simulation_benchmarking simulate --input benchmarking_simulate_demaio.csv --output ../simulated_benchmarking_de_maio --threads 16
```

### Assemble Simulated reads

```
plassembler_simulation_benchmarking assemble-simulated --input benchmarking_simulate_demaio.csv --output ../simulated_benchmarking_de_maio --threads 16
```

### Assemble Real reads

```
plassembler_simulation_benchmarking assemble-real --input benchmarking_real_demaio.csv --output ../real_benchmarking_de_maio --threads 16
```

### Assess simulations

```
plassembler_simulation_benchmarking assess-simulated --input benchmarking_simulate.csv --output ../simulated_benchmarking_de_maio --threads 16
```

### assess real

```
plassembler_simulation_benchmarking assess-real --input benchmarking_real.csv --output ../real_benchmarking_de_maio --threads 16
```
