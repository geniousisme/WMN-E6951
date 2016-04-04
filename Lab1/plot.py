import sys
import numpy as np
import matplotlib.pyplot as plt

def plot_cdf(file_name):
	# Create some test data

	f = open(file_name, 'r')
	data = [float(line) for line in f]
	fig, ax = plt.subplots(1)
	values, base = np.histogram(data, bins = 1000, normed = True)
	dY = base[1] - base[0]
	
	Y = values
	data = np.array(data)
	mu = data.mean()
	variance = data.var()
	print variance
	print data.std()
	percentile = np.percentile(data, 99)
	textstr = 																   \
	'$\mathrm{mean}=%.2f$\n$\mathrm{variance}=%.2f$\n$\mathrm{99th-percentile}=%.2f$' \
	% (mu, variance, percentile)
	cumulative = np.cumsum(Y) * dY

	ax.set_title(file_name[:-4].upper() + " CDF")

	ax.set_xlabel('rtt (ms)')
	ax.set_ylabel('probability')

	# plot the cumulative function
	plt.plot(base[:-1], cumulative, c='blue')

	# these are matplotlib.patch.Patch properties
	props = dict(boxstyle = 'round', facecolor = 'wheat', alpha = 0.6)

	# place a text box in upper left in axes coords
	ax.text(0.05, 0.95, textstr, transform = ax.transAxes, fontsize = 14,
        verticalalignment = 'top', bbox = props)

	plt.show()

if __name__ == "__main__":
	file_name = sys.argv[1]
	plot_cdf(file_name)