# Preprocessing scripts

The following .R scripts preproces the raw data (see the README file in the 'data' folder for description and categorisation of raw data files).


**01-A.R**
This script preprocesses archetype data with the following operations:

- remove empty archetype data sets from the environment;
- assign courseID values to each file;
- merge each file into a new dataframe **archetypeData** with `rbind()`;
- convert the courseID column to the factor type;
- delete columns irrelevant to later analysis;
- remove initial source data files from the environment.


**01-B.R:**
This script preprocesses enrollment data with the following operations:

- assign courseID values to each file;
- merge each file into a new dataframe **enrollmentData** with `rbind()`;
- convert the courseID column to the factor type;
- replace missing values ("") with NULL (NA) and convert to factors;
- formatting date columns as POSIXct;
- join/merge enrollmentData with archetypeData (such that, where there is a match in the 'learner_id' and 'courseID' columns, a row in the enrollmentData will state the student's behavioural archetype);
- create a new dataframe, **unenrollmentSubset** as a subset of enrollmentData containing those rows where the student has unenrolled;
- calculate the the duration of enrollment for each row in unenrolledSubset and store these values in a new column *enrolledInterval*;
- convert the duration length in *enrolledInterval* from seconds to weeks and store these values in a new column *duration*;
- remove initial source data files from the environment.


**01-C.R:** 
This script preprocesses leaving survey data with the following operations:

- remove empty leaving survey data sets from the environment;
- assign courseID values to each file;
- merge each file into a new dataframe **leavingSurveyData** with `rbind()`;
- convert the courseID column to the factor type;
- replace missing values ("") with NULL (NA) and convert to factors;
- format date columns as POSIXct;
- convert integer columns to factor columns;
- compress length of and merge values in the *leaving_reason* column and convert to factor type (*N.B. there is something wrong with the code written here - this is not being performed when the script is run*);
- create a new data frame, **unenrolledFeedback**, by joining/merging **enrollmentData** with **archetypeData** (such that, where there is a match in the 'learner_id' and 'courseID' columns, the rows from each table are joined and loaded into the new frame);
- remove initial source data files from the environment.


**01-D.R**
This script preprocesses the test/quiz question-answer data with the following operations:

- assign courseID values to each file;
- merge each file into a new dataframe **qaData** with `rbind()`;
- convert the courseID column to the factor type;
- delete empty *cloze_response* column;
- create new data column for submission dates (*N.B. this should be altered to convert the data to POSIXct format*);
- convert integer columns to factor columns;
- remove initial source data files from the environment.


**01-E.R**
This script preprocesses the user activity/step completion data with the following operations:

- assign courseID values to each file;
- merge each file into a new dataframe **activityData** with `rbind()`;
- convert the courseID column to the factor type;
- convert integer columns to characters, then concatenate the values;
- convert character columns to factors;
- format date columns as POSIXct;
- remove initial source data files from the environment.


**01-F.R**
This script preprocesses the weekly sentiment survey data with the following operations:

- remove empty leaving survey data sets from the environment;
- merge each file into a new dataframe **sentimentData** with `rbind()`;
- convert integer columns to factor columns;
- format date column as POSIXct;
- remove initial source data files from the environment.


**01-G.R**
This script preprocesses the team member data with the following operations:

- assign courseID values to each file;
- merge each file into a new dataframe **teamData** with `rbind()`;
- convert integer columns to factor columns;
- delete empty columns;
- remove initial source data files from the environment.


**01-H.R**
This script preprocesses the video stats data with the following operations:

- assign courseID values to each file;
- merge each file into a new dataframe **rawVideoStats** with `rbind()`;
- convert integer columns to factor columns;
- `melt` columns in **rawVideoStats** to create a new **geographicVidData** data frame, substituting new 'human-reader-friendly' values for the regions;
- `melt` columns in **rawVideoStats** to create a new **deviceVidData** data frame, substituting new 'human-reader-friendly' values for the types of devices;
- `melt` columns in **rawVideoStats** to create a new **viewDurData** data frame, substituting new 'human-reader-friendly' values for the duration viewed values;
- remove initial source data files from the environment.