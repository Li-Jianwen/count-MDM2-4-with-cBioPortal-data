# To invert the table axis, make it easy to read for human;
perl trans.pl PATIENT_DATA_oncoprint.tsv > PATIENT_DATA_oncoprint.tsv.tan  
# Get the "cancer type" from PATIENT_DATA_oncoprint.tsv.tan and the CNV information from alterations_across_samples-new.tsv;
perl merge.pl alterations_across_samples-new.tsv PATIENT_DATA_oncoprint.tsv.tan > table1 
#count MDM2/4 CNV for each cancer type
perl cal.pl table1 > table.cal 
