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

googleGeo = "US-TN"
googleTime= "today+5-y"

fentanyl1 = c("china girl", "china white", "dance fever", "king ivory", "fentanyl")
fentanyl2 = c("goodfella", "murder 8", "great bear", "tango & cash", "birria")
fentanyl3 = c("fent", "fenty", "toe tag dope")
#fentanyl3 = c("fentanyl")
  
Oxycontin1 = c("oxy", "greenies", "ercs",  "percs")
Oxycontin2 = c("512s", "hillbilly heroin", "oxycontin","m-30s")

orthoB1= c("broken arm", "broken hand", "broken finger",  "broken wrist", "broken shoulder")
orthoB2= c("broken toe", "broken shin", "broken knee",  "broken leg", "broken hip")
orthoB3= c("broken head", "broken neck", "broken back", "broken ankle")

orthoS1= c("sprained arm", "sprained hand", "sprained finger",  "sprained wrist", "sprained shoulder")
orthoS2= c("sprained toe", "sprained shin", "sprained knee",  "sprained leg", "sprained hip")
orthoS3= c("sprained head", "sprained neck", "sprained back", "sprained ankle")

orthoP1= c("arm pain", "hand pain", "finger pain",  "wrist pain", "shoulder pain")
orthoP2= c("toe pain", "shin pain", "knee pain",  "leg pain", "hip pain")
orthoP3= c("head pain", "neck pain", "back pain", "ankle pain")

psychS1= c("depressed", "suicidal", "make the pain go away",  "end it all", "life is unbearable")
psychS2= c("i'm exhausted", "can't sleep", "can't focus",  "wake up tired", "stressed out")
psychS3= c("headache", "seasonal affected disorder", " psychologist", " psychiatrist", "migrane")

dental1 = c("tooth hurts", "toothache", "cavity", "jaw hurts", "tooth fell out")
dental2 = c("sore mouth", "sore gums", "dentist", "mouthwash", "gums bleeding")


sex1 = c("am i pregnant", "home pregnancy test", "pregnancy test", "condom broke", "can i get pregnant from")
sex2 = c("it burns when I pee", "chlamidia", "herpes", "HPV", "genital warts")
sex3 = c("abortion clinic", "morning after pill", "plan b", "where can i get an abortion", "how much is an abortion")
sex4 = c("have an std", "common std", "what can i take for an std", "itches")

urology1 = c("i can't pee", "hurts to pee", "pee all the time", "pee is brown", "peeing blood")
urology2 = c("kidneys hurt","kidney stones", "urethra")

pediatric1 = c("my baby has a fever", "my baby is purple", "my baby is sick", "my baby is crying", "my baby vomited")

oncology1= c("i found a lump", "do i have cancer", "sun tanning", "tanning salons")

eent1 = c("sore throat", "cough", "hacking up", "lost my voice", "cough drops")
eent2 = c("coughing up blood")

cardio1 = c("chest pain", "high blood pressure", "left arm numb", "am i having a heart attack", "heart attack symptoms")

flu = c("flu", "have a cold", "flu medicine", "flu symptoms", "how long is the flu")

