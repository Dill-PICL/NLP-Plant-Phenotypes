import os

tempfiles_directory="temp_textfiles"

output_directory = "temp_output"

default_results_filename = "RESULTS.tsv"

default_results_path = os.path.join(output_directory,default_results_filename)

specificity= 'precise-match' 

jar_path="../lib/NobleCoder-1.0.jar"

ontology_name='go'

stdout_path="temp_output/nc_stdout.txt"

os.makedirs("temp_output")
os.makedirs("temp_textfile")



os.system(f"java -jar {jar_path} -terminology {ontology_name} -input {tempfiles_directory} -output {output_directory} -search '{specificity}' -score.concepts > {stdout_path}")

#os.system(f"java -jar ../lib/NobleCoder-1.0.jar -terminology go -input temp_textfiles -output temp_output -search 'precise-match' -score.concepts > nc_stdout.txt")
