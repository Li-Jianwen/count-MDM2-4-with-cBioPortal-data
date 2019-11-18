# count-MDM2-4-with-cBioPortal-data

1. PATIENT_DATA_oncoprint.tsv and alterations_across_samples-new.tsv were downloaded from https://www.cbioportal.org/  2019-09-12;
2. All the studies were seleceted except the cell lines;
3. Queried by genes of MDM2, MDM4; selected genomics profiles of Copy Number Alterations, selected Patient of Samples with CNA data;
4. The PATIENT_DATA_oncoprint.tsv was downloaded from the tab of OncoPrint, added "clinical tracks of Cancer Type", "Oncotree Code", "Cancer Type Detailed";
5. The alterations_across_samples-new.tsv was downloaded from section of "Type of Genetic Alterations Across All Samples" from the tab of Download, selected the columns of "MDM2:AMP" and "MDM4: AMP";
6. ICI and Non-ICI Patients Data For analysis.xlsx：An ICI treatment cohort of 1,105 patients and 2,285 non-ICI treated patients from MSK-IMPACT Clinical Sequencing Cohort downloaded from cBioPortal website.
7. Figure 1A-C code.R: the R code for Figure IA-C， the input file were ICI_amp.csv; ICI_amp_tmb_msi.csv; and non_ICI_amp.csv
