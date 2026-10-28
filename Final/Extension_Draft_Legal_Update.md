# Extension draft: legal update and improvements (v2, checked against official texts)
Prepared 16 Oct 2026 for "Cloud Forensics Challenges in Bangladesh".

Status key: [OFFICIAL] I read the text on bdlaws.minlaw.gov.bd. [NEWS] news or tracker only. [?] not confirmed, do not state as fact.
Not a legal opinion. Ask a lawyer or your supervisor to read the legal section once.

---

## 1. Corrections to the current paper

| # | Paper says | What the official texts show | Action |
|---|-----------|------------------------------|--------|
| 1 | CSA 2023 is the current cyber law | Replaced twice. (a) Cyber Protection Ordinance 2025 (No. 25 of 2025, 21 May 2025, amended by Ord. 54 of 2025). (b) Act 81 of 2026 (সাইবার সুরক্ষা আইন, ২০২৬), which repeals both ordinances and the 2023 Act (ss. 50-51) and is deemed in force from 21 May 2025 (s. 1(2)) [OFFICIAL]. Dates: the Act page shows 10 April 2026; the NCSA list shows 16 April 2026. | Rewrite all "CSA 2023" statements. Keep 2023 only as history. |
| 2 | "Cyber Security Ordinance 2025" | The Bengali title says "Suraksha" (সুরক্ষা, protection). Sources translate it as "Cyber Security" or "Cyber Protection". | Pick one English form, add the Bengali name once, and use it everywhere. |
| 3 | PDPO 2025 is current and forces localisation on cloud operators | The Ordinance (No. 61 of 2025) was replaced by the **Personal Data Protection Act 2026 (Act 63 of 2026)** [OFFICIAL]. In the Act, s. 29(7) only lets the Authority make regulations. I searched the full text: the "one real-time copy in Bangladesh" rule and the "60-day cloud order" that the Ordinance had in s. 29(7) are **not in the Act**. | Delete the localisation claim. Say instead: the Ordinance had such a rule, the final Act dropped it. |
| 4 | "National Digital Governance Framework 2025 mandates cloud-first" | Not found. The real laws are the National Data Management Ordinance 2025 (No. 60 of 2025), replaced by the **National Data Management Act 2026 (Act 80 of 2026)** [OFFICIAL title and repeal note]. I found no "Cloud First Policy" for Bangladesh. | Remove or correct. Do not cite what you cannot show. |
| 5 | "No statutory data-hold mechanism" | Wrong as written. Act 81 s. 36: the Director General may order the person or body in charge of a computer or system to keep data for 90 days, and the Tribunal may extend to a total of 180 days [OFFICIAL]. Same limits as DSA 2018 s. 44. | Rewrite (see section 2 below). |
| 6 | Ordinance "expands Tribunal jurisdiction" | Act 81 s. 41: the Cyber Tribunal under ICT Act 2006 s. 68 has exclusive jurisdiction over offences under the Act [OFFICIAL]. That is not a large change. | Remove or soften. |
| 7 | Section 65B is "the only mechanism" and unmet for cloud logs | Evidence (Amendment) Act 2022 (Act 20 of 2022, dated 20 Nov 2022) inserted 65A and 65B through its s. 12 [OFFICIAL per bdlaws amendment page]. s. 65B(4) asks for a certificate from "a person occupying a responsible official position". The text does not say records fail without it. | Say "the practical route", not "the only bar". Cite Act 20 of 2022. |
| 8 | Nothing on admissibility in cyber law | Act 81 s. 43 says forensic evidence obtained under the Act counts as evidence even if the Evidence Act would say otherwise. Digital forensic evidence prepared in a Digital Forensic Lab must be preserved (s. 43, second half; labs in ss. 10-11). s. 44: Tribunal may seek expert opinion [OFFICIAL]. Note: the 2023 Act already had the same evidence rule (s. 56), so this is carried forward, not new. | Add (see the final paper, Section IV). |

