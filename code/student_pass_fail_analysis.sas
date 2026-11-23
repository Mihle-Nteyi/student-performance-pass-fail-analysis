/* Student Performance Pass/Fail Analysis
   Group F academic project
   Cleaned SAS code transcription
*/

/* 1. Import data */
/* Replace the path with the location of your dataset */
proc import datafile="REPLACE_WITH_DATASET_PATH"
    out=student_data
    dbms=csv
    replace;
    getnames=yes;
run;

/* 2. Inspect dataset */
proc contents data=student_data;
run;

/* 3. Frequency analysis */
proc freq data=student_data;
    tables gender address internet_access / chisq;
run;

/* 4. Descriptive statistics */
proc univariate data=student_data;
    var age absences;
run;

/* 5. Full logistic regression model */
proc logistic data=student_data;
    class gender address;
    model Final_grade(event="Pass") =
        gender
        age
        address
        absences;
run;

/* 6. Reduced logistic regression model */
proc logistic data=student_data;
    class gender address;
    model Final_grade(event="Pass") =
        gender
        age
        absences;
run;
