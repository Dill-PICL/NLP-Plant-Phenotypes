library(ggplot2)
library(tidyr)
library(dplyr)
library(operators)
library(stringr)
library(hash)


# The input and output files that this script uses and creates.
setwd("..")
parent_directory <- getwd()
setwd("./outputs")
outputs_directory <- getwd()

if (file.exists(outputs_directory)){
  output_composition_name <- list.files(pattern = "composition")
  file_path_composition_files <- paste(outputs_directory, "/", output_composition_name, sep = "")
}
setwd(file_path_composition_files)
if (file.exists(file_path_composition_files)){
  input_name <- list.files(pattern = "words_shared_by_species_melted.csv")
  input_path <- paste(file_path_composition_files, "/", input_name, sep = "")
}

output_path <- paste(parent_directory, "/figs/shared_words.pdf", sep = "")

#input_path <- "/Users/irbraun/phenologs-with-oats/outputs/composition_01_13_2021_h10m34s56_3320/words_shared_by_species_melted.csv"
#output_path <- "/Users/irbraun/phenologs-with-oats/figs/shared_words.png"


# Read in the file that contains the all the precision and recall values for each method.
df <- read.csv(file=input_path)
head(df)


# The order of how the factor levels are specified matters for the plot; this puts 0 on the left and 5 on the right.
df$others = factor(df$others, levels=c(5,4,3,2,1,0), labels=c("5","4","3","2","1","0"))


df$species = factor(df$species, 
                    levels=c("gmx",
                             "mtr",
                             "sly",
                             "osa",
                             "zma",
                             "ath"), 
                    labels=c("Soybean",
                             "Medicago",
                             "Tomato",
                             "Rice",
                             "Maize",
                             "Arabidopsis"))

# Pick colors to represent the number of additional species this word stem is shared with.
method_colors <- c(
  "#581845",
  "#900C3F",
  "#C70039",
  "#F9483B",
  "#FED517",
  "#DAF7A6")
method_names <-  c("0","1","2","3","4","5")
color_mapping <- setNames(method_colors, method_names)


ggplot(df, aes(y=quantity, x=species, fill=others)) + 
  geom_bar(position="fill", stat="identity") +
  scale_fill_manual(name="Shared", values=color_mapping) +
  scale_y_continuous(expand=c(0.01, 0.01)) +
  coord_flip() +
  theme_bw() +  
  ylab("Proportion") +
  xlab("Species") +
  theme(plot.title = element_text(lineheight=1.0, face="bold", hjust=0.5), 
      panel.grid.major = element_blank(), 
      panel.grid.minor = element_blank(),
      legend.direction = "vertical",
      legend.position = "right")
# Saving the plot to a file.
ggsave(output_path, plot=last_plot(), device="pdf", path=NULL, scale=1, width=17, height=6, units=c("cm"), dpi=300, limitsize=FALSE)
