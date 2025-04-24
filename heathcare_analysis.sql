SELECT * FROM healthcare.health;
# Count the total number of patients:
select  distinct count(unique_id) from healthcare.health;
#List all unique medical conditions present in the dataset:
select distinct medical_condition from healthcare.health;
# Find the total number of male and female patients:
select gender,count(unique_id) as total_patient from healthcare.health group by gender;
# Retrieve all patient records where billing amount is greater than $5000:
select * from healthcare.health where billing_amount > 5000;
#Find the total billing amount for each medical condition:
select medical_condition,sum(billing_amount) as bills from healthcare.health group by medical_condition order by bills desc;
# Get the average length of hospital stay for each medical condition:
select medical_condition,avg(Stay) from healthcare.health group by medical_condition;
#Find the number of patients by gender and smoking status:
select gender,smoking_status,count(unique_id) as patient from healthcare.health group by gender,smoking_status order by gender, patient desc;
#Get the top 5 hospitals with the highest patient admissions:
select hospital,count(unique_id) as total_patient from healthcare.health group by hospital order by total_patient desc limit 5;
#Find the most common medical condition based on the number of patients:
select medical_condition,count(*) total_patient from healthcare.health group by medical_condition order by total_patient desc limit 1;
#Identify medical conditions with the highest mortality rate:
select medical_condition,count(unique_id) as patient,
sum(case when outcome = 'Deceased' then 1 else 0 end )as death_count,
(sum(case when outcome = 'Deceased'then 1 else 0 end )*100/count(*)) as death_rate
 from healthcare.health group by medical_condition order by patient desc;
# Calculate the average BMI for each medical condition:
select medical_condition,avg(BMI) from healthcare.health group by medical_condition;
# Find the most expensive treatment per medical condition:
select medical_condition,max(billing_amount) as bills from healthcare.health group by medical_condition order by bills desc;
#List patients admitted in 2024 who stayed more than 7 days:
select name,age,medical_condition,date_of_admission,Stay from healthcare.health where year(date_of_admission) = 2024 and Stay >7 ;
#Find the insurance company that has covered the highest total billing amount:
select insurance_provider,sum(billing_amount) as bills from healthcare.health group by insurance_provider order by bills desc limit 1;