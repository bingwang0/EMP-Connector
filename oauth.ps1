$resp = try {
     Invoke-RestMethod -Method Post -Uri https://mydomainname.my.salesforce.com/services/oauth2/token -Body "grant_type=password&client_id=3MVG9GXbtnGKjXe4AcGEL9XuD.gMAs0vYc02DuV.OBH9npr9iZwpRoq5nfoHNpE2XQsrxpI9kPVXusyjVnqg4&client_secret=607CA84E32321C2C0E7D1D0F76C56DD009E334F9858600D733915FC2E81427E8&username=salesforce_username&password=password+securitytoken"
}
catch {
     $_.Exception.Response
 }

 
Write-Output $resp.gettype()
Write-Output $resp
#to do: need to check the $resp type (below output only works for exceptions, ie., 400/500 responses)
$result = $resp.GetResponseStream()
$reader = New-Object System.IO.StreamReader($result)
$reader.BaseStream.Position = 0
$reader.DiscardBufferedData()
$responseBody = $reader.ReadToEnd();
Write-Output $responseBody
