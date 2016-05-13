import sys
import re
import numpy as np

def scraper(input_filename, out_filename):
	pattern = r"(\d{1,3}(\.\d{1,3})?) [M|K]?bits/sec"
	out_file = open(out_filename, "a")
	throughputs = []
	experiment_time = 1
	with open(input_filename, 'r') as f:
		for line in f:
			if not line.strip():
				continue
			if "local" in line:
				if throughputs:
					write_to_csv(throughputs, experiment_time, out_file, input_filename)
					throughputs = []
					experiment_time += 1
			else:
				match_obj = re.search(pattern, line)
				throughput = float(match_obj.group(1))
				if "Kbits/sec" in line:
					throughput /= 1000
				print "throughput", throughput
				throughputs.append(throughput)
		write_to_csv(throughputs, experiment_time, out_file, input_filename)
		f.close()
	out_file.close()

def write_to_csv(throughputs, experiment_time, out_file, input_filename):
	throughputs = np.array(throughputs)
	print throughputs
	avg = round(np.average(throughputs), 3)
	std = round(np.std(throughputs), 3)
	output_str = ','.join([input_filename[-1], str(experiment_time), str(avg), str(std)]) + '\n'
	out_file.write(output_str)

if __name__ == "__main__":
	scraper(sys.argv[1], sys.argv[2])