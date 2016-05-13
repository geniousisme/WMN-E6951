import subprocess


def call_drawR_script():
	subprocess.call(["Rscript", "draw.R"])

if __name__ == "__main__":
	call_drawR_script()