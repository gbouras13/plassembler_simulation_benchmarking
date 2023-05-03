# plassembler_simulation_benchmarking

Plassembler v1.0.0 simulation and benchmarking pipeline

#### Simulations:

### setup

```
# from the plassembler_simulation_benchmarking directory containing setup.py
conda create -n plassembler_simulation_benchmarking pip
conda activate plassembler_simulation_benchmarking
pip install -e .
plassembler_simulation_benchmarking --help
plassembler_simulation_benchmarking simulate --help
```

### run

Simulation

```
plassembler_simulation_benchmarking simulate --input benchmarking_simulate.csv --output simulate_plas --threads 8
```

Assemble Simulated

```
plassembler_simulation_benchmarking assemble-simulated --input benchmarking_simulate.csv --output simulate_plas_assembly --threads 8
```


Assemble Real (Required Other CSV with paths to Fastqs)

* Still specify the same output directory

```
plassembler_simulation_benchmarking assemble-real --input benchmarking_real.csv --output real_plas_assembly --threads 8
```