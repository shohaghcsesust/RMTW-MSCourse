$ErrorActionPreference = "Stop"
$dir = "D:\Personal\MSCSE\CSE 6093 RMTW\MID"
$path = "$dir\RMTW_FINAL_cloud_forensics_report_IEEE.docx"

$word = New-Object -ComObject Word.Application
$word.Visible = $false
try {
    $doc = $word.Documents.Open($path, $false, $false)

    # Shape 1 = Fig 1 (prisma), Shape 2 = Fig 2 (methodology). Replace in place.
    $shp1 = $doc.InlineShapes.Item(1)
    $anchor1 = $shp1.Range
    $insPos1 = $doc.Range($anchor1.Start, $anchor1.Start)
    $shp1.Delete()
    $newPic1 = $doc.InlineShapes.AddPicture("$dir\diagram_prisma.png", $false, $true, $insPos1)
    $newPic1.LockAspectRatio = -1
    $newPic1.Width = 230
    Write-Output "Replaced Fig 1 image"

    $shp2 = $doc.InlineShapes.Item(2)
    $anchor2 = $shp2.Range
    $insPos2 = $doc.Range($anchor2.Start, $anchor2.Start)
    $shp2.Delete()
    $newPic2 = $doc.InlineShapes.AddPicture("$dir\diagram_methodology.png", $false, $true, $insPos2)
    $newPic2.LockAspectRatio = -1
    $newPic2.Width = 230
    Write-Output "Replaced Fig 2 image"

    $shp3 = $doc.InlineShapes.Item(3)
    $anchor3 = $shp3.Range
    $insPos3 = $doc.Range($anchor3.Start, $anchor3.Start)
    $shp3.Delete()
    $newPic3 = $doc.InlineShapes.AddPicture("$dir\diagram_ai_solution.png", $false, $true, $insPos3)
    $newPic3.LockAspectRatio = -1
    $newPic3.Width = 230
    Write-Output "Replaced Fig 3 image"

    $doc.SaveAs([ref]$path)
    $doc.Close()
    Write-Output "SAVED"
}
finally {
    $word.Quit()
}
