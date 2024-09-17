
$scriptsDirPath = "./src/scripts"
$templateXmlPath = "./src/autounattend-template.xml"
$scriptIndent = "        "

$xmlTemplate = Get-Content -Path "$templateXmlPath";
$scriptFilenames = Get-ChildItem -Path "$scriptsDirPath" -Name;

Write-Output "building xml..."
foreach($scriptFilename in $scriptFilenames) {
  $script_data = (Get-Content -Path "$scriptsDirPath/$scriptFilename") -join "`n$scriptIndent";
  Write-Output "injecting script: $scriptFilename"
  $xmlTemplate = $xmlTemplate.Replace("[[$scriptFilename]]", $script_data);
}

$xmlTemplate = $xmlTemplate.Replace("$scriptIndent`n", "`n");
$xmlTemplate > autounattend.xml;
Write-Output "building xml complete!";