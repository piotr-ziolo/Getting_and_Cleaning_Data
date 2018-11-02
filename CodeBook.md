# Getting and Cleaning Data - Course Project - Code Book

This codebook aims at describing the created data set and steps performed to obtain it.

## Original Data
The data used as a source for the project came from UCI Machine Learing Repository. It contains data collected from the Samsung Galaxy S accelerometers.
To find more about it, visit: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
To download it (not using the attached R scipt), use: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

## Data Transformation
run_analysis.R performs multiple steps which lead to obtaining the final tidy data set:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The script has also many explicit comments on what the specific commands do.

## Tidy Data Set Description
tidy_data.txt contains 68 columns and 180 rows.

Two of them are dimensions:
- subject - IDs of 30 people taking part in the study;
- activity - names of 6 activities performed by them; they include walking, walking upstairs, walking downstairs, sitting, standing and laying.

This means that the granularity of the table is one row per each person per each activity.

The rest of the variables are measures:
- Time_BodyAcceleration_Mean_X                                 
- Time_BodyAcceleration_Mean_Y                                 
- Time_BodyAcceleration_Mean_Z                                 
- Time_BodyAcceleration_StandardDeviation_X                    
- Time_BodyAcceleration_StandardDeviation_Y                    
- Time_BodyAcceleration_StandardDeviation_Z                    
- Time_GravityAcceleration_Mean_X                              
- Time_GravityAcceleration_Mean_Y                              
- Time_GravityAcceleration_Mean_Z                              
- Time_GravityAcceleration_StandardDeviation_X                 
- Time_GravityAcceleration_StandardDeviation_Y                 
- Time_GravityAcceleration_StandardDeviation_Z                 
- Time_BodyAccelerationJerk_Mean_X                             
- Time_BodyAccelerationJerk_Mean_Y                             
- Time_BodyAccelerationJerk_Mean_Z                             
- Time_BodyAccelerationJerk_StandardDeviation_X                
- Time_BodyAccelerationJerk_StandardDeviation_Y                
- Time_BodyAccelerationJerk_StandardDeviation_Z                
- Time_BodyGyroscope_Mean_X                                    
- Time_BodyGyroscope_Mean_Y                                    
- Time_BodyGyroscope_Mean_Z                                    
- Time_BodyGyroscope_StandardDeviation_X                       
- Time_BodyGyroscope_StandardDeviation_Y                       
- Time_BodyGyroscope_StandardDeviation_Z                       
- Time_BodyGyroscopeJerk_Mean_X                                
- Time_BodyGyroscopeJerk_Mean_Y                                
- Time_BodyGyroscopeJerk_Mean_Z                                
- Time_BodyGyroscopeJerk_StandardDeviation_X                   
- Time_BodyGyroscopeJerk_StandardDeviation_Y                   
- Time_BodyGyroscopeJerk_StandardDeviation_Z                   
- Time_BodyAccelerationMagnitude_Mean                          
- Time_BodyAccelerationMagnitude_StandardDeviation             
- Time_GravityAccelerationMagnitude_Mean                       
- Time_GravityAccelerationMagnitude_StandardDeviation          
- Time_BodyAccelerationJerkMagnitude_Mean                      
- Time_BodyAccelerationJerkMagnitude_StandardDeviation         
- Time_BodyGyroscopeMagnitude_Mean                             
- Time_BodyGyroscopeMagnitude_StandardDeviation                
- Time_BodyGyroscopeJerkMagnitude_Mean                         
- Time_BodyGyroscopeJerkMagnitude_StandardDeviation            
- Frequency_BodyAcceleration_Mean_X                            
- Frequency_BodyAcceleration_Mean_Y                            
- Frequency_BodyAcceleration_Mean_Z                            
- Frequency_BodyAcceleration_StandardDeviation_X               
- Frequency_BodyAcceleration_StandardDeviation_Y               
- Frequency_BodyAcceleration_StandardDeviation_Z               
- Frequency_BodyAccelerationJerk_Mean_X                        
- Frequency_BodyAccelerationJerk_Mean_Y                        
- Frequency_BodyAccelerationJerk_Mean_Z                        
- Frequency_BodyAccelerationJerk_StandardDeviation_X           
- Frequency_BodyAccelerationJerk_StandardDeviation_Y           
- Frequency_BodyAccelerationJerk_StandardDeviation_Z           
- Frequency_BodyGyroscope_Mean_X                               
- Frequency_BodyGyroscope_Mean_Y                               
- Frequency_BodyGyroscope_Mean_Z                               
- Frequency_BodyGyroscope_StandardDeviation_X                  
- Frequency_BodyGyroscope_StandardDeviation_Y                  
- Frequency_BodyGyroscope_StandardDeviation_Z                  
- Frequency_BodyAccelerationMagnitude_Mean                     
- Frequency_BodyAccelerationMagnitude_StandardDeviation        
- Frequency_BodyBodyAccelerationJerkMagnitude_Mean             
- Frequency_BodyBodyAccelerationJerkMagnitude_StandardDeviation
- Frequency_BodyBodyGyroscopeMagnitude_Mean                    
- Frequency_BodyBodyGyroscopeMagnitude_StandardDeviation       
- Frequency_BodyBodyGyroscopeJerkMagnitude_Mean                
- Frequency_BodyBodyGyroscopeJerkMagnitude_StandardDeviation  

More about the the meaning of the of the measurements (especially the patterns observed in their names can be found in the original zipped file.
