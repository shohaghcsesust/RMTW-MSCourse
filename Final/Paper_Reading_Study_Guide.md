# RMTW Paper Reading – Study Guide (4 Papers, 60 Q&A)

Each paper is answered **only from its own source**. Page references are the page numbers printed in each PDF.

| # | Paper | File |
|---|---|---|
| 1 | Zaman et al. (2025), *Efficacy of using a digital health intervention model using community health workers for primary health services in Bangladesh: a repeated cross-sectional observational study*, BMC Public Health 25:1833 | IGP BMC Primary Health.pdf |
| 2 | Ahamed et al. (2026), *SuSastho.AI: A multimodal medical copilot for adolescents using evidence-based medicine and large language models*, Informatics in Medicine Unlocked 60:101720 | SUSASTHO-AI 2025.pdf |
| 3 | Faruque et al. (2019), *Feasibility of Digital Health Services for Educating the Community People Regarding Lifestyle Modification Combating Noncommunicable Diseases*, HCII 2019, LNCS 11587, pp. 333–345 | 2019-CMED-Digital Health Services NCD.pdf |
| 4 | Reza, Hassan & Mamun (2026), *A Pathway to Carbon-Neutral Healthcare: Exploring the Potential of Rooftop Solar Net Metering and Carbon Credits for Rural Medical Facilities in Bangladesh*, IET Renewable Power Generation 20:e70263 | IET Renewable Power Gen - 2026 - Reza….pdf |

> Note: the exam-paper titles (swallowing accelerometry; digital marriage platform; "CMED: Cloud based medical system framework") are not among these four files. Paper 3 is the 2019 CMED *feasibility* paper, not the 2016 cloud-framework paper.

---

# PART A – 60 QUESTIONS AND ANSWERS

## Paper 1: Efficacy of using a digital health intervention model using community health workers for primary health services in Bangladesh (Zaman et al., 2025)

**Q1. What is the actual problem this paper addresses?**
Answer: Rural Bangladesh lacks adequate primary healthcare because of a shortage of professionals, poor health-seeking behaviour (people go to pharmacists or religious healers) and low health awareness. Meanwhile NCDs cause about 67% of deaths in Bangladesh, so patients present late with advanced disease. (Introduction, p. 2)

**Q2. What research gap does it address?**
Answer: Most digital health services (telemedicine, online consultation) are available mainly in urban areas, and rural people's access to them had not been assessed. An earlier feasibility study (Faruque et al.) covered only usability and efficacy. This paper evaluates real health outcomes of the model over 18 months. (p. 2)

**Q3. State the goal of the paper in one sentence.**
Answer: To evaluate the effectiveness of a digital health intervention model, delivered by community health workers (CHWs) with a smart health kit and AI-based app, by observing health outcomes in a rural Bangladeshi area at six-month intervals over 18 months. (Abstract, p. 1)

**Q4. What are the main objectives?**
Answer: (1) Describe the vital health measurements of the served population. (2) Identify NCD risk factors using multivariate logistic regression. (3) Compare health outcomes across three consecutive six-month periods to judge effectiveness. The paper also aims to show scalability towards universal health coverage through public-private partnership. (pp. 1–2, 12)

**Q5. What is the intervention model and how does it work?**
Answer: Bottom-up model: one CHW (called a Health Assistant) per 500 households, 14 CHWs for 7,090 households, visits each household monthly. They measure vitals with a smart health kit and record them in the "Enriched Sastho" app. An AI-based clinical decision support system (CDSS) assesses risk, and patients get digital referrals to medical assistants or GP doctors. (pp. 3, Fig. 1)

**Q6. What study design and methodology are used?**
Answer: A repeated cross-sectional observational design. A baseline assessment (with KIIs and FGDs) was followed by follow-up every six months. The data were split into three periods (Jul–Dec 2018, Jan–Jun 2019, Jul–Dec 2019), and only each person's latest measurement in a period was used. (pp. 2–3, 5)

**Q7. How many participants and what data were used?**
Answer: The model served 32,581 people from 7,090 households in Somvag Union (1 July 2018 – 31 December 2019). Measurements analysed were BMI (14,670), BP (15,549), blood glucose (1,775) and MUAC (1,009). (pp. 3, 5)

**Q8. Where does the data come from and why was it used?**
Answer: It is real operational data from the CMED/PKSF pilot: CHWs collected demographic, health, nutrition and economic variables (Table 1) with the smart kit and app. The data were stored on AWS, moved to MySQL and analysed in Python (Google Colab). It was used because it reflects actual field delivery and allows before/after comparison. (pp. 3–5)

