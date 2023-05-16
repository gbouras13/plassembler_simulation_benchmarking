"""
All target output files are declared here
"""



SimulateTargetFiles = [
 os.path.join(FLAGS, "sr_aggr.txt"),
 os.path.join(FLAGS, "lr_aggr.txt")
]

AssembleSimulateTargetFiles = [
os.path.join(FLAGS, "plassembler_simulated_aggr.txt"),
#os.path.join(FLAGS, "unicycler_simulated_aggr.txt")
]

AssembleRealTargetFiles = [
os.path.join(FLAGS, "plassembler_real_aggr.txt"),
os.path.join(FLAGS, "plassembler_non_det_aggr.txt")
#os.path.join(FLAGS, "unicycler_real_aggr.txt")
]

SimulateQuastTargetFiles = [os.path.join(FLAGS, "quast_ref_aggr.txt"),
os.path.join(FLAGS, "quast_simulated_aggr.txt"),
    ]


RealQuastTargetFiles = [os.path.join(FLAGS, "quast_ref_aggr.txt"),
os.path.join(FLAGS, "quast_real_aggr.txt"),
    ]