## 2. New section: "Recent Legal Developments (2025-2026)"

Bangladesh changed its cyber and data laws quickly while this review was under way. We use the texts on the government's legal database (bdlaws) as of October 2026.

**Cyber law.** The Cyber Security Act 2023 was repealed in May 2025 by an ordinance. Parliament turned it into Act 81 of 2026 in April 2026. A short amendment (Act 99 of 2026, 1 July 2026) removed section 20 and nothing else.

Three parts of Act 81 matter for cloud evidence.
- *Preservation (s. 36).* Data can be held for 90 days, extendable to 180. The order goes to the person or body "in charge of the computer or system". It is not clear that this can reach a foreign cloud company.
- *Collection (ss. 33, 34, 38).* Investigators may collect traffic data and may ask any person or service provider for help, and the duty to assist is binding. A court warrant can cover traffic data held by a service provider.
- *Reach (s. 4).* If someone abroad commits an offence using a computer or network in Bangladesh, the offence is treated as committed in Bangladesh. This covers offences, not evidence that sits on servers abroad.

**Data protection.** Act 63 of 2026 lets organisations process data without consent to investigate an offence or follow a court order (s. 24(1)), but other duties still apply (s. 24(2)). Breaches that are likely to cause significant harm must be reported to the Authority (s. 20), with the time left to regulations. Moving large amounts of sensitive identity data abroad must be reported (s. 29(6)). A company stays responsible for a processor it hires (s. 8). The Act does not set a log-retention time and has no cloud-specific rule. [Section numbers read from the Act text; the Bengali clause numbers in the Act should be matched once more before printing.]

**Data management.** The National Data Management Act 2026 (Act 80 of 2026) sets up national data bodies. We found no forensic readiness duty in it. [Not read in full.]

**What it means for our findings.** The gap is smaller than the first draft said, but it remains. Bangladesh has a preservation power, a collection power, and a forensic-evidence rule. What it still lacks, as far as we can verify, is a clear path to freeze or obtain logs from a foreign cloud provider, a rule on how 65B certificates work for cloud records, and any minimum log-keeping time for providers. C1 and C4 stay open. C2 and C3 are partly helped by s. 43 but depend on how courts use it. C5 has no help from the data law now that the local-copy rule was dropped.

## 3. Suggested edits (simple wording)