**Q9. What statistical analysis is performed?**
Answer: Descriptive statistics with 95% CIs; multivariate logistic regression (odds ratios) for risk factors; normality testing (D'Agostino–Pearson), then Student's/Welch's t-test or Wilcoxon signed-rank test; and a two-proportion z-test for category percentages across periods (p < 0.05). (p. 5)

**Q10. Is the analysis quantitative or qualitative?**
Answer: Mainly quantitative (proportions, odds ratios, hypothesis tests). KIIs and FGDs were also conducted and the discussion cites FGD findings as support, so qualitative data play a supporting role. (pp. 3, 5, 10)

**Q11. What are the main descriptive results?**
Answer: 21.76% were overweight, 8.18% had prehypertension, 16.45% had high blood glucose and 11% of children under seven were malnourished (MUAC). Among adults measured, about 59.7% were women, because visits happened during the day when men were at work. (Abstract; Results, pp. 5–6, 11)

**Q12. What did the risk-factor analysis find?**
Answer: Age over 40 was strongly associated with hypertension (OR 13.56) and diabetes (OR 3.96). CVD was associated with hypertension (OR 12.50), stroke with CVD (OR 8.12), and hypertension with diabetes (OR 7.16). (Table 4, pp. 6–8)

**Q13. What did the three-period comparison show about effectiveness?**
Answer: Normal BMI and normal BP increased, and underweight and prehypertension decreased. Systolic BP fell (p < 0.006) and diastolic BP rose (p < 0.001) between periods 1 and 3, and the proportion of nourished children increased. Blood glucose did not improve, because many people declined the paid test and later participants were mostly confirmed diabetics. (pp. 6–10)

**Q14. What are the real-world impacts and recommendations?**
Answer: The model showed that AI decision support with CHW-led screening can improve early detection and management of NCDs in rural areas. The authors say it could be self-sustaining at about one dollar per family per month. They recommend scaling through public-private partnership, government adoption and subsidies to move towards universal health coverage. (pp. 11–12)

**Q15. What are the limitations?**
Answer: Only one rural union was studied, so results may not generalise. Data were gender-imbalanced, disease history was self-reported, and repeated measurements may cause selection bias. Follow-up and retention were low, and the referral rate could not be retrieved because of server issues. (p. 12)

---

## Paper 2: SuSastho.AI – A multimodal medical copilot for adolescents using evidence-based medicine and large language models (Ahamed et al., 2026)

**Q1. What is the actual problem?**
Answer: Bangladeshi adolescents have poor access to reliable sexual, reproductive and mental health (SRMH) information. 63% lack SRH services and only 13% receive mental health support, because of stigma, poverty and limited services. Standard LLMs are also unsafe for this use because they hallucinate and give outdated information. (Abstract; Intro, pp. 1–2)

**Q2. What research gap does it address?**
Answer: Earlier adolescent chatbots (AdolescentBot, SnehAI) relied on predefined questions or rules and could not give personalised answers or voice interaction. ChatDoctor was prone to hallucination with no safety mechanism. There was no evidence-based, voice-enabled Bengali copilot for adolescent SRMH. (p. 2)

**Q3. State the goal and purpose in one sentence.**
Answer: To build SuSastho.AI, an evidence-based, voice- and text-enabled LLM copilot that gives accurate, culturally sensitive SRMH information to Bangladeshi adolescents while reducing hallucination and bias. (Abstract; p. 2)

**Q4. What is the overall method?**
Answer: It combines Evidence-Based Medicine (EBM), retrieval-augmented generation (RAG) over a clinically validated knowledge base, and chain-of-thought (CoT) prompting. A fine-tuned Llama 3 8B Instruct model does the reasoning and generation. (Sections 2.1–2.3, 2.5)

**Q5. How is the response generated step by step?**
Answer: An EBM protocol formulates a clinical question, finds the best evidence, assesses it for validity and relevance, then applies it. This is implemented as two CoT tasks. Task-QG generates English and Bengali search queries from the current and previous user queries. Task-AG evaluates the retrieved documents, scores relevance, drafts an English answer and gives the final Bengali answer. If no relevant document is found, the system refuses to answer. (Sections 2.2–2.3, p. 3)

**Q6. What knowledge-base data is used and where does it come from?**
Answer: The knowledge base has 2063 medical documents across 20 SRMH categories. Sources include Bangladesh Ministry of Health guidelines, national NGO materials, peer-reviewed South Asian literature, and WHO/UNICEF documents. Two clinician teams reviewed it, with a third resolving disagreements. (Section 2.4, p. 3)

**Q7. What training dataset was created and why?**
Answer: 8,614 training examples (5,396 Task-QG and 3,218 Task-AG), written by clinical experts using FGD insights. They reflect adolescent slang, indirect phrasing and Banglish (Bengali in English letters), so the LLM can extract the clinical intent from adolescent-style queries. The LLM was fine-tuned on this dataset. (Section 2.4, p. 3)

**Q8. What is the system architecture, and how was the model chosen?**
Answer: A Spring Boot backend with a monitoring dashboard, a Flutter app (mobile and web), Wave2Vec with an N-gram model for speech recognition, VITS for speech synthesis, and Multilingual E5 embeddings for retrieval. The model path went from RASA/Chatterbot, to Bloom (unsafe answers), to Llama 3 8B Instruct, which had better Bengali comprehension. (Sections 2.5–2.6, pp. 3–5)

**Q9. How is the system evaluated?**
Answer: By human evaluation, because BLEU/ROUGE/METEOR cannot capture medical meaning. SRMH experts scored accuracy, factual consistency and relevance with a checklist, using two evaluators plus a third for disagreements. A correct refusal (when the KB lacks the answer) counted as correct. Baselines were RAG + Llama 3 8B + validated KB and plain Llama 3 8B (default weights). (Section 2.7, pp. 5–6)

**Q10. What participants and data were used in the pilot study?**
Answer: 32 participants (81.3% male, age 23–55, mean 29.5) who were adolescent health professionals and quality-assurance experts; adolescents were excluded for safety. They asked 428 questions, of which 199 were explicitly covered by the KB, 75 partly covered, 121 not covered and 33 were greetings or statements. (Section 3.1, p. 6)

**Q11. Is the analysis quantitative or qualitative?**
Answer: Mixed. Quantitative: accuracy percentages and category-wise results, and Likert-type usability ratings. Qualitative: expert comparison of answer quality across methods (Section 3.4) and a custom usability questionnaire. (Sections 3.1–3.5, pp. 6–9)

**Q12. What are the main results of the evaluation?**
Answer: Evaluated against KB availability, SuSastho.AI gave 86.68% correct, 2.57% partially correct and 10.75% incorrect answers. It answered correctly most often when the KB held explicit information (91.3%). It refused correctly when information was absent from the KB. (Table 1, p. 7)

**Q13. How does it compare with the baselines?**
Answer: On the same 428 questions, SuSastho.AI had 61.9% correctness versus 40.4% for RAG and 45.8% for Llama 3. It had 8.6% incorrect answers versus 12.9% and 35.5%. It reduced incorrect responses by 26.9% and raised correct ones by 16.1% against the baseline Llama 3 (as stated in the abstract and Section 3.3). (Section 3.3, p. 8)

**Q14. What do users say, and what is the societal impact?**
Answer: 87.5% agreed or strongly agreed that answers were what they were looking for, 90.7% found them relevant and 96.9% found them useful. Overall satisfaction was 84.4%. The tool could democratise validated health information for adolescents (including slum, street and refugee youth) and complement government programmes such as AFHS. (Sections 3.5, 4.3, pp. 8–12)

**Q15. What are the limitations and future work?**
Answer: Small sample and human evaluation by a few experts; no adolescents tested yet; weak handling of Banglish, ambiguous queries and greetings; and occasional irrelevant or fabricated content. Future work includes a risk-detection system, a symptom checker, RLHF/DPO and larger models. The authors note the cost advantage of Llama 3 8B ($0.2 vs $30 per million tokens for GPT-4). (Sections 4.1, 4.4, pp. 10–12)

---

## Paper 3: Feasibility of Digital Health Services for Educating the Community People Regarding Lifestyle Modification Combating NCDs (Faruque et al., 2019)

**Q1. What is the actual problem?**
Answer: NCDs cause about 67% of deaths in Bangladesh, but people do not know their health status. Healthcare is mostly curative and out-of-pocket, with only about 10% of health spending on prevention, and rural areas have little service reach. Preventive care and lifestyle change could avoid up to 90% of strokes, 80% of heart attacks and 73% of diabetes cases. (Introduction, pp. 335–336; Discussion, pp. 342–343)

**Q2. What research gap does it address?**
Answer: Commercial health apps grow much faster than academic research, so little evidence exists on the usability and efficacy of commercially available apps. This paper assesses a commercially launched platform, CMED Health, in a rural public-health setting. (Abstract; p. 334)

**Q3. State the goal in one sentence.**
Answer: To assess the content, usability and efficacy of the CMED digital healthcare platform, and its feasibility for preventing major NCDs (CVD, hypertension, diabetes) and improving primary healthcare in rural Bangladesh. (Abstract; p. 336)

**Q4. What is the CMED platform being evaluated?**
Answer: An IoT-enabled, AI-driven, cloud-based preventive and primary healthcare platform. Portable smart devices measure BP, blood glucose, pulse, SpO2, temperature, weight, height and BMI. A mobile app with a clinical decision support system (CDSS) gives instant feedback and a dashboard shows aggregated data and health-worker performance. (Figs. 1–3, pp. 335–337)

**Q5. What research methodology is used?**
Answer: Action Research Methodology, using a triangulation of quantitative methods, qualitative methods and participant observation. (Section 2, p. 337)

**Q6. What four things were evaluated, and how?**
Answer: (a) Content: CDSS cut-offs checked against the National Protocol on Diabetes and Hypertension. (b) Health advice validated by a policy-level expert workshop. (c) Usability tested in the field with providers and managers. (d) Efficacy tested by comparing app measurements with manual methods during a 6-month pilot. (Section 2, pp. 337–338)

**Q7. Who and how many participated, and where?**
Answer: The pilot covered more than 32,000 people in about 7,000 households in 21 villages of Dhamrai upazila (July–December 2019). A semi-structured questionnaire was given to 393 service receivers, plus key informant interviews and four focus group discussions (two with providers, two with receivers). (Section 2, p. 338)

**Q8. What data were collected and from whom?**
Answer: Quantitative and qualitative data came from four groups: rural health service providers, senior management staff, village opinion leaders and service receivers. FGDs were recorded and transcribed. Service-delivery data covered 17,907 of 32,122 adults screened, with BP 36,326, glucose 1,348, BMI 34,721, SpO2 38,400 and MUAC 1,229 measurements. (Section 2, pp. 338–339; Table 1)

**Q9. Is the analysis quantitative or qualitative?**
Answer: Mixed. Quantitative: survey percentages and service counts. Qualitative: KIIs and FGD speech-mark findings. The source reports only descriptive percentages and no inferential statistical tests. (Sections 2–3, pp. 337–342)

**Q10. How accepted was the platform?**
Answer: About 99.5% of survey respondents were satisfied, and most preferred it to the manual method. Reasons: it looked digital and smart (27.3%), results shown instantly (14.7%), comparison with previous records (14.4%) and instant advice (about 13%). All respondents said it suits community-level service. (Section 3.1, pp. 339–340)

**Q11. What did it show about detecting disease?**
Answer: Only 2.7% of the population knew they had diabetes, but 15.8% were found diabetic after blood glucose measurement. Similarly, 6.5% knew they were hypertensive, but 11.5% were identified as hypertensive after screening. (Usability of the App, p. 341)

**Q12. What did the qualitative findings reveal?**
Answer: Health workers said BMI monitoring became easy, advice was clearer, villagers trusted them more, and devices were over 90% accurate. Villagers said seeing results on screen with instant advice built trust, and past records helped doctor visits. Some started walking after seeing their weight. (Section 3.2, pp. 341–342)

**Q13. What advantages for feasibility did the authors list?**
Answer: Managers can supervise workers and find gaps; data support later research; dashboards give policymakers an overview; recording and collection happen together; the app works offline in areas with poor internet; worker workload fell; and community awareness rose through instant CDSS advice. (Discussion, p. 343)

**Q14. What is the real-world and social impact?**
Answer: It raised health awareness, led some villagers to change lifestyle, and identified undiagnosed diabetes and hypertension early at low cost at the doorstep. The authors conclude the model is feasible as a primary prevention approach for low-resource settings. The data could also be used to design targeted interventions and insurance policies. (Sections 3–5, pp. 341–344)

**Q15. What are the limitations?**
Answer: The study was too short to measure actual behaviour change. The survey respondents were 92.1% female because interviews were done in the daytime when men were at work. The source does not provide inferential statistical tests or the efficacy comparison figures against the manual devices. (Sections 3.1, 4, pp. 339, 343)

---

## Paper 4: A Pathway to Carbon-Neutral Healthcare – Rooftop Solar Net Metering and Carbon Credits for Rural Medical Facilities in Bangladesh (Reza, Hassan & Mamun, 2026)

**Q1. What is the actual problem?**
Answer: Rural healthcare facilities in Bangladesh face an unreliable electricity supply and frequent power cuts, while the country relies heavily on fossil fuel (renewables are only 4.98% of installed capacity). Reliable clean power is needed for clinical equipment, video consultations and essential services. (Introduction, pp. 1–2)

**Q2. What research gap does it address?**
Answer: Few net-metering studies exist in Bangladesh, and they mostly look at a single building. None had analysed the collective techno-economic impact on the rural healthcare sector, or included carbon credit sales in the cost-benefit analysis. The 2025 Net Metering Guideline also leaves key financial and operational issues unresolved. (p. 2)

**Q3. State the goal and the objectives.**
Answer: Goal: to assess the feasibility of rooftop solar net metering for rural healthcare facilities. Objectives: (1) a techno-economic feasibility assessment; (2) model the financial impact of carbon credit revenue; (3) propose amendments to the 2025 Net Metering Guidelines. (Abstract; p. 2)

**Q4. What methodology is used?**
Answer: A feasibility study with cost-benefit analysis in ten steps: collect rooftop area, solar irradiance, panel azimuth, sanctioned load and monthly consumption; size the system under the SREDA guideline; cost-benefit analysis; add carbon credit revenue by CAGR; verify generation with the SREDA calculator; then sensitivity analysis. (Section 4, Fig. 6, p. 9)

**Q5. What data were used and where did they come from?**
Answer: Data from 50 real facilities (Union Health and Family Welfare Centres, 10-bed and 20-bed hospitals), collected from utility offices. Data were rooftop area, location, monthly energy consumption and sanctioned load. An average irradiance of 4.59 kWh/m²/day was used. (Section 4.1, pp. 9–10)

**Q6. How was the system sized?**
Answer: The 5,424 union-level facilities were aggregated into one unit with about 70,799 m² of usable roof space and a total sanctioned load of 9.30 MW. Using 9 m² per kWp and 70% of the sanctioned load (for weak rural grids) gave 7.86 MWp (AC). The SREDA net-metering calculator performed the sizing. (Sections 4.2, 5, pp. 10–11)

**Q7. How are energy and CO₂ reduction calculated?**
Answer: Energy uses an average AC output of 1,200 kWh/kWp/year with panel degradation from 99% (year 1) to 83% (year 20). CO₂ reduction equals annual energy multiplied by the grid emission factor of 484 gCO₂/kWh. (Sections 4.3–4.4, p. 11)

**Q8. How are carbon credits modelled?**
Answer: Revenue equals annual CO₂ reduction multiplied by unit price, starting at US$5 per credit, with price growth (CAGR) scenarios of 1.5%, 3% and 5%, plus 0%, −10%, −25% and −50%. This accounts for carbon market volatility. (Sections 4.5, 5.4, pp. 11, 13)

**Q9. What cost parameters and evaluation metrics are used?**
Answer: Cost: about US$286.88 per kWp, 2% annual maintenance, 0.5% insurance, 25% inverter replacement in year 11, a 20-year life, and a 2.5% discount rate. Metrics: NPV, IRR, payback period and LCOE, plus a sensitivity analysis on carbon credit price. (Sections 4.6, 5.1, Table 7, pp. 11–12)

**Q10. Is the analysis quantitative or qualitative?**
Answer: Mainly quantitative (techno-economic cost-benefit and sensitivity analysis). It also includes a qualitative policy review comparing the 2018 and 2025 Net Metering Guidelines and a literature review. (Sections 2.11, 3, 5, pp. 7–8, 11–17)

**Q11. What are the main techno-economic results?**
Answer: Present-value project cost is about US$3.59 million (initial investment US$2.25 million). Over 20 years it generates 171.48 GWh and avoids about 82,999 tonnes of CO₂ (the paper writes "MT"). Energy revenue is about US$6.94 million, whereas buying the same power from the grid would cost about US$9.9 million. (Section 5, Table 8, pp. 12–13)

**Q12. What did adding carbon credits contribute?**
Answer: Carbon credit revenue is US$0.379M, US$0.434M and US$0.523M at 1.5%, 3% and 5% CAGR. Combined with energy, total revenue is US$7.319M, US$7.374M and US$7.463M respectively. The authors call this revenue non-guaranteed, because the market is volatile. (Section 5.4, pp. 13–14)

**Q13. What do NPV, IRR, payback and LCOE show, and does viability depend on carbon prices?**
Answer: At 5% CAGR: NPV US$3.86M, IRR 9.85%, payback 8.35 years, LCOE US$0.0179/kWh. At 1.5% CAGR: US$3.72M, 9.46%, 8.55 years, US$0.0187. Even at −50% CAGR, NPV is US$3.38M, IRR 7.83% and LCOE US$0.0207, versus the current tariff of US$0.0358. So the project stays viable without relying on carbon credits. (Table 9, pp. 15–17)

**Q14. What policy findings and recommendations does the paper make?**
Answer: The 2025 guideline allows three-phase consumers, removes the 10 MW cap and permits up to 100% of sanctioned load. It still leaves OPEX-model issues unresolved: limited consumer control, billing and payment disputes, and limits on selling excess power. Recommendations: prosumer incentives, tax and wheeling-charge exemptions, installer training, and carbon-credit trading facilities for prosumers. (Section 2.11, Table 4, Section 7, pp. 7–8, 18)

**Q15. What are the real-world impacts and limitations?**
Answer: Impact: cheaper, cleaner power for rural clinics, lower grid dependence and an estimated 40,656 carbon credits per year nationally. Limitations: no battery storage (so it cannot run during outages), 5,424 facilities aggregated into one system (so site-level results may differ), and a conservative 70% sizing instead of the 100% now allowed. (Sections 2.7, 6, 8, pp. 6, 17–19)

---

# PART B – ANSWER KEY (quick revision)

### Paper 1 — Answer Key
1. Problem: weak rural primary care, low awareness, NCDs ≈ 67% of deaths.
2. Gap: rural access to digital health not assessed; no outcome evaluation.
3. Goal: evaluate effectiveness of CHW + smart kit + AI app model over 18 months.
4. Objectives: describe vitals; find risk factors; compare 3 periods.
5. Model: 14 CHWs / 7,090 households, Enriched Sastho app, AI CDSS, referral to MA/GP.
6. Design: repeated cross-sectional; 3 six-month periods; latest measurement used.
7. Participants: 32,581 people, 7,090 households, Somvag Union.
8. Data: CHW smart-kit data on AWS, MySQL, Python.
9. Stats: CIs, logistic regression, t/Wilcoxon, two-proportion z-test.
10. Type: mainly quantitative; FGD/KII supportive.
11. Results: 21.76% overweight, 8.18% prehypertension, 16.45% high glucose, 11% malnourished.
12. Risk: age > 40 → HTN OR 13.56, diabetes OR 3.96; CVD–HTN OR 12.50.
13. Effectiveness: BMI, BP, MUAC improved; glucose did not.
14. Impact: PPP scaling, ~US$1/family/month, towards UHC.
15. Limits: one union, gender imbalance, self-reported, low retention, missing referral data.

### Paper 2 — Answer Key
1. Problem: 63% lack SRH services, 13% mental health support; LLM hallucination.
2. Gap: earlier bots rule-based, no voice or personalisation.
3. Goal: evidence-based Bengali voice/text copilot for adolescents.
4. Method: EBM + RAG + CoT + fine-tuned Llama 3 8B.
5. Steps: formulate question → find → assess → apply (Task-QG, Task-AG).
6. KB: 2,063 documents, 20 SRMH categories, two-layer clinician review.
7. Training data: 8,614 examples (5,396 QG + 3,218 AG), slang and Banglish.
8. Architecture: Spring Boot, Flutter, Wave2Vec ASR, VITS TTS, Multilingual E5.
9. Evaluation: human experts, 2+1 evaluators; baselines RAG and Llama 3.
10. Pilot: 32 professionals, 428 questions.
11. Type: mixed.
12. Result: 86.68% correct, 2.57% partial, 10.75% incorrect.
13. Comparison: 61.9% vs RAG 40.4% vs Llama 3 45.8%.
14. Users: 87.5% found answers; 90.7% relevant; 96.9% useful; societal impact.
15. Limits: small sample, Banglish, no adolescents yet; future RLHF/DPO.

### Paper 3 — Answer Key
1. Problem: NCDs 67% of deaths; unaware public; curative focus.
2. Gap: little evidence on commercial app usability/efficacy.
3. Goal: assess content, usability, efficacy and feasibility of CMED.
4. Platform: IoT + AI + cloud + app + CDSS + dashboard.
5. Method: Action Research; quantitative + qualitative + observation.
6. Evaluated: content, advice validation, usability, efficacy vs manual.
7. Participants: 32,000+ people, ~7,000 households, 21 villages, 393 surveyed, 4 FGDs.
8. Data: four stakeholder groups; 17,907 adults screened.
9. Type: mixed, descriptive.
10. Acceptance: 99.5% satisfied.
11. Detection: diabetes 2.7% known vs 15.8% found; hypertension 6.5% vs 11.5%.
12. Qualitative: trust, easy BMI, lifestyle change.
13. Advantages: supervision, offline, dashboards, less workload.
14. Impact: awareness, lifestyle modification, early detection, feasible primary prevention.
15. Limits: short study, 92.1% female respondents, no inferential tests.

### Paper 4 — Answer Key
1. Problem: unreliable rural clinic power; fossil dependence.
2. Gap: no rural-healthcare NMS study with carbon credits.
3. Objectives: feasibility, carbon credit impact, policy amendments.
4. Method: 10-step cost-benefit analysis with SREDA calculator.
5. Data: 50 facilities; 4.59 kWh/m²/day.
6. Sizing: 70,799 m², 9.30 MW load, 7.86 MWp (70% rule).
7. Calc: 1,200 kWh/kWp/yr; degradation 99%→83%; GEF 484 g/kWh.
8. Carbon: US$5 base, CAGR 1.5/3/5/0/−10/−25/−50%.
9. Metrics: NPV, IRR, payback, LCOE, sensitivity.
10. Type: quantitative + policy review.
11. Results: cost US$3.59M; 171.48 GWh; ~82,999 t CO₂; energy revenue US$6.94M vs US$9.9M grid bill.
12. Carbon revenue: US$0.379/0.434/0.523M.
13. At 5%: NPV US$3.86M, IRR 9.85%, payback 8.35 yrs, LCOE US$0.0179; viable even at −50%.
14. Policy: 2025 guideline gaps (OPEX issues); incentives, training, carbon trading.
15. Impact/limits: clean rural power; no battery, aggregated model, 70% sizing.

---

# PART C – FOUR-PAPER COMPARISON

| Aspect | Paper 1 (BMC 2025) | Paper 2 (SuSastho.AI) | Paper 3 (CMED 2019) | Paper 4 (Solar NMS) |
|---|---|---|---|---|
| Problem | Weak rural primary care, NCD burden | Adolescents lack reliable SRMH info; LLM hallucination | Unaware public, NCDs, preventive care gap | Unreliable rural clinic electricity; fossil dependence |
| Objective | Evaluate effectiveness of CHW + AI digital model | Build evidence-based Bengali medical copilot | Assess content, usability, efficacy, feasibility of CMED | Feasibility of rooftop solar NMS + carbon credit revenue + policy recommendations |
| Dataset/Data | 32,581 people, 7,090 households, 18 months | KB of 2,063 documents; 8,614 training examples; 428 pilot questions (32 participants) | 32,000+ people, ~7,000 households; 393 surveyed; 4 FGDs | 50 real facilities; scaled to 5,424 facilities |
| Methodology | Repeated cross-sectional observational study | EBM + RAG + CoT, fine-tuned Llama 3 8B | Action Research (triangulation) | Techno-economic cost-benefit and sensitivity analysis |
| Analysis Type | Mainly quantitative (+ FGD/KII support) | Mixed (accuracy + qualitative + questionnaire) | Mixed (descriptive) | Quantitative + policy review |
| Proposed Solution | CHWs + smart kit + Enriched Sastho + AI CDSS + GP referral | SuSastho.AI voice/text copilot | CMED IoT-AI-cloud platform | Rooftop solar net metering with carbon credits |
| Evaluation | Odds ratios, t/Wilcoxon, two-proportion z-test across 3 periods | Expert human grading; baselines RAG and Llama 3; usability survey | Content check, usability test, efficacy vs manual, survey, FGDs | NPV, IRR, payback, LCOE, CAGR sensitivity |
| Main Results | BMI, BP, MUAC improved; glucose did not; age > 40 key risk | 86.68% correct; 61.9% vs 40.4% RAG vs 45.8% Llama 3 | 99.5% satisfied; undiagnosed diabetes 15.8% vs 2.7% known | NPV US$3.38–3.86M; IRR 7.83–9.85%; LCOE US$0.0179–0.0207/kWh |
| Impact/Application | Scale via PPP towards UHC | Adolescent SRMH access; deployable low-cost tool | Primary prevention model for low-resource areas | Cleaner, cheaper rural clinic power; net-metering policy input |

---

# PART D – GLOSSARY

### Paper 1
- **Term: CHW (Community Health Worker)** — Definition: A trained local worker (called Health Assistant here) who visits households monthly to measure vitals and give health education.
- **Term: Enriched Sastho** — Definition: The mobile app used by CHWs to store patient profiles and run AI-based risk assessment.
- **Term: CDSS** — Definition: Clinical Decision Support System that assesses health risk and guides referral.
- **Term: Smart health kit** — Definition: Set of analogue and IoT devices measuring height, weight, temperature, SpO₂, BP, glucose and ECG.
- **Term: MUAC** — Definition: Mid-upper arm circumference, used to assess child malnutrition (children under seven here).
- **Term: Repeated cross-sectional study** — Definition: Design that measures a population at several time points without necessarily the same individuals.
- **Term: Odds ratio (OR)** — Definition: Measure of association between a risk factor and a disease from logistic regression.
- **Term: Two-proportion z-test** — Definition: Test used to compare percentages of a category between two periods.
- **Term: Wilcoxon signed-rank test** — Definition: Non-parametric test used to compare non-normal measurements.
- **Term: UHC** — Definition: Universal Health Coverage, the policy goal the model supports.

### Paper 2
- **Term: SRMH** — Definition: Sexual, reproductive and mental health, the target domain.
- **Term: EBM (Evidence-Based Medicine)** — Definition: Using the best available research evidence to guide clinical decisions.
- **Term: RAG** — Definition: Retrieval-augmented generation, where retrieved documents ground the LLM's answer.
- **Term: CoT prompting** — Definition: Chain-of-thought prompting that makes the LLM reason in explicit intermediate steps.
- **Term: Task-QG / Task-AG** — Definition: The two CoT tasks: search-query generation and answer generation.
- **Term: Llama 3 8B Instruct** — Definition: The fine-tuned core language model of the copilot.
- **Term: Multilingual E5** — Definition: Embedding model used for semantic document retrieval, effective in Bengali.
- **Term: Knowledge Base (KB)** — Definition: The 2,063 clinically validated documents used for retrieval.
- **Term: Banglish** — Definition: Bengali written in English letters, a known weak area.
- **Term: Hallucination** — Definition: LLM output that sounds plausible but is false.

### Paper 3
- **Term: CMED Health Platform** — Definition: IoT-enabled, AI-driven, cloud-based preventive and primary care platform.
- **Term: mHealth** — Definition: Use of mobile technology to improve health.
- **Term: NCD** — Definition: Non-communicable disease such as hypertension, diabetes and CVD.
- **Term: Action Research** — Definition: A cyclical, participatory method of acting and evaluating in the real setting.
- **Term: Triangulation** — Definition: Combining quantitative, qualitative and observation methods.
- **Term: KII** — Definition: Key Informant Interview.
- **Term: FGD** — Definition: Focus Group Discussion.
- **Term: Usability testing** — Definition: Testing how well the app works for its intended users in the field.
- **Term: Efficacy testing** — Definition: Comparing app and device measurements with manual methods over the pilot.

### Paper 4
- **Term: Net Metering System (NMS)** — Definition: Billing setup where solar generation is offset against consumption, with excess exported to the grid.
- **Term: kWp / MWp** — Definition: Peak power rating of a solar installation.
- **Term: Sanctioned load** — Definition: The electrical load approved for a consumer connection, used to cap system size.
- **Term: NPV** — Definition: Net present value, the discounted sum of project cash flows.
- **Term: IRR** — Definition: Internal rate of return, the discount rate at which NPV is zero.
- **Term: LCOE** — Definition: Levelised cost of electricity, lifetime cost per kWh generated.
- **Term: Payback period** — Definition: Time needed to recover the initial investment.
- **Term: Grid Emission Factor (GEF)** — Definition: gCO₂ per kWh of grid electricity displaced; 484 g/kWh here.
- **Term: Carbon credit / CER** — Definition: A tradable unit equal to one tonne of CO₂ reduced; CERs are issued under the CDM.
- **Term: CAGR** — Definition: Compound annual growth rate, used here for assumed carbon price growth.
- **Term: CAPEX / OPEX model** — Definition: Consumer-owned (CAPEX) versus investor-owned, pay-per-energy (OPEX) financing.
