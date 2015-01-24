# Getting and Cleaning Data Project
-------------------
This repository contains the files necessary to complete the project for the "Getting and Cleaning Data" Coursera course.

This project consists of the following :

1. "Instruction List" see below

2. [Code Book] (code_book.md)

3. [R Script] (run_analysis.R) which takes the raw input data and converts it to the tidy data required for the project

## Project Instructions

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 

Merges the training and the test sets to create one data set.

Extracts only the measurements on the mean and standard deviation for each measurement. 

Uses descriptive activity names to name the activities in the data set

Appropriately labels the data set with descriptive variable names. 

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Instruction List for [R Script] (run_analysis.R)

## Input data

The raw data for this script is the Human Activity Recognition Using Smartphones Dataset (Version 1.0). These files can be obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Unzip the the Dataset zip file and set this as your working directory in your R environment using the setwd() function.

## Output data

The output is the file [tidy_data.txt] (tidy_data.txt). This file contains the tidy data set required by the project.

## About this script

This script was developed & tested with R version 3.1.2 on the 32 bit Windows platform [windows 7] using RStudio version 0.98.1091

The following libraries were also used by the script:


- "LaF" package to read in fixed length text files quickly (version 0.6.1)
- "data.table" package to manipulate table data more efficiently in memory (version 1.9.4)
- "dplyr" package to manipulate in memory data with SQL like operations (version 0.4.0)

