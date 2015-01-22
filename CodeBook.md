# Data

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Variables

The training and test sets have 561 variables. These variables comprise the raw signals from the accelerometers as well as derived variables (e.g. min, max, mean, sd, Fast Fourier Transform). See features.txt for a complete list of variables and features_info.txt for more details. 

In addition there is a variable for each subject (1-30) and activity (e.g. walking, standing) since each subject may have performed many different activities for which data was available.

# Transformations

The training and test sets were merged so as to include data from all 30 subjects. 495 variables were filted out to select for the 66 columns that represent means and standard deviations of measurements. 
This remaining data was then melted and recast to derive a tidy dataset of means of each of the 66 variables for each subject and activity level combination. 

Variable names were modified to tidydata standards: 
tBodyAcc-mean()-X becomes tbodyaccmeanx, 
tGravityAcc-std()-Z becomes tgravityaccstdz
