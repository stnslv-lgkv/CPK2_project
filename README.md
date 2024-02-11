## Comparative analysis of the gut microbiota composition of healthy people and people with irritable bowel syndrome with predominant constipation

Authors:
- [Anna Arefieva](https://github.com/AnnaArefeva)
- [Maria Bochkareva](https://github.com/MariBochkareva)
- [Stanislav Legkovoy](https://github.com/stnslv-lgkv)
- [Thi Hong Zung Fam](https://github.com/fthzzz)

### Introduction

![IBS](/pics/IBS.png)

Irritable Bowel Syndrome with constipation, known as IBS-C, is a subtype of Irritable Bowel Syndrome characterized by chronic constipation and associated abdominal pain. It affects approximately one-third of individuals with IBS and is considered a functional gastrointestinal disorder because it causes symptoms without an identifiable cause [^1][^2][^3].

The exact cause of IBS-C is not fully understood, but it is believed to involve a dysfunction in the digestive system or alterations in gut-brain communication that lead to improper regulation of intestinal movements. Factors such as genetic predisposition, age, gender, and coexisting conditions like GERD, indigestion, chronic fatigue syndrome, fibromyalgia, chronic pelvic pain, anxiety, depression, food intolerances, and small intestinal bacterial overgrowth may play a role [^4][^2][^5].

Common causes of Irritable Bowel Syndrome with constipation (IBS-C) include [^7][^6]:

- Genetic predisposition: If a family member has IBS, your risk of developing the condition may be higher

- Age: IBS-C is more common in people under the age of 50, with females being twice as likely to develop it

- Underlying inflammation: Inflammation in the gastrointestinal tract may be related to previous bacterial infections or changes in the immune system

- Gut-brain dysfunction: Alterations in the gut-brain relationship where the brain does not send the correct signals to regulate intestinal movements can occur 

- Coexisting conditions: IBS-C may also appear in individuals with other health issues such as gastroesophageal reflux disease (GERD), indigestion, chronic fatigue syndrome, fibromyalgia, chronic pelvic pain, anxiety, depression, food intolerances, and small intestinal bacterial overgrowth (SIBO) 

- Postinfectious: Some people develop IBS-C after a gut infection like food poisoning 

- Reduced motility: Low motility, or the movements that push waste material along the digestive tract, can slow down digestion and cause constipation 

- Dysbiosis: Imbalance in gut flora, with either an excess of harmful bacteria or not enough beneficial bacteria, is common in people with IBS

- Small intestinal bacterial overgrowth (SIBO): Bacteria from the large intestine can migrate into the small intestine and cause symptoms

- Visceral hypersensitivity: Sensitivity in the intestines, which is a mechanism underlying IBS, may be caused by certain gut bacteria, changes in the nervous system, or the immune system

- Stress and trauma: Frequent exposure to stress can disrupt digestion, and individuals with IBS may have had traumatic experiences early in life

- Alcohol and smoking: Frequent alcohol consumption and current smoking are more common in people with IBS and are associated with stress 

Management strategies for IBS-C often include lifestyle changes, dietary modifications, and medications aimed at addressing specific symptoms. 

### Aim & tasks

The **aim** of this project was to develop a methodology of analyzing data and compare the gut microbiota of healthy people with the gut microbiota of people with constipation-type IBS

The following **tasks** were set in order to achieve the goal:

1. Determination of sampling distributions in different categories of research subjects

2. Search for meaningfully different microorganisms’ taxa (bacteria and archaea) and/or groups of taxon in categories of people

3. Building classifiers based on the trained data for each level of classification

4. Evaluation of the correlation between the presence/number of gas-producing bacteria and the constipation type of IBS

### Results
Raw sequencing data from six researches in NCBI were processed into percentages for various bacterial taxa identified across 285 individuals, including their health information and bacterial function data. The combined dataset included both healthy individuals and those with IBS-C, covering health status, age, sex, sequencing regions, and bacterial taxa (Order to Genus). Analysis methods included descriptive statistics, data visualization (box plots, histograms, word clouds), statistical tests (Wilcoxon signed-rank, Brunner Munzel, logistic regression), and machine learning models (Random Forest, UMAP, binary logistic regression).
Following results have been obtained regarding particular taxon levels:

**Order**:
1. At the Order level it is impossible to assess the relationship of IBS Constipation  with gas producers or bacteria with other certain function.
2. There is a statistically significant difference in the distribution of the percentage of bacteria between different groups by gender, research_ID, state of health.
3. ML model based on the random forest algorithm is built, which is able to separate patients with IBS-C from healthy people.
4. UMAP Clustering: Despite discernible clustering in UMAP analysis, the clusters lacked a clear pattern or link to specific health conditions or states within the dataset.

**Class**:
1. Subjects' sleep duration and antibiotic use were evaluated. Healthy individuals typically slept 7-8 hours. Extended antibiotic use correlated with a higher occurrence of IBS, likely due to gut bacterial imbalances and resistant strains that can cause inflammation. Additionally, IBS was more common in women.
2. Binary logistic regression modeled the impact of certain variables on the likelihood of health_state, with *Cyanobacteriia* and *Anaerolineae* increasing disease odds, and ABY1, *Spirochaetia*, *Coriobacteriia*, and *Actinobacteria* decreasing them.
3. The dataset lacked gas-producing bacterial classes, thus their link to constipation-predominant IBS was not evaluated.

**Family**:
1. Gas producer bacteria from *Veillonellaceae* family differs significantly in healthy people and people with IBS-C
2. ML model built on Random forest algorithm can efficiently separate  subjects with and without IBS-C 
3. By using the UMAP algorithm it is possible to divide research subjects into distinct clusters, where the health status makes a significant contribution, but this factor is not the only one

**Genus**:
1. Batch Effects: Analysis revealed significant batch effects impacting taxon abundance across various research identifiers.
2. Health State Influence: Kruskal-Wallis tests showed a significant impact of Health_State on taxon abundance, with a preponderance of low p-values indicating non-random disparities.
3. Association with IBS-C: A Generalized Linear Mixed Model indicated no significant link between gas-producing bacterial presence and IBS-C
4. The utilization of Boruta-selected features in a random forest model purportedly yielded exceptional predictive accuracy for Health_State classification, as demonstrated by an AUC of 0.9986, 96.49% accuracy, and a Kappa of 0.9163. However, these metrics, notably high for biological datasets, might suggest a potential issue with the model. The extraordinary performance could erroneously imply model effectiveness when, in reality, it may be indicative of underlying problems such as batch effects. 
5. UMAP Clustering: Despite discernible clustering in UMAP analysis, the clusters lacked a clear pattern or link to specific health conditions or states within the dataset.

### Conclusion
As a result of the analysis of the Orders, it was possible to find those for which the representation in the intestinal microbiota was statistically significantly different for sick and healthy people. A model that could separate sick and healthy people based on these characteristics was trained. The presence of a connection between gas-producing bacterial Orders and constipative-type IBS could not be assessed, because such bacteria were not represented among the studied Orders.

Despite highlighting important classes, it is worth noting that the exact mechanisms of how these classes influence IBS require more research, as the higher the taxonomic level, the larger it is. Also the source data had a lot of missing values and different ways of subjects’ description were identified in the date (e.g. Age - for some patients the exact age was written, but for others there was age range). So it created difficulties while creating ML models which could indicate the direction and strength of the influence of each variable on the probability of having Health_state (Healthy/Disease). For classes there were no gas-producing bacterial classes, so the their link to IBS-C was not evaluated.

Based on the results of the analysis of Families, it was possible to find out that healthy people and patients with IBS-C also differ in the representation of bacteria of this taxon. It was possible to establish a connection between gas-producing *Veillonellaceae* family and the constipating type of IBS. A model to distinguish between healthy people and patients was built using random forest algoritm. Clustering by UMAP showed that study participants are divided into groups by a larger number of factors than healthy status only. It is difficult to say that there is a significant batch effect due to the type of source (research ID) at the family level.

Our investigation into the microbiome at the Genus level has unveiled significant insights alongside considerable analytical hurdles, notably the profound batch effects impacting taxon abundance measurements across different research identifiers. This noise could mask biological signals, suggesting that observed disparities in taxon abundance might not strictly reflect health state variations but could also stem from methodological inconsistencies. Despite initial promising results from the Boruta feature selection and the observed impact of health state on taxon abundance, the subsequent predictive modeling using a random forest approach, evidenced by an overly optimistic AUC of 0.9986, accuracy of 96.49%, and a Kappa of 0.9163, likely reflects the model's sensitivity to batch effects rather than a true biological association. This misalignment, coupled with the lack of clinically meaningful clusters in UMAP analysis, underscores the complexity of microbiome data analysis and the necessity for careful methodological considerations.

### References

[^1]: Siah KT, Wong RK, Whitehead WE. Chronic Constipation and Constipation-Predominant IBS: Separate and Distinct Disorders or a Spectrum of Disease? Gastroenterol Hepatol (N Y). 2016 Mar;12(3):171-8. PMID: 27231446; PMCID: PMC4872845.
[^2]: Saha L. Irritable bowel syndrome: pathogenesis, diagnosis, treatment, and evidence-based medicine. World J Gastroenterol. 2014 Jun 14;20(22):6759-73. doi: 10.3748/wjg.v20.i22.6759. PMID: 24944467; PMCID: PMC4051916.
[^3]: https://www.verywellhealth.com/constipation-predominant-1944883
[^4]:https://www.mayoclinic.org/diseases-conditions/irritable-bowel-syndrome/symptoms-causes/syc-20360016
[^5]: Bellini M, Gambaccini D, Usai-Satta P, De Bortoli N, Bertani L, Marchi S, Stasi C. Irritable bowel syndrome and chronic constipation: Fact and fiction. World J Gastroenterol. 2015 Oct 28;21(40):11362-70. doi: 10.3748/wjg.v21.i40.11362. PMID: 26523103; PMCID: PMC4616212.
[^6]: https://www.healthline.com/health/ibs-constipation
[^7]: Canavan C, West J, Card T. The epidemiology of irritable bowel syndrome. Clin Epidemiol. 2014 Feb 4;6:71-80. doi: 10.2147/CLEP.S40245. PMID: 24523597; PMCID: PMC3921083.
