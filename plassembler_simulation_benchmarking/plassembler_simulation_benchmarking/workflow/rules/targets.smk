"""
All target output files are declared here
"""



SimulateTargetFiles = [
 os.path.join(FLAGS, "sr_aggr.txt"),
 os.path.join(FLAGS, "lr_aggr.txt")
]

AssembleSimulateTargetFiles = [
os.path.join(FLAGS, "plassembler_simulated_aggr.txt"),
os.path.join(FLAGS, "unicycler_8_threads_simulated_aggr.txt")
]

AssembleRealTargetFiles = [
os.path.join(FLAGS, "plassembler_8_threads_real_aggr.txt"),
os.path.join(FLAGS, "unicycler_8_threads_real_aggr.txt")
]