- Abstract: change "entirely silent" to "does not clearly address". Add: "The laws changed in 2025-26, and this review reflects those changes."
- Abstract/Intro: "100 million devices" and "66.94 million users" look inconsistent. Say which is which.
- Intro: the "$1.2 billion public cloud procurement" figure needs a source or removal.
- Motivation: "disproportionately high acquittal rate" needs a number and a source.
- RQs: "pre-registered" needs a registry (OSF or PROSPERO). Otherwise say "defined before the search began".
- "The first to ..." claims: use "to our knowledge".
- Method: add a second reviewer on a sample of the 16 papers and report agreement (Cohen's kappa).
- Say "reported in" instead of "validated in" for the AI results (93% F1, 60% cost cut, 14/17 jurisdictions). They come from studies in other countries.
- Mark 2025 arXiv preprints [4][5][6][9] as not peer reviewed.
- Table II, C1 and C5: update using section 1 above.
- Typos: "policymakers.s." in the abstract, "[11].." in Motivation.

## 4. Other improvements worth the time

1. Add a **Limitations** section: one reviewer, 16 papers, English only, preprints, fast-moving law, I read law texts in Bangla through machine help.
2. Add a **legal timeline figure**: ICT Act 2006, DSA 2018, CSA 2023, Ordinance May 2025, Act 81 April 2026, Act 99 July 2026, plus Evidence Act 2022 and the data laws.
3. Add a short **comparison with India** (s. 65B case law) and say it is persuasive only.
4. Add a **checklist for investigators**: ask for preservation on day one, request a 65B certificate from the provider, record hash values, log who touched the data.
5. Add one **worked example** (fraud with logs in a foreign SaaS) walking through C1 to C5.
6. Mention **MLAT law** (Mutual Legal Assistance in Criminal Matters Act 2012, from my memory, not checked here) and that Bangladesh is not in the Budapest Convention (already in the paper).
7. Add a line on **AI risks in court**: explainability, human review, keep AI output separate from the original evidence.
8. Cite statutes from bdlaws with access dates, and add the five laws above to the reference list.

## 5. Your checklist: status after my checks

| Item | Status |
|------|--------|
| 1. Read Cyber Security Act 2026 | **Done** for ss. 1, 4, 8, 31-44, 50-51 (preservation, search, assistance, Tribunal, evidence, reach, repeal). I did not read every offence section. Act title in English is not confirmed (Bengali says Suraksha). |
| 2. Read PDPA 2026 (Act 63) | **Done** for ss. 8, 20, 24, 29. Cloud-copy rule confirmed **absent** from the Act. Commencement (s. 1(3)) was read through a summary, so recheck it. |
| 3. June 2026 amendment | **Done, and news was wrong.** The official Act 99 of 2026 (1 July 2026) only omits section 20. Reports of platform removal deadlines, BTRC user-data demands for AI content and 10-year jail terms [NEWS] are **not** in that Act. Content blocking is already in s. 8 with a 3-day Tribunal check. I could not tell what the omitted s. 20 covered. Cite the official Act, not the news. |
| 4. Date 65B was added | **Done.** Act 20 of 2022, dated 20 Nov 2022, s. 12. I read it from search results of the bdlaws pages, not the gazette itself. |
| 5. September 2026 drafts | **Not enacted** as far as I can tell. Mention as proposals or leave out. |
| 6. Lawyer review | Still yours to do. |

Still open: the exact English title of Act 81; the contents of the National Data Management Act; whether s. 36 can bind foreign cloud providers (no source says so, so argue it as an open question).

## 6. Sources

- Cyber Act 2026: [bdlaws Act 81 of 2026](http://bdlaws.minlaw.gov.bd/act-print-1710.html), [amendment Act 99 of 2026](https://bdlaws.minlaw.gov.bd/act-print-1728.html), [NCSA list of laws](https://ncsa.gov.bd/pages/static-pages/6922e12a933eb65569e2a9f5)
- Data protection: [bdlaws Act 63 of 2026](http://bdlaws.minlaw.gov.bd/act-print-1692.html), [bdlaws Ordinance 61 of 2025 (repealed)](http://bdlaws.minlaw.gov.bd/act-print-1574.html), [Digital Policy Alert on Ord. 23 of 2026](https://digitalpolicyalert.org/event/38601-president-implemented-personal-data-protection-amendment-ordinance-2026-ordinance-no-23-of-2026)
- Data management: [bdlaws Ordinance 60 of 2025 (repealed)](http://bdlaws.minlaw.gov.bd/act-print-1573.html), [Act 80 of 2026](http://bdlaws.minlaw.gov.bd/act-details-1709.html), [BSS](https://www.bssnews.net/news-flash/330104)
- Evidence: [Evidence Act 1872 on bdlaws](http://bdlaws.minlaw.gov.bd/act-print-24.html), [Evidence (Amendment) Act 2022](http://bdlaws.minlaw.gov.bd/act-details-1416.html), [Dhaka Law Review](https://www.dhakalawreview.org/blog/2022/12/evidence-amendment-act-2022-an-experts-view-6169)
- DSA 2018 preservation (history): [UNODC fiche](https://sherloc.unodc.org/cld/uploads/pdf/El%20Evidence%20Hub/SOUTH_ASIA/eEvidence_Country_Fiche_BANGLADESH.pdf)
- News on 2026 amendment reports (not matching the official amendment): [Dhaka Tribune](https://www.dhakatribune.com/bangladesh/parliament/414016/cyber-security-amendment-bill-2026-passes-in)
