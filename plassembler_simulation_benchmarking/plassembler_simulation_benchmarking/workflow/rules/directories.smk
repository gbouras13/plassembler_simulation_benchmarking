"""
Database and output locations for the pipeline
"""




### OUTPUT DIRs
FLAGS = os.path.join(OUTPUT, 'FLAGS')

SR = os.path.join(OUTPUT, 'SR')
LR = os.path.join(OUTPUT, 'LR')

BENCHMARKS = os.path.join(OUTPUT, 'BENCHMARKS')

REAL = os.path.join(OUTPUT, 'REAL')
SIMULATED = os.path.join(OUTPUT, 'SIMULATED')


# plass
# real
PLASSEMBLER_OUTPUT_1_THREADS_REAL = os.path.join(REAL, 'PLASSEMBLER_OUTPUT_1_THREADS')
PLASSEMBLER_OUTPUT_8_THREADS_REAL = os.path.join(REAL, 'PLASSEMBLER_OUTPUT_8_THREADS')
PLASSEMBLER_OUTPUT_16_THREADS_REAL = os.path.join(REAL, 'PLASSEMBLER_OUTPUT_16_THREADS')

# sim
PLASSEMBLER_OUTPUT_1_THREADS_SIMULATED = os.path.join(SIMULATED, 'PLASSEMBLER_OUTPUT_1_THREADS')
PLASSEMBLER_OUTPUT_8_THREADS_SIMULATED = os.path.join(SIMULATED, 'PLASSEMBLER_OUTPUT_8_THREADS')
PLASSEMBLER_OUTPUT_16_THREADS_SIMULATED = os.path.join(SIMULATED, 'PLASSEMBLER_OUTPUT_16_THREADS')


# unicycler
# real
UNICYCLER_OUTPUT_1_THREADS_REAL = os.path.join(REAL, 'UNICYCLER_OUTPUT_1_THREADS')
UNICYCLER_OUTPUT_8_THREADS_REAL = os.path.join(REAL, 'UNICYCLER_OUTPUT_8_THREADS')
UNICYCLER_OUTPUT_16_THREADS_REAL = os.path.join(REAL, 'UNICYCLER_OUTPUT_16_THREADS')

#sim
UNICYCLER_OUTPUT_1_THREADS_SIMULATED = os.path.join(SIMULATED, 'UNICYCLER_OUTPUT_1_THREADS')
UNICYCLER_OUTPUT_8_THREADS_SIMULATED = os.path.join(SIMULATED, 'UNICYCLER_OUTPUT_8_THREADS')
UNICYCLER_OUTPUT_16_THREADS_SIMULATED = os.path.join(SIMULATED, 'UNICYCLER_OUTPUT_16_THREADS')









