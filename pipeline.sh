echo "START OF PIPELINE.SH\n"

# Convert the preprocessing notebooks to python scripts
echo "convert notebooks to scripts"
cd notebooks/
jupyter nbconvert --to script analysis.ipynb
jupyter nbconvert --to script analysis_dataset_composition.ipynb

jupyter nbconvert --to script bert.ipynb
# Scripts are located ../notebooks

# Run all the scripts
echo "\nrunninig all scripts"

echo " \n  analysis"
python analysis.py

echo "\n\n   analysis_dataset_composition"
python analysis_dataset_composition.py


echo "\nrunning post script"
cd ..
cd scripts/

echo "   rglob_and_stack"
python3 rglob_and_stack.py

cd ..   

### ABSOLUTE PATHS USED IN THIS NOTEBOOK - NEED TO CHANGE
# Convert the preprocessing notebooks to python scripts
echo "\n\nconvert notebooks to scripts"
cd quoats/
jupyter nbconvert --to script plots.ipynb 
python plots.py 




echo "\nEND OF PIPELINE.SH"
