# Plassembler Simulation & Benchmarking
Benchmarking and Simulation Scripts for Plassembler

# for conda setup issues
https://github.com/LooseLab/readfish/issues/124

# conda dir 

```
conda create -n plassembler_benchmarking pip
```

# install

```
pip install -e .
plassembler_simulation_benchmarking --help
plassembler_simulation_benchmarking simulate --help
```

### Set up the env

```

run_dir="/data/plassembler_benchmarking/plassembler_simulation_benchmarking"

cd $run_dir

conda activate plassembler_benchmarking

```

### Simulate reads

```
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



### Simulate reads

```
plassembler_simulation_benchmarking simulate --input benchmarking_simulate_demaio.csv --output ../simulated_benchmarking_de_maio --threads 16
```


### assemble sims

```
plassembler_simulation_benchmarking assemble-simulated --input benchmarking_simulate_demaio.csv --output ../simulated_benchmarking_de_maio --threads 16
```