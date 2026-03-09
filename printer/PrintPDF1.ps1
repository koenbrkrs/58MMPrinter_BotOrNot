# --- Configuration ---
$printer = "EM5820H" 
$exe = "C:\Users\koenb\Desktop\printer\SumatraPDF-3.5.2-64.exe"
$pdfFolder = "C:\Users\koenb\Desktop\printer\Printthis"
$doneFolder = "C:\Users\koenb\Desktop\printer\Finished"

# Ensure directories exist
if (-not (Test-Path $pdfFolder)) { New-Item -Path $pdfFolder -ItemType Directory | Out-Null }
if (-not (Test-Path $doneFolder)) { New-Item -Path $doneFolder -ItemType Directory | Out-Null }

Write-Host "--- EM5820H Pro Watcher ---" -ForegroundColor Cyan
Write-Host "Monitoring: $pdfFolder"

while ($true) {
    $pdfFiles = Get-ChildItem -Path $pdfFolder -Filter *.pdf
    
    foreach ($file in $pdfFiles) {
        $filePath = $file.FullName
        Write-Host "[( $(Get-Date -Format HH:mm:ss) )] Printing: $($file.Name)" -ForegroundColor Yellow

        # Use 'noscale' to prevent the driver from shrinking A4 white space.
        # This assumes your PDF is now 58mm wide.
        $args = "-print-to `"$printer`" -silent -print-settings `"noscale,paper=58x210mm`" `"$filePath`""
        
        try {
            Start-Process -FilePath $exe -ArgumentList $args -Wait
            
            # Brief pause for hardware to finish
            Start-Sleep -Seconds 2
            
            # Archive the file
            Move-Item -Path $filePath -Destination (Join-Path $doneFolder $file.Name) -Force
            Write-Host "Success! Ticket archived." -ForegroundColor Green
        }
        catch {
            Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
        }
    }

    Start-Sleep -Seconds 3
}