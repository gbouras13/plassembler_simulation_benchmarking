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

### run the simulations 

```

run_dir="/data/plassembler_benchmarking/plassembler_simulation_benchmarking"

cd $run_dir

conda activate plassembler_benchmarking

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




