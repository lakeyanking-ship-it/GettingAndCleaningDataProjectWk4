A mixed‑style CodeBook works best for this project: list the core variables explicitly (subject, activity, and the major feature groups), then describe the naming conventions so reviewers understand how all remaining variables are structured without forcing you to list all ~66 individually.

Here is a polished CodeBook.md you can paste directly into your repo. It balances explicit detail with concise structure and meets peer‑grading expectations.

---

## CodeBook.md

### Overview  
This CodeBook describes the variables, data sources, and transformations used to create the tidy dataset `tidy_data.txt` for the Getting and Cleaning Data course project. The dataset summarizes the average of each mean and standard‑deviation measurement for every subject and activity in the UCI Human Activity Recognition (HAR) dataset.

---

## Source Data  
The raw data come from the *UCI HAR Dataset*, which includes smartphone accelerometer and gyroscope measurements collected from 30 volunteers performing six activities:

- WALKING  
- WALKING_UPSTAIRS  
- WALKING_DOWNSTAIRS  
- SITTING  
- STANDING  
- LAYING  

The original dataset contains 561 sensor features, split into training and test sets.

---

## Variables in the Tidy Dataset

### Identifiers  
These variables uniquely identify each observation in the tidy dataset:

- **subject** — Integer from 1 to 30 identifying the participant.  
- **activity_name** — Descriptive activity label (e.g., “WALKING”, “SITTING”).

### Measurement Variables  
All remaining variables are numeric and represent the **average** of each original mean or standard‑deviation measurement for each subject–activity pair.

The variables follow a consistent naming structure:

```
Domain + Signal + Instrument + Statistic + Axis(optional)
```

### Naming Components  
- **Domain**  
  - `Time` — time‑domain signals  
  - `Frequency` — frequency‑domain signals (FFT‑transformed)

- **Signal**  
  - `Body` — body motion component  
  - `Gravity` — gravity component  

- **Instrument**  
  - `Accelerometer` — accelerometer sensor  
  - `Gyroscope` — gyroscope sensor  
  - `Magnitude` — magnitude of the 3‑axis signal  

- **Statistic**  
  - `Mean` — mean value  
  - `Std` — standard deviation  

- **Axis (optional)**  
  - `X`, `Y`, `Z` — directional components  
  - Magnitude variables have no axis suffix  

### Examples of Final Variable Names  
These examples illustrate the naming pattern:

- `TimeBodyAccelerometerMeanX`  
- `TimeBodyAccelerometerStdY`  
- `TimeGravityAccelerometerMeanZ`  
- `FrequencyBodyGyroscopeStdX`  
- `TimeBodyAccelerometerMagnitudeMean`  
- `FrequencyBodyGyroscopeMagnitudeStd`

The tidy dataset contains one such variable for each mean and standard‑deviation feature extracted from the original dataset.

---

## Transformations Applied

### 1. Merging Training and Test Sets  
The training and test datasets were combined using row binding after loading subject IDs, activity labels, and feature measurements.

### 2. Extracting Mean and Standard‑Deviation Features  
Only features containing `"mean()"` or `"std()"` in the original feature list were retained.

### 3. Applying Descriptive Activity Names  
Numeric activity codes were replaced with descriptive labels from `activity_labels.txt`.

### 4. Cleaning Variable Names  
Original feature names were transformed to descriptive, readable forms by:

- Expanding prefixes (`t` → `Time`, `f` → `Frequency`)  
- Replacing abbreviations (`Acc` → `Accelerometer`, `Gyro` → `Gyroscope`)  
- Removing punctuation (`()`, `-`)  
- Correcting duplicates (`BodyBody` → `Body`)  
- Standardizing capitalization  

### 5. Creating the Final Tidy Dataset  
The dataset was grouped by subject and activity, and the **mean of every variable** was computed.  
The result contains **180 rows** (30 subjects × 6 activities) and **68 columns**.

---

