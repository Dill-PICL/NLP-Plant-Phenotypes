# NLP-Plant-Phenotypes

datasets available at:  

For preprocessing, merging and analysis of datasets are available in this repository: 

## Pre-reqs 
1. openjdk
2. gcc and R modules for running the scripts

The next step is to Install the required packages

```python 
pip install -r requirements.txt
```

To directly run, use 
```python
bash pipeline.sh
```

To run it as python script, go to the notebooks directory

```python
python analysis.py
python analysis_dataset_composition.py
cd ..
cd scripts/
python rglob_and_stack.py
cd .. 
cd quoats/
python plots.py
```

To run it as jupyter notebook, go to notebooks directory and run analysis, analysis_data_composition first. Then go to scripts directory and run rglob_and_stack.py and plots.py from quoats.


## FEEDBACK

Any queries or feedback. Contact ianrbraun@gmail.com OR jyothi@iastate.edu.


