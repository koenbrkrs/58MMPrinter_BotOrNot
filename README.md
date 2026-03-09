# 58MMPrinter_BotOrNot
My little 58mm printer works now. Check here how.

http://www.zjiang.com/en/init.php/service/driver
Driver:

58mm Thermal Printer Auto-Print SystemThis project automates the process of monitoring a folder for PDF tickets and printing them instantly to a 58mm thermal printer.🛠 PrerequisitesHardware: Yoko EM5820H (or any ESC/POS compatible 58mm USB printer).

Software: SumatraPDF (Portable 64-bit version).
Note: Use the Portable version to avoid "corrupted installation" errors related to missing DLLs.OS: 
Windows 10/11.1. Driver Installation (The "Raster" Setup)To print QR codes and images, you must use a driver that supports graphics, not just text.
Download the ZIJIANG Receipt Printer Driver V11.3.0.0 from the Zjiang Service Center.

Run the installer and select POS-58.Assign the port to the correct USB port (e.g., USB005).
Check "Printer Properties" > "Ports" to find the active USB port.Rename the Printer: Go to "Printer Properties" and rename the device to EM5820H to match the script configuration.

2. Document Configuration (Crucial)Thermal printers do not scale large documents well. For full-width printing: Page Width: Set your PDF document width to exactly 58mm.Margins: Set all margins to 0mm.Scaling: If you use an A4 PDF ($210\text{mm}$), the driver will shrink it by ~75%, making the text unreadably small.

4. Troubleshooting
Small Print: Ensure the PDF is 58mm wide. If it is an A4 file, change the script setting from noscale to fit.Gibberish Text: Go to "Printer Properties" > "Advanced" and check "Print directly to the printer".Printer Not Found: Run Get-Printer | Select-Object Name in PowerShell to verify the exact name Windows sees.No QR Code: This indicates you are likely using the "Generic / Text Only" driver. Switch to the Zjiang POS-58 driver.

5. Quick Launch
Create a .bat file on your desktop to start the watcher with one click:Codefragmentpowershell.exe -ExecutionPolicy Bypass -File "C:\Users\koenb\Desktop\printer\Print
