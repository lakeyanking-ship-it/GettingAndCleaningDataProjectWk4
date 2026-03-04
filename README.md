# GettingAndCleaningDataProjectWk4
Project for the Getting and Cleaning Data course. Includes the R script, tidy data set, CodeBook, and README used to clean and summarize the UCI HAR Dataset.

Getting and Cleaning Data: Course Project
This repository contains the work for the Getting and Cleaning Data course project. The goal is to take the raw UCI Human Activity Recognition (HAR) dataset and produce a tidy summary dataset that reports the average of each mean and standard‑deviation measurement for every subject and activity.
Raw Data
The source data comes from the UCI HAR Dataset, which includes accelerometer and gyroscope measurements collected from Samsung Galaxy S smartphones. The dataset contains training and test partitions, activity labels, subject identifiers, and 561 sensor features.
Script Overview
The analysis is performed by run_analysis.R, which executes the following steps:
Loads the training and test datasets, including subjects, activities, and feature measurements.
Merges the training and test sets into one combined dataset.
Extracts only the measurements on the mean and standard deviation.
Replaces activity codes with descriptive activity names.
Cleans and standardizes variable names for clarity.
Creates a second tidy dataset that contains the average of each variable for each subject and activity.
Writes the final tidy dataset to tidy_data.txt.
How to Run the Script
Download and unzip the UCI HAR Dataset into the project directory.
Open the R Project associated with this repository.
Run run_analysis.R from RStudio.
The script will generate tidy_data.txt in the project folder.
Files in This Repository
run_analysis.R — Script that performs the full data cleaning and summarization workflow.
tidy_data.txt — Final tidy dataset created by the script.
CodeBook.md — Describes the variables, data transformations, and cleaning steps.
README.md — Overview of the project and instructions for running the analysis.
