$ErrorActionPreference = "Stop"
$dir = "D:\Personal\MSCSE\CSE 6093 RMTW\MID"

$ppt = New-Object -ComObject PowerPoint.Application
try {
    $pres = $ppt.Presentations.Add($false)
    $pres.PageSetup.SlideWidth = 576   # 8in
    $pres.PageSetup.SlideHeight = 432  # 6in

    function New-Slide() {
        $idx = $pres.Slides.Count + 1
        $s = $pres.Slides.Add($idx, 11)
        $s.Background.Fill.Solid()
        $s.Background.Fill.ForeColor.RGB = 255*65536 + 255*256 + 255
        return $s
    }
    function Add-Box($slide,$left,$top,$width,$height,$text,$fontSize,$bold,$fillR,$fillG,$fillB,$fontR,$fontG,$fontB,$align) {
        $box = $slide.Shapes.AddTextbox(1, $left, $top, $width, $height)
        $box.TextFrame.WordWrap = $true
        $tr = $box.TextFrame.TextRange
        $tr.Text = $text
        $tr.Font.Size = $fontSize
        $tr.Font.Bold = $bold
        $tr.Font.Name = "Calibri"
        $tr.Font.Color.RGB = $fontB*65536 + $fontG*256 + $fontR
        if ($align -ne $null) { $tr.ParagraphFormat.Alignment = $align }
        $box.Fill.Visible = 1
        $box.Fill.ForeColor.RGB = $fillB*65536 + $fillG*256 + $fillR
        $box.Line.ForeColor.RGB = 100*65536 + 100*256 + 100
        $box.Line.Weight = 1
        $box.TextFrame.MarginLeft=6; $box.TextFrame.MarginRight=6; $box.TextFrame.MarginTop=4; $box.TextFrame.MarginBottom=4
        return $box
    }
    function Add-Arrow($slide,$left,$top,$width,$height) {
        $shp = $slide.Shapes.AddShape(13, $left, $top, $width, $height)  # msoShapeDownArrow -ish; 13=downArrow? use 33? we'll use straight connector instead
        return $shp
    }

    # ============ Fig 1: PRISMA 2020 flow ============
    $s1 = New-Slide
    Add-Box $s1 15 8 546 24 "PRISMA 2020 Literature Selection Flow -- Cloud Forensics Challenges in Bangladesh" 15 $true 27 39 71 255 255 255 2 | Out-Null

    $boxW = 380; $boxX = 40
    $sideW = 150; $sideX = 430

    $b1 = Add-Box $s1 $boxX 45 $boxW 40 "Records identified via 7-repository database search (arXiv, MDPI, Google Scholar, SSRN, NDC e-Journal, BJMIS, IJRIAS)`rn = 782" 11 $false 27 39 71 255 255 255 2
    $side1 = Add-Box $s1 $sideX 45 $sideW 40 "Duplicates removed`rn = 248" 10 $false 255 230 230 120 30 30 2

    $b2 = Add-Box $s1 $boxX 100 $boxW 34 "Records screened by title & abstract`rn = 534" 11 $false 45 85 135 255 255 255 2
    $side2 = Add-Box $s1 $sideX 100 $sideW 34 "Excluded as outside scope`rn = 486" 10 $false 255 230 230 120 30 30 2

    $b3 = Add-Box $s1 $boxX 149 $boxW 40 "Full-text articles assessed for eligibility`rn = 48" 11 $false 45 85 135 255 255 255 2
    $side3 = Add-Box $s1 $sideX 149 $sideW 40 "Excluded: paywalled n=18`rtangential n=14" 10 $false 255 230 230 120 30 30 2

    $b4 = Add-Box $s1 $boxX 204 $boxW 40 "Studies included in final synthesis`rn = 16 (open-access, 2021-2026, English)" 11 $true 27 108 62 255 255 255 2

    $s1.Shapes.AddLine(230, 85, 230, 100).Line.Weight = 2
    $s1.Shapes.AddLine(230, 134, 230, 149).Line.Weight = 2
    $s1.Shapes.AddLine(230, 189, 230, 204).Line.Weight = 2

    $pres.SaveAs("$dir\_fig_temp1.pptx")

    # ============ Fig 2: Five-phase methodology ============
    $s2 = New-Slide
    Add-Box $s2 15 8 546 24 "Five-Phase Research Methodology Framework" 16 $true 27 39 71 255 255 255 2 | Out-Null

    $phases = @(
        @("Phase 1 -- Protocol Design & Research Question Formulation", "RQ1-RQ4 pre-registered; database list, query strings, and eligibility criteria established", 27,39,71),
        @("Phase 2 -- Multi-Database Systematic Search", "7 repositories searched; 6 query strings applied uniformly; n = 782 records retrieved", 45,85,135),
        @("Phase 3 -- PRISMA 2020 Screening & Eligibility Assessment", "534 screened -> 48 full-text reviewed -> 16 studies included (2021-2026, open-access)", 45,85,135),
        @("Phase 4 -- Thematic Synthesis Across Five Challenge Clusters", "C1 Volatile Data & Log Expiry | C2 Multi-Tenancy | C3 Chain-of-Custody & s.65B | C4 Cross-Border MLAT | C5 Forensic Readiness Deficit", 96,74,45),
        @("Phase 5 -- AI-Enhanced Solution Mapping & Framework Synthesis", "Each cluster matched to its highest-evidenced AI resolution tool -> AI-CFRF-BD framework", 27,108,62)
    )
    $y = 42
    for ($pi = 0; $pi -lt $phases.Count; $pi++) {
        $ph = $phases[$pi]
        Add-Box $s2 30 $y 516 46 ($ph[0] + "`r" + $ph[1]) 11 $false $ph[2] $ph[3] $ph[4] 255 255 255 $null | Out-Null
        $y += 54
        if ($pi -lt ($phases.Count - 1)) { $s2.Shapes.AddLine(288, $y-8, 288, $y+2).Line.Weight = 2 }
    }

    $pres.SaveAs("$dir\_fig_temp2.pptx")

    # ============ Fig 3: AI-CFRF-BD framework (matches Table II exactly) ============
    $s3 = New-Slide
    Add-Box $s3 15 8 546 24 "The AI-CFRF-BD Framework: Challenge Clusters Mapped to AI Resolution Tools" 14 $true 27 39 71 255 255 255 2 | Out-Null

    $rows3 = @(
        @("C1","Volatile Data & Log Expiry","CIAF -- Alharthi & Garcia, 2025 [5]","93% F1"),
        @("C2","Multi-Tenancy & Evidence Contamination","ML-CF -- Tageldin & Venter, 2023 [7]","ISO/IEC 27043"),
        @("C3","Chain-of-Custody & s.65B Admissibility","Blockchain CoC -- Igonor et al., 2025 [6]","14/17 jurisdictions"),
        @("C4","Cross-Border MLAT Latency","CLERMS -- Akilal & Kechadi, 2025 [9]","40-70% MLAT reduction"),
        @("C5","Forensic Readiness Deficit","Self-Hosted CF -- arXiv 2510.21246 [4]","60% cost reduction")
    )
    $y = 44
    Add-Box $s3 30 $y 90 22 "Cluster" 11 $true 27 39 71 255 255 255 2 | Out-Null
    Add-Box $s3 122 $y 210 22 "Challenge" 11 $true 27 39 71 255 255 255 2 | Out-Null
    Add-Box $s3 334 $y 150 22 "AI Resolution Tool" 11 $true 27 39 71 255 255 255 2 | Out-Null
    Add-Box $s3 486 $y 60 22 "Metric" 11 $true 27 39 71 255 255 255 2 | Out-Null
    $y += 28
    foreach ($r in $rows3) {
        Add-Box $s3 30 $y 90 40 $r[0] 11 $true 45 85 135 255 255 255 2 | Out-Null
        Add-Box $s3 122 $y 210 40 $r[1] 10 $false 240 240 245 20 20 20 $null | Out-Null
        Add-Box $s3 334 $y 150 40 $r[2] 10 $false 232 245 233 20 60 20 $null | Out-Null
        Add-Box $s3 486 $y 60 40 $r[3] 9 $false 255 244 224 100 60 0 $null | Out-Null
        $y += 46
    }

    for ($i=1; $i -le 3; $i++) {
        $s = $pres.Slides.Item($i)
        $exportPath = switch ($i) {
            1 { "$dir\diagram_prisma.png" }
            2 { "$dir\diagram_methodology.png" }
            3 { "$dir\diagram_ai_solution.png" }
        }
        $s.Export($exportPath, "PNG", 1600, 1200)
        Write-Output "Exported: $exportPath"
    }

    $pres.Close()
}
finally {
    $ppt.Quit()
}
