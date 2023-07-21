echo "START OF PIPELINE.SH\n"

# Convert the preprocessing notebooks to python scripts
echo "convert notebooks to scripts"
cd notebooks/
jupyter nbconvert --to script analysis.ipynb


cd your_local_path/reorganizing-irb-scripts/plant-phenotypes-nlp/notebooks
python analysis.py --name plants1 --dataset plants --filter --ic --vanilla
python analysis.py --name plants2 --dataset plants --filter --learning --baseline
python analysis.py --name plants3 --dataset plants --filter --bio_small --vocab
python analysis.py --name plants4 --dataset plants --filter --collapsed
python analysis.py --name plants5 --dataset plants --filter --noblecoder
python analysis.py --name plants6 --dataset plants --filter --nmf --lda
python analysis.py --name plants7 --dataset plants --filter --bert --biobert
cd ../scripts
python rglob_and_stack.py plants



cd ../quoats/
jupyter nbconvert --to script plots.ipynb 
python plots.py 




echo "\nEND OF PIPELINE.SH"
