install.packages("devtools")
library("devtools")
devtools::install_github("ropenhealth/openfda")
library("openfda")

patient_ages = fda_query("/drug/event.json") %>%
  fda_count("patient.patientonsetage") %>%
  fda_exec()

library("ggplot2")
qplot(x=term, y=count, data=patient_ages)

paxil_ages = fda_query("/drug/event.json") %>%
  fda_filter("patient.drug.openfda.generic_name", "paroxetine") %>%
  fda_count("patient.patientonsetage") %>%
  fda_exec()

age_query = fda_query("/drug/event.json") %>%
  # fda_api_key("MYKEY") %>%
  fda_count("patient.patientonsetage");


paxil_ages = age_query %>% fda_filter("patient.drug.openfda.generic_name", "paroxetine") %>% fda_exec()
zoloft_ages = age_query %>% fda_filter("patient.drug.openfda.generic_name", "sertraline") %>% fda_exec()
qplot(x=term, y=count, data=paxil_ages)
qplot(x=term, y=count, data=zoloft_ages)

library(gtrendsR)
google.trends = gtrends(c("bitcoin bubble"), geo = c("CA"), gprop = "web", time = "2010-06-30 2017-06-30")[[1]]

library("rvest")

trend=gtrends("", geo = "US-TN-531", time = "today+5-y", gprop = c("web", "news",
                                                                   "images", "froogle", "youtube"), category = 45, hl = "en-US")

negativeSearch=gtrends(c("bitcoin bubble", "bitcoin fraud", "bitcoin stolen", "bitcoin crash"),  time = "now 1-H", gprop = c("web", "news",
                                                                                                                             "images", "froogle", "youtube"),  hl = "en-US")
Sys.sleep(4)
negativeSearch2=gtrends(c("bitcoin crash coming", "bitcoin bubble about to burst", "sell bitcoin", "stolen bitcoin wallet"),  time = "now 1-H", gprop = c("web", "news",
                                                                                                                                                          "images", "froogle", "youtube"),  hl = "en-US")
Sys.sleep(5) 
positiveSearch=gtrends(c("bitcoin breaking", "bitcoin record", "bitcoin rising", "bitcoin increase", "buy bitcoin"),  time = "now 1-H", gprop = c("web", "news",
                                                                                                                                                  "images", "froogle", "youtube"),  hl = "en-US")

plot(negativeSearch)
top = 0
top$freq = as.data.frame(trend$subject)
top
# Health: 45
# Aging & Geriatrics: 623
# Alzheimer's Disease: 624
# Alternative & Natural Medicine: 499
# Acupuncture & Chinese Medicine: 1239
# Cleansing & Detoxification: 1238
# Health Conditions: 419
# AIDS & HIV: 625
# Allergies: 626
# Arthritis: 628
# Cancer: 429
# Cold & Flu: 629
# Diabetes: 630
# Ear Nose & Throat: 1211
# Eating Disorders: 571
# Endocrine Conditions: 1328
# Diabetes: 630
# Thyroid Conditions: 1329
# Genetic Disorders: 941
# GERD & Digestive Disorders: 638
# Heart & Hypertension: 559
# Infectious Diseases: 632
# Cold & Flu: 629
# Parasites & Parasitic Diseases: 1262
# Sexually Transmitted Diseases: 421
# AIDS & HIV: 625
# Vaccines & Immunizations: 1263
# Injury: 817
# Neurological Disorders: 942
# Alzheimer's Disease: 624
# Obesity: 818
# Pain Management: 819
# Headaches & Migraines: 631
# Respiratory Conditions: 824
# Asthma: 627
# Skin Conditions: 420
# Sleep Disorders: 633
# Health Education & Medical Training: 254
# Health Foundations & Medical Research: 252
# Health News: 1253
# Health Policy: 1256
# Medical Devices & Equipment: 251
# Assistive Technology: 1352
# Mobility Equipment & Accessories: 1353
# Medical Facilities & Services: 256
# Doctors' Offices: 634
# Hospitals & Treatment Centers: 250
# Medical Procedures: 635
# Medical Tests & Exams: 943
# Surgery: 944
# Cosmetic Surgery: 238
# Vaccines & Immunizations: 1263
# Physical Therapy: 500
# Medical Literature & Resources: 253
# Medical Photos & Illustration: 945
# Men's Health: 636
# Erectile Dysfunction: 202
# Mental Health: 437
# Anxiety & Stress: 639
# Depression: 640
# Learning & Developmental Disabilities: 641
# ADD & ADHD: 642
# Nursing: 418
# Assisted Living & Long Term Care: 649
# Nutrition: 456
# Special & Restricted Diets: 457
# Cholesterol Issues: 643
# Vitamins & Supplements: 237
# Oral & Dental Care: 245
# Pediatrics: 645
# Pharmacy: 248
# Drugs & Medications: 646
# Public Health: 947
# Health Policy: 1256
# Occupational Health & Safety: 644
# Poisons & Overdoses: 946
# Vaccines & Immunizations: 1263
# Reproductive Health: 195
# Birth Control: 198
# Erectile Dysfunction: 202
# Infertility: 647
# OBGYN: 558
# Pregnancy & Maternity: 401
# Sex Education & Counseling: 536
# Sexual Enhancement: 1236
# Sexually Transmitted Diseases: 421
# AIDS & HIV: 625
# Substance Abuse: 257
# Drug & Alcohol Testing: 1351
# Drug & Alcohol Treatment: 1350
# Smoking & Smoking Cessation: 1237
# Steroids & Performance-Enhancing Drugs: 1235
# Vision Care: 246
# Eyeglasses & Contacts: 1224
# Women's Health: 648
# OBGYN: 558
# Pregnancy & Maternity: 401