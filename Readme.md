---
title: "Readme"
author: "Henkels"
date: "July 24, 2015"
output: html_document
---

# Getting and Cleaning Data: Course Project

## Introduction
This repository contains my work for the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization. 

## About the raw data
There are two specific folders in the data labeled test and train. Both folders contain a subject txt file that indicates the subjects number, a y_test.txt file that includes the activity the subjeect was performing at the time data was captured, and a x_test.txt file that contains 561 data features.

## About the script and the tidy dataset
The data transformation script is labeled run_analysis.R which will merge the test and training sets together. Prerequisites for this script:

- the UCI HAR Dataset must be extracted
- the UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset"

After merging testing and training, activities are labeled as well as columns, then all unnecessary data is removed leaving just the subject's number, activity, and mean and standard deviation of their measurments.

Lastly, the script will create a tidy data set containing the means of all the columns per activity, per subject. This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

## About the Code Book
The CodeBook.md file explains the transformations performed and the resulting data and variables.
