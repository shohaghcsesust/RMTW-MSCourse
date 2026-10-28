$ErrorActionPreference = "Stop"
$dir = "D:\Personal\MSCSE\CSE 6093 RMTW\MID"
$srcPath = "$dir\RMTW_FINAL_cloud_forensics_report.docx"
$dstPath = "$dir\RMTW_FINAL_cloud_forensics_report_IEEE.docx"
Copy-Item -Path $srcPath -Destination $dstPath -Force

$word = New-Object -ComObject Word.Application
$word.Visible = $false
try {
    $doc = $word.Documents.Open($dstPath, $false, $false)

    function Find-ParaContaining($anchor) {
        $rng = $doc.Content.Duplicate
        $rng.Find.ClearFormatting()
        $ok = $rng.Find.Execute($anchor)
        if (-not $ok) { throw "Anchor not found: $anchor" }
        return $rng.Paragraphs.First
    }

    function Set-SectionMargins($sec) {
        $sec.PageSetup.LeftMargin = 45
        $sec.PageSetup.RightMargin = 45
        $sec.PageSetup.TopMargin = 54
        $sec.PageSetup.BottomMargin = 72
    }

    # ---------- Section 1: title block stays 1 column, just fix margins ----------
    Set-SectionMargins $doc.Sections.Item(1)

    # ---------- Break #1: before "Abstract" -> start 2-column body ----------
    $p = Find-ParaContaining "Abstract"
    $doc.Range($p.Range.Start, $p.Range.Start).InsertBreak(3)  # wdSectionBreakContinuous
    $secBody1 = $doc.Sections.Last
    Set-SectionMargins $secBody1
    $secBody1.PageSetup.TextColumns.SetCount(2)
    $secBody1.PageSetup.TextColumns.Spacing = 14.4
    Write-Output ("After break #1, section count = " + $doc.Sections.Count)

    # ---------- Break #2/#3: sandwich Table I before 'III. METHODOLOGY' ----------
    $p = Find-ParaContaining "III. METHODOLOGY"
    $doc.Range($p.Range.Start, $p.Range.Start).InsertBreak(3)
    $secTableI = $doc.Sections.Last
    Set-SectionMargins $secTableI
    $secTableI.PageSetup.TextColumns.SetCount(1)
    Write-Output ("After break #2, section count = " + $doc.Sections.Count)

    # Insert Table I caption + table at the start of this new 1-col section
    $p = Find-ParaContaining "III. METHODOLOGY"
    $insPt = $doc.Range($p.Range.Start, $p.Range.Start)
    $insPt.InsertBefore("TABLE I. COMPARATIVE ANALYSIS OF MOST RELEVANT PRIOR STUDIES AGAINST THE FIVE CHALLENGE DIMENSIONS`r")
    $capPara = Find-ParaContaining "TABLE I. COMPARATIVE ANALYSIS"
    $capPara.Range.Font.Bold = $true
    $capPara.Range.Font.Size = 9
    $capPara.Format.Alignment = 1  # wdAlignParagraphCenter

    $tblInsPt = $doc.Range($capPara.Range.End, $capPara.Range.End)
    $t1 = $doc.Tables.Add($tblInsPt, 10, 11)
    $t1.Range.Font.Size = 8
    $headers1 = @("Ref","Focus & Contribution","C1","C2","C3","C4","C5","AI Tech.","BD Rel.","Method","Year")
    for ($c=1; $c -le 11; $c++) { $t1.Cell(1,$c).Range.Text = $headers1[$c-1]; $t1.Cell(1,$c).Range.Font.Bold = $true }
    $rows1 = @(
        @("[1]","Alshabibi et al. -- SLR, 7 tech. + 5 legal barriers","Y","Y","P","P","Y","ML survey","N","SLR","2024"),
        @("[5]","Alharthi & Garcia -- CIAF LLM (93% F1)","Y","Y","P","N","P","LLM/GenAI","P","Framework","2025"),
        @("[6]","Igonor et al. -- blockchain CoC, 14/17 jurisd.","N","P","Y","Y","N","Blockchain","P","Prototype","2025"),
        @("[7]","Tageldin & Venter -- ML-CF, ISO/IEC 27043","Y","Y","P","N","Y","ML/LSTM","P","SLR","2023"),
        @("[9]","Akilal & Kechadi -- CLERMS, 40-70% MLAT","Y","N","N","Y","P","NLP/Log","P","Prototype","2025"),
        @("[12]","Ahmed & Arifuzzaman -- CSA 2023 BD gap","Y","Y","Y","P","Y","Statistical","Y","Survey","2025"),
        @("[13]","Akter & Rahman -- cloud forensic dims., UIU","Y","Y","Y","Y","P","Process ML","Y","SLR+Model","2023"),
        @("[15]","Sharmin & Rahman -- BD Police survey (52)","P","N","Y","Y","Y","Statistical","Y","Survey","2025"),
        @("[P]","This study -- AI-CFRF-BD (PRISMA SLR)","Y","Y","Y","Y","Y","LLM+ML+BC","Y","PRISMA","2026")
    )
    for ($r=0; $r -lt $rows1.Count; $r++) {
        for ($c=0; $c -lt 11; $c++) { $t1.Cell($r+2,$c+1).Range.Text = $rows1[$r][$c] }
    }
    $t1.PreferredWidthType = 3  # wdPreferredWidthPercent
    $t1.PreferredWidth = 100
    $noteIns = $doc.Range($t1.Range.End, $t1.Range.End)
    $noteIns.InsertAfter("`rY = Fully addressed, P = Partially, N = Not addressed. BD Rel. = Bangladesh relevance. [P] = This study.`r")
    $notePara = Find-ParaContaining "Y = Fully addressed"
    $notePara.Range.Font.Size = 8
    $notePara.Range.Font.Italic = $true

    # Close section 1-col for Table I, reopen 2-col before "III. METHODOLOGY"
    $p = Find-ParaContaining "III. METHODOLOGY"
    $doc.Range($p.Range.Start, $p.Range.Start).InsertBreak(3)
    $secBody2 = $doc.Sections.Last
    Set-SectionMargins $secBody2
    $secBody2.PageSetup.TextColumns.SetCount(2)
    $secBody2.PageSetup.TextColumns.Spacing = 14.4
    Write-Output ("After break #3, section count = " + $doc.Sections.Count)

    # ---------- Insert Fig 1 & Fig 2 after the PRISMA/methodology intro sentence ----------
    # Each step re-finds its anchor fresh -- never chain a Range/InlineShape reference
    # captured before an earlier insertion, since that reference goes stale.
    $p = Find-ParaContaining "Figure 2 illustrates the complete five-phase research process"
    $ins1 = $doc.Range($p.Range.End, $p.Range.End)
    $pic1 = $doc.InlineShapes.AddPicture("$dir\diagram_prisma.png", $false, $true, $ins1)
    $pic1.LockAspectRatio = -1
    $pic1.Width = 230
    $ins1b = $doc.Range($pic1.Range.End, $pic1.Range.End)
    $ins1b.InsertAfter("`rFig. 1. PRISMA 2020 literature selection flow.`r")

    $pCap1 = Find-ParaContaining "Fig. 1. PRISMA 2020 literature selection flow"
    $ins2 = $doc.Range($pCap1.Range.End, $pCap1.Range.End)
    $pic2 = $doc.InlineShapes.AddPicture("$dir\diagram_methodology.png", $false, $true, $ins2)
    $pic2.LockAspectRatio = -1
    $pic2.Width = 230
    $ins2b = $doc.Range($pic2.Range.End, $pic2.Range.End)
    $ins2b.InsertAfter("`rFig. 2. Five-phase research methodology framework.`r")
    Write-Output "Inserted Fig 1 and Fig 2"

    # ---------- Break #4/#5: sandwich Table II before 'IV. RESULTS' ----------
    $p = Find-ParaContaining "IV. RESULTS"
    $doc.Range($p.Range.Start, $p.Range.Start).InsertBreak(3)
    $secTableII = $doc.Sections.Last
    Set-SectionMargins $secTableII
    $secTableII.PageSetup.TextColumns.SetCount(1)
    Write-Output ("After break #4, section count = " + $doc.Sections.Count)

    $p = Find-ParaContaining "IV. RESULTS"
    $insPt2 = $doc.Range($p.Range.Start, $p.Range.Start)
    $insPt2.InsertBefore("TABLE II. TAXONOMY OF CLOUD FORENSICS CHALLENGES, AI SOLUTIONS, AND BANGLADESH CONTEXT`r")
    $capPara2 = Find-ParaContaining "TABLE II. TAXONOMY"
    $capPara2.Range.Font.Bold = $true
    $capPara2.Range.Font.Size = 9
    $capPara2.Format.Alignment = 1

    $tblInsPt2 = $doc.Range($capPara2.Range.End, $capPara2.Range.End)
    $t2 = $doc.Tables.Add($tblInsPt2, 6, 6)
    $t2.Range.Font.Size = 8
    $headers2 = @("ID","Challenge & Root Cause","BD Legal Gap","AI Resolution Tool","BD Impact","Metric")
    for ($c=1; $c -le 6; $c++) { $t2.Cell(1,$c).Range.Text = $headers2[$c-1]; $t2.Cell(1,$c).Range.Font.Bold = $true }
    $rows2 = @(
        @("C1","Volatile Data & Log Expiry. CSP logs auto-deleted (30-90 days); detection window closes before court order issues.","No data-hold statute; ICT Act 2006 & CSA 2023 silent.","CIAF (Alharthi & Garcia, 2025): LLM hash-stamps logs before deletion; no CSP cooperation required.","Evidence stamped in window; no legislative change; deploys with NTMC.","93% F1"),
        @("C2","Multi-Tenancy & Evidence Contamination. Shared infra; container isolation weak; one-tenant extraction risks co-resident exposure.","BD criminal code silent on commingled evidence; CSA 2023 does not address this.","ML-CF (Tageldin & Venter, 2023): RF, LSTM, CNN isolate forensic artefacts; ISO/IEC 27043-aligned.","Artefacts from NTMC feeds; no new legislation; ISO/IEC 27043 aligned.","ISO/IEC 27043"),
        @("C3","Chain-of-Custody & s.65B Admissibility. No CSP-to-court custody record; s.65B drafted for physical devices.","s.65B precondition unmet for cloud logs; no MoL blockchain guidance; Tribunal acquittals [11].","Blockchain CoC (Igonor et al., 2025): smart contracts hash + timestamp each custody step.","Admissible s.65B; MoL note suffices; no single-custodian trust.","14/17 jurisdictions"),
        @("C4","Cross-Border MLAT Latency. MLAT delays 6 wk-10 mo; BD: under 50/yr; Budapest Convention not ratified.","No US/EU CSP data-sharing; no specialist digital-evidence track in MLAT.","CLERMS (Akilal & Kechadi, 2025): NLP pre-validates MLAT requests; catches errors pre-submission.","Low-cost MoFA/MoL change; faster preservation; fewer wasted requests.","40-70% MLAT reduction"),
        @("C5","Forensic Readiness Deficit. No pre-incident logging; reactive posture; endpoint tools; primary logs never captured.","BTRC & CSA 2023 impose no logging standard or pre-incident config in BD.","Self-Hosted CF (arXiv 2510.21246, 2025): NTMC integration; no CSP cooperation; existing intercept authority.","Pre-incident capture; within legal authority; reduces investigation costs.","60% cost reduction")
    )
    for ($r=0; $r -lt $rows2.Count; $r++) {
        for ($c=0; $c -lt 6; $c++) { $t2.Cell($r+2,$c+1).Range.Text = $rows2[$r][$c] }
    }
    $t2.PreferredWidthType = 3
    $t2.PreferredWidth = 100
    $noteIns2 = $doc.Range($t2.Range.End, $t2.Range.End)
    $noteIns2.InsertAfter("`rCIAF=Cloud Intelligence & AI Forensics; CoC=Chain of Custody; MoL=Ministry of Law; CLERMS=Cross-border LE Request Mgmt.; MoFA=Ministry of Foreign Affairs; NTMC=National Telecom Monitoring Centre.`r")
    $notePara2 = Find-ParaContaining "CIAF=Cloud Intelligence"
    $notePara2.Range.Font.Size = 8
    $notePara2.Range.Font.Italic = $true

    # Close 1-col Table II section, reopen 2-col before "IV. RESULTS"
    $p = Find-ParaContaining "IV. RESULTS"
    $doc.Range($p.Range.Start, $p.Range.Start).InsertBreak(3)
    $secBody3 = $doc.Sections.Last
    Set-SectionMargins $secBody3
    $secBody3.PageSetup.TextColumns.SetCount(2)
    $secBody3.PageSetup.TextColumns.Spacing = 14.4
    Write-Output ("After break #5, section count = " + $doc.Sections.Count)

    # ---------- Insert Fig 3 (AI-CFRF-BD framework) in Section IV ----------
    $p = Find-ParaContaining "This phased sequencing directly answers RQ4"
    $ins3 = $doc.Range($p.Range.End, $p.Range.End)
    $pic3 = $doc.InlineShapes.AddPicture("$dir\diagram_ai_solution.png", $false, $true, $ins3)
    $pic3.LockAspectRatio = -1
    $pic3.Width = 230
    $ins3b = $doc.Range($pic3.Range.End, $pic3.Range.End)
    $ins3b.InsertAfter("`rFig. 3. The AI-CFRF-BD framework: five clusters mapped to five validated AI resolution tools.`r")
    Write-Output "Inserted Fig 3"

    $doc.SaveAs([ref]$dstPath)
    $doc.Close()
    Write-Output "SAVED: $dstPath"
    Write-Output ("Final section count: " + $doc.Sections.Count)
}
finally {
    $word.Quit()
}
