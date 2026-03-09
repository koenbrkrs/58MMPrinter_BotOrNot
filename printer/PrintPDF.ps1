# Path Configuration
$printerName = "EM5820H"
$sumatraPath = "C:\Users\koenb\Desktop\Printer\SumatraPDF-3.5.2-64-install.exe"
$folderPath = "C:\Users\koenb\Desktop\Printer\Printthis"

# Find the first PDF in the folder
$pdfFile = Get-ChildItem -Path $folderPath -Filter *.pdf | Select-Object -First 1

if ($pdfFile) {
    $filePath = $pdfFile.FullName
    
    # -print-to-default prints silently to the system default
    # -print-to "PrinterName" targets a specific one
    # -print-settings "paper=58mm" helps force the width if the driver is finicky
    Start-Process -FilePath $sumatraPath -ArgumentList "-print-to `"$printerName`" -print-settings `"paper=58mm`" `"$filePath`"" -Wait
    
    Write-Host "Sent $filePath to $printerName"
} else {
    Write-Host "No PDF found in $folderPath"
}