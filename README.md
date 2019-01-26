# Getting-and-Cleaning-Data-Course-Project
This is the final project for Coursera course on Data Science Specialisation

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

In this project, the data is collected from the accelerometers from the Samsung Galaxy S smartphone, later it is reshaped to the final dataset "tidy.txt".

The Repository Contains the following files:
- `Readme.md`: This explains how all of the scripts work and how they are connected. 
- `tidy.txt` : This is the final tidy dataset which has avarage of each variable by Subject and Activity name.
- `run_analysis.R` : This is the script to manipulte and generate the required dateset.
- `CodeBook.md` : describes the variables, the data, and any transformations or work that was performed to clean up the data


## Data Background(Source)
>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## Manipulations

All the data manipulations are done in run_analysis.R and following steps were followed:

1. The data is downloaded and imported to R.
2. Appropriate labels are assigned to the imported datasets
3. The test and train datasets are merged.
4. The Required fields(Mean and Standard deviation) is extracted
5. Activity Number are converted to activity names.
6. Final Tidy data set is created with the average of each variable for each activity and each subject.
