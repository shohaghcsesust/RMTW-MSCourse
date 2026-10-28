$ErrorActionPreference = "Stop"
$path = "D:\Personal\MSCSE\CSE 6093 RMTW\MID\RMTW_FINAL_cloud_forensics_report_IEEE.docx"

$word = New-Object -ComObject Word.Application
$word.Visible = $false
try {
    $doc = $word.Documents.Open($path, $false, $false)

    # Table 1 = RQ table (5x2, already fine). Table 2 = Table I (10x11). Table 3 = Table II (6x6).
    $t1 = $doc.Tables.Item(2)
    $t1.AutoFitBehavior(0)  # wdAutoFitFixed
    $widths1 = @(28,150,24,24,24,24,24,70,40,55,32)
    for ($c=1; $c -le 11; $c++) { $t1.Columns.Item($c).Width = $widths1[$c-1] }
    Write-Output "Table I widths set"

    $t2 = $doc.Tables.Item(3)
    $t2.AutoFitBehavior(0)
    $widths2 = @(30,120,90,125,90,37)
    for ($c=1; $c -le 6; $c++) { $t2.Columns.Item($c).Width = $widths2[$c-1] }
    Write-Output "Table II widths set"

    $doc.SaveAs([ref]$path)
    $doc.Close()
    Write-Output "SAVED"
}
finally {
    $word.Quit()
}