fentanylR1=gtrends(fentanyl1, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
fentanylR2=gtrends(fentanyl2, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
fentanylR3=gtrends(fentanyl3, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")


OxycontinR1=gtrends(Oxycontin1, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
OxycontinR2=gtrends(Oxycontin2, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")

orthoRb1=gtrends(orthoB1, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
orthoRb2=gtrends(orthoB2, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
orthoRb3=gtrends(orthoB3, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")

orthoRs1=gtrends(orthoS1, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
orthoRs2=gtrends(orthoS3, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
orthoRs3=gtrends(orthoS3, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")

orthoRp1=gtrends(orthoP1, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
orthoRp2=gtrends(orthoP2, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
orthoRp3=gtrends(orthoP3, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")


psychRs1=gtrends(psychS1, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
psychRs2=gtrends(psychS2, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
psychRs3=gtrends(psychS3, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")

dentalR1 = gtrends(dental1, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
dentalR2 = gtrends(dental2, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
  
sexR1 = gtrends(sex1, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
sexR2 = gtrends(sex2, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
sexR3 = gtrends(sex3, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
sexR4 = gtrends(sex4, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")

urologyR1 = gtrends(urology1, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
urologyR2 = gtrends(urology2, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
  
pediatricR1 = gtrends(pediatric1, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")

oncologyR1=gtrends(oncology1, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")

eentR1 = gtrends(eent1, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")
eentR2 = gtrends(eent2, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")

cardioR1 = gtrends(cardio1, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")

fluR = gtrends(flu, geo = googleGeo, time = googleTime, gprop = c("web", "news", "images", "froogle", "youtube"),  hl = "en-US")

#------------Drug Corner---------------------------
plot(fentanylR1)
plot(fentanylR2)
plot(fentanylR3)

plot(OxycontinR1)
plot(OxycontinR2)

#------------Ortho Corner---------------------------
plot(orthoRb1)
plot(orthoRb2)
plot(orthoRb3)

plot(orthoRs1)
plot(orthoRs2)
plot(orthoRs3)

plot(orthoRp1)
plot(orthoRp2)
plot(orthoRp3)

plot(psychRs1)
plot(psychRs2)
plot(psychRs3)

plot(dentalR1)
plot(dentalR2)

plot(sexR1)
plot(sexR2)
plot(sexR3)
plot(sexR4)

plot(urologyR1)
plot(urologyR2)

plot(pediatricR1)

plot(oncologyR1)

plot(eentR1)
plot(eentR2)

plot(cardioR1)

plot(fluR)


fentanylTwitter = "china girl OR fentanyl OR goodfella OR birria OR fent"


OxycontinTwitter = c("oxy OR greenies OR ercs OR percs OR 512s OR oxycontin OR m30s")

orthoB1= c("broken arm", "broken hand", "broken finger",  "broken wrist", "broken shoulder")
orthoB2= c("broken toe", "broken shin", "broken knee",  "broken leg", "broken hip")
orthoB3= c("broken head", "broken neck", "broken back", "broken ankle")

orthoS1= c("sprained arm", "sprained hand", "sprained finger",  "sprained wrist", "sprained shoulder")
orthoS2= c("sprained toe", "sprained shin", "sprained knee",  "sprained leg", "sprained hip")
orthoS3= c("sprained head", "sprained neck", "sprained back", "sprained ankle")

orthoP1= c("arm pain", "hand pain", "finger pain",  "wrist pain", "shoulder pain")
orthoP2= c("toe pain", "shin pain", "knee pain",  "leg pain", "hip pain")
orthoP3= c("head pain", "neck pain", "back pain", "ankle pain")

psychS1= c("depressed", "suicidal", "make the pain go away",  "end it all", "life is unbearable")
psychS2= c("i'm exhausted", "can't sleep", "can't focus",  "wake up tired", "stressed out")
psychS3= c("headache", "seasonal affected disorder", " psychologist", " psychiatrist", "migrane")

dental1 = c("tooth hurts", "toothache", "cavity", "jaw hurts", "tooth fell out")
dental2 = c("sore mouth", "sore gums", "dentist", "mouthwash", "gums bleeding")


sex1 = c("am i pregnant", "home pregnancy test", "pregnancy test", "condom broke", "can i get pregnant from")
sex2 = c("it burns when I pee", "chlamidia", "herpes", "HPV", "genital warts")
sex3 = c("abortion clinic", "morning after pill", "plan b", "where can i get an abortion", "how much is an abortion")
sex4 = c("have an std", "common std", "what can i take for an std", "itches")

urology1 = c("i can't pee", "hurts to pee", "pee all the time", "pee is brown", "peeing blood")
urology2 = c("kidneys hurt","kidney stones", "urethra")

pediatric1 = c("my baby has a fever", "my baby is purple", "my baby is sick", "my baby is crying", "my baby vomited")

oncology1= c("i found a lump", "do i have cancer", "sun tanning", "tanning salons")

eent1 = c("sore throat", "cough", "hacking up", "lost my voice", "cough drops")
eent2 = c("coughing up blood")

cardio1 = c("chest pain", "high blood pressure", "left arm numb", "am i having a heart attack", "heart attack symptoms")

flu = c("flu", "have a cold", "flu medicine", "flu symptoms", "how long is the flu")


drugs = searchTwitter(OxycontinTwitter, n=500, lang = 'en', since = "2017-12-13", until = "2017-12-19" , geocode='36.3134,-82.3534,100mi')

tweetsdf = twListToDF(drugs)


#------------Communicable Disease Corner---------------------------

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