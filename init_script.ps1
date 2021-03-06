cls

#==== shutdown Nasca login request
$nasca_log = Get-Process 'drmlogin' -ErrorAction SilentlyContinue
if ($nasca_log)
{
    $nasca_log | % { $_.CloseMainWindow() }
}
Remove-Variable nasca_log

#==== open Outlook
& 'C:\Program Files\Microsoft Office\Office16\OUTLOOK.exe'
Start-Sleep -Seconds 5;    #wait for Outlook to load

#==== open Knox Portal
$loginUrl = "URL"
$username = "USUARIO"
$password = "PASSWORD"
#initialize browser
$ie = New-Object -com internetexplorer.application; 
$ie.visible = $true; 
$ie.navigate($loginUrl);
#Start-Sleep -Seconds 10
while ($ie.ReadyState -ne 4) 
{ 
    Start-Sleep -Milliseconds 1000; 
} 
$ie.Document.getElementByID("USERID").value = $username 
$ie.Document.getElementByID("USERPASSWORD").value=$password 
$ie.Document.getElementById("signIn").Click();

#==== open Firefox & Whatsapp
& 'C:\Program Files\Mozilla Firefox\firefox.exe' "web.whatsapp.com"
Start-Sleep -Seconds 10;    #wait for browser idle