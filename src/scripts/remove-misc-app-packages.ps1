Get-AppxProvisionedPackage -Online | Where-Object -Property 'DisplayName' -In -Value @(
  'Microsoft.Microsoft3DViewer';
  'Microsoft.BingSearch';
  'Clipchamp.Clipchamp';
  'Microsoft.549981C3F5F10';
  'Microsoft.Windows.DevHome';
  'MicrosoftCorporationII.MicrosoftFamily';
  'Microsoft.WindowsFeedbackHub';
  'Microsoft.GetHelp';
  'Microsoft.Getstarted';
  'Microsoft.WindowsMaps';
  'Microsoft.BingNews';
  'Microsoft.MicrosoftOfficeHub';
  'Microsoft.Office.OneNote';
  'Microsoft.OutlookForWindows';
  'Microsoft.People';
  'Microsoft.PowerAutomateDesktop';
  'MicrosoftCorporationII.QuickAssist';
  'Microsoft.SkypeApp';
  'Microsoft.MicrosoftSolitaireCollection';
  'MSTeams';
  'Microsoft.Todos';
  'Microsoft.WindowsSoundRecorder';
  'Microsoft.BingWeather';
  'Microsoft.Xbox.TCUI';
  'Microsoft.XboxApp';
  'Microsoft.XboxGameOverlay';
  'Microsoft.XboxGamingOverlay';
  'Microsoft.XboxIdentityProvider';
  'Microsoft.XboxSpeechToTextOverlay';
  'Microsoft.GamingApp';
  'Microsoft.YourPhone';
  'Microsoft.ZuneVideo';
) | Remove-AppxProvisionedPackage -AllUsers -Online

Get-WindowsCapability -Online | Where-Object -FilterScript {
  ($_.Name -split '~')[0] -in @(
    'Browser.InternetExplorer';
    'MathRecognizer';
    'Microsoft.Windows.PowerShell.ISE';
    'App.Support.QuickAssist';
    'App.StepsRecorder';
  );
} | Remove-WindowsCapability -Online