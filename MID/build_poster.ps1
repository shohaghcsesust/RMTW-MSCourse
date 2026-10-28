$ErrorActionPreference = "Stop"
$dir = "D:\Personal\MSCSE\CSE 6093 RMTW\MID"
$outPath = "$dir\RMTW_FINAL_Poster_Cloud_Forensics.pptx"

$ppt = New-Object -ComObject PowerPoint.Application
try {
    $pres = $ppt.Presentations.Add($false)
    $pres.PageSetup.SlideWidth = 2592
    $pres.PageSetup.SlideHeight = 3456
    $slide = $pres.Slides.Add(1, 11)

    function Add-Box($left,$top,$width,$text,$fontSize,$bold,$fillR,$fillG,$fillB,$fontR,$fontG,$fontB,$align) {
        $box = $slide.Shapes.AddTextbox(1, $left, $top, $width, 10)
        $box.TextFrame.WordWrap = $true
        $box.TextFrame.AutoSize = 1   # ppAutoSizeShapeToFitText -- shape grows to fit text, width stays fixed
        $tr = $box.TextFrame.TextRange
        $tr.Text = $text
        $tr.Font.Size = $fontSize
        $tr.Font.Bold = $bold
        $tr.Font.Name = "Calibri"
        if ($fontR -ne $null) { $tr.Font.Color.RGB = $fontB*65536 + $fontG*256 + $fontR }
        if ($align -ne $null) { $tr.ParagraphFormat.Alignment = $align }
        if ($fillR -ne $null) {
            $box.Fill.Visible = 1
            $box.Fill.ForeColor.RGB = $fillB*65536 + $fillG*256 + $fillR
            $box.Line.Visible = 0
        } else {
            $box.Fill.Visible = 0
            $box.Line.Visible = 0
        }
        $box.TextFrame.MarginLeft = 10
        $box.TextFrame.MarginRight = 10
        $box.TextFrame.MarginTop = 8
        $box.TextFrame.MarginBottom = 8
        return $box
    }

    $slide.Background.Fill.Solid()
    $slide.Background.Fill.ForeColor.RGB = 255*65536 + 255*256 + 255

    # ---------------- Header ----------------
    $headerBg = Add-Box 0 0 2592 " " 1 $false 27 39 71 $null $null $null $null
    $bTitle = Add-Box 60 40 2472 "Cloud Forensics Challenges in Bangladesh: A PRISMA Systematic Review with AI-Enhanced Resolution Strategies" 60 $true $null $null $null 255 255 255 2
    $y = $bTitle.Top + $bTitle.Height + 15
    $bAuth = Add-Box 60 $y 2472 "Md. Ahsan Kabir  |  Dept. of CSE, United International University, Dhaka  |  mkabir2520016@mscse.uiu.ac.bd" 28 $false $null $null $null 210 220 235 2
    $y = $bAuth.Top + $bAuth.Height + 25
    Write-Output ("headerBg shape name: " + $headerBg.Name + " current height: " + $headerBg.Height)
    $headerBg.TextFrame.AutoSize = 0   # ppAutoSizeNone -- stop it snapping back to fit-text
    $headerBg.Height = $y
    Write-Output ("headerBg height after fix: " + $headerBg.Height)
    $headerBg.ZOrder(1)   # msoSendToBack
    $bTitle.ZOrder(0); $bAuth.ZOrder(0)   # msoBringToFront

    # ---------------- Regulatory update band ----------------
    $regTop = $y + 20
    $bRegHead = Add-Box 90 ($regTop+15) 2412 "LATEST REGULATORY UPDATE (2026)" 32 $true $null $null $null 140 90 0 $null
    $y2 = $bRegHead.Top + $bRegHead.Height + 12
    $bRegBody = Add-Box 90 $y2 2412 "The Cyber Security Ordinance 2025 REPEALED the Cyber Security Act 2023 outright -- the same cloud-evidence gap persists under the new law. NEW: the Personal Data Protection (Amendment) Ordinance 2026 (signed 5 Feb 2026) now requires a real-time in-country cloud copy for `"restricted`" data or Critical Information Infrastructure (CII) -- an incidental opening for future forensic-audit-access legislation that this review's framework is positioned to use." 26 $false $null $null $null 90 60 0 $null
    $regBottom = $bRegBody.Top + $bRegBody.Height + 15
    $regBg = Add-Box 60 $regTop 2472 " " 1 $false 255 243 205 $null $null $null $null
    $regBg.Height = $regBottom - $regTop
    $regBg.ZOrder(4)   # msoSendToBack-ish: send behind the text boxes just added
    $bRegHead.ZOrder(1); $bRegBody.ZOrder(1)  # msoBringToFront

    $colTop = $regBottom + 40
    $col1X = 60
    $col2X = 1336
    $colW = 1176

    function Add-SectionHeading($x,$y,$text) {
        return Add-Box $x $y $colW $text 34 $true 27 39 71 255 255 255 $null
    }
    function Add-Body($x,$y,$text,[int]$size=25) {
        return Add-Box $x $y $colW $text $size $false $null $null $null 20 20 20 $null
    }

    # ---------------- Column 1 ----------------
    $y = $colTop
    $h = Add-SectionHeading $col1X $y "1. Introduction & Motivation"; $y = $h.Top + $h.Height + 12
    $b = Add-Body $col1X $y "Bangladesh: 100M+ internet-enabled devices; USD 1.2B+ public-sector cloud procurement since 2020. Investigative laws (ICT Act 2006, Cyber Security Ordinance 2025) were drafted for physical devices and are silent on cloud-hosted evidence. Result: a disproportionately high acquittal rate on cloud-evidence cases -- driven by chain-of-custody failures and Section 65B admissibility gaps, not disputed facts."; $y = $b.Top + $b.Height + 35

    $h = Add-SectionHeading $col1X $y "2. Research Gap & Questions"; $y = $h.Top + $h.Height + 12
    $b = Add-Body $col1X $y "No prior PRISMA-based study maps cloud forensics challenges to Bangladesh's legal context.`rRQ1: Technical cloud-forensics challenges in Bangladesh?`rRQ2: Legal barriers to cloud-evidence admissibility?`rRQ3: How can AI tools address RQ1/RQ2?`rRQ4: What implementable framework improves Bangladesh's readiness?"; $y = $b.Top + $b.Height + 35

    $h = Add-SectionHeading $col1X $y "3. Methodology (PRISMA 2020)"; $y = $h.Top + $h.Height + 12
    $b = Add-Body $col1X $y "782 records identified -> 534 screened -> 48 full-text reviewed -> 16 studies included (2021-2026, open-access). 7 repositories, 6 query strings, single-reviewer thematic coding."; $y = $b.Top + $b.Height + 20
    $picW = $colW
    $picH = $picW*684/900
    $pic1 = $slide.Shapes.AddPicture("$dir\diagram_prisma.png", 0, -1, $col1X, $y, $picW, $picH)
    $y = $y + $picH + 35

    $h = Add-SectionHeading $col1X $y "4. Discussion & Contribution"; $y = $h.Top + $h.Height + 12
    $b = Add-Body $col1X $y "First Bangladesh-specific PRISMA synthesis linking cloud forensics gaps to validated AI tools. Reframes the problem: the tools already exist -- the real gap is legal recognition and adoption, not missing technology. `"Power of Disposal`" (Karagiannis & Vergidis, 2021): only the cloud provider, not the Bangladeshi state, can currently grant access to cloud-hosted data."; $y = $b.Top + $b.Height + 35
    $col1End = $y

    # ---------------- Column 2 ----------------
    $y = $colTop
    $h = Add-SectionHeading $col2X $y "5. Results: AI-CFRF-BD Framework"; $y = $h.Top + $h.Height + 12
    $b = Add-Body $col2X $y "Five challenge clusters (C1-C5), each mapped to a validated AI/automation tool with quantitative evidence."; $y = $b.Top + $b.Height + 20
    $pic2 = $slide.Shapes.AddPicture("$dir\diagram_ai_solution.png", 0, -1, $col2X, $y, $picW, $picH)
    $y = $y + $picH + 35

    $b = Add-Body $col2X $y "Phase 1 (no legislative change): CIAF log hash-stamping (C1, 93% F1); ML-CF artefact isolation (C2); Self-Hosted CF pre-incident capture (C5).`rPhase 2 (Ministry of Law practice note): Blockchain chain-of-custody (C3, compatible in 14/17 jurisdictions).`rPhase 3 (inter-ministerial): CLERMS MLAT pre-validation (C4, 40-70% latency reduction)."; $y = $b.Top + $b.Height + 35

    $h = Add-SectionHeading $col2X $y "6. Limitations & Future Work"; $y = $h.Top + $h.Height + 12
    $b = Add-Body $col2X $y "Single-reviewer coding; English/open-access sources only. Framework is synthesis-level -- not yet piloted on Bangladeshi data. Next steps: NTMC pilot of a Phase-1 tool; a narrow forensic-audit-access amendment leveraging the new CII residency rule; practitioner consultation with CID Digital Forensics & BGD e-GOV CIRT."; $y = $b.Top + $b.Height + 35

    $h = Add-SectionHeading $col2X $y "References (selected)"; $y = $h.Top + $h.Height + 12
    $b = Add-Body $col2X $y "[1] Alshabibi et al. 2024  ·  [8] Karagiannis & Vergidis 2021  ·  [11] Uzzal 2025  ·  [15] Sharmin & Rahman 2025  ·  [20] Cyber Security Ordinance 2025  ·  [21] PDPO (Amendment) Ordinance 2026`rFull 22-reference list in the accompanying paper." 22; $y = $b.Top + $b.Height + 35
    $col2End = $y

    $contentEnd = [Math]::Max($col1End, $col2End)
    $footerTop = [Math]::Max($contentEnd + 10, 3396)
    Add-Box 0 $footerTop 2592 " " 1 $false 27 39 71 $null $null $null $null | Out-Null
    $bFoot = Add-Box 60 ($footerTop+15) 2472 "CSE 6093 - Research Methodologies and Technical Writing  |  Final Presentation  |  United International University" 22 $false $null $null $null 220 220 230 2
    $footerBottom = $bFoot.Top + $bFoot.Height + 20
    $slide.Shapes.Item($slide.Shapes.Count - 1).Height = $footerBottom - $footerTop

    $finalHeight = $footerBottom + 20
    if ($finalHeight -gt $pres.PageSetup.SlideHeight) {
        $pres.PageSetup.SlideHeight = $finalHeight
    }

    $pres.SaveAs($outPath)
    $pres.Close()
    Write-Output ("SAVED: $outPath, final height=" + $finalHeight)
}
finally {
    $ppt.Quit()
}
