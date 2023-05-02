"""
Function for parsing the 'Reads' config and identifying samples and read files
"""


def simulate_from_csv(csvFile):
    """
    Read samples and files from CSV 
    3 cols
    1 = sample 
    2 = genome
    3 = total_length
    """
    outDict = {}
    with open(csvFile,'r') as csv:
        for line in csv:
            l = line.strip().split(',')
            if len(l) == 3:
                outDict[l[0]] = {}
                if os.path.isfile(l[1]):
                    outDict[l[0]]['genome'] = l[1]
                    outDict[l[0]]['total_length'] = l[2]
                else:
                    sys.stderr.write("\n"
                                     f"    FATAL: Error parsing {csvFile}. {l[1]} does not exist. \n"
                                     "    Check formatting, and that \n" 
                                     "    file names and file paths are correct.\n"
                                     "\n")
                    sys.exit(1)
    return outDict



def parseSamplesSimulate(csvfile):
    # for reading from directory
    #if os.path.isdir(readFileDir):
    #   sampleDict = samplesFromDirectory(readFileDir)
    if os.path.isfile(csvfile):
        sampleDict = simulate_from_csv(csvfile)
    else:
        sys.stderr.write("\n"
                         f"    FATAL: {csvfile} is neither a file nor directory.\n"
                         "\n")
        sys.exit(1)
    if len(sampleDict.keys()) == 0:
        sys.stderr.write("\n"
                         "    FATAL: We could not detect any samples at all.\n"
                         "\n")
        sys.exit(1)
    return sampleDict