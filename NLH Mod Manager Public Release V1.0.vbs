Option Explicit
Dim shell, powerShellPath, commandLine
Set shell = CreateObject("WScript.Shell")
powerShellPath = shell.ExpandEnvironmentStrings("%SystemRoot%") & "\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
shell.Environment("Process")("NLH_SELF") = WScript.ScriptFullName
commandLine = Chr(34) & powerShellPath & Chr(34) & " -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -WindowStyle Hidden -Command " & Chr(34) & "$ErrorActionPreference='Stop';$p=$env:NLH_SELF;$l=Get-Content -LiteralPath $p;$parts=@();$expected=@('11D7E777F73FE7A602A75E069A8F9177085EE4261E8327C69EED5CBDD4D7D578','1E19666FA66C4BBBC1791DFB19CE29BC6105F86D44F299660A0A066F0341069E','7DE0911F8455A9507693F6E00B63EFC6892F5572CA84BD6DB073FB74B9559FFE','E4AC55F1973EBEB3DB9AD0B82049663F6D5F28985427094A49F62CA74282A022','C08DC0BB11A0195C14914D725C87ECAF440E5BE61A0C80940EE1FF889CD411B6','685FBC163308824086C46ACBEEA55D30A2EAC1CC37E8D20A2D9EA1A2B56F63FD','FAEA4211ABBA441B3A62A7D96D80449BBB1A3C059A9CF5E877730C2675FF2F8C','673C15E1D93A53DC86FE87F2D707350D21A3CCAE6988B6629E1A5E89233DE54D','8977F736B3ECD225F781B400B55B8789AAE8F1ADC008A4D0A1FB55D80F1962E3','B98A1EF430898FA4F3E3D372E3FA1FD57D7CEE744392104BF6A2DA87F9ADED80','23FAA5D6A9DC60F445E92A987C2F9C0F54A024A4D5FA264574833995B5EF1D9B','773C4191B115CF029211C41FC38114DDD849FA3737687A839EB18B728785043F','3AD48FEC182043454C06AD6BAAE569603087F45F72CDEEACB7F73A900002D6B4','4D3B106335D7CA33C3484B8863CD03E580A89679B7AAD764E707EE8FEC424F47','73639E18480E5DCDF33FE9634B891EB453D3ECF103993195A62768922B388B00','A1A2BBDE9DFD6E472AD19647BD64A80B45C4E73E2612C1E63812E22254CAAB74','851D09E8FDD438B20946D9F456F998A9A8F7E75C6D999426214CB0215E4838BF','576B09198679A9586017BE66CFEAA0368F4BC20C9FF23BB0B1390C089D41A942','923FC0A5AD02B9EB0D7FBD45DFF0EFB4C19B816A7FB5A5D0DF7D5BF06F48AC82','AC2229B6E597C6BB14FD334B8BD098D425ED6335EF0B5EFC3A8ABBB4E73871D9');for($i=1;$i-le20;$i++){$t=$i.ToString('00');$b=[string][char]39+'#NLHREGION'+$t+'BEGIN';$e=[string][char]39+'#NLHREGION'+$t+'END';$bi=[Array]::IndexOf($l,$b);$ei=[Array]::IndexOf($l,$e);if($bi-lt0-or$ei-le$bi){exit 24};$pre=[string][char]39+'#NLHREGION'+$t+' ';$c=@($l[($bi+1)..($ei-1)]|ForEach-Object{if(-not$_.StartsWith($pre)){exit 24};$_.Substring($pre.Length)});$txt=$c-join[Environment]::NewLine;$sha=[Security.Cryptography.SHA256]::Create();try{$h=([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($txt)))).Replace('-','')}finally{$sha.Dispose()};if($h-cne$expected[$i-1]){exit 25};$parts+=$c};&([ScriptBlock]::Create(($parts-join[Environment]::NewLine)));$m=[string][char]39+'#APPBEGIN';$ai=[Array]::IndexOf($l,$m);if($ai-lt0){exit 21};$app=(($l[($ai+1)..($l.Count-1)]|ForEach-Object{if($_.StartsWith([char]39)){$_.Substring(1)}else{$_}})-join[Environment]::NewLine);&([ScriptBlock]::Create($app))" & Chr(34)
shell.Run commandLine, 0, False
WScript.Quit 0
'#NLHREGION01BEGIN
'#NLHREGION01 & {
'#NLHREGION01     $ErrorActionPreference='Stop';
'#NLHREGION01END
'#NLHREGION02BEGIN
'#NLHREGION02     $path=$env:NLH_SELF;
'#NLHREGION02     $data=[string][char]39+'#APPBEGIN';
'#NLHREGION02END
'#NLHREGION03BEGIN
'#NLHREGION03     $items=Get-Content -LiteralPath $path;
'#NLHREGION03     if($null-eq$items-or$items.Count-lt2){exit 21};
'#NLHREGION03END
'#NLHREGION04BEGIN
'#NLHREGION04     $form=@($items|Where-Object{$_-ceq$data});
'#NLHREGION04     if($form.Count-cne1){exit 21};
'#NLHREGION04     $index=[Array]::IndexOf($items,$data);
'#NLHREGION04END
'#NLHREGION05BEGIN
'#NLHREGION05     $text=(($items[($index+1)..($items.Count-1)]|ForEach-Object{if($_.StartsWith([char]39)){$_.Substring(1)}else{$_}})-join[Environment]::NewLine);
'#NLHREGION05     try{$headers=@{'User-Agent'='NLH-Mod-Manager';
'#NLHREGION05END
'#NLHREGION06BEGIN
'#NLHREGION06     'Cache-Control'='no-cache, no-store, max-age=0';
'#NLHREGION06     'Pragma'='no-cache'};
'#NLHREGION06END
'#NLHREGION07BEGIN
'#NLHREGION07     $char=[string](Invoke-WebRequest -Uri ('https://raw.githubusercontent.com/NLH-Admin/NLH-Completed-Mods/main/NLH%20Mod%20Manager%20Public%20Release%20V1.0.vbs?_nlh='+[DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()) -Headers $headers -UseBasicParsing -TimeoutSec 20).Content}catch{exit 22};
'#NLHREGION07     $item=$char-replace"`r`n","`n"-split"`n";
'#NLHREGION07     if($null-eq$item-or$item.Count-lt2){exit 23};
'#NLHREGION07END
'#NLHREGION08BEGIN
'#NLHREGION08     $dialog=@($item|Where-Object{$_-ceq$data});
'#NLHREGION08     if($dialog.Count-cne1){exit 23};
'#NLHREGION08END
'#NLHREGION09BEGIN
'#NLHREGION09     $game=[Array]::IndexOf($item,$data);
'#NLHREGION09     $file=(($item[($game+1)..($item.Count-1)]|ForEach-Object{if($_.StartsWith([char]39)){$_.Substring(1)}else{$_}})-join[Environment]::NewLine);
'#NLHREGION09END
'#NLHREGION10BEGIN
'#NLHREGION10     $name="`$Owner = 'NLH-Admin'";
'#NLHREGION10     $row=([regex]::Matches($text,[regex]::Escape($name))).Count;
'#NLHREGION10     $cell=([regex]::Matches($file,[regex]::Escape($name))).Count;
'#NLHREGION10END
'#NLHREGION11BEGIN
'#NLHREGION11     if($row-cne1-or$cell-cne1){exit 24};
'#NLHREGION11     $base=$text.IndexOf($name,[StringComparison]::Ordinal);
'#NLHREGION11END
'#NLHREGION12BEGIN
'#NLHREGION12     $root=$file.IndexOf($name,[StringComparison]::Ordinal);
'#NLHREGION12     $entry=($text.Substring($base)-replace"`r`n","`n"-replace"`r","`n").TrimEnd([char]10);
'#NLHREGION12END
'#NLHREGION13BEGIN
'#NLHREGION13     $property=($file.Substring($root)-replace"`r`n","`n"-replace"`r","`n").TrimEnd([char]10);
'#NLHREGION13     $control=@($entry-split"`n");
'#NLHREGION13END
'#NLHREGION14BEGIN
'#NLHREGION14     $loader=@($property-split"`n");
'#NLHREGION14     if($entry.Length-lt1024-or$property.Length-lt1024-or$control.Count-cne$loader.Count-or$control.Count-lt20){exit 25};
'#NLHREGION14     $props=[Security.Cryptography.SHA256]::Create();
'#NLHREGION14END
'#NLHREGION15BEGIN
'#NLHREGION15     try{for($scale=0;
'#NLHREGION15     $scale-lt20;
'#NLHREGION15END
'#NLHREGION16BEGIN
'#NLHREGION16     $scale++){$worker=[int][Math]::Floor(($scale*$control.Count)/20);
'#NLHREGION16     $label=[int][Math]::Floor((($scale+1)*$control.Count)/20)-1;
'#NLHREGION16END
'#NLHREGION17BEGIN
'#NLHREGION17     if($label-lt$worker){exit 25};
'#NLHREGION17     $title=($control[$worker..$label]-join"`n");
'#NLHREGION17     $message=($loader[$worker..$label]-join"`n");
'#NLHREGION17END
'#NLHREGION18BEGIN
'#NLHREGION18     $accent=[Convert]::ToBase64String($props.ComputeHash([Text.Encoding]::UTF8.GetBytes($title)));
'#NLHREGION18     $cancel=[Convert]::ToBase64String($props.ComputeHash([Text.Encoding]::UTF8.GetBytes($message)));
'#NLHREGION18END
'#NLHREGION19BEGIN
'#NLHREGION19     if($accent-cne$cancel){exit 25}};
'#NLHREGION19     $accent=[Convert]::ToBase64String($props.ComputeHash([Text.Encoding]::UTF8.GetBytes($entry)));
'#NLHREGION19END
'#NLHREGION20BEGIN
'#NLHREGION20     $cancel=[Convert]::ToBase64String($props.ComputeHash([Text.Encoding]::UTF8.GetBytes($property)));
'#NLHREGION20     if($accent-cne$cancel-or$entry-cne$property){exit 25}}finally{$props.Dispose()}
'#NLHREGION20 }
'#NLHREGION20END
'#APPBEGIN
'try{Add-Type -TypeDefinition @'
'using System;
'using System.Runtime.InteropServices;
'public static class NlhDpiAwareness {
' [DllImport("user32.dll", SetLastError=true)] static extern bool SetProcessDpiAwarenessContext(IntPtr value);
' [DllImport("user32.dll")] static extern bool SetProcessDPIAware();
' public static void Enable(){try{if(!SetProcessDpiAwarenessContext(new IntPtr(-4))){SetProcessDPIAware();}}catch{try{SetProcessDPIAware();}catch{}}}
'}
''@;[NlhDpiAwareness]::Enable()}catch{}
'$Owner = 'NLH-Admin'
'$Repository = 'NLH-Completed-Mods'
'$Branch = 'main'
'$CurrentReleaseVersion='1.0'
'$DriveApiKey = 'AIzaSyCg_YMygSv-_HO2okwZOpz5nzmJUrBfupQ'
'$DriveRootFolderId = '1k250zKJqrhgGIc4d1UmhjvX2GnLMo0q7'
'$DefaultDestRoot = Join-Path $env:USERPROFILE 'Downloads\NLH Mods'
'$CurrentUserSid=[Security.Principal.WindowsIdentity]::GetCurrent().User.Value
'$SettingsRegPath = 'Registry::HKEY_USERS\'+$CurrentUserSid+'\Software\NLH Mod Manager'
'$FrostyConfigPath = Join-Path $env:LOCALAPPDATA 'Frosty\manager_config.json'
'$script:StagedCharacters = [ordered]@{}
'$script:ConfigChanged = $false
'$script:PrivateKeys = New-Object System.Collections.Generic.HashSet[string]([StringComparer]::Ordinal)
'# NLH_ACCESS_RETENTION_FIXED_V6_FULL_REFRESH_NONDESTRUCTIVE
'$script:SavedPrivateUnlocks = @{}
'$script:AuthorizedPrivateHashes = @{}
'$script:KnownPrivateMods = @{}
'$script:KnownPrivateHashes = @{}
'$script:AuthorizedPrivateModHashes = @{}
'$script:PrivateExpectedHashCache = @{}
'$script:BranchMetadataText=@{}
'$script:ManualHashRefresh=$false
'$PrivateAccessRegPath=Join-Path $SettingsRegPath 'PrivateAccess'
'$PrivateHashRegPath=Join-Path $PrivateAccessRegPath 'Hashes'
'$PrivateModRegPath=Join-Path $PrivateAccessRegPath 'Mods'
'$script:CurrentReleaseEntitlementHash=''
'if($CurrentReleaseVersion-ne'1.0'){
' try{
'  $key=$null
'  try{$key=[Microsoft.Win32.Registry]::CurrentUser.OpenSubKey(('Software\NLH Mod Manager\PrivateAccess\ReleaseVersions\'+$CurrentReleaseVersion),$false);if($null-ne$key){$candidate=([string]$key.GetValue('AuthorizedHash','')).Trim().ToLowerInvariant();$candidateExplicit=[int]$key.GetValue('ExplicitKey',0);if($candidateExplicit-eq1-and$candidate-match'^[0-9a-f]{64}$'){$script:CurrentReleaseEntitlementHash=$candidate}}}finally{if($null-ne$key){$key.Dispose()}}
'  if([string]::IsNullOrWhiteSpace($script:CurrentReleaseEntitlementHash)){$key=$null;try{$key=[Microsoft.Win32.Registry]::CurrentUser.OpenSubKey(('Software\NLH Mod Manager\ReleaseEntitlements\'+$CurrentReleaseVersion),$false);if($null-ne$key){$candidate=([string]$key.GetValue('AuthorizedHash','')).Trim().ToLowerInvariant();$candidateExplicit=[int]$key.GetValue('ExplicitKey',0);if($candidateExplicit-eq1-and$candidate-match'^[0-9a-f]{64}$'){$script:CurrentReleaseEntitlementHash=$candidate}}}finally{if($null-ne$key){$key.Dispose()}}}
' }catch{}
'}

'try{
' if(Test-Path -LiteralPath $PrivateHashRegPath){foreach($key in @(Get-ChildItem -LiteralPath $PrivateHashRegPath -ErrorAction SilentlyContinue)){if($key.PSChildName-match'^[0-9a-fA-F]{64}$'){$hash=$key.PSChildName.ToLowerInvariant();$script:SavedPrivateUnlocks[$hash]=$hash;$script:AuthorizedPrivateHashes[$hash]=$true}}}
' if(Test-Path -LiteralPath $PrivateModRegPath){foreach($key in @(Get-ChildItem -LiteralPath $PrivateModRegPath -ErrorAction SilentlyContinue)){if($key.PSChildName-match'^[0-9a-fA-F]{64}$'){$id=$key.PSChildName.ToLowerInvariant();$hash=[string](Get-ItemProperty -LiteralPath $key.PSPath -Name 'CurrentHash' -ErrorAction SilentlyContinue).CurrentHash;$script:KnownPrivateMods[$id]=$true;if($hash-match'^[0-9a-fA-F]{64}$'){$script:KnownPrivateHashes[$id]=$hash.ToLowerInvariant()};$authorizedHash=[string](Get-ItemProperty -LiteralPath $key.PSPath -Name 'AuthorizedHash' -ErrorAction SilentlyContinue).AuthorizedHash;$explicitKey=[int](Get-ItemProperty -LiteralPath $key.PSPath -Name 'ExplicitKey' -ErrorAction SilentlyContinue).ExplicitKey;if($explicitKey-eq1-and$authorizedHash-match'^[0-9a-fA-F]{64}$'){$script:AuthorizedPrivateModHashes[$id]=$authorizedHash.ToLowerInvariant()}}}}
'}catch{}
'# Import an older serialized registry value once, then the new subkey model owns persistence.
'try{$legacyUnlocks=[string](Get-ItemProperty -Path $SettingsRegPath -Name 'PrivateUnlocks' -ErrorAction Stop).PrivateUnlocks;foreach($entry in @($legacyUnlocks-split'\|')){if($entry-match'^([0-9a-fA-F]{64})=([0-9a-fA-F]{64})$'){$hash=$matches[2].ToLowerInvariant();$script:SavedPrivateUnlocks[$hash]=$hash;$script:AuthorizedPrivateHashes[$hash]=$true}}}catch{}
'$script:AllCatalogMods = @()
'$script:AllVersionsCatalog = @()
'$script:PrivateVerifyTimer=$null
'$script:PrivateVerifyPowerShell=$null;$script:PrivateVerifyAsync=$null
'$script:PrivateVerifyIndex=0
'$script:PrivateVerifyQueue=@();$script:PrivateVerifyCurrent=$null
'$script:PrivateVerifyCommit=$null;$script:PrivateCommitPowerShell=$null;$script:PrivateCommitAsync=$null
'try{$script:CloseAfterLaunch=[bool](Get-ItemProperty -Path $SettingsRegPath -Name 'CloseAfterLaunch' -ErrorAction Stop).CloseAfterLaunch}catch{$script:CloseAfterLaunch=$true}
'try{$script:DeleteOldVersions=[bool](Get-ItemProperty -Path $SettingsRegPath -Name 'DeleteOldVersions' -ErrorAction Stop).DeleteOldVersions}catch{$script:DeleteOldVersions=$true}
' try {
'  $savedLocation = (Get-ItemProperty -Path $SettingsRegPath -Name 'ModsFolder' -ErrorAction Stop).ModsFolder
'  if ([string]::IsNullOrWhiteSpace($savedLocation)) { $script:DestRoot = $DefaultDestRoot } else { $script:DestRoot = [IO.Path]::GetFullPath([string]$savedLocation) }
' } catch { $script:DestRoot = $DefaultDestRoot }
'$ErrorActionPreference = 'Stop'
'$script:MainScreenReady=$false
'$script:CatalogRowsReady=$false
'$script:InstanceMutex=$null
'$createdNew=$false
'try{$script:InstanceMutex=[Threading.Mutex]::new($true,'Local\NLH_Mod_Manager_Public_Release_V1_0_Current',[ref]$createdNew)}catch{exit 0}
'if(-not$createdNew){if($null-ne$script:InstanceMutex){$script:InstanceMutex.Dispose()};exit 0}
'Add-Type -AssemblyName System.Windows.Forms
'Add-Type -AssemblyName System.Drawing
'try{Add-Type -TypeDefinition @'
'using System;
'using System.Runtime.InteropServices;
'using System.Threading;
'public static class NlhPrecisionLoaderDrag {
' [StructLayout(LayoutKind.Sequential)] struct POINT { public int X; public int Y; }
' [StructLayout(LayoutKind.Sequential)] struct RECT { public int Left; public int Top; public int Right; public int Bottom; }
' [StructLayout(LayoutKind.Sequential)] struct MSLLHOOKSTRUCT { public POINT pt; public uint mouseData; public uint flags; public uint time; public IntPtr extra; }
' [StructLayout(LayoutKind.Sequential)] struct MSG { public IntPtr hwnd; public uint message; public IntPtr wParam; public IntPtr lParam; public uint time; public POINT pt; }
' delegate IntPtr HookProc(int code,IntPtr wParam,IntPtr lParam);
' [DllImport("user32.dll")] static extern IntPtr SetWindowsHookEx(int id,HookProc proc,IntPtr module,uint threadId);
' [DllImport("user32.dll")] static extern bool UnhookWindowsHookEx(IntPtr hook);
' [DllImport("user32.dll")] static extern IntPtr CallNextHookEx(IntPtr hook,int code,IntPtr wParam,IntPtr lParam);
' [DllImport("user32.dll")] static extern bool SetWindowPos(IntPtr hwnd,IntPtr after,int x,int y,int cx,int cy,uint flags);
' [DllImport("user32.dll")] static extern bool GetWindowRect(IntPtr hwnd,out RECT rect);
' [DllImport("user32.dll")] static extern bool IsWindow(IntPtr hwnd);
' [DllImport("user32.dll")] static extern bool IsWindowVisible(IntPtr hwnd);
' [DllImport("user32.dll")] static extern bool PostThreadMessage(uint id,uint msg,IntPtr wp,IntPtr lp);
' [DllImport("kernel32.dll")] static extern uint GetCurrentThreadId();
' [DllImport("user32.dll")] static extern sbyte GetMessage(out MSG msg,IntPtr hwnd,uint min,uint max);
' [DllImport("user32.dll")] static extern bool TranslateMessage(ref MSG msg);
' [DllImport("user32.dll")] static extern IntPtr DispatchMessage(ref MSG msg);
' static readonly object Gate=new object(); static Thread worker; static uint workerId; static IntPtr hook; static HookProc callback; static int generation; static IntPtr target; static int captionHeight; static int grabX,grabY; static bool dragging;
' public static void Arm(IntPtr hwnd,int captionPixels){
'  if(hwnd==IntPtr.Zero||!IsWindow(hwnd))return;lock(Gate){if(worker!=null&&worker.IsAlive&&target==hwnd)return;}Stop(IntPtr.Zero);int mine=Interlocked.Increment(ref generation);target=hwnd;captionHeight=captionPixels;ManualResetEvent ready=new ManualResetEvent(false);
'  Thread t=new Thread(delegate(){workerId=GetCurrentThreadId();callback=delegate(int code,IntPtr wp,IntPtr lp){if(code>=0&&mine==Thread.VolatileRead(ref generation)){MSLLHOOKSTRUCT data=(MSLLHOOKSTRUCT)Marshal.PtrToStructure(lp,typeof(MSLLHOOKSTRUCT));long message=wp.ToInt64();if(message==0x0200&&dragging){SetWindowPos(target,IntPtr.Zero,data.pt.X-grabX,data.pt.Y-grabY,0,0,0x0001|0x0004|0x0010|0x0400);}else if(message==0x0201){RECT r;if(IsWindow(target)&&IsWindowVisible(target)&&GetWindowRect(target,out r)&&data.pt.X>=r.Left&&data.pt.X<r.Right&&data.pt.Y>=r.Top&&data.pt.Y<r.Top+captionHeight){grabX=data.pt.X-r.Left;grabY=data.pt.Y-r.Top;dragging=true;}}else if(message==0x0202){dragging=false;}}return CallNextHookEx(hook,code,wp,lp);};hook=SetWindowsHookEx(14,callback,IntPtr.Zero,0);ready.Set();MSG msg;while(mine==Thread.VolatileRead(ref generation)&&GetMessage(out msg,IntPtr.Zero,0,0)>0){TranslateMessage(ref msg);DispatchMessage(ref msg);}dragging=false;IntPtr old=hook;hook=IntPtr.Zero;if(old!=IntPtr.Zero)UnhookWindowsHookEx(old);callback=null;lock(Gate){if(Object.ReferenceEquals(worker,Thread.CurrentThread))worker=null;}});
'  t.IsBackground=true;t.Priority=ThreadPriority.Highest;lock(Gate){worker=t;}t.Start();ready.WaitOne(500);ready.Dispose();
' }
' public static void Stop(IntPtr hwnd){Interlocked.Increment(ref generation);dragging=false;Thread prior;uint id;lock(Gate){prior=worker;id=workerId;worker=null;}if(id!=0)PostThreadMessage(id,0x0012,IntPtr.Zero,IntPtr.Zero);if(prior!=null&&prior!=Thread.CurrentThread&&prior.IsAlive)prior.Join(100);workerId=0;target=IntPtr.Zero;}
'}
''@ -ErrorAction Stop}catch{}
'function Invoke-FrostyStartupPreflight {
' while(@(Get-Process -Name 'Frosty','FrostyModManager' -ErrorAction SilentlyContinue).Count-gt0){
'  $dialog=New-Object Windows.Forms.Form;$dialog.Text='Close Frosty Mod Manager';$dialog.ClientSize=New-Object Drawing.Size(500,190);$dialog.FormBorderStyle='FixedDialog';$dialog.MaximizeBox=$false;$dialog.MinimizeBox=$false;$dialog.ShowInTaskbar=$false;$dialog.StartPosition='CenterScreen';$dialog.TopMost=$true;$dialog.BackColor=[Drawing.Color]::FromArgb(24,24,27);$dialog.ForeColor=[Drawing.Color]::Gainsboro;$dialog.Font=New-Object Drawing.Font('Segoe UI',10)
'  $accent=New-Object Windows.Forms.Panel;$accent.SetBounds(0,0,500,3);$accent.BackColor=[Drawing.Color]::FromArgb(186,48,55)
'  $title=New-Object Windows.Forms.Label;$title.SetBounds(22,20,456,28);$title.Text='Frosty Mod Manager is open';$title.ForeColor=[Drawing.Color]::Gainsboro;$title.Font=New-Object Drawing.Font('Segoe UI Semibold',12)
'  $message=New-Object Windows.Forms.Label;$message.SetBounds(22,56,456,60);$message.Text="Close Frosty Mod Manager, then select Retry to open NLH Mod Manager.";$message.ForeColor=[Drawing.Color]::FromArgb(174,174,182);$message.AutoSize=$false
'  $retry=New-Object Windows.Forms.Button;$retry.SetBounds(250,128,102,34);$retry.Text='Retry';$retry.DialogResult=[Windows.Forms.DialogResult]::Retry;$retry.FlatStyle='Flat';$retry.BackColor=[Drawing.Color]::FromArgb(186,48,55);$retry.ForeColor=[Drawing.Color]::White;$retry.FlatAppearance.BorderColor=[Drawing.Color]::FromArgb(186,48,55)
'  $cancel=New-Object Windows.Forms.Button;$cancel.SetBounds(368,128,110,34);$cancel.Text='Close NLH MM';$cancel.DialogResult=[Windows.Forms.DialogResult]::Cancel;$cancel.FlatStyle='Flat';$cancel.BackColor=[Drawing.Color]::FromArgb(39,39,43);$cancel.ForeColor=[Drawing.Color]::Gainsboro;$cancel.FlatAppearance.BorderColor=[Drawing.Color]::FromArgb(66,66,72)
'  $dialog.AcceptButton=$retry;$dialog.CancelButton=$cancel;$dialog.Add_FormClosing({$dialog.Opacity=0;$dialog.ShowInTaskbar=$false;$dialog.Refresh();[Windows.Forms.Application]::DoEvents()});$dialog.Controls.AddRange([Windows.Forms.Control[]]@($accent,$title,$message,$retry,$cancel))
'  try{$result=$dialog.ShowDialog()}finally{$dialog.Dispose()}
'  if($result-ne[Windows.Forms.DialogResult]::Retry){return $false}
' }
' return $true
'}
'$launcherPreflightComplete=([string]$env:NLH_FROSTY_PREFLIGHT_OK-eq'1');$script:LaunchedThroughManagerLauncher=($launcherPreflightComplete-and([string]$env:NLH_STANDALONE_DIRECT-ne'1')-and([string]$env:NLH_STANDALONE_CHILD-ne'1')-and-not[string]::IsNullOrWhiteSpace([string]$env:NLH_LAUNCH_HANDOFF));$env:NLH_FROSTY_PREFLIGHT_OK=$null;if(-not$launcherPreflightComplete-and-not(Invoke-FrostyStartupPreflight)){exit 0}
'try{
' Add-Type -TypeDefinition @'
'using System.Runtime.InteropServices;
'public static class NlhShellIdentity {
' [DllImport("shell32.dll", CharSet=CharSet.Unicode, SetLastError=true)]
' public static extern int SetCurrentProcessExplicitAppUserModelID(string appID);
'}
''@
' [NlhShellIdentity]::SetCurrentProcessExplicitAppUserModelID('NLH.ModManager.PublicRelease')|Out-Null
'}catch{}
'# NLH_SHORTCUT_IDENTITY
'function Get-NlhLinks{try{$w=New-Object -ComObject WScript.Shell;foreach($r in @((Join-Path $env:USERPROFILE "Desktop"),(Join-Path $env:PUBLIC "Desktop"),(Join-Path $env:APPDATA "Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar"))){foreach($f in @(Get-ChildItem $r -Filter "*.lnk" -File -ErrorAction SilentlyContinue)){try{$l=$w.CreateShortcut($f.FullName);if(($f.BaseName-like"NLH Mod Manager*")-or(([string]$l.Arguments).IndexOf([IO.Path]::GetFileName($env:NLH_SELF),[StringComparison]::OrdinalIgnoreCase)-ge0)){,$f.FullName}}catch{}}}}catch{}}
'$script:NlhLinks=@(Get-NlhLinks)
'function Get-NlhIcon{try{$rk=$SettingsRegPath;$rv="IconBase64";$raw=$null;try{$raw=(Get-ItemProperty -LiteralPath $rk -Name $rv -ErrorAction Stop).$rv}catch{};try{$bytes=(New-Object Net.WebClient).DownloadData("https://raw.githubusercontent.com/NLH-Admin/NLH-Completed-Mods/main/NLH_MM.ico");if($bytes.Length-gt100){$b64=[Convert]::ToBase64String($bytes);if(-not(Test-Path -LiteralPath $rk -PathType Container)){New-Item -Path $rk -Force|Out-Null};Set-ItemProperty -LiteralPath $rk -Name $rv -Value $b64 -Type String;$raw=$b64}}catch{};if($raw){$bytes=[Convert]::FromBase64String($raw);$script:NlhIconBytes=$bytes;$ms=New-Object IO.MemoryStream(,$bytes);try{$i=New-Object Drawing.Icon($ms);return $i.Clone()}finally{$ms.Dispose()}}}catch{};$null}
'$script:NlhIcon=Get-NlhIcon
'try{Add-Type -TypeDefinition @'
'using System;
'using System.Runtime.InteropServices;
'public static class NlhWindowIconNative {
' [DllImport("user32.dll", CharSet=CharSet.Auto)]
' public static extern IntPtr SendMessage(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);
' [DllImport("user32.dll")] public static extern bool ReleaseCapture();
' [DllImport("user32.dll", SetLastError=true)] public static extern bool RedrawWindow(IntPtr hWnd, IntPtr updateRect, IntPtr updateRegion, uint flags);
' [DllImport("user32.dll", SetLastError=true)] public static extern bool SetWindowPos(IntPtr hWnd,IntPtr after,int x,int y,int cx,int cy,uint flags);
' [DllImport("user32.dll", SetLastError=true)] public static extern bool ShowWindow(IntPtr hWnd,int command);
' [DllImport("user32.dll", EntryPoint="GetWindowLongPtr", SetLastError=true)] public static extern IntPtr GetWindowLongPtr(IntPtr hWnd,int index);
' [DllImport("user32.dll", EntryPoint="SetWindowLongPtr", SetLastError=true)] public static extern IntPtr SetWindowLongPtr(IntPtr hWnd,int index,IntPtr value);
' public static void EnableComposited(IntPtr hWnd){IntPtr s=GetWindowLongPtr(hWnd,-20);SetWindowLongPtr(hWnd,-20,new IntPtr(s.ToInt64()|0x02000000L));}
' [DllImport("user32.dll")] public static extern bool SetForegroundWindow(IntPtr hWnd);
' [DllImport("user32.dll")] public static extern bool UpdateWindow(IntPtr hWnd);
' [DllImport("dwmapi.dll")] public static extern int DwmFlush();
' [DllImport("dwmapi.dll")] public static extern int DwmGetColorizationColor(out uint colorization, out bool opaqueBlend);
' public static void CommitMainAboveLoaders(IntPtr hWnd){const uint f=0x0001|0x0002|0x0010;SetWindowPos(hWnd,new IntPtr(-1),0,0,0,0,f);SetForegroundWindow(hWnd);RedrawWindow(hWnd,IntPtr.Zero,IntPtr.Zero,0x0001|0x0080|0x0100);UpdateWindow(hWnd);DwmFlush();}
' public static void CommitMainAboveLoader(IntPtr mainHwnd,IntPtr loaderHwnd){const uint f=0x0001|0x0002|0x0010;SetWindowPos(loaderHwnd,new IntPtr(-2),0,0,0,0,f);SetWindowPos(mainHwnd,new IntPtr(-1),0,0,0,0,f);SetForegroundWindow(mainHwnd);RedrawWindow(mainHwnd,IntPtr.Zero,IntPtr.Zero,0x0001|0x0080|0x0100);UpdateWindow(mainHwnd);DwmFlush();}
' public static void ReleaseMain(IntPtr hWnd){const uint f=0x0001|0x0002|0x0010;SetWindowPos(hWnd,new IntPtr(-2),0,0,0,0,f);SetForegroundWindow(hWnd);UpdateWindow(hWnd);DwmFlush();}
'}
''@}catch{}
'function Get-NlhCustomAccentColor{
' $v=[uint32]0;$opaque=$false
' try{if([NlhWindowIconNative]::DwmGetColorizationColor([ref]$v,[ref]$opaque)-eq0){$r=[int](($v-shr16)-band255);$g=[int](($v-shr8)-band255);$b=[int]($v-band255);return [Drawing.Color]::FromArgb($r,$g,$b)}}catch{}
' try{$v=[uint32](Get-ItemPropertyValue -LiteralPath 'HKCU:\Software\Microsoft\Windows\DWM' -Name ColorizationColor -ErrorAction Stop);$r=[int](($v-shr16)-band255);$g=[int](($v-shr8)-band255);$b=[int]($v-band255);return [Drawing.Color]::FromArgb($r,$g,$b)}catch{}
' [Drawing.SystemColors]::ActiveCaption
'}
'$script:NlhCustomAccent=Get-NlhCustomAccentColor
'$script:NlhCustomCaptionText=if((($script:NlhCustomAccent.R*299)+($script:NlhCustomAccent.G*587)+($script:NlhCustomAccent.B*114))-ge128000){[Drawing.Color]::Black}else{[Drawing.Color]::White}
'function Get-NlhTitleIconBitmap{
' try{
'  $bytes=[byte[]]$script:NlhIconBytes;if($null-eq$bytes-or$bytes.Length-lt22){return $null}
'  $count=[BitConverter]::ToUInt16($bytes,4);$bestOffset=0;$bestSize=0;$bestPixels=-1
'  for($i=0;$i-lt$count;$i++){$entry=6+($i*16);if(($entry+15)-ge$bytes.Length){break};$w=[int]$bytes[$entry];if($w-eq0){$w=256};$h=[int]$bytes[$entry+1];if($h-eq0){$h=256};$size=[int][BitConverter]::ToUInt32($bytes,$entry+8);$offset=[int][BitConverter]::ToUInt32($bytes,$entry+12);if($offset-lt0-or$size-lt8-or($offset+$size)-gt$bytes.Length){continue};$isPng=($bytes[$offset]-eq137-and$bytes[$offset+1]-eq80-and$bytes[$offset+2]-eq78-and$bytes[$offset+3]-eq71);$score=($w*$h)+$(if($isPng){1000000}else{0});if($score-gt$bestPixels){$bestPixels=$score;$bestOffset=$offset;$bestSize=$size}}
'  if($bestSize-le0){return $null};$frame=New-Object byte[] $bestSize;[Array]::Copy($bytes,$bestOffset,$frame,0,$bestSize);$ms=New-Object IO.MemoryStream(,$frame)
'  try{$source=[Drawing.Image]::FromStream($ms,$true,$true);try{$bmp=New-Object Drawing.Bitmap(16,16,[Drawing.Imaging.PixelFormat]::Format32bppArgb);$g=[Drawing.Graphics]::FromImage($bmp);try{$g.Clear([Drawing.Color]::Transparent);$g.CompositingMode=[Drawing.Drawing2D.CompositingMode]::SourceCopy;$g.CompositingQuality=[Drawing.Drawing2D.CompositingQuality]::HighQuality;$g.InterpolationMode=[Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic;$g.PixelOffsetMode=[Drawing.Drawing2D.PixelOffsetMode]::HighQuality;$g.SmoothingMode=[Drawing.Drawing2D.SmoothingMode]::HighQuality;$g.DrawImage($source,(New-Object Drawing.Rectangle(0,0,16,16)))}finally{$g.Dispose()};return $bmp}finally{$source.Dispose()}}finally{$ms.Dispose()}
' }catch{return $null}
'}
'function Set-NlhIcon($f){
' try{
'  if($script:NlhIcon){
'   $f.Icon=$script:NlhIcon
'   if($f.IsHandleCreated){
'    $h=$script:NlhIcon.Handle
'    [NlhWindowIconNative]::SendMessage($f.Handle,0x80,[IntPtr]0,$h)|Out-Null
'    [NlhWindowIconNative]::SendMessage($f.Handle,0x80,[IntPtr]1,$h)|Out-Null
'   }
'  }
' }catch{}
'}
'try{Add-Type -TypeDefinition 'using System;using System.Runtime.InteropServices;[ComImport,Guid("00021401-0000-0000-C000-000000000046")]class SL{}[ComImport,Guid("0000010b-0000-0000-C000-000000000046"),InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]interface PF{void GetClassID(out Guid g);void IsDirty();void Load([MarshalAs(UnmanagedType.LPWStr)]string f,uint m);void Save([MarshalAs(UnmanagedType.LPWStr)]string f,bool r);void SaveCompleted(string f);void GetCurFile(out string f);}[ComImport,Guid("886D8EEB-8CF2-4446-8D02-CDBA1DBDCF99"),InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]interface PS{uint GetCount();void GetAt(uint i,out K k);void GetValue(ref K k,out V v);void SetValue(ref K k,ref V v);void Commit();}[StructLayout(LayoutKind.Sequential,Pack=4)]struct K{public Guid f;public uint p;public K(uint n){f=new Guid("9F4C2855-9F79-4B39-A8D0-E1D42DE1D5F3");p=n;}}[StructLayout(LayoutKind.Explicit)]struct V{[FieldOffset(0)]public ushort t;[FieldOffset(8)]public IntPtr p;}public static class NI{[DllImport("shell32.dll",CharSet=CharSet.Unicode)]public static extern int SetCurrentProcessExplicitAppUserModelID(string x);static void Put(PS s,uint n,string x){K k=new K(n);V v=new V();v.t=31;v.p=Marshal.StringToCoTaskMemUni(x);try{s.SetValue(ref k,ref v);}finally{Marshal.FreeCoTaskMem(v.p);}}public static void Link(string f){object o=new SL();try{((PF)o).Load(f,2);PS s=(PS)o;Put(s,5,"NLH.ModManager.PublicRelease");s.Commit();((PF)o).Save(f,true);}finally{Marshal.FinalReleaseComObject(o);}}}' -ErrorAction Stop;[NI]::SetCurrentProcessExplicitAppUserModelID("NLH.ModManager.PublicRelease")|Out-Null;foreach($l in $script:NlhLinks){try{[NI]::Link($l)}catch{}}}catch{}
'Add-Type -ReferencedAssemblies @('System.Windows.Forms.dll','System.Drawing.dll') -TypeDefinition @'
'using System.Drawing;
'using System.Windows.Forms;
'public sealed class NlhDarkForm : Form {
' public bool ReadyToShow { get; set; }
' public NlhDarkForm() {
'  BackColor = Color.FromArgb(24,24,27);
'  ForeColor = Color.FromArgb(235,235,240);
'  ReadyToShow = false;
'  SetStyle(ControlStyles.AllPaintingInWmPaint | ControlStyles.OptimizedDoubleBuffer | ControlStyles.UserPaint, true);
'  UpdateStyles();
' }
' protected override CreateParams CreateParams {
'  get { CreateParams cp = base.CreateParams; cp.ExStyle |= 0x02000000; return cp; }
' }
' protected override void SetVisibleCore(bool value) { base.SetVisibleCore(value && ReadyToShow); }
' protected override void OnPaintBackground(PaintEventArgs e) { e.Graphics.Clear(BackColor); }
'}
''@
'Add-Type -AssemblyName System.IO.Compression
'Add-Type -AssemblyName System.IO.Compression.FileSystem
'[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12
'[System.Windows.Forms.Application]::EnableVisualStyles()
'[System.Windows.Forms.Application]::SetCompatibleTextRenderingDefault($false)
'try{
' Add-Type -ReferencedAssemblies @('System.Windows.Forms.dll') -TypeDefinition @'
'using System;
'using System.Windows.Forms;
'public sealed class NlhModalInputFilter : IMessageFilter {
' private readonly Form owner;
' public NlhModalInputFilter(Form form) { owner=form; }
' [System.Runtime.InteropServices.DllImport("user32.dll")] private static extern bool IsChild(IntPtr parent, IntPtr child);
' public bool PreFilterMessage(ref Message m) {
'  if(owner==null || owner.IsDisposed || m.HWnd==IntPtr.Zero) return false;
'  bool targetsOwner=(m.HWnd==owner.Handle || IsChild(owner.Handle,m.HWnd));
'  if(!targetsOwner) return false;
'  if(m.Msg==0x0112 && (((long)m.WParam)&0xFFF0L)==0xF060L) return false;
'  if((m.Msg>=0x0100 && m.Msg<=0x0109) || (m.Msg>=0x0200 && m.Msg<=0x020E)) return true;
'  return false;
' }
'}
'public sealed class NlhMainCloseBridge : NativeWindow, IDisposable {
' private readonly Form main;
' public NlhMainCloseBridge(Form form) { main=form; AssignHandle(form.Handle); }
' protected override void WndProc(ref Message m) {
'  if(m.Msg==0x0010 && main!=null && !main.IsDisposed) { foreach(Form child in main.OwnedForms) { try { if(child!=null && !child.IsDisposed) child.Close(); } catch {} } }
'  base.WndProc(ref m);
' }
' public void Dispose() { try { ReleaseHandle(); } catch {} }
'}
''@
'}catch{}
'function Get-NlhVisualControlTree($Root){
' $items=New-Object System.Collections.ArrayList;$pending=New-Object System.Collections.ArrayList
' foreach($child in @($Root.Controls)){[void]$pending.Add($child)}
' while($pending.Count-gt0){$control=$pending[0];$pending.RemoveAt(0);[void]$items.Add($control);foreach($child in @($control.Controls)){[void]$pending.Add($child)}}
' $items
'}
'$script:NlhOwnedDialogActive=$false
'$script:NlhActiveOwnedDialog=$null
'$script:NlhOwnedDialogSuspended=$false
'$script:NlhPrivateKeyBusyHandoff=$false
'function Invoke-NlhOwnedWindow($Dialog,$Owner){
' if($null-eq$Dialog){return [Windows.Forms.DialogResult]::None}
' if($null-eq$Owner-or$Owner.IsDisposed){return $Dialog.ShowDialog()}
' $Dialog.StartPosition=[Windows.Forms.FormStartPosition]::Manual
' $subCaptionHeight=33;$originalControls=@($Dialog.Controls);foreach($subControl in $originalControls){$subControl.Top+=$subCaptionHeight};$Dialog.ClientSize=New-Object Drawing.Size($Dialog.ClientSize.Width,($Dialog.ClientSize.Height+$subCaptionHeight));$Dialog.FormBorderStyle=[Windows.Forms.FormBorderStyle]::None;$Dialog.MinimizeBox=$false;$Dialog.MaximizeBox=$false
' $subTitleBar=New-Object Windows.Forms.Panel;$subTitleBar.SetBounds(0,0,$Dialog.ClientSize.Width,30);$subTitleBar.Anchor='Top,Left,Right';$subTitleBar.BackColor=$script:NlhCustomAccent
' $subTitleText=New-Object Windows.Forms.Label;$subTitleText.SetBounds(10,5,($Dialog.ClientSize.Width-102),25);$subTitleText.Anchor='Top,Left,Right';$subTitleText.Text=$Dialog.Text;$subTitleText.ForeColor=$script:NlhCustomCaptionText;$subTitleText.BackColor=[Drawing.Color]::Transparent;$subTitleText.TextAlign='MiddleLeft';$subTitleText.Font=New-Object Drawing.Font('Segoe UI',9)
' $subTitleMin=New-Object Windows.Forms.Button;$subTitleMin.SetBounds(($Dialog.ClientSize.Width-92),0,46,30);$subTitleMin.Anchor='Top,Right';$subTitleMin.Text=[char]0x2013;$subTitleMin.FlatStyle='Flat';$subTitleMin.FlatAppearance.BorderSize=0;$subTitleMin.BackColor=$script:NlhCustomAccent;$subTitleMin.ForeColor=$script:NlhCustomCaptionText;$subTitleMin.TabStop=$false;$subTitleMin.Font=New-Object Drawing.Font('Segoe UI Symbol',10);$subTitleMin.FlatAppearance.MouseOverBackColor=[Drawing.Color]::FromArgb(42,255,255,255);$subTitleMin.FlatAppearance.MouseDownBackColor=[Drawing.Color]::FromArgb(70,255,255,255)
' $subTitleClose=New-Object Windows.Forms.Button;$subTitleClose.SetBounds(($Dialog.ClientSize.Width-46),0,46,30);$subTitleClose.Anchor='Top,Right';$subTitleClose.Text=[char]0x00D7;$subTitleClose.FlatStyle='Flat';$subTitleClose.FlatAppearance.BorderSize=0;$subTitleClose.BackColor=$script:NlhCustomAccent;$subTitleClose.ForeColor=$script:NlhCustomCaptionText;$subTitleClose.TabStop=$false;$subTitleClose.Font=New-Object Drawing.Font('Segoe UI Symbol',11);$subTitleClose.FlatAppearance.MouseOverBackColor=[Drawing.Color]::FromArgb(232,17,35);$subTitleClose.FlatAppearance.MouseDownBackColor=[Drawing.Color]::FromArgb(153,27,20)
' $subAccentLine=New-Object Windows.Forms.Panel;$subAccentLine.SetBounds(0,30,$Dialog.ClientSize.Width,3);$subAccentLine.Anchor='Top,Left,Right';$subAccentLine.BackColor=$C.Accent
' $subDrag={param($sender,$e);if($e.Button-eq[Windows.Forms.MouseButtons]::Left){[NlhWindowIconNative]::ReleaseCapture()|Out-Null;[NlhWindowIconNative]::SendMessage($Dialog.Handle,0x00A1,[IntPtr]2,[IntPtr]0)|Out-Null}}.GetNewClosure();$subTitleBar.Add_MouseDown($subDrag);$subTitleText.Add_MouseDown($subDrag)
' $subTitleMin.Add_Click({if($null-ne$Owner-and-not$Owner.IsDisposed){$Owner.WindowState=[Windows.Forms.FormWindowState]::Minimized}}.GetNewClosure());$subTitleClose.Add_Click({$Dialog.Close()}.GetNewClosure());$subTitleBar.Controls.AddRange([Windows.Forms.Control[]]@($subTitleText,$subTitleMin,$subTitleClose));$Dialog.Controls.Add($subTitleBar);$Dialog.Controls.Add($subAccentLine);$subTitleBar.BringToFront();$subAccentLine.BringToFront()
' $workingArea=[Windows.Forms.Screen]::FromControl($Owner).WorkingArea
' $dialogX=$workingArea.Left+[int](($workingArea.Width-$Dialog.Width)/2);$dialogY=$workingArea.Top+[int](($workingArea.Height-$Dialog.Height)/2)
' $Dialog.Location=New-Object Drawing.Point($dialogX,$dialogY)
' $visualStates=New-Object System.Collections.ArrayList;$gridStates=New-Object System.Collections.ArrayList;$cellStates=New-Object System.Collections.ArrayList;$inactiveText=[Drawing.Color]::FromArgb(180,180,186)
' foreach($control in @(Get-NlhVisualControlTree $Owner)){
'  try{[void]$visualStates.Add([pscustomobject]@{Control=$control;ForeColor=$control.ForeColor});if(-not($control-is[Windows.Forms.RichTextBox])-and$control-ne$lblCredit){$control.ForeColor=$inactiveText}}catch{}
'  try{if($control.GetType().FullName-eq'System.Windows.Forms.DataGridView'){[void]$gridStates.Add([pscustomobject]@{Grid=$control;DefaultCellStyle=$control.DefaultCellStyle.Clone();RowsDefaultCellStyle=$control.RowsDefaultCellStyle.Clone();AlternatingRowsDefaultCellStyle=$control.AlternatingRowsDefaultCellStyle.Clone();ColumnHeadersDefaultCellStyle=$control.ColumnHeadersDefaultCellStyle.Clone()});$control.DefaultCellStyle.ForeColor=$inactiveText;$control.RowsDefaultCellStyle.ForeColor=$inactiveText;$control.AlternatingRowsDefaultCellStyle.ForeColor=$inactiveText;$control.ColumnHeadersDefaultCellStyle.ForeColor=$inactiveText;foreach($modalRow in @($control.Rows)){foreach($modalCell in @($modalRow.Cells)){[void]$cellStates.Add([pscustomobject]@{Cell=$modalCell;ForeColor=$modalCell.Style.ForeColor;SelectionForeColor=$modalCell.Style.SelectionForeColor});$modalColumnName=[string]$modalCell.OwningColumn.Name;if($modalColumnName-notin'Status','Version'){$modalCell.Style.ForeColor=$inactiveText;$modalCell.Style.SelectionForeColor=$inactiveText}}}}}catch{}
' }
' try{$versionColor=[Drawing.Color]::FromArgb(218,194,126);$dgv.Columns['Version'].DefaultCellStyle.ForeColor=$versionColor;$dgv.Columns['Version'].DefaultCellStyle.SelectionForeColor=$versionColor;foreach($row in @($dgv.Rows)){$row.Cells['Version'].Style.ForeColor=$versionColor;$row.Cells['Version'].Style.SelectionForeColor=$versionColor}}catch{}
' $script:NlhOwnedDialogActive=$true;$script:NlhActiveOwnedDialog=$Dialog;$script:NlhOwnedDialogSuspended=$false;try{[NlhWindowIconNative]::EnableComposited($Dialog.Handle)}catch{}
' try{foreach($gridState in @($gridStates)){if($null-ne$gridState.Grid-and-not$gridState.Grid.IsDisposed){$gridState.Grid.Invalidate();$gridState.Grid.Update()}};$Owner.Invalidate($true);$Owner.Update();[Windows.Forms.Application]::DoEvents()}catch{}
' $restoreNativeOwnerDisable=$false
' $modalInputFilter=$null
' try{
'  if($script:NlhNativeOwnerDisabled-and$Owner.IsHandleCreated){[NlhModalOwnerNative]::EnableWindow($Owner.Handle,$true)|Out-Null;$restoreNativeOwnerDisable=$true}
'  if($null-ne('NlhModalInputFilter'-as[type])){$modalInputFilter=New-Object NlhModalInputFilter($Owner);[Windows.Forms.Application]::AddMessageFilter($modalInputFilter)}
'  $Dialog.Show($Owner)
'  while(-not$Dialog.IsDisposed-and-not$Owner.IsDisposed){[Windows.Forms.Application]::DoEvents();[Threading.Thread]::Sleep(10)}
'  $result=$Dialog.DialogResult
' }finally{
'  if($null-ne$modalInputFilter){[Windows.Forms.Application]::RemoveMessageFilter($modalInputFilter)}
'  $script:NlhOwnedDialogActive=$false;$script:NlhActiveOwnedDialog=$null;$script:NlhOwnedDialogSuspended=$false
'  if($restoreNativeOwnerDisable-and-not$Owner.IsDisposed-and$Owner.IsHandleCreated){[NlhModalOwnerNative]::EnableWindow($Owner.Handle,$false)|Out-Null}
' }
' foreach($visualState in @($visualStates)){try{if($null-ne$visualState.Control-and-not$visualState.Control.IsDisposed){$visualState.Control.ForeColor=$visualState.ForeColor}}catch{}}
' foreach($cellState in @($cellStates)){try{if($null-ne$cellState.Cell){$cellState.Cell.Style.ForeColor=$cellState.ForeColor;$cellState.Cell.Style.SelectionForeColor=$cellState.SelectionForeColor}}catch{}}
' foreach($gridState in @($gridStates)){try{if($null-ne$gridState.Grid-and-not$gridState.Grid.IsDisposed){$gridState.Grid.DefaultCellStyle=$gridState.DefaultCellStyle;$gridState.Grid.RowsDefaultCellStyle=$gridState.RowsDefaultCellStyle;$gridState.Grid.AlternatingRowsDefaultCellStyle=$gridState.AlternatingRowsDefaultCellStyle;$gridState.Grid.ColumnHeadersDefaultCellStyle=$gridState.ColumnHeadersDefaultCellStyle}}catch{}}
' if($script:NlhTextDisabledDepth-le0){try{Restore-PreferenceCheckboxes}catch{};try{Update-BulkConfigButton}catch{}}
' if($script:NlhPrivateKeyBusyHandoff){$script:NlhPrivateKeyBusyHandoff=$false}else{try{$Owner.UseWaitCursor=$false;$Owner.Cursor=[Windows.Forms.Cursors]::Default;$Owner.Invalidate($true);$Owner.Refresh();$Owner.Update()}catch{}}
' try{if(-not$Dialog.IsDisposed){$Dialog.Dispose()}}catch{}
' $result
'}
'try{Add-Type -TypeDefinition @'
'using System;
'using System.Runtime.InteropServices;
'public static class NlhModalOwnerNative {
' [DllImport("user32.dll", SetLastError=true)] public static extern bool EnableWindow(IntPtr hWnd, bool enable);
'}
''@}catch{}
'$script:NlhNativeOwnerDisabled=$false
'try{Add-Type -TypeDefinition @'
'using System;
'using System.Runtime.InteropServices;
'public static class NlhAtomicRedrawNative {
' [DllImport("user32.dll")] public static extern IntPtr SendMessage(IntPtr hWnd,uint msg,IntPtr wParam,IntPtr lParam);
' [DllImport("user32.dll", SetLastError=true)] public static extern bool RedrawWindow(IntPtr hWnd,IntPtr updateRect,IntPtr updateRegion,uint flags);
'}
''@}catch{}
'$script:NlhKeyHandoffRedrawSuspended=$false
'function Suspend-NlhMainRedraw {try{if($form.IsHandleCreated){[NlhAtomicRedrawNative]::SendMessage($form.Handle,0x000B,[IntPtr]::Zero,[IntPtr]::Zero)|Out-Null}}catch{}}
'function Resume-NlhMainRedraw {try{if($form.IsHandleCreated){[NlhAtomicRedrawNative]::SendMessage($form.Handle,0x000B,[IntPtr]1,[IntPtr]::Zero)|Out-Null;[NlhAtomicRedrawNative]::RedrawWindow($form.Handle,[IntPtr]::Zero,[IntPtr]::Zero,0x0001-bor0x0080-bor0x0100-bor0x0400)|Out-Null;$form.Update()}}catch{}}
'$script:NlhTextDisabledDepth=0
'$script:NlhTextDisabledVisualStates=$null
'$script:NlhTextDisabledTimer=$null
'function Start-NlhTextDisabledState {
' $script:NlhTextDisabledDepth++
' if($script:NlhTextDisabledDepth-gt1){return}
' $inactiveText=[Drawing.Color]::FromArgb(180,180,186)
' $script:NlhTextDisabledVisualStates=New-Object System.Collections.ArrayList
' $script:NlhTextDisabledGridStates=New-Object System.Collections.ArrayList
' foreach($control in @(Get-NlhVisualControlTree $form)){try{if($control.GetType().FullName-eq'System.Windows.Forms.DataGridView'){[void]$script:NlhTextDisabledGridStates.Add([pscustomobject]@{Grid=$control;DefaultCellStyle=$control.DefaultCellStyle.Clone();RowsDefaultCellStyle=$control.RowsDefaultCellStyle.Clone();AlternatingRowsDefaultCellStyle=$control.AlternatingRowsDefaultCellStyle.Clone();ColumnHeadersDefaultCellStyle=$control.ColumnHeadersDefaultCellStyle.Clone()})}}catch{};try{[void]$script:NlhTextDisabledVisualStates.Add([pscustomobject]@{Control=$control;ForeColor=$control.ForeColor;Enabled=$control.Enabled});if(-not($control-is[Windows.Forms.RichTextBox])-and$control-ne$lblCredit){$control.ForeColor=$inactiveText}}catch{}}
' $owner=$form
' $tick={try{$pending=New-Object System.Collections.ArrayList;foreach($child in @($owner.Controls)){[void]$pending.Add($child)};while($pending.Count-gt0){$control=$pending[0];$pending.RemoveAt(0);foreach($child in @($control.Controls)){[void]$pending.Add($child)};try{if(-not($control-is[Windows.Forms.RichTextBox])-and$control-ne$lblCredit){$control.ForeColor=$inactiveText}}catch{};try{if($control.GetType().FullName-eq'System.Windows.Forms.DataGridView'){$control.DefaultCellStyle.ForeColor=$inactiveText;$control.RowsDefaultCellStyle.ForeColor=$inactiveText;$control.AlternatingRowsDefaultCellStyle.ForeColor=$inactiveText;$control.ColumnHeadersDefaultCellStyle.ForeColor=$inactiveText;$versionColor=[Drawing.Color]::FromArgb(218,194,126);$control.Columns['Version'].DefaultCellStyle.ForeColor=$versionColor;$control.Columns['Version'].DefaultCellStyle.SelectionForeColor=$versionColor;foreach($row in @($control.Rows)){$row.Cells['Version'].Style.ForeColor=$versionColor;$row.Cells['Version'].Style.SelectionForeColor=$versionColor};$control.Invalidate()}}catch{}};$owner.Invalidate($true);$owner.Update()}catch{}}.GetNewClosure()
' $script:NlhTextDisabledTimer=New-Object Windows.Forms.Timer;$script:NlhTextDisabledTimer.Interval=60;$script:NlhTextDisabledTimer.Add_Tick($tick);$script:NlhTextDisabledTimer.Start()
' try{$form.Invalidate($true);$form.Update();[Windows.Forms.Application]::DoEvents()}catch{}
'}
'function Activate-NlhExactOwnerDisabledState {
' foreach($state in @($script:NlhTextDisabledVisualStates)){try{if($null-ne$state.Control-and-not$state.Control.IsDisposed){$state.Control.Enabled=[bool]$state.Enabled}}catch{}}
' try{Restore-PreferenceCheckboxes}catch{};try{Update-BulkConfigButton}catch{}
' try{if($form.IsHandleCreated){[NlhModalOwnerNative]::EnableWindow($form.Handle,$false)|Out-Null;$script:NlhNativeOwnerDisabled=$true;$form.Invalidate($true);$form.Update();[Windows.Forms.Application]::DoEvents()}}catch{}
'}
'function Stop-NlhRefreshDisabledStateImmediately {
' if($script:NlhTextDisabledDepth-le0){$script:NlhTextDisabledDepth=0;return}
' $script:NlhTextDisabledDepth=0
' try{if($script:NlhNativeOwnerDisabled-and$form.IsHandleCreated){[NlhModalOwnerNative]::EnableWindow($form.Handle,$true)|Out-Null;$script:NlhNativeOwnerDisabled=$false}}catch{}
' try{if($null-ne$script:NlhTextDisabledTimer){$script:NlhTextDisabledTimer.Stop();$script:NlhTextDisabledTimer.Dispose()}}catch{};$script:NlhTextDisabledTimer=$null
' foreach($state in @($script:NlhTextDisabledVisualStates)){try{if($null-ne$state.Control-and-not$state.Control.IsDisposed){$state.Control.ForeColor=$state.ForeColor}}catch{}}
' foreach($gridState in @($script:NlhTextDisabledGridStates)){try{if($null-ne$gridState.Grid-and-not$gridState.Grid.IsDisposed){$gridState.Grid.DefaultCellStyle=$gridState.DefaultCellStyle;$gridState.Grid.RowsDefaultCellStyle=$gridState.RowsDefaultCellStyle;$gridState.Grid.AlternatingRowsDefaultCellStyle=$gridState.AlternatingRowsDefaultCellStyle;$gridState.Grid.ColumnHeadersDefaultCellStyle=$gridState.ColumnHeadersDefaultCellStyle}}catch{}}
' $script:NlhTextDisabledVisualStates=$null;$script:NlhTextDisabledGridStates=$null
' try{Restore-PreferenceCheckboxes}catch{};try{Update-BulkConfigButton}catch{}
' try{$dgv.ClearSelection();$dgv.CurrentCell=$null;$dgv.Invalidate();$dgv.Update();$form.Invalidate($true);$form.Update()}catch{}
'}
'function Apply-NlhRefreshGridDisabledStateImmediately {
' $inactiveText=[Drawing.Color]::FromArgb(180,180,186);$versionColor=[Drawing.Color]::FromArgb(218,194,126)
' try{if($null-ne$dgv-and-not$dgv.IsDisposed){$dgv.DefaultCellStyle.ForeColor=$inactiveText;$dgv.RowsDefaultCellStyle.ForeColor=$inactiveText;$dgv.AlternatingRowsDefaultCellStyle.ForeColor=$inactiveText;$dgv.ColumnHeadersDefaultCellStyle.ForeColor=$inactiveText;$dgv.Columns['Version'].DefaultCellStyle.ForeColor=$versionColor;$dgv.Columns['Version'].DefaultCellStyle.SelectionForeColor=$versionColor;$dgv.Invalidate()}}catch{}
'}
'function Stop-NlhTextDisabledState {
' if($script:NlhTextDisabledDepth-le0){$script:NlhTextDisabledDepth=0;return}
' $script:NlhTextDisabledDepth--
' if($script:NlhTextDisabledDepth-gt0){return}
' try{if($script:NlhNativeOwnerDisabled-and$form.IsHandleCreated){[NlhModalOwnerNative]::EnableWindow($form.Handle,$true)|Out-Null;$script:NlhNativeOwnerDisabled=$false}}catch{}
' try{if($null-ne$script:NlhTextDisabledTimer){$script:NlhTextDisabledTimer.Stop();$script:NlhTextDisabledTimer.Dispose()}}catch{};$script:NlhTextDisabledTimer=$null
' foreach($state in @($script:NlhTextDisabledVisualStates)){try{if($null-ne$state.Control-and-not$state.Control.IsDisposed){$state.Control.ForeColor=$state.ForeColor}}catch{}}
' foreach($gridState in @($script:NlhTextDisabledGridStates)){try{if($null-ne$gridState.Grid-and-not$gridState.Grid.IsDisposed){$gridState.Grid.DefaultCellStyle=$gridState.DefaultCellStyle;$gridState.Grid.RowsDefaultCellStyle=$gridState.RowsDefaultCellStyle;$gridState.Grid.AlternatingRowsDefaultCellStyle=$gridState.AlternatingRowsDefaultCellStyle;$gridState.Grid.ColumnHeadersDefaultCellStyle=$gridState.ColumnHeadersDefaultCellStyle}}catch{}}
' $script:NlhTextDisabledVisualStates=$null
' try{if($null-ne$dgv-and-not$dgv.IsDisposed){foreach($row in @($dgv.Rows)){if($null-ne$row.Tag){Update-Row $row}}}}catch{}
' try{foreach($row in @($dgv.Rows)){$row.Cells['Version'].Style.ForeColor=[Drawing.Color]::Empty;$row.Cells['Version'].Style.SelectionForeColor=[Drawing.Color]::Empty}}catch{}
' try{Restore-PreferenceCheckboxes}catch{};try{Update-BulkConfigButton}catch{};try{$form.Invalidate($true);$form.Refresh();$form.Update()}catch{}
'}
'$C = @{
' Form=[Drawing.Color]::FromArgb(24,24,26); Surface=[Drawing.Color]::FromArgb(32,32,35)
' Surface2=[Drawing.Color]::FromArgb(39,39,43); Header=[Drawing.Color]::FromArgb(45,45,49)
' Border=[Drawing.Color]::FromArgb(66,66,72); Text=[Drawing.Color]::FromArgb(235,235,238)
' Muted=[Drawing.Color]::FromArgb(174,174,182); Accent=[Drawing.Color]::FromArgb(186,48,55)
' AccentHot=[Drawing.Color]::FromArgb(210,62,69); AccentDown=[Drawing.Color]::FromArgb(145,36,42)
' Green=[Drawing.Color]::FromArgb(100,205,135); Orange=[Drawing.Color]::FromArgb(244,167,72)
' DangerBg=[Drawing.Color]::FromArgb(74,35,39); DangerFg=[Drawing.Color]::FromArgb(255,174,178)
'}
'function Style-Button($Button,$Back,$Fore,$Border,$Hover) {
' $Button.FlatStyle='Flat'; $Button.FlatAppearance.BorderSize=1; $Button.FlatAppearance.BorderColor=$Border
' $Button.FlatAppearance.MouseOverBackColor=$Hover; $Button.FlatAppearance.MouseDownBackColor=$C.AccentDown
' $Button.BackColor=$Back; $Button.ForeColor=$Fore; $Button.Cursor=[Windows.Forms.Cursors]::Hand
' $Button.Font=New-Object Drawing.Font('Segoe UI Semibold',9)
'}
'function Set-ApplyOnlyAvailable([bool]$Available) {
' $btnApplyOnly.Tag=$Available
' if($Available){
'  $btnApplyOnly.BackColor=$C.Header;$btnApplyOnly.ForeColor=[Drawing.Color]::White;$btnApplyOnly.FlatAppearance.BorderColor=$C.Muted
'  $btnApplyOnly.FlatAppearance.MouseOverBackColor=$C.Surface2;$btnApplyOnly.FlatAppearance.MouseDownBackColor=$C.AccentDown;$btnApplyOnly.Cursor=[Windows.Forms.Cursors]::Hand
' }else{
'  $inactiveBack=[Drawing.Color]::FromArgb(42,42,46)
'  $btnApplyOnly.BackColor=$inactiveBack;$btnApplyOnly.ForeColor=[Drawing.Color]::FromArgb(180,180,186);$btnApplyOnly.FlatAppearance.BorderColor=[Drawing.Color]::FromArgb(82,82,88)
'  $btnApplyOnly.FlatAppearance.MouseOverBackColor=$inactiveBack;$btnApplyOnly.FlatAppearance.MouseDownBackColor=$inactiveBack;$btnApplyOnly.Cursor=[Windows.Forms.Cursors]::Default
' }
'}
'function Set-ClearLogAvailable([bool]$Available) {
' if($null-eq$btnClearLog-or$btnClearLog.IsDisposed-or$btnClearLog.Disposing){return}
' $btnClearLog.Tag=$Available
' if($Available){
'  $btnClearLog.BackColor=$C.Surface2;$btnClearLog.ForeColor=$C.Text;$btnClearLog.FlatAppearance.BorderColor=$C.Border
'  $btnClearLog.FlatAppearance.MouseOverBackColor=$C.Header;$btnClearLog.FlatAppearance.MouseDownBackColor=$C.AccentDown;$btnClearLog.Cursor=[Windows.Forms.Cursors]::Hand
' }else{
'  $inactiveBack=[Drawing.Color]::FromArgb(42,42,46)
'  $btnClearLog.BackColor=$inactiveBack;$btnClearLog.ForeColor=[Drawing.Color]::FromArgb(180,180,186);$btnClearLog.FlatAppearance.BorderColor=[Drawing.Color]::FromArgb(82,82,88)
'  $btnClearLog.FlatAppearance.MouseOverBackColor=$inactiveBack;$btnClearLog.FlatAppearance.MouseDownBackColor=$inactiveBack;$btnClearLog.Cursor=[Windows.Forms.Cursors]::Default
' }
'}
'function Log([string]$Text,[string]$ColorName='Gainsboro') {
' try{
'  if($Text-match'(?i)private\s+(?:hash|access|cleanup)|revok(?:e|ed|ing|ation)|private mod verification'){return}
'  if($null-eq$txtLog-or$txtLog.IsDisposed-or$txtLog.Disposing-or-not$txtLog.IsHandleCreated){return}
'  $now=[Diagnostics.Stopwatch]::GetTimestamp()
'  if($script:LastLogText-eq$Text-and$script:LastLogColor-eq$ColorName-and$script:LastLogTick){$elapsedMs=(($now-$script:LastLogTick)*1000.0/[Diagnostics.Stopwatch]::Frequency);if($elapsedMs-lt750){return}}
'  $script:LastLogText=$Text;$script:LastLogColor=$ColorName;$script:LastLogTick=$now
'  $txtLog.SelectionStart=$txtLog.TextLength;$txtLog.SelectionLength=0;$txtLog.SelectionColor=[Drawing.Color]::FromName($ColorName);$txtLog.AppendText("$Text`r`n");$txtLog.ScrollToCaret()
'  if($null-ne$btnClearLog-and-not$btnClearLog.IsDisposed-and-not$btnClearLog.Disposing){Set-ClearLogAvailable ($txtLog.TextLength-gt0)}
' }catch [ObjectDisposedException]{return}catch{return}
'}
'function Safe-Name([string]$Name) { $Name -replace '[<>:"/\\|?*]','_' }
'function Get-NlhIpcName([string]$Token,[string]$Kind){if([string]::IsNullOrWhiteSpace($Token)){return $null};'Local\NLH_MM_'+$Token+'_'+$Kind}
'function Open-NlhIpcMap([string]$Token,[bool]$Create=$false){if([string]::IsNullOrWhiteSpace($Token)){return $null};$name=Get-NlhIpcName $Token 'Progress';try{if($Create){return [IO.MemoryMappedFiles.MemoryMappedFile]::CreateOrOpen($name,4096,[IO.MemoryMappedFiles.MemoryMappedFileAccess]::ReadWrite)}else{return [IO.MemoryMappedFiles.MemoryMappedFile]::OpenExisting($name,[IO.MemoryMappedFiles.MemoryMappedFileRights]::ReadWrite)}}catch{return $null}}
'function Write-NlhIpcProgress([string]$Token,[int]$Percent,[string]$Status){$map=Open-NlhIpcMap $Token $false;if($null-eq$map){return};try{$text=([string]$Percent+'|'+$Status);$bytes=[Text.Encoding]::UTF8.GetBytes($text);$view=$map.CreateViewAccessor(0,4096,[IO.MemoryMappedFiles.MemoryMappedFileAccess]::Write);try{$view.Write(0,[int]$bytes.Length);$view.WriteArray(4,$bytes,0,$bytes.Length)}finally{$view.Dispose()}}finally{$map.Dispose()}}
'function Read-NlhIpcProgress([string]$Token){$map=Open-NlhIpcMap $Token $false;if($null-eq$map){return ''};try{$view=$map.CreateViewAccessor(0,4096,[IO.MemoryMappedFiles.MemoryMappedFileAccess]::Read);try{$length=$view.ReadInt32(0);if($length-le0-or$length-gt4092){return ''};$bytes=New-Object byte[] $length;$null=$view.ReadArray(4,$bytes,0,$length);[Text.Encoding]::UTF8.GetString($bytes)}finally{$view.Dispose()}}finally{$map.Dispose()}}
'function Open-NlhIpcEvent([string]$Token,[string]$Kind,[bool]$Create=$false){if([string]::IsNullOrWhiteSpace($Token)){return $null};$name=Get-NlhIpcName $Token $Kind;try{if($Create){$made=$false;return New-Object Threading.EventWaitHandle($false,[Threading.EventResetMode]::ManualReset,$name,[ref]$made)}else{return [Threading.EventWaitHandle]::OpenExisting($name)}}catch{return $null}}
'function Set-NlhIpcEvent([string]$Token,[string]$Kind){$event=Open-NlhIpcEvent $Token $Kind $false;if($null-ne$event){try{$event.Set()|Out-Null}finally{$event.Dispose()}}}
'function Test-NlhIpcEvent([string]$Token,[string]$Kind){$event=Open-NlhIpcEvent $Token $Kind $false;if($null-eq$event){return $false};try{return $event.WaitOne(0)}finally{$event.Dispose()}}
'function Send-LauncherProgress([int]$Percent,[string]$Status){if(-not[string]::IsNullOrWhiteSpace([string]$env:NLH_LAUNCH_HANDOFF)){Write-NlhIpcProgress ([string]$env:NLH_LAUNCH_HANDOFF) $Percent $Status}}
'function Update-InstallLocationDisplay {
' if($chkShowFilePaths.Checked){$lblFolder.Text='Install location: Hidden for privacy'}
' else{$lblFolder.Text="Install location: $script:DestRoot"}
'}
'function Version-Key([string]$Version) {
' $nums=[regex]::Matches($Version,'\d+') | ForEach-Object { $_.Value.PadLeft(10,'0') }
' if($nums.Count){ return ($nums -join '.') }
' return $Version.ToLowerInvariant()
'}
'function Select-NewestPerCharacter([object[]]$Mods) {
' # One entry per character: the highest version only (same rule as the catalog).
' @(@($Mods)|Where-Object{$null -ne $_}|Group-Object Character|ForEach-Object{$_.Group|Sort-Object{Version-Key([string]$_.Version)}-Descending|Select-Object -First 1})
'}
'function Invoke-GitHub([string]$Uri) {
' $headers=@{'User-Agent'='NLH-Mods-Downloader';'Accept'='application/vnd.github+json';'X-GitHub-Api-Version'='2022-11-28';'Cache-Control'='no-cache';'Pragma'='no-cache'}
' $separator=if($Uri.Contains('?')){'&'}else{'?'};$freshUri=$Uri+$separator+'_nlh=' + [DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()
' $worker=[PowerShell]::Create();$null=$worker.AddScript({param($u,$h)Invoke-RestMethod -Uri $u -Headers $h -Method Get -TimeoutSec 8}).AddArgument($freshUri).AddArgument($headers);$pending=$worker.BeginInvoke();try{while(-not$pending.IsCompleted){[Windows.Forms.Application]::DoEvents();[Threading.Thread]::Sleep(8)};@($worker.EndInvoke($pending))}finally{$worker.Dispose()}
'}
'function Get-DriveChildren([string]$FolderId){
' $q="'$FolderId' in parents and trashed = false"
' $uri="https://www.googleapis.com/drive/v3/files?q=$([uri]::EscapeDataString($q))&key=$DriveApiKey&fields=files(id,name,mimeType,modifiedTime)&pageSize=1000"
' $worker=[PowerShell]::Create();$null=$worker.AddScript({param($u)Invoke-RestMethod -Uri $u -Method Get -TimeoutSec 10}).AddArgument($uri);$pending=$worker.BeginInvoke();try{while(-not$pending.IsCompleted){[Windows.Forms.Application]::DoEvents();[Threading.Thread]::Sleep(8)};$response=@($worker.EndInvoke($pending))|Select-Object -First 1;@($response.files)}finally{$worker.Dispose()}
'}
'function Get-DriveVersionKey([string]$Name){$nums=[regex]::Matches($Name,'\d+')|ForEach-Object{$_.Value.PadLeft(10,'0')};if($nums.Count){$nums-join'.'}else{$Name.ToLowerInvariant()}}
'function Get-DriveCatalog {
' $mods=New-Object System.Collections.Generic.List[object]
' $privatePattern=[regex]::new('^(?<base>.+)_Private\.txt$',[Text.RegularExpressions.RegexOptions]::IgnoreCase)
' $changePattern=[regex]::new('^(?<base>.+)_Changelog\.txt$',[Text.RegularExpressions.RegexOptions]::IgnoreCase)
' $githubAvailable=$false;try{$githubRoot=@(Invoke-GitHub "https://api.github.com/repos/$Owner/$Repository/contents?ref=$Branch");$githubAvailable=$true}catch{$githubRoot=@()}
' $githubFiles=@{};foreach($item in $githubRoot){if([string]$item.type-eq'file'){$githubFiles[(Get-MetadataKey ([string]$item.name))]=$item}}
' $rootItems=@(Get-DriveChildren $DriveRootFolderId);$rootFiles=@($rootItems|Where-Object mimeType -ne 'application/vnd.google-apps.folder')
' foreach($char in @($rootItems|Where-Object mimeType -eq 'application/vnd.google-apps.folder')){
'  $charItems=@(Get-DriveChildren $char.id);$versions=@($charItems|Where-Object mimeType -eq 'application/vnd.google-apps.folder');if(-not$versions.Count){continue}
'  $latest=$versions|Sort-Object{Get-DriveVersionKey([string]$_.name)}-Descending|Select-Object -First 1
'  $versionItems=@(Get-DriveChildren $latest.id);$payloadFiles=@($versionItems|Where-Object mimeType -ne 'application/vnd.google-apps.folder');if(-not$payloadFiles.Count){continue}
'  $base=([string]$char.name)+'_'+([string]$latest.name);$metadataKey=Get-MetadataKey $base;$allMetadataFiles=@($rootFiles+@($charItems|Where-Object mimeType -ne 'application/vnd.google-apps.folder')+$payloadFiles)
'  $private=$null;$change=$null
'  foreach($sidecar in $allMetadataFiles){$name=[string]$sidecar.name;$match=$privatePattern.Match($name);if($match.Success-and(Get-MetadataKey $match.Groups['base'].Value)-eq$metadataKey){$private=$sidecar;continue};$match=$changePattern.Match($name);if($match.Success-and(Get-MetadataKey $match.Groups['base'].Value)-eq$metadataKey){$change=$sidecar}}
'  $privateName=$base+'_Private.txt';$changeName=$base+'_Changelog.txt';$githubPrivateKey=Get-MetadataKey $privateName;$githubChangeKey=Get-MetadataKey $changeName;$githubPrivate=if($githubFiles.ContainsKey($githubPrivateKey)){$githubFiles[$githubPrivateKey]}else{$null};$githubChange=if($githubFiles.ContainsKey($githubChangeKey)){$githubFiles[$githubChangeKey]}else{$null}
'  $githubPrivateFound=($null-ne$githubPrivate);$githubChangeFound=($null-ne$githubChange)
'  $mods.Add([pscustomobject]@{Character=[string]$char.name;Version=[string]$latest.name;DownloadUrl=$null;DriveFolderId=[string]$latest.id;FileName=(Safe-Name($base)+'.zip');IsPrivate=$(if($githubAvailable){$githubPrivateFound}else{($null-ne$private)});PrivateUrl=$(if($githubAvailable-and$githubPrivate){[string]$githubPrivate.download_url}else{$null});PrivateApiUrl=$(if($githubAvailable-and$githubPrivateFound){Get-GitHubRootFileApiUrl $privateName}else{$null});PrivateDriveFileId=$(if(-not$githubAvailable-and$private){[string]$private.id}else{$null});HasChangelog=($null-ne$change-or$githubChangeFound)})
' }
' @($mods|Sort-Object Character)
'}
'function Get-DriveFallbackBytes($Mod){
' $folderId=[string]$Mod.DriveFolderId
' if([string]::IsNullOrWhiteSpace($folderId)){
'  $char=Get-DriveChildren $DriveRootFolderId|Where-Object{$_.mimeType-eq'application/vnd.google-apps.folder'-and$_.name-ieq$Mod.Character}|Select-Object -First 1
'  if(-not$char){throw 'The requested mod could not be found in the backup source.'}
'  $version=Get-DriveChildren $char.id|Where-Object{$_.mimeType-eq'application/vnd.google-apps.folder'-and$_.name-ieq$Mod.Version}|Select-Object -First 1
'  if(-not$version){throw 'The requested version could not be found in the backup source.'};$folderId=[string]$version.id
' }
' $files=@(Get-DriveChildren $folderId|Where-Object mimeType -ne 'application/vnd.google-apps.folder')
' if(-not$files.Count){throw 'The backup source contains no downloadable files for this version.'}
' $memory=New-Object IO.MemoryStream
' $archive=New-Object IO.Compression.ZipArchive($memory,[IO.Compression.ZipArchiveMode]::Create,$true)
' try{
'  foreach($file in $files){
'   $uri="https://www.googleapis.com/drive/v3/files/$($file.id)?alt=media&key=$DriveApiKey"
'   $wc=New-Object Net.WebClient;$wc.Headers['User-Agent']='NLH-Mod-Manager';try{$data=$wc.DownloadData($uri)}finally{$wc.Dispose()}
'   $entry=$archive.CreateEntry([string]$file.name,[IO.Compression.CompressionLevel]::NoCompression);$stream=$entry.Open();try{$stream.Write($data,0,$data.Length)}finally{$stream.Dispose()}
'  }
' }finally{$archive.Dispose()}
' try{$memory.ToArray()}finally{$memory.Dispose()}
'}
'function Get-MetadataKey([string]$Name){
' if([string]::IsNullOrWhiteSpace($Name)){return ''}
' $value=[Net.WebUtility]::HtmlDecode($Name).Normalize([Text.NormalizationForm]::FormKC)
' ([regex]::Replace($value,'[^A-Za-z0-9]','')).ToLowerInvariant()
'}
'function Get-RemoteText([string]$Url,[string]$DriveFileId){
' if(-not[string]::IsNullOrWhiteSpace($Url)){
'  $separator=if($Url.Contains('?')){'&'}else{'?'}
'  $freshUrl=$Url+$separator+'_nlh=' + [DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()
'  $headers=@{'User-Agent'='NLH-Mod-Manager';'Cache-Control'='no-cache, no-store, max-age=0';'Pragma'='no-cache'}
'  return [Net.WebUtility]::HtmlDecode((Invoke-WebRequest -Uri $freshUrl -Headers $headers -UseBasicParsing -TimeoutSec 10).Content).Trim()
' }
' if(-not[string]::IsNullOrWhiteSpace($DriveFileId)){$uri="https://www.googleapis.com/drive/v3/files/${DriveFileId}?alt=media&key=$DriveApiKey&_nlh=$([DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds())";$wc=New-Object Net.WebClient;$wc.Headers['User-Agent']='NLH-Mod-Manager';$wc.Headers['Cache-Control']='no-cache, no-store, max-age=0';$wc.Headers['Pragma']='no-cache';try{return ([Text.Encoding]::UTF8.GetString($wc.DownloadData($uri))).Trim()}finally{$wc.Dispose()}}
' ''
'}
'function Get-GitHubRootFileApiUrl([string]$FileName){
' $encoded=[uri]::EscapeDataString($FileName).Replace('%2F','/')
' "https://api.github.com/repos/$Owner/$Repository/contents/${encoded}?ref=$Branch"
'}
'function Get-KeyHash([string]$Value){$sha=[Security.Cryptography.SHA256]::Create();try{([BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($Value)))).Replace('-','').ToLowerInvariant()}finally{$sha.Dispose()}}
'function Get-PrivateModId($Mod){Get-KeyHash (([string]$Mod.Character).Trim().ToLowerInvariant()+'|'+([string]$Mod.Version).Trim().ToLowerInvariant())}
'function Merge-SavedPrivateCandidates([object[]]$Catalog) {
' $merged=New-Object System.Collections.Generic.List[object]
' foreach($item in @($Catalog)){if($null-ne$item){$merged.Add($item)}}
' try{
'  if(Test-Path -LiteralPath $PrivateModRegPath){
'   foreach($key in @(Get-ChildItem -LiteralPath $PrivateModRegPath -ErrorAction SilentlyContinue)){
'    if($key.PSChildName-notmatch'^[0-9a-fA-F]{64}$'){continue}
'    $props=Get-ItemProperty -LiteralPath $key.PSPath -ErrorAction SilentlyContinue
'    $character=([string]$props.Character).Trim();$version=([string]$props.Version).Trim();$fileName=([string]$props.FileName).Trim();$authorizedHash=([string]$props.AuthorizedHash).Trim().ToLowerInvariant()
'    if([string]::IsNullOrWhiteSpace($character)-or[string]::IsNullOrWhiteSpace($version)-or[string]::IsNullOrWhiteSpace($fileName)-or$authorizedHash-notmatch'^[0-9a-f]{64}$'){continue}
'    $candidate=[pscustomobject]@{Character=$character;Version=$version;DownloadUrl=([string]$props.DownloadUrl);DriveFolderId=$(if([string]::IsNullOrWhiteSpace([string]$props.DriveFolderId)){$null}else{[string]$props.DriveFolderId});FileName=$fileName;IsPrivate=$true;PrivateUrl=([string]$props.PrivateUrl);PrivateApiUrl=$(if([string]::IsNullOrWhiteSpace([string]$props.PrivateApiUrl)){$null}else{[string]$props.PrivateApiUrl});PrivateDriveFileId=$(if([string]::IsNullOrWhiteSpace([string]$props.PrivateDriveFileId)){$null}else{[string]$props.PrivateDriveFileId});HasChangelog=$false}
'    $candidateId=Get-PrivateModId $candidate
'    if($candidateId-ne$key.PSChildName.ToLowerInvariant()){continue}
'    $existing=$merged|Where-Object{(Get-PrivateModId $_)-eq$candidateId}|Select-Object -First 1
'    if($null-eq$existing){$merged.Add($candidate)}
'   }
'  }
' }catch{}
' @($merged.ToArray())
'}
'# NLH_VERIFY_ALL_INSTALLED_VERSIONS
'function Get-InstalledVersionCandidates {
' # Locked versions you still have installed must have their key re-checked even when they are not the newest version
' # and have no saved unlock record. Returns every installed Character\Version folder that matches a version listed on GitHub
' # and is not already in the normal check list. These are check-only: they never add a row to the mod list.
' $found=New-Object System.Collections.Generic.List[object]
' try{
'  $seen=@{};foreach($known in @($script:AllCatalogMods)){if($null -ne $known){$seen[(Get-PrivateModId $known)]=$true}}
'  foreach($candidate in @($script:AllVersionsCatalog)){
'   if($null -eq $candidate){continue}
'   $candidateId=Get-PrivateModId $candidate
'   if($seen.ContainsKey($candidateId)){continue}
'   $versionFolder=Join-Path $DestRoot (Join-Path (Safe-Name ([string]$candidate.Character)) (Safe-Name ([string]$candidate.Version)))
'   if(-not(Test-Path -LiteralPath $versionFolder -PathType Container)){continue}
'   $seen[$candidateId]=$true
'   $candidate|Add-Member -NotePropertyName VerifyOnly -NotePropertyValue $true -Force
'   $found.Add($candidate)
'  }
' }catch{}
' @($found.ToArray())
'}
'function Test-SavedPrivateHash([string]$Expected){if([string]::IsNullOrWhiteSpace($Expected)){return $false};$normalized=$Expected.Trim().ToLowerInvariant();foreach($savedHash in @($script:SavedPrivateUnlocks.Values)){if(([string]$savedHash).Trim().ToLowerInvariant()-eq$normalized){return $true}};$false}
'function Test-AuthorizedPrivateHash([string]$Expected){
' if([string]::IsNullOrWhiteSpace($Expected)){return $false}
' $normalized=$Expected.Trim().ToLowerInvariant();if($normalized-notmatch'^[0-9a-f]{64}$'){return $false}
' if($script:AuthorizedPrivateHashes.ContainsKey($normalized)){return $true}
' if(Test-SavedPrivateHash $normalized){$script:AuthorizedPrivateHashes[$normalized]=$true;return $true}
' try{$authorizedPath=Join-Path $PrivateHashRegPath $normalized;if(Test-Path -LiteralPath $authorizedPath -PathType Container){$script:SavedPrivateUnlocks[$normalized]=$normalized;$script:AuthorizedPrivateHashes[$normalized]=$true;return $true}}catch{}
' $false
'}
'function Save-PrivateUnlocks {
' if(-not(Test-Path -LiteralPath $PrivateHashRegPath)){New-Item -Path $PrivateHashRegPath -Force|Out-Null}
' foreach($savedHash in @($script:SavedPrivateUnlocks.Values)){$hash=([string]$savedHash).Trim().ToLowerInvariant();if($hash-match'^[0-9a-f]{64}$'){$path=Join-Path $PrivateHashRegPath $hash;if(-not(Test-Path -LiteralPath $path)){New-Item -Path $path -Force|Out-Null};New-ItemProperty -LiteralPath $path -Name 'Authorized' -Value 1 -PropertyType DWord -Force|Out-Null}}
'}
'function Save-KnownPrivateHashes {
' if(-not(Test-Path -LiteralPath $PrivateModRegPath)){New-Item -Path $PrivateModRegPath -Force|Out-Null}
' foreach($id in @($script:KnownPrivateMods.Keys)){$normalizedId=([string]$id).Trim().ToLowerInvariant();if($normalizedId-notmatch'^[0-9a-f]{64}$'){continue};$path=Join-Path $PrivateModRegPath $normalizedId;if(-not(Test-Path -LiteralPath $path)){New-Item -Path $path -Force|Out-Null};if($script:KnownPrivateHashes.ContainsKey($normalizedId)){$hash=([string]$script:KnownPrivateHashes[$normalizedId]).Trim().ToLowerInvariant();if($hash-match'^[0-9a-f]{64}$'){Set-ItemProperty -LiteralPath $path -Name 'CurrentHash' -Value $hash -Type String -Force}};if($script:AuthorizedPrivateModHashes.ContainsKey($normalizedId)){$authorizedHash=([string]$script:AuthorizedPrivateModHashes[$normalizedId]).Trim().ToLowerInvariant();if($authorizedHash-match'^[0-9a-f]{64}$'){Set-ItemProperty -LiteralPath $path -Name 'AuthorizedHash' -Value $authorizedHash -Type String -Force}}}
'}
'function Get-PrivateExpectedHash($Mod){
' if(-not$Mod.IsPrivate){return $null}
' $cacheKey=Get-PrivateModId $Mod
' if($script:PrivateExpectedHashCache.ContainsKey($cacheKey)){return [string]$script:PrivateExpectedHashCache[$cacheKey]}
' try{
'  $zip=[string]$Mod.FileName;$base=if($zip.EndsWith('.zip',[StringComparison]::OrdinalIgnoreCase)){$zip.Substring(0,$zip.Length-4)}else{$zip};$metadataName=($base+'_Private.txt').ToLowerInvariant()
'  $stored=if($script:BranchMetadataText.ContainsKey($metadataName)){[string]$script:BranchMetadataText[$metadataName]}else{$null}
'  if([string]::IsNullOrWhiteSpace($stored)){return $null}
'  $stored=$stored.Trim([char]0xFEFF,[char]0x200B,[char]0x00A0,[char]0x20,[char]0x09,[char]0x0D,[char]0x0A)
'  $hashMatch=[regex]::Match($stored,'(?im)^\s*sha256\s*:\s*([0-9a-f]{64})\s*$')
'  if($hashMatch.Success){$value=$hashMatch.Groups[1].Value.ToLowerInvariant();$script:PrivateExpectedHashCache[$cacheKey]=$value;return $value}
'  if(-not[string]::IsNullOrWhiteSpace($stored)){$value=Get-KeyHash $stored;$script:PrivateExpectedHashCache[$cacheKey]=$value;return $value}
' }catch{}
' $null
'}
'function Get-PrivateModPackageArtifacts($Mod){
' $fbmods=New-Object System.Collections.Generic.List[string]
' $archives=New-Object System.Collections.Generic.List[string]
' foreach($root in @($DestRoot,$DefaultDestRoot)|Select-Object -Unique){
'  $folder=Join-Path $root (Join-Path (Safe-Name $Mod.Character) (Safe-Name $Mod.Version))
'  if(Test-Path -LiteralPath $folder -PathType Container){
'   foreach($file in @(Get-ChildItem -LiteralPath $folder -File -Recurse -ErrorAction SilentlyContinue)){
'    if($file.Extension-ieq'.fbmod'-and-not$fbmods.Contains($file.Name)){$fbmods.Add($file.Name)}
'    elseif($file.Extension-ieq'.archive'-and-not$archives.Contains($file.Name)){$archives.Add($file.Name)}
'   }
'  }
' }
' if($fbmods.Count-eq0){
'  $bytes=$null
'  try{if(-not[string]::IsNullOrWhiteSpace([string]$Mod.DownloadUrl)){$wc=New-Object Net.WebClient;$wc.Headers['User-Agent']='NLH-Mod-Manager';try{$bytes=$wc.DownloadData([string]$Mod.DownloadUrl)}finally{$wc.Dispose()}}else{$bytes=Get-DriveFallbackBytes $Mod}}catch{}
'  if($bytes){$memory=New-Object IO.MemoryStream(,$bytes);$zip=New-Object IO.Compression.ZipArchive($memory,[IO.Compression.ZipArchiveMode]::Read);try{foreach($entry in $zip.Entries){$extension=[IO.Path]::GetExtension($entry.Name);if($extension-ieq'.fbmod'-and-not$fbmods.Contains($entry.Name)){$fbmods.Add($entry.Name)}elseif($extension-ieq'.archive'-and-not$archives.Contains($entry.Name)){$archives.Add($entry.Name)}}}finally{$zip.Dispose();$memory.Dispose()}}
' }
' [pscustomobject]@{Fbmods=@($fbmods);Archives=@($archives)}
'}
'function Revoke-PrivateModAccess($Mod,[string[]]$PreserveFileNames=@()){
' $characterName=Safe-Name ([string]$Mod.Character);$versionName=Safe-Name ([string]$Mod.Version)
' $fbmodNames=New-Object System.Collections.Generic.List[string];$archiveNames=New-Object System.Collections.Generic.List[string]
' # Capture artifact names and delete every exact local character/version folder first.
' foreach($root in @($script:DestRoot,$DestRoot,$DefaultDestRoot)|Where-Object{-not[string]::IsNullOrWhiteSpace([string]$_)}|Select-Object -Unique){
'  try{
'   $versionFolder=Join-Path ([string]$root) (Join-Path $characterName $versionName);$characterFolder=Join-Path ([string]$root) $characterName
'   if(Test-Path -LiteralPath $versionFolder -PathType Container){
'    foreach($file in @(Get-ChildItem -LiteralPath $versionFolder -File -Recurse -Force -ErrorAction SilentlyContinue)){if($file.Extension-ieq'.fbmod'-and-not$fbmodNames.Contains($file.Name)){$null=$fbmodNames.Add($file.Name)}elseif($file.Extension-ieq'.archive'-and-not$archiveNames.Contains($file.Name)){$null=$archiveNames.Add($file.Name)}}
'    Remove-Item -LiteralPath $versionFolder -Recurse -Force -ErrorAction Stop
'    
'   }
'   if((Test-Path -LiteralPath $characterFolder -PathType Container)-and(@(Get-ChildItem -LiteralPath $characterFolder -Force -ErrorAction SilentlyContinue).Count-eq0)){Remove-Item -LiteralPath $characterFolder -Force -ErrorAction SilentlyContinue}
'  }catch{}
' }
' # If local files were already missing, inspect only the selected mod ZIP to recover exact Frosty artifact names.
' if($fbmodNames.Count-eq0){try{$artifacts=Get-PrivateModPackageArtifacts $Mod;foreach($name in @($artifacts.Fbmods)){if($name-and-not$fbmodNames.Contains([string]$name)){$null=$fbmodNames.Add([string]$name)}};foreach($name in @($artifacts.Archives)){if($name-and-not$archiveNames.Contains([string]$name)){$null=$archiveNames.Add([string]$name)}}}catch{}}
' # Never remove files that belong to a replacement version installed by Install-ValidVersionBeforeRevoke.
' $preserveNames=@{};foreach($name in @($PreserveFileNames)){if(-not [string]::IsNullOrWhiteSpace([string]$name)){$preserveNames[([string]$name).ToLowerInvariant()]=$true}}
' foreach($name in @($fbmodNames)){if($preserveNames.ContainsKey($name.ToLowerInvariant())){$null=$fbmodNames.Remove($name)}};foreach($name in @($archiveNames)){if($preserveNames.ContainsKey($name.ToLowerInvariant())){$null=$archiveNames.Remove($name)}}
' $removeNames=@{};foreach($name in $fbmodNames){$removeNames[$name.ToLowerInvariant()]=$true}
' # Remove matching entries from every Frosty pack independently of file deletion.
' try{
'  if($removeNames.Count-gt0-and(Test-Path -LiteralPath $FrostyConfigPath -PathType Leaf)){
'   Assert-FrostyClosedForConfigChange;$json=Get-Content -LiteralPath $FrostyConfigPath -Raw -Encoding UTF8|ConvertFrom-Json;$game=$json.Games.starwarsbattlefrontii
'   if($null-ne$game-and$null-ne$game.Packs){foreach($packProperty in @($game.Packs.PSObject.Properties)){$kept=New-Object System.Collections.Generic.List[string];foreach($entry in @(([string]$packProperty.Value)-split'\|')){if([string]::IsNullOrWhiteSpace($entry)){continue};$index=$entry.LastIndexOf(':');$entryName=if($index-gt0){$entry.Substring(0,$index)}else{$entry};if($removeNames.ContainsKey($entryName.ToLowerInvariant())){}else{$null=$kept.Add($entry)}};$packProperty.Value=($kept-join'|')};[IO.File]::WriteAllText($FrostyConfigPath,($json|ConvertTo-Json -Depth 20),(New-Object Text.UTF8Encoding($false)));}
'  }
' }catch{}
' # Delete exact Frosty library files and archive companions.
' try{
'  $frostyExe=Get-FrostyExecutable $false
'  if($frostyExe){$frostyDir=Join-Path (Join-Path ([IO.Path]::GetDirectoryName($frostyExe)) 'Mods') 'starwarsbattlefrontii';$bases=@{};foreach($name in $fbmodNames){$bases[[IO.Path]::GetFileNameWithoutExtension($name).ToLowerInvariant()]=$true};$exactArchives=@{};foreach($name in $archiveNames){$exactArchives[$name.ToLowerInvariant()]=$true};if(Test-Path -LiteralPath $frostyDir -PathType Container){foreach($file in @(Get-ChildItem -LiteralPath $frostyDir -File -Recurse -Force -ErrorAction SilentlyContinue)){$delete=($file.Extension-ieq'.fbmod'-and$removeNames.ContainsKey($file.Name.ToLowerInvariant()))-or($file.Extension-ieq'.archive'-and($exactArchives.ContainsKey($file.Name.ToLowerInvariant())-or@($bases.Keys|Where-Object{$file.Name.StartsWith($_,[StringComparison]::OrdinalIgnoreCase)}).Count-gt0));if($delete -and -not $preserveNames.ContainsKey($file.Name.ToLowerInvariant())){Remove-Item -LiteralPath $file.FullName -Force -ErrorAction Stop}}};}
' }catch{}
' if($script:StagedCharacters.Contains([string]$Mod.Character)){$script:StagedCharacters.Remove([string]$Mod.Character)}
'}
'function Install-ValidVersionBeforeRevoke($LockedMod){
' # Before a locked version is deleted, look for another version of the same character that still has a valid key (or needs none).
' # If the locked version is installed, install that other version first. Download-And-Extract carries over the selected Frosty pack position and on/off state.
' # Returns the file names of the replacement version so the delete step leaves them alone. Returns nothing when there is no valid replacement.
' $preserve=New-Object System.Collections.Generic.List[string]
' $timerWasRunning=($null -ne $script:PrivateVerifyTimer -and $script:PrivateVerifyTimer.Enabled);if($timerWasRunning){$script:PrivateVerifyTimer.Stop()}
' try{
'  $lockedId=Get-PrivateModId $LockedMod;$characterName=([string]$LockedMod.Character).Trim()
'  $lockedFolder=Join-Path $DestRoot (Join-Path (Safe-Name ([string]$LockedMod.Character)) (Safe-Name ([string]$LockedMod.Version)))
'  $fallback=$null
'  foreach($candidate in @(@($script:AllCatalogMods)|Where-Object{$null -ne $_ -and (([string]$_.Character).Trim() -ieq $characterName) -and ((Get-PrivateModId $_) -ne $lockedId)}|Sort-Object -Property {Version-Key([string]$_.Version)} -Descending)){
'   $privateFile=[IO.Path]::GetFileNameWithoutExtension([string]$candidate.FileName)+'_Private.txt'
'   $commit=[string]$script:PrivateVerifyCommit;if([string]::IsNullOrWhiteSpace($commit)){$commit=[string]$Branch}
'   $url="https://raw.githubusercontent.com/$Owner/$Repository/$commit/$([uri]::EscapeDataString($privateFile))";$status=0;$text=$null
'   try{$response=Invoke-WebRequest -Uri $url -Headers @{'User-Agent'='NLH-Mod-Manager';'Cache-Control'='no-cache, no-store, max-age=0';'Pragma'='no-cache'} -UseBasicParsing -TimeoutSec 12;$status=[int]$response.StatusCode;$text=[string]$response.Content}catch{if($null -ne $_.Exception.Response){try{$status=[int]$_.Exception.Response.StatusCode}catch{}}}
'   if($status -eq 404){$candidate.IsPrivate=$false;$fallback=$candidate;break}
'   if($status -ne 200 -or [string]::IsNullOrWhiteSpace($text)){continue}
'   $trimmed=$text.Trim([char]0xFEFF,[char]0x200B,[char]0x00A0,[char]0x20,[char]0x09,[char]0x0D,[char]0x0A);$hashMatch=[regex]::Match($trimmed,'(?im)^\s*sha256\s*:\s*([0-9a-f]{64})\s*$')
'   $candidateHash=if($hashMatch.Success){$hashMatch.Groups[1].Value.ToLowerInvariant()}else{Get-KeyHash $trimmed}
'   if(Test-PrivateModAuthorization $candidate $candidateHash){$candidate.IsPrivate=$true;$candidate.PrivateUrl=$url;$fallback=$candidate;break}
'  }
'  if($null -eq $fallback){return}
'  $fallbackFolder=Join-Path $DestRoot (Join-Path (Safe-Name ([string]$fallback.Character)) (Safe-Name ([string]$fallback.Version)))
'  if(Test-Path -LiteralPath $lockedFolder -PathType Container){
'   $fallbackExisted=Test-Path -LiteralPath $fallbackFolder
'   Log "Access to $($LockedMod.Character) $($LockedMod.Version) was removed. Switching to $($fallback.Version)..." Silver
'   try{
'    $null=Download-And-Extract $fallback
'    Log "Switched $($LockedMod.Character) from $($LockedMod.Version) to $($fallback.Version)." LimeGreen
'   }catch{
'    Log "Could not switch $($LockedMod.Character) to $($fallback.Version): $($_.Exception.Message)" Red
'    if(-not $fallbackExisted -and (Test-Path -LiteralPath $fallbackFolder)){try{Remove-Item -LiteralPath $fallbackFolder -Recurse -Force -ErrorAction Stop}catch{}}
'   }
'  }
'  if(Test-Path -LiteralPath $fallbackFolder -PathType Container){
'   foreach($file in @(Get-ChildItem -LiteralPath $fallbackFolder -File -Recurse -Force -ErrorAction SilentlyContinue)){if($file.Extension -ieq '.fbmod' -or $file.Extension -ieq '.archive'){$preserve.Add($file.Name)}}
'   $fallbackId=Get-PrivateModId $fallback;$fallbackRow=@($dgv.Rows|Where-Object{$null -ne $_.Tag -and ((Get-PrivateModId $_.Tag) -eq $fallbackId)})|Select-Object -First 1
'   if($null -ne $fallbackRow){$null=Update-Row $fallbackRow}else{$null=Add-VerifiedCatalogRow $fallback}
'  }
' }catch{}finally{if($timerWasRunning -and $null -ne $script:PrivateVerifyTimer){$script:PrivateVerifyTimer.Start()}}
' [string[]]@($preserve)
'}
'function Test-PrivateModAuthorization($Mod,[string]$Expected){
' if([string]::IsNullOrWhiteSpace($Expected)){return $false}
' $normalized=$Expected.Trim().ToLowerInvariant();$modId=Get-PrivateModId $Mod
' if($script:AuthorizedPrivateModHashes.ContainsKey($modId)-and([string]$script:AuthorizedPrivateModHashes[$modId]).Trim().ToLowerInvariant()-eq$normalized){return $true}
' if(-not(Test-AuthorizedPrivateHash $normalized)){return $false}
' $script:AuthorizedPrivateModHashes[$modId]=$normalized;$script:KnownPrivateMods[$modId]=$true;$script:KnownPrivateHashes[$modId]=$normalized
' try{$explicitPath=Join-Path $PrivateModRegPath $modId;if(-not(Test-Path -LiteralPath $explicitPath)){New-Item -Path $explicitPath -Force|Out-Null};Set-ItemProperty -LiteralPath $explicitPath -Name 'AuthorizedHash' -Value $normalized -Type String -Force;Set-ItemProperty -LiteralPath $explicitPath -Name 'CurrentHash' -Value $normalized -Type String -Force;Set-ItemProperty -LiteralPath $explicitPath -Name 'ExplicitKey' -Value 1 -Type DWord -Force}catch{}
' Save-KnownPrivateHashes;return $true
'}
'function Test-ModUnlocked($Mod){
' if(-not$Mod.IsPrivate){return $true}
' $modId=Get-PrivateModId $Mod
' $expected=Get-PrivateExpectedHash $Mod
' if([string]::IsNullOrWhiteSpace($expected)){return $false}
' if(Test-PrivateModAuthorization $Mod $expected){
'  if((-not$script:SavedPrivateUnlocks.ContainsKey($modId))-or([string]$script:SavedPrivateUnlocks[$modId]).Trim().ToLowerInvariant()-ne$expected.Trim().ToLowerInvariant()){$normalizedHash=$expected.Trim().ToLowerInvariant();$script:SavedPrivateUnlocks[$normalizedHash]=$normalizedHash;$script:AuthorizedPrivateHashes[$normalizedHash]=$true;Save-PrivateUnlocks}
'  return $true
' }
' foreach($key in $script:PrivateKeys){if((Get-KeyHash $key.Trim())-eq$expected){$normalizedHash=$expected.Trim().ToLowerInvariant();$script:SavedPrivateUnlocks[$normalizedHash]=$normalizedHash;$script:AuthorizedPrivateHashes[$normalizedHash]=$true;Save-PrivateUnlocks;return $true}}
' $false
'}
'function Test-AndRestoreReleaseEntitlement([string]$Version,[string]$CurrentHash){
' if([string]::IsNullOrWhiteSpace($Version)-or$CurrentHash-notmatch'^[0-9a-f]{64}$'){return $false}
' $retainedHash='';$retainedExplicit=0;$key=$null
' try{$key=[Microsoft.Win32.Registry]::CurrentUser.OpenSubKey(('Software\NLH Mod Manager\ReleaseEntitlements\'+$Version),$false);if($null-ne$key){$retainedHash=([string]$key.GetValue('AuthorizedHash','')).Trim().ToLowerInvariant();$retainedExplicit=[int]$key.GetValue('ExplicitKey',0)}}catch{}finally{if($null-ne$key){$key.Dispose()}}
' if(-not($retainedExplicit-eq1-and$retainedHash-eq$CurrentHash)){$key=$null;try{$key=[Microsoft.Win32.Registry]::CurrentUser.OpenSubKey('Software\NLH Mod Manager',$false);if($null-ne$key){$retainedHash=([string]$key.GetValue(('AuthorizedRelease_'+$Version.Replace('.','_')),'')).Trim().ToLowerInvariant();if($retainedHash-eq$CurrentHash){$retainedExplicit=1}}}catch{}finally{if($null-ne$key){$key.Dispose()}}}
' if(-not($retainedExplicit-eq1-and$retainedHash-eq$CurrentHash)){$key=$null;try{$key=[Microsoft.Win32.Registry]::CurrentUser.OpenSubKey('Software\NLH Mod Manager\PrivateAccess\ReleaseAccess',$false);if($null-ne$key){$retainedHash=([string]$key.GetValue(('Version_'+$Version),'')).Trim().ToLowerInvariant();if($retainedHash-eq$CurrentHash){$retainedExplicit=1}}}catch{}finally{if($null-ne$key){$key.Dispose()}}}
' if(-not($retainedExplicit-eq1-and$retainedHash-eq$CurrentHash)){$key=$null;try{$key=[Microsoft.Win32.Registry]::CurrentUser.OpenSubKey('Software\NLH Mod Manager\PrivateAccess\ReleaseAccess',$false);if($null-ne$key){$legacyHash=([string]$key.GetValue(('Version_'+$Version),'')).Trim().ToLowerInvariant();if($legacyHash-eq$CurrentHash){$retainedHash=$legacyHash;$retainedExplicit=1}}}catch{}finally{if($null-ne$key){$key.Dispose()}}}
' if(-not($retainedExplicit-eq1-and$retainedHash-eq$CurrentHash)){return $false}
' $repairKey=$null
' try{$repairKey=[Microsoft.Win32.Registry]::CurrentUser.CreateSubKey(('Software\NLH Mod Manager\PrivateAccess\ReleaseVersions\'+$Version));$repairKey.SetValue('AuthorizedHash',$CurrentHash,[Microsoft.Win32.RegistryValueKind]::String);$repairKey.SetValue('CurrentHash',$CurrentHash,[Microsoft.Win32.RegistryValueKind]::String);$repairKey.SetValue('ExplicitKey',1,[Microsoft.Win32.RegistryValueKind]::DWord);return $true}catch{return $false}finally{if($null-ne$repairKey){$repairKey.Dispose()}}
'}
'function Save-ReleaseEntitlementToRegistry([string]$Version,[string]$Hash){
' try{
'  $normalizedHash=$Hash.Trim().ToLowerInvariant();if($normalizedHash-notmatch'^[0-9a-f]{64}$'){return}
'  $key=$null
'  try{$key=[Microsoft.Win32.Registry]::CurrentUser.CreateSubKey(('Software\NLH Mod Manager\ReleaseEntitlements\'+$Version));$key.SetValue('AuthorizedHash',$normalizedHash,[Microsoft.Win32.RegistryValueKind]::String);$key.SetValue('CurrentHash',$normalizedHash,[Microsoft.Win32.RegistryValueKind]::String);$key.SetValue('ExplicitKey',1,[Microsoft.Win32.RegistryValueKind]::DWord)}finally{if($null-ne$key){$key.Dispose()}}
'  $key=$null
'  try{$key=[Microsoft.Win32.Registry]::CurrentUser.CreateSubKey('Software\NLH Mod Manager');$key.SetValue(('AuthorizedRelease_'+$Version.Replace('.','_')),$normalizedHash,[Microsoft.Win32.RegistryValueKind]::String)}finally{if($null-ne$key){$key.Dispose()}}
'  $key=$null
'  try{$key=[Microsoft.Win32.Registry]::CurrentUser.CreateSubKey('Software\NLH Mod Manager\PrivateAccess\ReleaseAccess');$key.SetValue(('Version_'+$Version),$normalizedHash,[Microsoft.Win32.RegistryValueKind]::String)}finally{if($null-ne$key){$key.Dispose()}}
'  $key=$null
'  try{$key=[Microsoft.Win32.Registry]::CurrentUser.CreateSubKey(('Software\NLH Mod Manager\PrivateAccess\ReleaseVersions\'+$Version));$key.SetValue('AuthorizedHash',$normalizedHash,[Microsoft.Win32.RegistryValueKind]::String);$key.SetValue('CurrentHash',$normalizedHash,[Microsoft.Win32.RegistryValueKind]::String);$key.SetValue('ExplicitKey',1,[Microsoft.Win32.RegistryValueKind]::DWord)}finally{if($null-ne$key){$key.Dispose()}}
' }catch{}
'}
'function Test-AndSaveReleaseKey([string]$Key){
' if([string]::IsNullOrWhiteSpace($Key)){return $null};$enteredHash=Get-KeyHash $Key.Trim()
' foreach($version in @('1.1','1.2','1.3','1.4','1.5','2.0')){try{
'  $result=Get-DirectGitHubText ("NLH Mod Manager Public Release V${version}_Private.txt");if($result.Status-ne200-or[string]::IsNullOrWhiteSpace([string]$result.Text)){continue}
'  $marker=[regex]::Match(([string]$result.Text).Trim(),'(?im)^\s*SHA256\s*:\s*([0-9a-f]{64})\s*$');if(-not$marker.Success){continue};$expectedHash=$marker.Groups[1].Value.ToLowerInvariant();if($enteredHash-ne$expectedHash){continue}
'  $script:SavedPrivateUnlocks[$expectedHash]=$expectedHash;$script:AuthorizedPrivateHashes[$expectedHash]=$true;Save-PrivateUnlocks
'  $rk=$null;try{$rk=[Microsoft.Win32.Registry]::CurrentUser.CreateSubKey('Software\NLH Mod Manager\PrivateAccess\ReleaseAccess');$rk.SetValue(('Version_'+$version),$expectedHash,[Microsoft.Win32.RegistryValueKind]::String)}finally{if($null-ne$rk){$rk.Dispose()}}
'  $releaseKey=$null;try{$releaseKey=[Microsoft.Win32.Registry]::CurrentUser.CreateSubKey(('Software\NLH Mod Manager\PrivateAccess\ReleaseVersions\'+$version));$releaseKey.SetValue('CurrentHash',$expectedHash,[Microsoft.Win32.RegistryValueKind]::String);$releaseKey.SetValue('AuthorizedHash',$expectedHash,[Microsoft.Win32.RegistryValueKind]::String);$releaseKey.SetValue('ExplicitKey',1,[Microsoft.Win32.RegistryValueKind]::DWord)}finally{if($null-ne$releaseKey){$releaseKey.Dispose()}}
'  Save-ReleaseEntitlementToRegistry $version $expectedHash;if($version-eq$CurrentReleaseVersion){$script:CurrentReleaseEntitlementHash=$expectedHash}
'  
'  return $version
' }catch{}}
' $null
'}
'if(-not('NlhBlueGlowProgress' -as[type])){Add-Type -ReferencedAssemblies System.Windows.Forms,System.Drawing -TypeDefinition @"
'using System;
'using System.Drawing;
'using System.Drawing.Drawing2D;
'using System.Windows.Forms;
'public sealed class NlhBlueGlowProgress : Control {
' private int min=0,max=100,val=0,phase=-24; private readonly Timer timer;
' public int Minimum { get{return min;} set{min=value;if(max<min)max=min;Value=val;} }
' public int Maximum { get{return max;} set{max=Math.Max(value,min);Value=val;} }
' public int Value { get{return val;} set{val=Math.Max(min,Math.Min(max,value));Invalidate();} }
' public ProgressBarStyle Style { get; set; } public int MarqueeAnimationSpeed { get; set; }
' public NlhBlueGlowProgress(){SetStyle(ControlStyles.AllPaintingInWmPaint|ControlStyles.UserPaint|ControlStyles.OptimizedDoubleBuffer|ControlStyles.ResizeRedraw,true);Style=ProgressBarStyle.Continuous;BackColor=Color.FromArgb(34,34,39);timer=new Timer();timer.Interval=28;timer.Tick+=(s,e)=>{phase+=4;if(phase>Width+24)phase=-24;Invalidate();};timer.Start();}
' protected override void Dispose(bool disposing){if(disposing&&timer!=null)timer.Dispose();base.Dispose(disposing);}
' protected override void OnPaint(PaintEventArgs e){Graphics g=e.Graphics;g.SmoothingMode=SmoothingMode.AntiAlias;Rectangle tr=new Rectangle(0,1,Math.Max(1,Width-1),Math.Max(2,Height-3));using(GraphicsPath tp=Round(tr,Math.Max(2,Height/2))){using(SolidBrush b=new SolidBrush(Color.FromArgb(40,40,46)))g.FillPath(b,tp);using(Pen p=new Pen(Color.FromArgb(69,69,79)))g.DrawPath(p,tp);}double range=Math.Max(1,max-min);int fw=(int)Math.Round(tr.Width*((val-min)/range));if(fw<1)return;Rectangle fr=new Rectangle(tr.X,tr.Y,Math.Min(tr.Width,fw),tr.Height);using(GraphicsPath fp=Round(fr,Math.Max(2,Height/2))){using(LinearGradientBrush fill=new LinearGradientBrush(fr,Color.FromArgb(20,72,210),Color.FromArgb(36,112,255),0f))g.FillPath(fill,fp);g.SetClip(fp);Rectangle shine=new Rectangle(phase-18,tr.Y,36,tr.Height);using(LinearGradientBrush sh=new LinearGradientBrush(shine,Color.FromArgb(0,138,180,255),Color.FromArgb(220,138,180,255),0f)){ColorBlend cb=new ColorBlend();cb.Positions=new float[]{0f,.5f,1f};cb.Colors=new Color[]{Color.FromArgb(0,138,180,255),Color.FromArgb(230,138,180,255),Color.FromArgb(0,138,180,255)};sh.InterpolationColors=cb;g.FillRectangle(sh,shine);}g.ResetClip();using(Pen hi=new Pen(Color.FromArgb(190,170,205,255)))g.DrawLine(hi,fr.X+2,fr.Y+1,Math.Max(fr.X+2,fr.Right-3),fr.Y+1);}}
' private static GraphicsPath Round(Rectangle r,int radius){GraphicsPath p=new GraphicsPath();int d=Math.Min(Math.Min(r.Width,r.Height),radius*2);if(d<=1){p.AddRectangle(r);return p;}p.AddArc(r.X,r.Y,d,d,180,90);p.AddArc(r.Right-d,r.Y,d,d,270,90);p.AddArc(r.Right-d,r.Bottom-d,d,d,0,90);p.AddArc(r.X,r.Bottom-d,d,d,90,90);p.CloseFigure();return p;}
'}
'"@}
'function Set-NlhBlueGlowProgress($Progress){if($null-ne$Progress){$Progress.Invalidate();$Progress.Update()}}
'# NLH_STANDALONE_SEPARATE_PROCESS_LOADER_R4
'if(-not$script:LaunchedThroughManagerLauncher-and[string]$env:NLH_STANDALONE_CHILD-ne'1'-and[string]::IsNullOrWhiteSpace([string]$env:NLH_UPDATE_HANDOFF)){
' $selfPath=[IO.Path]::GetFullPath([string]$env:NLH_SELF)
' $handoff=[guid]::NewGuid().ToString('N');$promotionGate=$handoff;$ipcMap=Open-NlhIpcMap $handoff $true;$ipcTransition=Open-NlhIpcEvent $handoff 'Transition' $true;$ipcClose=Open-NlhIpcEvent $handoff 'Close' $true;$ipcPromotion=Open-NlhIpcEvent $handoff 'Promotion' $true
' # Parent retains IPC owner handles until the child finishes and the loader closes.
' $loader=New-Object Windows.Forms.Form;Set-NlhIcon $loader;$loader.Text='NLH Mod Manager Public Release V1.0';$loader.ClientSize=New-Object Drawing.Size(436,179);$loader.FormBorderStyle='None';$loader.MaximizeBox=$false;$loader.MinimizeBox=$false;$loader.StartPosition='CenterScreen';$loader.TopMost=$true;$loader.BackColor=[Drawing.Color]::FromArgb(24,24,27);$loader.ForeColor=[Drawing.Color]::Gainsboro;$loader.Font=New-Object Drawing.Font('Segoe UI',9);$loader.ShowInTaskbar=$true
' $loaderCaption=New-Object Windows.Forms.Panel;$loaderCaption.SetBounds(0,0,436,26);$loaderCaption.BackColor=$script:NlhCustomAccent
' $loaderIcon=New-Object Windows.Forms.PictureBox;$loaderIcon.SetBounds(5,5,16,16);$loaderIcon.SizeMode='Normal';$loaderIcon.BackColor=$script:NlhCustomAccent;$loaderIconBitmap=Get-NlhTitleIconBitmap;if($null-ne$loaderIconBitmap){$loaderIcon.Image=$loaderIconBitmap}else{$loaderIcon.Visible=$false}
' $loaderCaptionText=New-Object Windows.Forms.Label;$loaderCaptionText.SetBounds(25,7,406,19);$loaderCaptionText.Text='NLH Mod Manager';$loaderCaptionText.BackColor=$script:NlhCustomAccent;$loaderCaptionText.ForeColor=$script:NlhCustomCaptionText;$loaderCaptionText.Font=New-Object Drawing.Font('Segoe UI',8.25);$loaderCaption.Controls.AddRange([Windows.Forms.Control[]]@($loaderIcon,$loaderCaptionText))
' $loaderAccent=New-Object Windows.Forms.Panel;$loaderAccent.SetBounds(0,26,436,3);$loaderAccent.BackColor=[Drawing.Color]::FromArgb(186,48,55)
' $loaderTitle=New-Object Windows.Forms.Label;$loaderTitle.SetBounds(20,40,396,42);$loaderTitle.Text='NLH Mod Manager';$loaderTitle.Font=New-Object Drawing.Font('Segoe UI Semibold',18);$loaderTitle.ForeColor=[Drawing.Color]::Gainsboro
' $loaderText=New-Object Windows.Forms.Label;$loaderText.SetBounds(22,86,392,24);$loaderText.Text='Starting manager...';$loaderText.Font=New-Object Drawing.Font('Segoe UI',10);$loaderText.ForeColor=[Drawing.Color]::FromArgb(174,174,182)
' $loaderProgress=New-Object NlhBlueGlowProgress;$loaderProgress.SetBounds(22,126,392,10);$loaderProgress.Minimum=0;$loaderProgress.Maximum=100;$loaderProgress.Value=40
' $loader.Controls.AddRange([Windows.Forms.Control[]]@($loaderCaption,$loaderAccent,$loaderTitle,$loaderText,$loaderProgress));Set-NlhBlueGlowProgress $loaderProgress
' $loader.Add_FormClosing({[NlhPrecisionLoaderDrag]::Stop($loader.Handle)});$loader.Add_VisibleChanged({if(-not$loader.Visible){[NlhPrecisionLoaderDrag]::Stop($loader.Handle)}})
' if($null-ne$script:InstanceMutex){try{$script:InstanceMutex.ReleaseMutex()}catch{};try{$script:InstanceMutex.Dispose()}catch{};$script:InstanceMutex=$null}
' $env:NLH_STANDALONE_CHILD='1';$env:NLH_FROSTY_PREFLIGHT_OK='1';$env:NLH_LAUNCH_HANDOFF=$handoff;$env:NLH_PROMOTION_GATE=$promotionGate
' $loader.Opacity=0;$loader.SuspendLayout();$loader.ResumeLayout($true);$loader.PerformLayout();$loader.Show();$env:NLH_STANDALONE_LOADER_HWND=([long]$loader.Handle).ToString();[NlhPrecisionLoaderDrag]::Arm($loader.Handle,26);$loader.Refresh();$loader.Update();[Windows.Forms.Application]::DoEvents();$loader.Opacity=1;$loader.Refresh();$loader.Update();[Windows.Forms.Application]::DoEvents()
' $managerPowerShell=Join-Path $env:SystemRoot 'System32\WindowsPowerShell\v1.0\powershell.exe';$managerCommand="`$p=`$env:NLH_SELF;`$l=Get-Content -LiteralPath `$p;`$m=[string][char]39+[Text.Encoding]::ASCII.GetString([byte[]](35,65,80,80,66,69,71,73,78));`$b=[Array]::IndexOf(`$l,`$m);if(`$b-lt0){exit 2};`$x=((`$l[(`$b+1)..(`$l.Count-1)]|ForEach-Object{if(`$_.StartsWith([char]39)){`$_.Substring(1)}else{`$_}})-join[Environment]::NewLine);&([ScriptBlock]::Create(`$x))"
' try{$managerStart=New-Object Diagnostics.ProcessStartInfo;$managerStart.FileName=$managerPowerShell;$managerStart.Arguments='-NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -WindowStyle Hidden -Command '+[char]34+$managerCommand+[char]34;$managerStart.WorkingDirectory=[IO.Path]::GetDirectoryName($selfPath);$managerStart.UseShellExecute=$false;$managerStart.CreateNoWindow=$true;$managerStart.WindowStyle=[Diagnostics.ProcessWindowStyle]::Hidden;$child=New-Object Diagnostics.Process;$child.StartInfo=$managerStart;if(-not$child.Start()){throw 'Manager process did not start.'}}catch{try{$loader.Close();$loader.Dispose()}catch{};exit 1}
' $loaderClosed=$false
' while(-not$loaderClosed-and-not$child.HasExited){
'  if(Test-NlhIpcEvent $handoff 'Close'){$loaderClosed=$true;$loader.TopMost=$false;$loader.Hide();$loader.Close();$loader.Dispose();break}
'  if(-not$loader.IsDisposed-and((Test-NlhIpcEvent $handoff 'Promotion')-or(Test-NlhIpcEvent $handoff 'Transition'))){$loader.TopMost=$false}
'  $pt=Read-NlhIpcProgress $handoff;if(-not[string]::IsNullOrWhiteSpace($pt)){try{$pm=[regex]::Match($pt,'^(\d{1,3})\|(.*)$');if($pm.Success){$pct=[int]$pm.Groups[1].Value;if($pct-gt$loaderProgress.Value){$loaderProgress.Value=[Math]::Min(100,$pct)};$state=$pm.Groups[2].Value;if($state-ne'main-ready'){$loaderText.Text=$state}else{$loaderClosed=$true;$loader.TopMost=$false;$loader.Hide();$loader.Close();$loader.Dispose();break}}}catch{}}
'  [Windows.Forms.Application]::DoEvents();[Threading.Thread]::Sleep(10)
' }
' if(-not$loader.IsDisposed){$loader.TopMost=$false;$loader.Hide();$loader.Close();$loader.Dispose()}
' if($null-ne$child-and-not$child.HasExited){try{$child.WaitForExit()}catch{}}
' foreach($ipcObject in @($ipcPromotion,$ipcClose,$ipcTransition,$ipcMap)){if($null-ne$ipcObject){try{$ipcObject.Dispose()}catch{}}}
' Remove-Item -LiteralPath $handoff,$transitionFile,$closeFile,$promotionGate -Force -ErrorAction SilentlyContinue
' $env:NLH_STANDALONE_CHILD=$null;$env:NLH_STANDALONE_LOADER_HWND=$null;$env:NLH_FROSTY_PREFLIGHT_OK=$null;$env:NLH_LAUNCH_HANDOFF=$null;$env:NLH_PROMOTION_GATE=$null
' exit 0
'}

'function Show-ReleaseRestartChoice([string]$Version){
' $dialog=New-Object Windows.Forms.Form;$dialog.Text='Switch Release Version';$dialog.ClientSize=New-Object Drawing.Size(520,220);$dialog.FormBorderStyle='FixedDialog';$dialog.MaximizeBox=$false;$dialog.MinimizeBox=$false;$dialog.StartPosition='CenterParent';$dialog.ShowInTaskbar=$false;$dialog.BackColor=$C.Form;$dialog.ForeColor=$C.Text;$dialog.Font=New-Object Drawing.Font('Segoe UI',10)
' $accent=New-Object Windows.Forms.Panel;$accent.SetBounds(0,0,520,3);$accent.BackColor=$C.Accent;$title=New-Object Windows.Forms.Label;$title.SetBounds(22,22,476,30);$title.Text=('Switch to NLH Mod Manager V'+$Version);$title.Font=New-Object Drawing.Font('Segoe UI Semibold',13);$message=New-Object Windows.Forms.Label;$message.SetBounds(22,62,476,72);$privateReleaseState=Get-DirectGitHubText ("NLH Mod Manager Public Release V${Version}_Private.txt");$requiresUnlock=($privateReleaseState.Status-eq200-and-not[string]::IsNullOrWhiteSpace([string]$privateReleaseState.Text));$message.Text=if($requiresUnlock){'Restart now to switch to this unlocked release, or restart later to keep using the current release.'}else{'Restart now to switch to this public release, or restart later to keep using the current release.'};$message.ForeColor=$C.Muted
' $now=New-Object Windows.Forms.Button;$now.SetBounds(238,158,126,36);$now.Text='Restart Now';Style-Button $now $C.Accent $C.Text $C.Accent $C.AccentHot;$later=New-Object Windows.Forms.Button;$later.SetBounds(376,158,122,36);$later.Text='Restart Later';Style-Button $later $C.Surface2 $C.Text $C.Border $C.Header
' $dialog.Add_FormClosing({if($dialog.Opacity-ne0){$dialog.Opacity=0;$dialog.ShowInTaskbar=$false;$dialog.Refresh();[Windows.Forms.Application]::DoEvents()}});$now.Add_Click({$dialog.Opacity=0;$dialog.Refresh();[Windows.Forms.Application]::DoEvents();$dialog.DialogResult=[Windows.Forms.DialogResult]::Yes;$dialog.Close()});$later.Add_Click({$dialog.Opacity=0;$dialog.Refresh();[Windows.Forms.Application]::DoEvents();$dialog.DialogResult=[Windows.Forms.DialogResult]::No;$dialog.Close()});$dialog.AcceptButton=$now;$dialog.CancelButton=$later;$dialog.Controls.AddRange([Windows.Forms.Control[]]@($accent,$title,$message,$now,$later));Set-Busy $false;try{$restart=((Invoke-NlhOwnedWindow $dialog $form)-eq[Windows.Forms.DialogResult]::Yes)}finally{$dialog.Dispose()};if($restart){$settingsKey=$null;$savedVersion='';try{$settingsKey=[Microsoft.Win32.Registry]::CurrentUser.CreateSubKey('Software\NLH Mod Manager');$settingsKey.SetValue('PreferredRelease',$Version,[Microsoft.Win32.RegistryValueKind]::String);$savedVersion=([string]$settingsKey.GetValue('PreferredRelease','')).Trim()}finally{if($null-ne$settingsKey){$settingsKey.Dispose()}};if($savedVersion-ne$Version){Show-NLHInfo 'Release Version' 'The selected release could not be confirmed before restart.';return};$launcher=Join-Path ([IO.Path]::GetDirectoryName([string]$env:NLH_SELF)) 'NLH Mod Manager Public Release.vbs';if(-not(Test-Path -LiteralPath $launcher -PathType Leaf)){Show-NLHInfo 'Release Version' 'NLH Mod Manager Public Release.vbs was not found beside this version.';return};$script:AppClosing=$true;$form.Hide();[Windows.Forms.Application]::DoEvents();$env:NLH_UPDATE_HANDOFF=$null;$env:NLH_LAUNCH_HANDOFF=$null;$env:NLH_STANDALONE_DIRECT=$null;try{Start-Process -FilePath $env:WINDIR'\System32\wscript.exe' -ArgumentList ('"'+$launcher+'"') -WorkingDirectory ([IO.Path]::GetDirectoryName($launcher)) -ErrorAction Stop|Out-Null}catch{$script:AppClosing=$false;$form.Show();$form.Activate();Show-NLHInfo 'Release Version' ('The launcher could not be started: '+$_.Exception.Message);return};$form.Close()}
'}
'function Show-PrivateKeyDialog {
' $dialog=New-Object Windows.Forms.Form;$dialog.Text='Enter Private Key';$dialog.ClientSize=New-Object Drawing.Size(500,190);$dialog.FormBorderStyle='FixedDialog';$dialog.MaximizeBox=$false;$dialog.MinimizeBox=$false;$dialog.StartPosition='CenterParent';$dialog.BackColor=$C.Form;$dialog.ForeColor=$C.Text;$dialog.Font=New-Object Drawing.Font('Segoe UI',10);$dialog.ShowInTaskbar=$false;$dialog.KeyPreview=$true
' $accent=New-Object Windows.Forms.Panel;$accent.SetBounds(0,0,600,3);$accent.BackColor=$C.Accent
' $label=New-Object Windows.Forms.Label;$label.SetBounds(22,22,456,24);$label.Text='Enter a private key';$label.ForeColor=$C.Text
' $keyBox=New-Object Windows.Forms.TextBox;$keyBox.SetBounds(22,58,456,29);$keyBox.BackColor=$C.Surface2;$keyBox.ForeColor=$C.Text;$keyBox.BorderStyle='FixedSingle';$keyBox.UseSystemPasswordChar=$true;$keyBox.ShortcutsEnabled=$true
' $paste=New-Object Windows.Forms.Button;$paste.SetBounds(22,128,96,34);$paste.Text='Paste';Style-Button $paste $C.Surface2 $C.Text $C.Border $C.Header
' $ok=New-Object Windows.Forms.Button;$ok.SetBounds(270,128,104,34);$ok.Text='Unlock';Style-Button $ok $C.Accent $C.Text $C.Accent $C.AccentHot
' $cancel=New-Object Windows.Forms.Button;$cancel.SetBounds(390,128,88,34);$cancel.Text='Cancel';Style-Button $cancel $C.Surface2 $C.Text $C.Border $C.Header
' $ok.DialogResult=[Windows.Forms.DialogResult]::None;$cancel.DialogResult=[Windows.Forms.DialogResult]::None;$dialog.AcceptButton=$ok;$dialog.CancelButton=$cancel;$dialog.Add_FormClosing({if($dialog.DialogResult-ne[Windows.Forms.DialogResult]::OK){$dialog.Opacity=0}});$ok.Add_Click({if([string]::IsNullOrWhiteSpace([string]$keyBox.Text)){return};$script:NlhPrivateKeyBusyHandoff=$true;$dialog.Tag=([string]$keyBox.Text).Trim();$dialog.DialogResult=[Windows.Forms.DialogResult]::OK;$dialog.Close()});$cancel.Add_Click({$dialog.Opacity=0;$dialog.DialogResult=[Windows.Forms.DialogResult]::Cancel;$dialog.Close()})
' $pasteFromClipboard={try{$clipboardText=[Windows.Forms.Clipboard]::GetText([Windows.Forms.TextDataFormat]::UnicodeText);if($null-ne$keyBox-and-not$keyBox.IsDisposed-and-not[string]::IsNullOrWhiteSpace($clipboardText)){$keyBox.Text=$clipboardText.Trim();$keyBox.SelectionStart=$keyBox.TextLength;$keyBox.Focus()}}catch{}}
' $paste.Add_Click($pasteFromClipboard);$keyBox.Add_KeyDown({param($sender,$e);if(($e.Control-and$e.KeyCode-eq[Windows.Forms.Keys]::V)-or($e.Shift-and$e.KeyCode-eq[Windows.Forms.Keys]::Insert)){$e.SuppressKeyPress=$true;$e.Handled=$true;&$pasteFromClipboard}})
' $menu=New-Object Windows.Forms.ContextMenuStrip;$pasteItem=$menu.Items.Add('Paste');$pasteItem.Add_Click($pasteFromClipboard);$keyBox.ContextMenuStrip=$menu
' $dialog.Controls.AddRange([Windows.Forms.Control[]]@($accent,$label,$keyBox,$paste,$ok,$cancel));$dialog.Add_Shown({try{$keyBox.Focus()}catch{}})
' try{$result=(Invoke-NlhOwnedWindow $dialog $form);if($result-eq[Windows.Forms.DialogResult]::OK-and-not[string]::IsNullOrWhiteSpace([string]$dialog.Tag)){return ([string]$dialog.Tag).Trim()};$null}finally{try{$menu.Dispose()}catch{};try{$dialog.Dispose()}catch{}}
'}
'function Show-Changelog($Mod){
' if(-not$Mod.HasChangelog){return}
' try{
'  $zip=[string]$Mod.FileName;$base=if($zip.EndsWith('.zip',[StringComparison]::OrdinalIgnoreCase)){$zip.Substring(0,$zip.Length-4)}else{$zip};$fileName=$base+'_Changelog.txt';$key=$fileName.ToLowerInvariant()
'  $text=if($script:BranchMetadataText.ContainsKey($key)){[string]$script:BranchMetadataText[$key]}else{$null}
'  if([string]::IsNullOrWhiteSpace($text)){$result=Get-DirectGitHubText $fileName;if($result.Status-eq200){$text=[string]$result.Text;$script:BranchMetadataText[$key]=$text}else{$text='No changelog information is available.'}}
'  Show-NLHInfo ($Mod.Character+' '+$Mod.Version+' Changelog') $text
' }catch{Show-NLHInfo 'Changelog' 'The changelog could not be loaded.'}
'}
'function Get-Catalog {
' $zipPattern=[regex]::new('^(?<base>.+)\.zip$',[Text.RegularExpressions.RegexOptions]::IgnoreCase)
' $modPattern=[regex]::new('^(?<character>.+)_(?<version>[^_]+)$',[Text.RegularExpressions.RegexOptions]::IgnoreCase)
' $parsed=New-Object System.Collections.Generic.List[object]
' $script:AllVersionsCatalog=@()
' try{
'  Send-LauncherProgress 50 'Requesting catalog index...'
'  if($script:PrivateMetadataRootItems){$items=@($script:PrivateMetadataRootItems);$script:PrivateMetadataRootItems=$null}else{$items=@(Invoke-GitHub "https://api.github.com/repos/$Owner/$Repository/contents?ref=$Branch")}
'  Send-LauncherProgress 54 'Catalog index received'
'  if([string]::IsNullOrWhiteSpace([string]$script:CurrentReleaseStartupRevision)){$currentReleaseName="NLH Mod Manager Public Release V${CurrentReleaseVersion}.vbs";$currentReleaseItem=@($items|Where-Object{([string]$_.type)-eq'file'-and([string]$_.name)-ieq$currentReleaseName}|Select-Object -First 1);if($currentReleaseItem.Count-gt0){$script:CurrentReleaseStartupRevision=([string]$currentReleaseItem[0].sha).Trim().ToLowerInvariant()}}
'  $rootFiles=@{};foreach($item in $items){if([string]$item.type-eq'file'){$rootFiles[(Get-MetadataKey ([string]$item.name))]=$item}}
'  Send-LauncherProgress 57 'Indexing catalog files...'
'  $catalogZipItems=@($items|Where-Object{([string]$_.type)-eq'file'-and([string]$_.name).EndsWith('.zip',[StringComparison]::OrdinalIgnoreCase)});$catalogZipTotal=[Math]::Max(1,$catalogZipItems.Count);$catalogZipDone=0
'  foreach($item in $items){
'   if([string]$item.type-ne'file'){continue};$name=[string]$item.name;$zipMatch=$zipPattern.Match($name);if(-not$zipMatch.Success){continue}
'   $base=$zipMatch.Groups['base'].Value;$modMatch=$modPattern.Match($base);if(-not$modMatch.Success){continue}
'   $privateName=$base+'_Private.txt';$changeName=$base+'_Changelog.txt';$privateKey=Get-MetadataKey $privateName;$changeKey=Get-MetadataKey $changeName
'   $privateItem=if($rootFiles.ContainsKey($privateKey)){$rootFiles[$privateKey]}else{$null};$changeItem=if($rootFiles.ContainsKey($changeKey)){$rootFiles[$changeKey]}else{$null}
'   $privateParts=$privateName.Split('/')|ForEach-Object{[uri]::EscapeDataString($_)};$privateProbeUrl="https://raw.githubusercontent.com/$Owner/$Repository/$Branch/$($privateParts-join'/')"
'   $isPrivate=($null-ne$privateItem);$hasChangelog=($null-ne$changeItem)
'   $downloadUrl=[string]$item.download_url;if([string]::IsNullOrWhiteSpace($downloadUrl)){$parts=([string]$item.path).Split('/')|ForEach-Object{[uri]::EscapeDataString($_)};$downloadUrl="https://raw.githubusercontent.com/$Owner/$Repository/$Branch/$($parts-join'/')"}
'   $parsed.Add([pscustomobject]@{Character=$modMatch.Groups['character'].Value.Trim();Version=$modMatch.Groups['version'].Value.Trim();DownloadUrl=$downloadUrl;DriveFolderId=$null;FileName=$name;IsPrivate=$isPrivate;PrivateUrl=$(if($privateItem){[string]$privateItem.download_url}elseif($isPrivate){$privateProbeUrl}else{$null});PrivateApiUrl=$(if($isPrivate){Get-GitHubRootFileApiUrl $privateName}else{$null});PrivateDriveFileId=$null;HasChangelog=$hasChangelog});$catalogZipDone++;$catalogPercent=57+[int](8*$catalogZipDone/$catalogZipTotal);Send-LauncherProgress $catalogPercent ('Reading catalog entries '+$catalogZipDone+' of '+$catalogZipTotal+'...');[Windows.Forms.Application]::DoEvents()
'  }
' }catch{return @(Get-DriveCatalog)}
' if($parsed.Count-eq0){return @(Get-DriveCatalog)}
' $script:AllVersionsCatalog=@($parsed.ToArray())
' $latest=New-Object System.Collections.Generic.List[object];foreach($g in @($parsed|Group-Object Character)){$selected=$g.Group|Sort-Object{Version-Key([string]$_.Version)}-Descending|Select-Object -First 1;if($selected){$latest.Add($selected)}};@($latest|Sort-Object Character)
'}
'function Get-Status($Mod){
' $char=Join-Path $DestRoot (Safe-Name $Mod.Character); if(-not(Test-Path $char)){return 'NotInstalled'}
' $ver=Join-Path $char (Safe-Name $Mod.Version); if(Test-Path $ver){
'  if(@(Get-ChildItem -LiteralPath $ver -File -Recurse -ErrorAction SilentlyContinue).Count){return 'UpToDate'}
' }
' if(@(Get-ChildItem -LiteralPath $char -Directory -ErrorAction SilentlyContinue).Count){return 'UpdateAvailable'}
' 'NotInstalled'
'}
'function Status-Info([string]$Status){
' switch($Status){
'  'UpToDate' {@{Text='Up to Date';Color=$C.Green;Button='Re-download'}}
'  'UpdateAvailable' {@{Text='Update Available';Color=$C.Orange;Button='Update'}}
'  default {@{Text='Not Installed';Color=$C.Muted;Button='Download'}}
' }
'}
'function Restore-PreferenceCheckboxes {
' foreach($box in @($chkCloseAfterLaunch,$chkDeleteOldVersions)){
'  if($null-eq$box-or$box.IsDisposed-or$box.Disposing){continue}
'  $box.Enabled=$true;$box.ForeColor=$C.Text;$box.BackColor=$C.Form;$box.Cursor=[Windows.Forms.Cursors]::Hand;$box.Refresh()
' }
'}
'function Set-Busy([bool]$Busy){
' foreach($x in @($chkShowFilePaths,$chkCloseAfterLaunch,$chkDeleteOldVersions,$pnlReleaseVersion,$dgv,$txtSearch,$btnRefresh,$btnOpen,$btnChangeFolder,$btnAll,$btnLaunchFrosty,$btnApplyOnly,$btnClearQueue,$btnRedownloadAll,$btnBulkConfig,$btnDeleteAll,$btnPrivateKey)){$x.Enabled=-not$Busy}
' if(-not$Busy){Set-ApplyOnlyAvailable ($script:ConfigChanged-or$script:StagedCharacters.Count-gt0)}
' Restore-PreferenceCheckboxes
' $form.UseWaitCursor=$Busy; [Windows.Forms.Application]::DoEvents();Restore-PreferenceCheckboxes
'}
'function Update-Summary {
' $all=$dgv.Rows.Count;$up=@($dgv.Rows|?{$_.Tag.Status-eq'UpToDate'}).Count
' $av=@($dgv.Rows|?{$_.Tag.Status-eq'UpdateAvailable'}).Count;$ni=$all-$up-$av
' $lblSummary.Text="$all mods  •  Up to date: $up  •  Updates: $av  •  Not installed: $ni"
'}
'function Update-Row($Row){
' $Row.Tag.Status=Get-Status $Row.Tag; $i=Status-Info $Row.Tag.Status
' $Row.Cells['Status'].Value=$i.Text;$Row.Cells['Status'].Style.ForeColor=$i.Color;$Row.Cells['Status'].Style.SelectionForeColor=$i.Color;$Row.Cells['Status'].Style.SelectionBackColor=$C.Surface;$actionCell=$Row.Cells['Action'];$actionCell.Value=$i.Button;$actionCell.FlatStyle='Flat'
' switch($Row.Tag.Status){
'  'NotInstalled' {$actionCell.Style.BackColor=[Drawing.Color]::FromArgb(40,40,44);$actionCell.Style.ForeColor=$C.Text;$actionCell.Style.SelectionBackColor=[Drawing.Color]::FromArgb(40,40,44);$actionCell.Style.SelectionForeColor=$C.Text}
'  'UpdateAvailable' {$actionCell.Style.BackColor=[Drawing.Color]::FromArgb(48,48,53);$actionCell.Style.ForeColor=[Drawing.Color]::FromArgb(235,235,238);$actionCell.Style.SelectionBackColor=[Drawing.Color]::FromArgb(48,48,53);$actionCell.Style.SelectionForeColor=[Drawing.Color]::FromArgb(235,235,238)}
'  default {$actionCell.Style.BackColor=[Drawing.Color]::FromArgb(40,40,44);$actionCell.Style.ForeColor=[Drawing.Color]::FromArgb(215,215,220);$actionCell.Style.SelectionBackColor=[Drawing.Color]::FromArgb(40,40,44);$actionCell.Style.SelectionForeColor=[Drawing.Color]::FromArgb(215,215,220)}
' }
' $changeCell=$Row.Cells['Changelog'];$changeCell.ToolTipText='';$changeCell.ReadOnly=(-not[bool]$Row.Tag.HasChangelog);$changeCell.Tag=if($changeCell.ReadOnly){'DisabledChangelog'}else{$null};$changeCell.Value=if($Row.Tag.HasChangelog){'View'}else{'—'};$changeCell.FlatStyle='Flat';if($changeCell.ReadOnly){$changeCell.Style.BackColor=[Drawing.Color]::FromArgb(41,41,45);$changeCell.Style.ForeColor=[Drawing.Color]::FromArgb(148,148,156);$changeCell.Style.SelectionBackColor=[Drawing.Color]::FromArgb(41,41,45);$changeCell.Style.SelectionForeColor=[Drawing.Color]::FromArgb(148,148,156)}else{$changeCell.Style.BackColor=[Drawing.Color]::FromArgb(40,40,44);$changeCell.Style.ForeColor=$C.Text;$changeCell.Style.SelectionBackColor=[Drawing.Color]::FromArgb(40,40,44);$changeCell.Style.SelectionForeColor=$C.Text}
' $deleteCell=$Row.Cells['Uninstall'];$deleteCell.ToolTipText='';$deleteCell.ReadOnly=($Row.Tag.Status-eq'NotInstalled');$deleteCell.Tag=if($deleteCell.ReadOnly){'DisabledDelete'}else{$null}
' if($deleteCell.ReadOnly){$deleteCell.Value='Delete';$deleteCell.FlatStyle='Flat';$deleteCell.Style.BackColor=[Drawing.Color]::FromArgb(41,41,45);$deleteCell.Style.ForeColor=[Drawing.Color]::FromArgb(148,148,156);$deleteCell.Style.SelectionBackColor=[Drawing.Color]::FromArgb(41,41,45);$deleteCell.Style.SelectionForeColor=[Drawing.Color]::FromArgb(148,148,156)}else{$deleteCell.Value='Delete';$deleteCell.FlatStyle='Flat';$deleteCell.Style.BackColor=[Drawing.Color]::FromArgb(72,39,42);$deleteCell.Style.ForeColor=[Drawing.Color]::FromArgb(232,213,214);$deleteCell.Style.SelectionBackColor=[Drawing.Color]::FromArgb(72,39,42);$deleteCell.Style.SelectionForeColor=[Drawing.Color]::FromArgb(232,213,214)}
' Update-FrostyRow $Row;Update-Summary
'}
'function Restore-StatusColors {
' if($null-eq$dgv-or$dgv.IsDisposed){return}
' foreach($row in $dgv.Rows){if($null-eq$row.Tag){continue};$info=Status-Info ([string]$row.Tag.Status);$statusCell=$row.Cells['Status'];$statusCell.Style.ForeColor=$info.Color;$statusCell.Style.SelectionForeColor=$info.Color;$statusCell.Style.SelectionBackColor=$C.Surface}
'}
'function Set-Progress([bool]$Visible,[string]$Text='',[int]$Value=0){
' $pnlProgress.Visible=$Visible;$lblProgress.Text=$Text
' if($Value-ge0-and$Value-le100){$prg.Value=$Value}
' Restore-StatusColors
' [Windows.Forms.Application]::DoEvents()
' Restore-StatusColors
'}
'function Complete-PrivateKeyProgress([string]$Text){
' foreach($value in @(94,96,98,100)){Set-Progress $true 'Checking private key...' $value;Set-NlhBlueGlowProgress $prg;$pnlProgress.Refresh();[Windows.Forms.Application]::DoEvents();Start-Sleep -Milliseconds 90}
' Set-Progress $true 'Checking private key...' 100;Set-NlhBlueGlowProgress $prg;$pnlProgress.Refresh();[Windows.Forms.Application]::DoEvents();Start-Sleep -Milliseconds 180;Set-Progress $true $Text 100;Set-NlhBlueGlowProgress $prg;$pnlProgress.Refresh();[Windows.Forms.Application]::DoEvents();Start-Sleep -Milliseconds 420
'}
'function Sync-UpdatedCharacterInFrostyConfig($OldFiles,$NewFiles){
' if($OldFiles.Count-eq0-or-not(Test-Path -LiteralPath $FrostyConfigPath)){return}
' $json=Get-Content -LiteralPath $FrostyConfigPath -Raw -Encoding UTF8|ConvertFrom-Json
' $game=$json.Games.starwarsbattlefrontii;if($null-eq$game){return}
' $packName=[string]$game.Options.SelectedPack;$property=$game.Packs.PSObject.Properties[$packName];if($null-eq$property){return}
' $old=@{};foreach($name in $OldFiles){$old[$name.ToLowerInvariant()]=$true}
' $entries=@([string]$property.Value-split'\|');$result=New-Object System.Collections.Generic.List[string];$foundOld=$false;$inserted=$false;$newIndex=0
' foreach($entry in $entries){
'  if([string]::IsNullOrWhiteSpace($entry)){continue}
'  $i=$entry.LastIndexOf(':');$name=if($i-gt0){$entry.Substring(0,$i)}else{$entry};$state=if($i-gt0){$entry.Substring($i+1)}else{'True'}
'  if($old.ContainsKey($name.ToLowerInvariant())){
'   $foundOld=$true
'   if($newIndex-lt$NewFiles.Count){$result.Add(([string]$NewFiles[$newIndex])+':'+$state);$newIndex++}
'   if(-not$inserted){while($newIndex-lt$NewFiles.Count){$result.Add(([string]$NewFiles[$newIndex])+':'+$state);$newIndex++};$inserted=$true}
'  }else{$result.Add($entry)}
' }
' if(-not$foundOld){return}
' $backup=$FrostyConfigPath+'.nlh-update-backup';Copy-Item $FrostyConfigPath $backup -Force
' try{$property.Value=($result-join'|');[IO.File]::WriteAllText($FrostyConfigPath,($json|ConvertTo-Json -Depth 20),(New-Object Text.UTF8Encoding($false)));Get-Content $FrostyConfigPath -Raw -Encoding UTF8|ConvertFrom-Json|Out-Null;Log "Updated Frosty entries for $($NewFiles.Count) file(s)." Silver}catch{Copy-Item $backup $FrostyConfigPath -Force;throw}finally{Remove-Item $backup -Force -ErrorAction SilentlyContinue}
'}
'function Download-And-Extract($Mod){
' $client=New-Object Net.WebClient;$client.Headers['User-Agent']='NLH-Mods-Downloader'
' try{
'  $characterRoot=Join-Path $DestRoot (Safe-Name $Mod.Character)
'  $oldFiles=@(if(Test-Path -LiteralPath $characterRoot){Get-ChildItem -LiteralPath $characterRoot -Filter '*.fbmod' -File -Recurse -ErrorAction SilentlyContinue|ForEach-Object Name|Sort-Object -Unique})
'  Log "Downloading $($Mod.Character) $($Mod.Version)..." Silver
'  Set-Progress $true "Downloading: $([IO.Path]::GetFileNameWithoutExtension([string]$Mod.FileName))" 0
'  try{if([string]::IsNullOrWhiteSpace([string]$Mod.DownloadUrl)){throw 'GitHub download URL unavailable.'};$bytes=$client.DownloadData($Mod.DownloadUrl)}catch{try{$bytes=Get-DriveFallbackBytes $Mod}catch{throw 'The mod download is currently unavailable from both sources.'}}
'  Set-Progress $true "Installing: $($Mod.Character) $($Mod.Version)" 55
'  $target=Join-Path $DestRoot (Join-Path (Safe-Name $Mod.Character) (Safe-Name $Mod.Version))
'  if(Test-Path $target){Remove-Item -LiteralPath $target -Recurse -Force}
'  [IO.Directory]::CreateDirectory($target)|Out-Null
'  $ms=New-Object IO.MemoryStream(,$bytes);$zip=New-Object IO.Compression.ZipArchive($ms,[IO.Compression.ZipArchiveMode]::Read)
'  try{
'   foreach($entry in $zip.Entries){
'    $rel=$entry.FullName.Replace('/','\'); if([string]::IsNullOrWhiteSpace($rel)){continue}
'    $dest=[IO.Path]::GetFullPath((Join-Path $target $rel));$root=[IO.Path]::GetFullPath($target)+[IO.Path]::DirectorySeparatorChar
'    if(-not $dest.StartsWith($root,[StringComparison]::OrdinalIgnoreCase)){throw 'Unsafe path found inside ZIP.'}
'    if($entry.Name-eq''){[IO.Directory]::CreateDirectory($dest)|Out-Null;continue}
'    [IO.Directory]::CreateDirectory([IO.Path]::GetDirectoryName($dest))|Out-Null
'    $input=$entry.Open();$output=[IO.File]::Create($dest)
'    try{$input.CopyTo($output)}finally{$output.Dispose();$input.Dispose()}
'   }
'  }finally{$zip.Dispose();$ms.Dispose()}
'  Set-Progress $true "Installed: $($Mod.Character) $($Mod.Version)" 100
'  Log "Installed new version: $($Mod.Character) $($Mod.Version)." LimeGreen
'  if($oldFiles.Count-gt0){
'   $frostyExe=Get-FrostyExecutable
'   $newFiles=@(Install-CharacterIntoFrosty $Mod $frostyExe)
'   Sync-UpdatedCharacterInFrostyConfig $oldFiles $newFiles
'   Remove-OldCharacterFilesFromFrosty $oldFiles $newFiles $frostyExe
'  }
'  if($chkDeleteOldVersions.Checked){
'   $removedVersions=New-Object System.Collections.Generic.List[string]
'   foreach($oldVersionFolder in @(Get-ChildItem -LiteralPath $characterRoot -Directory -ErrorAction SilentlyContinue)){
'    if($oldVersionFolder.FullName-ine$target){
'     $removedVersions.Add($oldVersionFolder.Name)
'     Remove-Item -LiteralPath $oldVersionFolder.FullName -Recurse -Force
'    }
'   }
'   if($removedVersions.Count-gt0){Log "Deleted previous version for $($Mod.Character): $($removedVersions -join ', ')." Red}
'  }
' }finally{$client.Dispose();Start-Sleep -Milliseconds 250;Set-Progress $false}
'}
'function Show-NLHInfo([string]$Title,[string]$Message) {
' $dialog=New-Object Windows.Forms.Form
' $dialog.Text=$Title;$dialog.ClientSize=New-Object Drawing.Size(500,190)
' $dialog.FormBorderStyle='FixedDialog';$dialog.MaximizeBox=$false;$dialog.MinimizeBox=$false
' $dialog.StartPosition='CenterParent';$dialog.BackColor=$C.Form;$dialog.ForeColor=$C.Text
' $dialog.Font=New-Object Drawing.Font('Segoe UI',10);$dialog.ShowInTaskbar=$false
' $accent=New-Object Windows.Forms.Panel;$accent.SetBounds(0,0,500,3);$accent.BackColor=$C.Accent
' $label=New-Object Windows.Forms.Label;$label.SetBounds(22,22,456,88);$label.AutoEllipsis=$true;$label.Text=$Message
' $label.ForeColor=$C.Text;$label.AutoSize=$false;$label.TextAlign='MiddleLeft'
' $ok=New-Object Windows.Forms.Button;$ok.SetBounds(382,128,96,34);$ok.Text='OK'
' Style-Button $ok $C.Accent $C.Text $C.Accent $C.AccentHot
' $dialog.AcceptButton=$ok;$dialog.CancelButton=$ok
' $dialog.Add_FormClosing({$dialog.Opacity=0;$dialog.Refresh();[Windows.Forms.Application]::DoEvents()})
' $ok.Add_Click({$dialog.DialogResult=[Windows.Forms.DialogResult]::OK;$dialog.Close()})
' $dialog.Controls.AddRange([Windows.Forms.Control[]]@($accent,$label,$ok))
' try{(Invoke-NlhOwnedWindow $dialog $form)|Out-Null}finally{$dialog.Dispose();if($null-ne$form-and-not$form.IsDisposed){$form.Activate();$form.BringToFront();$form.Focus()}}
'}
'function Show-NLHConfirm([string]$Title,[string]$Message,[string]$ConfirmText='Continue') {
' $dialog=New-Object Windows.Forms.Form
' $dialog.Text=$Title;$dialog.ClientSize=New-Object Drawing.Size(500,280)
' $dialog.FormBorderStyle='FixedDialog';$dialog.MaximizeBox=$false;$dialog.MinimizeBox=$false
' $dialog.StartPosition='CenterParent';$dialog.BackColor=$C.Form;$dialog.ForeColor=$C.Text
' $dialog.Font=New-Object Drawing.Font('Segoe UI',10);$dialog.ShowInTaskbar=$false
' $accent=New-Object Windows.Forms.Panel;$accent.SetBounds(0,0,500,3);$accent.BackColor=$C.Accent
' $label=New-Object Windows.Forms.Label;$label.SetBounds(22,18,456,184);$label.Text=$Message;$label.AutoEllipsis=$true
' $label.ForeColor=$C.Text;$label.AutoSize=$false;$label.TextAlign='MiddleLeft'
' $yes=New-Object Windows.Forms.Button;$yes.SetBounds(238,220,136,34);$yes.Text=$ConfirmText
' Style-Button $yes $C.Accent $C.Text $C.Accent $C.AccentHot
' $no=New-Object Windows.Forms.Button;$no.SetBounds(382,220,96,34);$no.Text='Cancel'
' Style-Button $no $C.Surface2 $C.Text $C.Border $C.Header
' $dialog.AcceptButton=$yes;$dialog.CancelButton=$no
' $dialog.Add_FormClosing({if($dialog.Opacity-ne0){$dialog.Opacity=0;$dialog.ShowInTaskbar=$false;$dialog.Refresh();[Windows.Forms.Application]::DoEvents()}})
' $yes.Add_Click({$dialog.Opacity=0;$dialog.ShowInTaskbar=$false;$dialog.Refresh();[Windows.Forms.Application]::DoEvents();$dialog.DialogResult=[Windows.Forms.DialogResult]::Yes;$dialog.Close()})
' $no.Add_Click({$dialog.Opacity=0;$dialog.ShowInTaskbar=$false;$dialog.Refresh();[Windows.Forms.Application]::DoEvents();$dialog.DialogResult=[Windows.Forms.DialogResult]::No;$dialog.Close()})
' $dialog.Controls.AddRange([Windows.Forms.Control[]]@($accent,$label,$yes,$no))
' try { return ((Invoke-NlhOwnedWindow $dialog $form)-eq[Windows.Forms.DialogResult]::Yes) }
' finally { $dialog.Dispose() }
'}
'function Show-FrostyRetryDialog([string]$Message) {
' $dialog=New-Object Windows.Forms.Form
' $dialog.Text='Close Frosty Mod Manager';$dialog.ClientSize=New-Object Drawing.Size(500,190)
' $dialog.FormBorderStyle='FixedDialog';$dialog.MaximizeBox=$false;$dialog.MinimizeBox=$false;$dialog.ShowInTaskbar=$false
' $dialog.StartPosition='CenterScreen';$dialog.TopMost=$true
' $dialog.Add_Shown({$dialog.Activate();$dialog.BringToFront()});$dialog.Add_FormClosing({$dialog.Opacity=0})
' $dialog.BackColor=$C.Form;$dialog.ForeColor=$C.Text;$dialog.Font=New-Object Drawing.Font('Segoe UI',10)
' $accent=New-Object Windows.Forms.Panel;$accent.SetBounds(0,0,500,3);$accent.BackColor=$C.Accent
' $title=New-Object Windows.Forms.Label;$title.SetBounds(22,20,456,28);$title.Text='Frosty Mod Manager is open';$title.ForeColor=$C.Text;$title.Font=New-Object Drawing.Font('Segoe UI Semibold',12)
' $label=New-Object Windows.Forms.Label;$label.SetBounds(22,56,456,60);$label.Text=$Message;$label.ForeColor=$C.Muted;$label.AutoSize=$false
' $retry=New-Object Windows.Forms.Button;$retry.SetBounds(250,128,102,34);$retry.Text='Retry';Style-Button $retry $C.Accent ([Drawing.Color]::White) $C.Accent $C.AccentHot
' $cancel=New-Object Windows.Forms.Button;$cancel.SetBounds(368,128,110,34);$cancel.Text='Close NLH MM';Style-Button $cancel $C.Surface2 $C.Text $C.Border $C.Header
' $retry.Add_Click({$dialog.Opacity=0;$dialog.DialogResult=[Windows.Forms.DialogResult]::Retry;$dialog.Close()})
' $cancel.Add_Click({$dialog.Opacity=0;$dialog.DialogResult=[Windows.Forms.DialogResult]::Cancel;$dialog.Close()})
' $dialog.AcceptButton=$retry;$dialog.CancelButton=$cancel;$dialog.Controls.AddRange([Windows.Forms.Control[]]@($accent,$title,$label,$retry,$cancel))
' try{return (Invoke-NlhOwnedWindow $dialog $form)}finally{$dialog.Dispose()}
'}
'function Assert-FrostyClosedForConfigChange {
' if(-not$script:MainScreenReady){return}
' while(@(Get-Process -Name 'Frosty','FrostyModManager' -ErrorAction SilentlyContinue).Count-gt0){
'$message="Close Frosty Mod Manager, then select Retry to continue using NLH Mod Manager."
'  $result=Show-FrostyRetryDialog $message
'  if($result-ne[Windows.Forms.DialogResult]::Retry){$script:AppClosing=$true;try{if($null-ne$form-and-not$form.IsDisposed){$form.Close()}}catch{};try{if($null-ne$applicationContext){$applicationContext.ExitThread()}}catch{};throw 'NLH Mod Manager was closed because Frosty Mod Manager is still open.'}
' }
' if(-not$script:AppClosing-and$null-ne$form-and-not$form.IsDisposed){$form.WindowState=[Windows.Forms.FormWindowState]::Normal;$form.Show();$form.Activate();$form.BringToFront();$form.Focus()}
'}
'function Get-CurrentFrostyPackInfo {
' if(-not(Test-Path -LiteralPath $FrostyConfigPath)){return $null}
' try{
'  $json=Get-Content -LiteralPath $FrostyConfigPath -Raw -Encoding UTF8|ConvertFrom-Json
'  $game=$json.Games.starwarsbattlefrontii
'  if($null-eq$game){return $null}
'  $packName=[string]$game.Options.SelectedPack
'  if([string]::IsNullOrWhiteSpace($packName)){return $null}
'  $property=$game.Packs.PSObject.Properties[$packName]
'  if($null-eq$property){return $null}
'  [pscustomobject]@{Name=$packName;Value=[string]$property.Value}
' }catch{return $null}
'}
'function Update-FrostyPackDisplay {
' $pack=Get-CurrentFrostyPackInfo
' if($null-eq$pack){$lblFrostyPack.Text='Selected Frosty pack: Not available';$lblFrostyPack.ForeColor=$C.Muted}
' else{$lblFrostyPack.Text='Selected Frosty pack: '+$pack.Name;$lblFrostyPack.ForeColor=$C.Text}
'}
'function Test-CharacterInFrostyConfig($Mod){
' try{$files=@(Get-CharacterFbmods $Mod)}catch{return $false}
' $pack=Get-CurrentFrostyPackInfo;if($null-eq$pack){return $false}
' $entries=@($pack.Value-split'\|')
' foreach($file in $files){
'  $found=$false
'  foreach($entry in $entries){$i=$entry.LastIndexOf(':');if($i-gt0){$name=$entry.Substring(0,$i)}else{$name=$entry};if($name-ieq$file){$found=$true;break}}
'  if(-not$found){return $false}
' }
' $true
'}
'function Update-FrostyRow($Row){
' $cell=$Row.Cells['Frosty'];$cell.FlatStyle='Flat'
' if($Row.Tag.Status-eq'NotInstalled'){
'  $cell.Value='Add to Config';$cell.ToolTipText='';$cell.ReadOnly=$true;$cell.Tag='DisabledConfig';$cell.Style.BackColor=[Drawing.Color]::FromArgb(41,41,45);$cell.Style.ForeColor=[Drawing.Color]::FromArgb(148,148,156);$cell.Style.SelectionBackColor=[Drawing.Color]::FromArgb(41,41,45);$cell.Style.SelectionForeColor=[Drawing.Color]::FromArgb(148,148,156);return
' }
' $cell.ReadOnly=$false;$cell.Tag=$null
' if($script:StagedCharacters.Contains([string]$Row.Tag.Character)){$cell.Value='Queued to Config';$cell.Style.BackColor=[Drawing.Color]::FromArgb(40,40,44);$cell.Style.ForeColor=$C.Text}
' elseif(Test-CharacterInFrostyConfig $Row.Tag){$cell.Value='Remove from Config';$cell.Style.BackColor=[Drawing.Color]::FromArgb(57,42,44);$cell.Style.ForeColor=[Drawing.Color]::FromArgb(226,207,209)}
' else{$cell.Value='Add to Config';$cell.Style.BackColor=[Drawing.Color]::FromArgb(40,40,44);$cell.Style.ForeColor=$C.Text}
' $cell.Style.SelectionBackColor=$cell.Style.BackColor;$cell.Style.SelectionForeColor=$cell.Style.ForeColor
'}
'function Remove-CharacterFromFrostyConfig($Row){
' Assert-FrostyClosedForConfigChange
' $files=@(Get-CharacterFbmods $Row.Tag)
' $json=Get-Content -LiteralPath $FrostyConfigPath -Raw -Encoding UTF8|ConvertFrom-Json
' $game=$json.Games.starwarsbattlefrontii;$packName=[string]$game.Options.SelectedPack;$property=$game.Packs.PSObject.Properties[$packName]
' if($null-eq$property){throw "The selected Frosty pack '$packName' was not found."}
' $remove=@{};foreach($file in $files){$remove[$file.ToLowerInvariant()]=$true}
' $kept=New-Object System.Collections.Generic.List[string]
' foreach($entry in @(([string]$property.Value)-split'\|')){if([string]::IsNullOrWhiteSpace($entry)){continue};$i=$entry.LastIndexOf(':');if($i-gt0){$name=$entry.Substring(0,$i)}else{$name=$entry};if(-not$remove.ContainsKey($name.ToLowerInvariant())){$kept.Add($entry)}}
' $backup=$FrostyConfigPath+'.nlh-backup';Copy-Item $FrostyConfigPath $backup -Force
' try{$property.Value=($kept-join'|');[IO.File]::WriteAllText($FrostyConfigPath,($json|ConvertTo-Json -Depth 20),(New-Object Text.UTF8Encoding($false)));Get-Content $FrostyConfigPath -Raw -Encoding UTF8|ConvertFrom-Json|Out-Null;$script:ConfigChanged=$true;Log "Removed $($Row.Tag.Character) from Frosty pack '$packName'." LimeGreen;Update-FrostyRow $Row;Update-StagedDisplay;$lblStaged.Text='Config changes ready';$btnLaunchFrosty.Text='Apply Config Changes and Launch Frosty';Set-ApplyOnlyAvailable $true;Update-FrostyPackDisplay}catch{Copy-Item $backup $FrostyConfigPath -Force;throw}finally{Remove-Item $backup -Force -ErrorAction SilentlyContinue}
'}
'function Update-BulkConfigButton {
' if($null-eq$btnBulkConfig-or$null-eq$pnlBulk){return}
' if($null-eq$dgv-or$dgv.IsDisposed){return}
' if($dgv.Rows.Count-eq0){$pnlBulk.Visible=$false;return}
' $eligible=@($dgv.Rows|Where-Object{$_.Tag.Status-ne'NotInstalled'})
' $hasInstalled=($eligible.Count-gt0)
' $pnlBulk.Visible=$true;$pnlBulk.BringToFront()
' $allDownloaded=($dgv.Rows.Count-gt0-and$eligible.Count-eq$dgv.Rows.Count)
' $btnRedownloadAll.Visible=$allDownloaded
' $btnRedownloadAll.Enabled=$allDownloaded
' $btnBulkConfig.Tag=$hasInstalled;$btnDeleteAll.Tag=$hasInstalled
' $btnBulkConfig.Enabled=$true;$btnDeleteAll.Enabled=$true
' if($hasInstalled){
'  $btnBulkConfig.BackColor=$C.Header;$btnBulkConfig.ForeColor=$C.Text;$btnBulkConfig.FlatAppearance.BorderColor=$C.Border;$btnBulkConfig.FlatAppearance.MouseOverBackColor=[Drawing.Color]::FromArgb(52,52,57);$btnBulkConfig.FlatAppearance.MouseDownBackColor=$C.AccentDown;$btnBulkConfig.Cursor=[Windows.Forms.Cursors]::Hand
'  $btnDeleteAll.BackColor=[Drawing.Color]::FromArgb(72,39,42);$btnDeleteAll.ForeColor=[Drawing.Color]::FromArgb(232,213,214);$btnDeleteAll.FlatAppearance.BorderColor=[Drawing.Color]::FromArgb(106,49,54);$btnDeleteAll.FlatAppearance.MouseOverBackColor=[Drawing.Color]::FromArgb(86,44,48);$btnDeleteAll.FlatAppearance.MouseDownBackColor=$C.AccentDown;$btnDeleteAll.Cursor=[Windows.Forms.Cursors]::Hand
' }else{
'  $inactiveBack=[Drawing.Color]::FromArgb(42,42,46);$inactiveText=[Drawing.Color]::FromArgb(180,180,186);$inactiveBorder=[Drawing.Color]::FromArgb(82,82,88)
'  foreach($inactiveButton in @($btnBulkConfig,$btnDeleteAll)){$inactiveButton.BackColor=$inactiveBack;$inactiveButton.ForeColor=$inactiveText;$inactiveButton.FlatAppearance.BorderColor=$inactiveBorder;$inactiveButton.FlatAppearance.MouseOverBackColor=$inactiveBack;$inactiveButton.FlatAppearance.MouseDownBackColor=$inactiveBack;$inactiveButton.Cursor=[Windows.Forms.Cursors]::Default}
'  $btnBulkConfig.Text='Add All to Config';return
' }
' $allSelected=$true
' foreach($row in $eligible){if(-not$script:StagedCharacters.Contains($row.Tag.Character)-and-not(Test-CharacterInFrostyConfig $row.Tag)){$allSelected=$false;break}}
' if($allSelected){$btnBulkConfig.Text='Remove All from Config'}else{$btnBulkConfig.Text='Add All to Config'}
'}
'function Update-StagedDisplay {
' $names=@($script:StagedCharacters.Keys)
' $btnClearQueue.Visible=($names.Count-gt0);Update-BulkConfigButton
' if($names.Count-eq0){if($script:ConfigChanged){$lblStaged.Text='Config changes ready';$btnLaunchFrosty.Text='Apply Config Changes and Launch Frosty';Set-ApplyOnlyAvailable $true}else{$lblStaged.Text='No config changes selected';$btnLaunchFrosty.Text='Launch Frosty Without Changes';Set-ApplyOnlyAvailable $false};return}
' if($names.Count-eq1){$display=$names[0]}
' elseif($names.Count-eq2){$display=$names[0]+' and '+$names[1]}
' else{$display=($names[0..($names.Count-2)]-join', ')+', and '+$names[-1]}
' $lblStaged.Text='Add '+$display+' to Config';$btnLaunchFrosty.Text='Apply Config Changes and Launch Frosty';Set-ApplyOnlyAvailable $true
'}
'function Get-CharacterFbmods($Mod){
' $folder=Join-Path $DestRoot (Join-Path (Safe-Name $Mod.Character) (Safe-Name $Mod.Version))
' if(-not(Test-Path -LiteralPath $folder)){throw "Install $($Mod.Character) before adding it to Frosty."}
' $files=@(Get-ChildItem -LiteralPath $folder -Filter '*.fbmod' -File -Recurse -ErrorAction Stop)
' if($files.Count-eq0){throw "No .fbmod files were found for $($Mod.Character)."}
' @($files.Name|Sort-Object -Unique)
'}
'function Stage-Character($Row){
' $files=@(Get-CharacterFbmods $Row.Tag)
' $script:StagedCharacters[$Row.Tag.Character]=[pscustomobject]@{Mod=$Row.Tag;Files=$files}
' Update-FrostyRow $Row
' Update-StagedDisplay
' Log "Queued $($Row.Tag.Character) for Frosty config ($($files.Count) file(s))." LimeGreen
'}
'function Unstage-Character($Row){
' $key=[string]$Row.Tag.Character
' $files=@(Get-CharacterFbmods $Row.Tag)
' if($script:StagedCharacters.Contains($key)){$script:StagedCharacters.Remove($key)}
' $cell=$Row.Cells['Frosty'];$cell.Value='Add to Config';$cell.ReadOnly=$false;$cell.Tag=$null;$cell.FlatStyle='Flat';$cell.Style.BackColor=[Drawing.Color]::FromArgb(40,40,44);$cell.Style.ForeColor=$C.Text;$cell.Style.SelectionBackColor=[Drawing.Color]::FromArgb(40,40,44);$cell.Style.SelectionForeColor=$C.Text
' $dgv.InvalidateCell($cell)
' Update-StagedDisplay
' Log "Unqueued $key for Frosty config ($($files.Count) file(s))." Silver
'}
'function Get-FrostyExecutable([bool]$ShowProgress=$false) {
' # Only Frosty 1.0.6.3 is accepted by the search below (same rule as the saved-path check).
' $pattern='(?i)(^|[\\/])(?:Frosty[^\\/]*[\\/])?1\.0\.6\.3(?:[\\/]|$)|Frosty[^\\/]*1\.0\.6\.3'
' try{$saved=(Get-ItemProperty -Path $SettingsRegPath -Name 'FrostyExe' -ErrorAction Stop).FrostyExe}catch{$saved=$null}
' if($saved-and(Test-Path -LiteralPath $saved)-and($saved-match'(?i)(^|[\\/])(?:Frosty[^\\/]*[\\/])?1\.0\.6\.3(?:[\\/]|$)|Frosty[^\\/]*1\.0\.6\.3')){return [IO.Path]::GetFullPath($saved)}
' $searchTimer=[Diagnostics.Stopwatch]::StartNew();$lastSecond=-1
' if($ShowProgress){$prg.Style=[Windows.Forms.ProgressBarStyle]::Marquee;$prg.MarqueeAnimationSpeed=24;$pnlProgress.Visible=$true;$lblProgress.Text='Locating Frosty Mod Manager...  0 s';Restore-StatusColors;Restore-PreferenceCheckboxes}
' $worker=[PowerShell]::Create()
' $searchScript=@'
'param($pattern)
'$ErrorActionPreference='SilentlyContinue'
'$candidates=New-Object System.Collections.Generic.List[string]
'$appPathKeys=@('HKCU:\Software\Microsoft\Windows\CurrentVersion\App Paths\FrostyModManager.exe','HKLM:\Software\Microsoft\Windows\CurrentVersion\App Paths\FrostyModManager.exe','HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\App Paths\FrostyModManager.exe')
'foreach($key in $appPathKeys){try{$value=(Get-Item -LiteralPath $key).GetValue('');if($value){$candidates.Add([string]$value)}}catch{}}
'$shortcutRoots=@((Join-Path $env:APPDATA 'Microsoft\Windows\Start Menu\Programs'),(Join-Path $env:ProgramData 'Microsoft\Windows\Start Menu\Programs'),(Join-Path $env:APPDATA 'Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar'),(Join-Path $env:USERPROFILE 'Desktop'),(Join-Path $env:PUBLIC 'Desktop'))
'try{$wsh=New-Object -ComObject WScript.Shell;foreach($root in $shortcutRoots){if(Test-Path -LiteralPath $root){foreach($lnk in Get-ChildItem -LiteralPath $root -Filter '*.lnk' -File -Recurse){try{$target=$wsh.CreateShortcut($lnk.FullName).TargetPath;if(([IO.Path]::GetFileName($target)-in@('Frosty.exe','FrostyModManager.exe'))){$candidates.Add($target)}}catch{}}}}}catch{}
'foreach($drive in Get-PSDrive -PSProvider FileSystem){if(-not(Test-Path -LiteralPath $drive.Root)){continue};foreach($fileName in @('Frosty.exe','FrostyModManager.exe')){foreach($exe in Get-ChildItem -LiteralPath $drive.Root -Filter $fileName -File -Recurse -Force){$candidates.Add($exe.FullName)}}}
'$candidates|Where-Object{(Test-Path -LiteralPath $_ -PathType Leaf)-and([IO.Path]::GetExtension($_)-ieq'.exe')-and($_-match$pattern)}|Sort-Object @{Expression={if([IO.Path]::GetFileName($_)-ieq'Frosty.exe'){0}else{1}}},@{Expression={$_.Length}}|Select-Object -First 1
''@
' $null=$worker.AddScript($searchScript).AddArgument($pattern);$async=$worker.BeginInvoke()
' try{
'  while(-not$async.IsCompleted){
'   $elapsed=[int]$searchTimer.Elapsed.TotalSeconds
'   if($ShowProgress-and$elapsed-ne$lastSecond){$lastSecond=$elapsed;$lblProgress.Text="Locating Frosty Mod Manager...  $elapsed s";Restore-StatusColors}
'   if($ShowProgress){Restore-StatusColors;Restore-PreferenceCheckboxes;[Windows.Forms.Application]::DoEvents();Restore-StatusColors;Restore-PreferenceCheckboxes}
'   Start-Sleep -Milliseconds 40
'  }
'  $result=@($worker.EndInvoke($async));$path=$result|Where-Object{$_}|Select-Object -First 1
' }finally{$worker.Dispose()}
' $searchTimer.Stop();$elapsed=[int]$searchTimer.Elapsed.TotalSeconds
' if(-not$path){if($ShowProgress){$prg.Style=[Windows.Forms.ProgressBarStyle]::Blocks;$prg.MarqueeAnimationSpeed=0;Set-Progress $false};throw 'Frosty version 1.0.6.3 could not be found in an extracted folder. Older versions and compressed archives are ignored.'}
' $path=[IO.Path]::GetFullPath([string]$path)
' if(-not(Test-Path $SettingsRegPath)){New-Item -Path $SettingsRegPath -Force|Out-Null}
' New-ItemProperty -Path $SettingsRegPath -Name 'FrostyExe' -Value $path -PropertyType String -Force|Out-Null
' if($ShowProgress){$lblProgress.Text="Located Frosty Mod Manager ($elapsed s)";Restore-StatusColors;Restore-PreferenceCheckboxes;[Windows.Forms.Application]::DoEvents();Restore-StatusColors;Restore-PreferenceCheckboxes;Start-Sleep -Milliseconds 250;$prg.Style=[Windows.Forms.ProgressBarStyle]::Blocks;$prg.MarqueeAnimationSpeed=0;Set-Progress $false}
' if($ShowProgress){Log "Located Frosty Mod Manager in $elapsed second(s)." LimeGreen}
' $path
'}
'function Start-FrostyBackgroundSearch {
' try{$saved=(Get-ItemProperty -Path $SettingsRegPath -Name 'FrostyExe' -ErrorAction Stop).FrostyExe}catch{$saved=$null}
' if($saved-and(Test-Path -LiteralPath $saved)){return}
' if($script:FrostyBackgroundPowerShell){return}
' $definition=${function:Get-FrostyExecutable}.ToString()
' $deepScan="foreach(`$drive in Get-PSDrive -PSProvider FileSystem){if(-not(Test-Path -LiteralPath `$drive.Root)){continue};foreach(`$fileName in @('Frosty.exe','FrostyModManager.exe')){foreach(`$exe in Get-ChildItem -LiteralPath `$drive.Root -Filter `$fileName -File -Recurse -Force){`$candidates.Add(`$exe.FullName)}}}"
' $quickScan="`$quickRoots=@((Join-Path `$env:USERPROFILE 'Downloads'),(Join-Path `$env:USERPROFILE 'Documents'),(Join-Path `$env:LOCALAPPDATA 'Programs'),`$env:ProgramFiles,`${env:ProgramFiles(x86)});foreach(`$root in `$quickRoots){if([string]::IsNullOrWhiteSpace(`$root)-or-not(Test-Path -LiteralPath `$root)){continue};foreach(`$fileName in @('Frosty.exe','FrostyModManager.exe')){foreach(`$exe in Get-ChildItem -LiteralPath `$root -Filter `$fileName -File -Recurse -ErrorAction SilentlyContinue){`$candidates.Add(`$exe.FullName)}}}"
' $definition=$definition.Replace($deepScan,$quickScan)
' $script:FrostyBackgroundPowerShell=[PowerShell]::Create()
' $backgroundScript='param($RegistryPath) [Threading.Thread]::CurrentThread.Priority=[Threading.ThreadPriority]::BelowNormal; $SettingsRegPath=$RegistryPath; function Get-FrostyExecutable { '+$definition+' }; try{Get-FrostyExecutable $false|Out-Null}catch{}'
' $null=$script:FrostyBackgroundPowerShell.AddScript($backgroundScript).AddArgument($SettingsRegPath)
' $null=$script:FrostyBackgroundPowerShell.BeginInvoke()
'}
'function Get-FrostyModsDirectory([string]$FrostyExe){
' $profile='starwarsbattlefrontii'
' $root=Join-Path ([IO.Path]::GetDirectoryName($FrostyExe)) 'Mods'
' $custom=''
' if(Test-Path -LiteralPath $FrostyConfigPath -PathType Leaf){try{$config=Get-Content -LiteralPath $FrostyConfigPath -Raw -Encoding UTF8|ConvertFrom-Json;$custom=[string]$config.CustomModsDirectory}catch{$custom=''}}
' if(-not[string]::IsNullOrWhiteSpace($custom)-and(Test-Path -LiteralPath $custom -PathType Container)){$root=[IO.Path]::GetFullPath($custom)}
' $dir=Join-Path $root $profile
' [IO.Directory]::CreateDirectory($dir)|Out-Null
' [IO.Path]::GetFullPath($dir)
'}
'function Install-CharacterIntoFrosty($Mod,[string]$FrostyExe){
' $source=Join-Path $DestRoot (Join-Path (Safe-Name $Mod.Character) (Safe-Name $Mod.Version))
' if(-not(Test-Path -LiteralPath $source)){throw "Install $($Mod.Character) before adding it to Frosty."}
' $fbmods=@(Get-ChildItem -LiteralPath $source -Filter '*.fbmod' -File -Recurse -ErrorAction Stop)
' if($fbmods.Count-eq0){throw "No .fbmod files were found for $($Mod.Character)."}
' $frostyDir=Get-FrostyModsDirectory $FrostyExe
' $installed=New-Object System.Collections.Generic.List[string]
' foreach($fbmod in $fbmods){
'  $related=@($fbmod)
'  $base=[IO.Path]::Combine($fbmod.DirectoryName,[IO.Path]::GetFileNameWithoutExtension($fbmod.Name))
'  foreach($archive in @(Get-ChildItem -LiteralPath $fbmod.DirectoryName -Filter '*.archive' -File -ErrorAction SilentlyContinue)){if($archive.FullName.StartsWith($base,[StringComparison]::OrdinalIgnoreCase)){$related+=@($archive)}}
'  foreach($file in $related){
'   $destination=Join-Path $frostyDir $file.Name
'   Copy-Item -LiteralPath $file.FullName -Destination $destination -Force
'   if((Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash-cne(Get-FileHash -LiteralPath $destination -Algorithm SHA256).Hash){throw "Frosty installation verification failed for $($file.Name)."}
'  }
'  $installed.Add($fbmod.Name)
' }
' Log "Installed $($installed.Count) mod file(s) into Frosty's mod library." LimeGreen
' @($installed)
'}
'function Remove-OldCharacterFilesFromFrosty($OldFiles,$NewFiles,[string]$FrostyExe){
' if($OldFiles.Count-eq0-or[string]::IsNullOrWhiteSpace($FrostyExe)){return}
' $frostyDir=Get-FrostyModsDirectory $FrostyExe
' $keep=@{};$keepArchiveBases=@{};foreach($name in $NewFiles){$normalizedName=([string]$name).ToLowerInvariant();$keep[$normalizedName]=$true;$keepArchiveBases[[IO.Path]::GetFileNameWithoutExtension($normalizedName)]=$true}
' foreach($oldName in $OldFiles){
'  if([string]::IsNullOrWhiteSpace($oldName)-or$keep.ContainsKey(([string]$oldName).ToLowerInvariant())){continue}
'  $oldFbmod=Join-Path $frostyDir ([string]$oldName)
'  $base=[IO.Path]::GetFileNameWithoutExtension([string]$oldName)
'  if(Test-Path -LiteralPath $oldFbmod -PathType Leaf){Remove-Item -LiteralPath $oldFbmod -Force}
'  foreach($archive in @(Get-ChildItem -LiteralPath $frostyDir -Filter '*.archive' -File -ErrorAction SilentlyContinue)){
'   $archiveBase=[IO.Path]::GetFileNameWithoutExtension($archive.Name);$belongsToOld=($archiveBase.Equals($base,[StringComparison]::OrdinalIgnoreCase)-or$archiveBase.StartsWith($base+'_',[StringComparison]::OrdinalIgnoreCase));$belongsToNew=$false;foreach($newBase in @($keepArchiveBases.Keys)){if($archiveBase.Equals($newBase,[StringComparison]::OrdinalIgnoreCase)-or$archiveBase.StartsWith($newBase+'_',[StringComparison]::OrdinalIgnoreCase)){$belongsToNew=$true;break}};if($belongsToOld-and-not$belongsToNew){Remove-Item -LiteralPath $archive.FullName -Force}
'  }
' }
'}
'function Close-AfterFrostyLaunch {
' if(-not$chkCloseAfterLaunch.Checked){return}
' $form.Hide()
' $form.BeginInvoke([Action]{$form.Close()})|Out-Null
'}
'function Apply-FrostyConfig([bool]$LaunchAfter) {
' if($script:StagedCharacters.Count-eq0-and-not$script:ConfigChanged){if($LaunchAfter){$exe=Get-FrostyExecutable $true;Start-Process -FilePath $exe -WorkingDirectory ([IO.Path]::GetDirectoryName($exe));Log 'Launched Frosty without config changes.' LimeGreen;Close-AfterFrostyLaunch};return}
' if($script:StagedCharacters.Count-eq0){$script:ConfigChanged=$false;Update-StagedDisplay;if($LaunchAfter){$exe=Get-FrostyExecutable $true;Start-Process -FilePath $exe -WorkingDirectory ([IO.Path]::GetDirectoryName($exe));Log 'Launched Frosty with the updated config.' LimeGreen;Close-AfterFrostyLaunch}else{Log 'Config changes applied without launching Frosty.' LimeGreen};return}
' Assert-FrostyClosedForConfigChange
' if(-not(Test-Path -LiteralPath $FrostyConfigPath)){throw "Frosty config was not found:`r`n$FrostyConfigPath"}
'$exe=Get-FrostyExecutable $LaunchAfter;if(-not$exe){return}
' $backup=$FrostyConfigPath+'.nlh-backup'
' Copy-Item -LiteralPath $FrostyConfigPath -Destination $backup -Force
' try{
'  $json=Get-Content -LiteralPath $FrostyConfigPath -Raw -Encoding UTF8|ConvertFrom-Json
'  $game=$json.Games.starwarsbattlefrontii
'  if($null-eq$game){throw 'The Star Wars Battlefront II Frosty profile was not found.'}
'  $packName=[string]$game.Options.SelectedPack
'  if([string]::IsNullOrWhiteSpace($packName)){throw 'Frosty has no currently selected mod pack.'}
'  $packProperty=$game.Packs.PSObject.Properties[$packName]
'  if($null-eq$packProperty){throw "The selected Frosty pack '$packName' was not found."}
'  $newFiles=New-Object System.Collections.Generic.List[string]
'  foreach($item in $script:StagedCharacters.Values){
'   $installedNames=@(Install-CharacterIntoFrosty $item.Mod $exe)
'   foreach($name in $installedNames){if(-not$newFiles.Contains($name)){$newFiles.Add($name)}}
'  }
'  $remove=@{};foreach($name in $newFiles){$remove[$name.ToLowerInvariant()]=$true}
'  $existing=New-Object System.Collections.Generic.List[string]
'  foreach($entry in @(([string]$packProperty.Value)-split'\|')){
'   if([string]::IsNullOrWhiteSpace($entry)){continue}
'   $separatorIndex=$entry.LastIndexOf(':')
'   if($separatorIndex-gt0){$name=$entry.Substring(0,$separatorIndex)}else{$name=$entry}
'   if(-not$remove.ContainsKey($name.ToLowerInvariant())){$existing.Add($entry)}
'  }
'  $applyMode=[string]$json.GlobalOptions.ApplyModOrder
'  $newEntries=New-Object System.Collections.Generic.List[string]
'  foreach($name in $newFiles){$newEntries.Add($name+':True')}
'  $ordered=New-Object System.Collections.Generic.List[string]
'  if($applyMode-ieq'List'){
'   foreach($entry in $newEntries){$ordered.Add($entry)}
'   foreach($entry in $existing){$ordered.Add($entry)}
'  }else{
'   foreach($entry in $existing){$ordered.Add($entry)}
'   foreach($entry in $newEntries){$ordered.Add($entry)}
'  }
'  $packProperty.Value=($ordered-join'|')
'  $out=$json|ConvertTo-Json -Depth 20
'  [IO.File]::WriteAllText($FrostyConfigPath,$out,(New-Object Text.UTF8Encoding($false)))
'  $verify=Get-Content -LiteralPath $FrostyConfigPath -Raw -Encoding UTF8|ConvertFrom-Json
'  if([string]$verify.Games.starwarsbattlefrontii.Options.SelectedPack-ne$packName){throw 'Config validation failed after saving.'}
'  $savedPack=[string]$verify.Games.starwarsbattlefrontii.Packs.PSObject.Properties[$packName].Value
'  foreach($name in $newFiles){if(-not$savedPack.Contains($name+':True')){throw "Config validation failed for $name."}}
'  Log "Added $($newFiles.Count) mod file(s) to Frosty pack '$packName'." LimeGreen
'  $script:StagedCharacters.Clear();$script:ConfigChanged=$false;Update-StagedDisplay;foreach($row in $dgv.Rows){Update-FrostyRow $row};Update-FrostyPackDisplay
'  if($LaunchAfter){Start-Process -FilePath $exe -WorkingDirectory ([IO.Path]::GetDirectoryName($exe));Log 'Applied config changes and launched Frosty.' LimeGreen;Close-AfterFrostyLaunch}else{Log 'Applied config changes without launching Frosty.' LimeGreen}
' }catch{Copy-Item -LiteralPath $backup -Destination $FrostyConfigPath -Force;throw}finally{Remove-Item -LiteralPath $backup -Force -ErrorAction SilentlyContinue}
'}
'function Uninstall-Mod($Row){
' $mod=$Row.Tag
' $message="Uninstall $($mod.Character) $($mod.Version)?`r`n`r`nThis removes the installed mod, archive companions, Frosty library files, and matching Frosty pack entries."
' if(-not(Show-NLHConfirm ("Uninstall $($mod.Character) $($mod.Version)") $message 'Uninstall')){return}
' Set-Busy $true
' try{
'  Revoke-PrivateModAccess $mod
'  Log "Uninstalled $($mod.Character) from local storage and Frosty." LimeGreen
'  Update-Row $Row;Update-FrostyPackDisplay;Update-BulkConfigButton;Update-StagedDisplay
' }finally{Update-BulkConfigButton;Set-Busy $false}
'}
'function Get-CommitPinnedGitHubText([string]$FileName){
' $curlPath=Join-Path $env:SystemRoot 'System32\curl.exe';if(-not(Test-Path -LiteralPath $curlPath -PathType Leaf)){return [pscustomobject]@{Status=0;Text=$null;Url=$null}}
' try{
'  $stamp=[DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds();$feedUrl="https://github.com/$Owner/$Repository/commits/$Branch.atom?_nlh=$stamp"
'  $feed=[string](& $curlPath '--silent' '--show-error' '--location' '--connect-timeout' '8' '--max-time' '15' '--header' 'Cache-Control: no-cache, no-store, max-age=0' '--header' 'Pragma: no-cache' $feedUrl 2>&1|Out-String)
'  if($LASTEXITCODE-ne0){return [pscustomobject]@{Status=0;Text=$null;Url=$feedUrl}}
'  $commitMatch=[regex]::Match($feed,'(?i)/commit/([0-9a-f]{40})');if(-not$commitMatch.Success){return [pscustomobject]@{Status=0;Text=$null;Url=$feedUrl}}
'  $commit=$commitMatch.Groups[1].Value;$encoded=[uri]::EscapeDataString($FileName);$url="https://raw.githubusercontent.com/$Owner/$Repository/$commit/${encoded}?_nlh=$stamp"
'  $output=[string](& $curlPath '--silent' '--show-error' '--location' '--connect-timeout' '8' '--max-time' '15' '--header' 'Cache-Control: no-cache, no-store, max-age=0' '--header' 'Pragma: no-cache' '--write-out' "`n__NLH_HTTP_STATUS__:%{http_code}" $url 2>&1|Out-String)
'  $match=[regex]::Match($output,'(?s)^(.*)\r?\n__NLH_HTTP_STATUS__:(\d{3})\s*$');if(-not$match.Success){return [pscustomobject]@{Status=0;Text=$null;Url=$url}}
'  $body=$match.Groups[1].Value;$status=[int]$match.Groups[2].Value;[pscustomobject]@{Status=$status;Text=$(if($status-eq200){$body}else{$null});Url=$url}
' }catch{return [pscustomobject]@{Status=0;Text=$null;Url=$null}}
'}
'function Get-DirectGitHubText([string]$FileName){
' if($script:ManualHashRefresh){return Get-CommitPinnedGitHubText $FileName}
' $encoded=[uri]::EscapeDataString($FileName)
' $url="https://raw.githubusercontent.com/$Owner/$Repository/$Branch/${encoded}?_nlh=$([DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds())"
' $curlPath=Join-Path $env:SystemRoot 'System32\curl.exe'
' if(-not(Test-Path -LiteralPath $curlPath -PathType Leaf)){return [pscustomobject]@{Status=0;Text=$null;Url=$url}}
' try{
'  $output=[string](& $curlPath '--silent' '--show-error' '--location' '--connect-timeout' '8' '--max-time' '15' '--header' 'Cache-Control: no-cache, no-store, max-age=0' '--write-out' "`n__NLH_HTTP_STATUS__:%{http_code}" $url 2>&1 | Out-String)
'  $exitCode=$LASTEXITCODE
'  $match=[regex]::Match($output,'(?s)^(.*)\r?\n__NLH_HTTP_STATUS__:(\d{3})\s*$')
'  if(-not$match.Success){return [pscustomobject]@{Status=0;Text=$null;Url=$url}}
'  $body=$match.Groups[1].Value;$status=[int]$match.Groups[2].Value
'  if($exitCode-ne0-and$status-eq0){return [pscustomobject]@{Status=0;Text=$null;Url=$url}}
'  [pscustomobject]@{Status=$status;Text=$body;Url=$url}
' }catch{return [pscustomobject]@{Status=0;Text=$null;Url=$url}}
'}
'function Apply-RawPrivateState($Mods){
' $metadata=@{}
' foreach($mod in $Mods){
'  $zip=[string]$mod.FileName;if([string]::IsNullOrWhiteSpace($zip)){continue}
'  $base=if($zip.EndsWith('.zip',[StringComparison]::OrdinalIgnoreCase)){$zip.Substring(0,$zip.Length-4)}else{$zip}
'  $privateName=$base+'_Private.txt';$privateResult=Get-DirectGitHubText $privateName
'  if($privateResult.Status-eq200-and-not[string]::IsNullOrWhiteSpace([string]$privateResult.Text)){
'   $privateText=[string]$privateResult.Text;$metadata[$privateName.ToLowerInvariant()]=$privateText;$privateId=Get-PrivateModId $mod
'   $trimmed=$privateText.Trim([char]0xFEFF,[char]0x200B,[char]0x00A0,[char]0x20,[char]0x09,[char]0x0D,[char]0x0A)
'   $hashMatch=[regex]::Match($trimmed,'(?im)^\s*sha256\s*:\s*([0-9a-f]{64})\s*$')
'   $currentPrivateHash=if($hashMatch.Success){$hashMatch.Groups[1].Value.ToLowerInvariant()}else{Get-KeyHash $trimmed}
'   $mod.IsPrivate=$true;$mod.PrivateUrl=[string]$privateResult.Url;$mod.PrivateApiUrl=$null;$mod.PrivateDriveFileId=$null
'   if(Test-PrivateModAuthorization $mod $currentPrivateHash){
'    if((-not$script:SavedPrivateUnlocks.ContainsKey($privateId))-or([string]$script:SavedPrivateUnlocks[$privateId]).Trim().ToLowerInvariant()-ne$currentPrivateHash){$script:SavedPrivateUnlocks[$currentPrivateHash]=$currentPrivateHash;$script:AuthorizedPrivateHashes[$currentPrivateHash]=$true;Save-PrivateUnlocks}
'   }
'   # Record the observed hash only. A user-requested full refresh is deliberately non-destructive.
'   $script:KnownPrivateMods[$privateId]=$true;$script:KnownPrivateHashes[$privateId]=$currentPrivateHash
'  }elseif($privateResult.Status-eq404){
'   $mod.IsPrivate=$false;$mod.PrivateUrl=$null;$mod.PrivateApiUrl=$null;$mod.PrivateDriveFileId=$null
'  }
'  $changeName=$base+'_Changelog.txt';$changeResult=Get-DirectGitHubText $changeName
'  if($changeResult.Status-eq200){$metadata[$changeName.ToLowerInvariant()]=[string]$changeResult.Text;$mod.HasChangelog=$true}
'  elseif($changeResult.Status-eq404){$mod.HasChangelog=$false}
' }
' $script:BranchMetadataText=$metadata;$script:PrivateExpectedHashCache.Clear();Save-KnownPrivateHashes
'}
'function Register-VerifiedCatalogMod($Mod){  
' if($null-eq$Mod){return}  
' $modId=Get-PrivateModId $Mod;$updated=New-Object System.Collections.Generic.List[object];$found=$false  
' foreach($catalogMod in @($script:AllCatalogMods)){if($null-eq$catalogMod){continue};if((Get-PrivateModId $catalogMod)-eq$modId){if(-not$found){$updated.Add($Mod);$found=$true}}else{$updated.Add($catalogMod)}}  
' if(-not$found){$updated.Add($Mod)};$script:AllCatalogMods=@($updated.ToArray())  
' Add-VerifiedCatalogRow $Mod;Update-CatalogViewportSurface;Update-BulkConfigButton;$dgv.Invalidate();$dgv.Update()  
'}  
'function Add-VerifiedCatalogRow($Mod){
' if($null-eq$Mod){return}
' foreach($existingRow in $dgv.Rows){if($null-ne$existingRow.Tag-and(Get-PrivateModId $existingRow.Tag)-eq(Get-PrivateModId $Mod)){return}}
' # Only the newest version of a character is listed: skip this one if a newer/equal one is shown, replace older ones.
' $sameCharacterRows=@($dgv.Rows|Where-Object{$null -ne $_.Tag -and ([string]$_.Tag.Character).Trim() -ieq ([string]$Mod.Character).Trim()})
' foreach($sameRow in $sameCharacterRows){if((Version-Key([string]$sameRow.Tag.Version)) -ge (Version-Key([string]$Mod.Version))){return}}
' foreach($sameRow in $sameCharacterRows){$dgv.Rows.Remove($sameRow)}
' $statusValue=Get-Status $Mod;if($Mod.PSObject.Properties['Status']){$Mod.Status=$statusValue}else{$Mod|Add-Member -MemberType NoteProperty -Name Status -Value $statusValue}
' $info=Status-Info $Mod.Status;$row=New-Object Windows.Forms.DataGridViewRow;$row.Height=$dgv.RowTemplate.Height;$row.MinimumHeight=$dgv.RowTemplate.Height;$row.CreateCells($dgv,$Mod.Character,$info.Text,$Mod.Version,$info.Button,$(if($Mod.HasChangelog){'View'}else{'—'}),'Add to Config','Delete');$row.Tag=$Mod
' $row.Cells[$dgv.Columns['Status'].Index].Style.ForeColor=$info.Color;$row.Cells[$dgv.Columns['Status'].Index].Style.SelectionForeColor=$info.Color;$row.Cells[$dgv.Columns['Status'].Index].Style.SelectionBackColor=$C.Surface
' $null=$dgv.Rows.Add($row);Update-Row $row;$dgv.ClearSelection();$dgv.CurrentCell=$null;Update-Summary
'}
'function Stop-PrivateVerificationForRefresh {
' try{if($null-ne$script:PrivateVerifyTimer){$script:PrivateVerifyTimer.Stop();$script:PrivateVerifyTimer.Dispose()}}catch{}
' $script:PrivateVerifyTimer=$null
' try{if($null-ne$script:PrivateVerifyPowerShell){$script:PrivateVerifyPowerShell.Stop();$script:PrivateVerifyPowerShell.Dispose()}}catch{}
' $script:PrivateVerifyPowerShell=$null;$script:PrivateVerifyAsync=$null;$script:PrivateVerifyCurrent=$null;$script:PrivateVerifyQueue=@();$script:PrivateVerifyIndex=0
' try{if($null-ne$script:PrivateCommitPowerShell){$script:PrivateCommitPowerShell.Stop();$script:PrivateCommitPowerShell.Dispose()}}catch{}
' $script:PrivateCommitPowerShell=$null;$script:PrivateCommitAsync=$null;$script:PrivateVerifyCommit=$null
'}
'function Load-Catalog([bool]$UseCachedCatalog=$false,[bool]$DeferPrivateVerification=$false) {
' $script:CatalogRowsReady=$false;if(-not$script:ManualHashRefresh){$pnlBulk.Visible=$false}
' $dgv.Rows.Clear();Log 'Loading mod catalog...' Silver
' try{if(-not$UseCachedCatalog-or$script:AllCatalogMods.Count-eq0){$script:PrivateExpectedHashCache.Clear();$script:AllCatalogMods=@(Merge-SavedPrivateCandidates @(Get-Catalog));if(-not$DeferPrivateVerification){Apply-RawPrivateState $script:AllCatalogMods}};$mods=if($DeferPrivateVerification){@($script:AllCatalogMods|Where-Object{-not$_.IsPrivate})}else{@(Select-NewestPerCharacter @($script:AllCatalogMods|Where-Object{Test-ModUnlocked $_}))}}catch{Show-NLHInfo 'NLH Mod Manager' ("Could not load the mod catalog:`n`n$($_.Exception.Message)");return}
' $dgv.SuspendLayout();$dgv.AutoSizeColumnsMode='None'
' try{
'  $rows=New-Object System.Collections.Generic.List[Windows.Forms.DataGridViewRow]
'  $index=0
'  foreach($m in $mods){
'   $statusValue=Get-Status $m;if($m.PSObject.Properties['Status']){$m.Status=$statusValue}else{$m|Add-Member -MemberType NoteProperty -Name Status -Value $statusValue}
'   $i=Status-Info $m.Status
'   $row=New-Object Windows.Forms.DataGridViewRow;$row.Height=$dgv.RowTemplate.Height;$row.MinimumHeight=$dgv.RowTemplate.Height;$row.CreateCells($dgv,$m.Character,$i.Text,$m.Version,$i.Button,$(if($m.HasChangelog){'View'}else{'—'}),'Add to Config','Delete');$row.Tag=$m
'   $row.Cells[$dgv.Columns['Status'].Index].Style.ForeColor=$i.Color;$row.Cells[$dgv.Columns['Status'].Index].Style.SelectionForeColor=$i.Color;$row.Cells[$dgv.Columns['Status'].Index].Style.SelectionBackColor=$C.Surface
'   $rows.Add($row);$index++
'   if(($index%20)-eq0){[Windows.Forms.Application]::DoEvents()}
'  }
'  if($rows.Count-gt0){$dgv.Rows.AddRange($rows.ToArray())}
'  foreach($row in $dgv.Rows){Update-Row $row}
' }finally{$dgv.AutoSizeColumnsMode='Fill';$dgv.ResumeLayout($true)}
' $script:CatalogRowsReady=$true
' $finalLoadedCount=@($dgv.Rows|Where-Object{$null-ne$_.Tag}).Count;Log "Loaded $finalLoadedCount mods." LimeGreen;Update-Summary;Update-FrostyPackDisplay;Update-BulkConfigButton;Update-CatalogViewportSurface;$dgv.ClearSelection();$dgv.CurrentCell=$null
'}
'$ReleaseAccessRegPath=Join-Path $SettingsRegPath 'PrivateAccess\ReleaseVersions'
'function Save-KnownReleaseVersion([string]$Version){
' if([string]::IsNullOrWhiteSpace($Version)-or$Version-eq'1.0'){return}
' try{
'  if(-not(Test-Path -LiteralPath $SettingsRegPath -PathType Container)){New-Item -Path $SettingsRegPath -Force|Out-Null}
'  $savedText='';try{$savedText=[string](Get-ItemProperty -LiteralPath $SettingsRegPath -Name 'UnlockedReleaseVersions' -ErrorAction Stop).UnlockedReleaseVersions}catch{}
'  $saved=New-Object System.Collections.Generic.List[string]
'  foreach($item in @($savedText-split'[,;|]')){$item=([string]$item).Trim();if($item-match'^\d+(?:\.\d+)+$'-and$item-ne'1.0'-and-not$saved.Contains($item)){$null=$saved.Add($item)}}
'  if(-not$saved.Contains($Version)){$null=$saved.Add($Version)}
'  $validSaved=@($saved|ForEach-Object{([string]$_).Trim()}|Where-Object{$_-match'^\d+(?:\.\d+)+$'}|Select-Object -Unique);$value=(@($validSaved|Sort-Object {[version]$_})-join',')
'  New-ItemProperty -LiteralPath $SettingsRegPath -Name 'UnlockedReleaseVersions' -Value $value -PropertyType String -Force|Out-Null
' }catch{}
'}
'function Refresh-ReleaseAuthorizationState {
'$script:CurrentReleaseRemoteRevision=''
' $script:CurrentReleaseStillAuthorized=$true;$script:AvailableReleaseCount=0
' $candidateVersions=New-Object System.Collections.Generic.List[string]
' foreach($version in @(([string]$env:NLH_AVAILABLE_RELEASES)-split';')){$version=([string]$version).Trim();if($version-match'^\d+(?:\.\d+)+$'-and-not$candidateVersions.Contains($version)){$null=$candidateVersions.Add($version)}}
' $savedText='';try{$savedText=[string](Get-ItemProperty -LiteralPath $SettingsRegPath -Name 'UnlockedReleaseVersions' -ErrorAction Stop).UnlockedReleaseVersions}catch{}
' foreach($item in @($savedText-split'[,;|]')){$item=([string]$item).Trim();if($item-match'^\d+(?:\.\d+)+$'-and-not$candidateVersions.Contains($item)){$null=$candidateVersions.Add($item)}}
' foreach($entry in @(([string]$env:NLH_AUTHORIZED_RELEASES)-split';')){if($entry-match'^(\d+(?:\.\d+)+)=([0-9a-f]{64})$'-and-not$candidateVersions.Contains($matches[1])){$null=$candidateVersions.Add($matches[1])}}
' try{foreach($releaseKey in @(Get-ChildItem -LiteralPath $ReleaseAccessRegPath -ErrorAction SilentlyContinue)){$version=([string]$releaseKey.PSChildName).Trim();if($version-match'^\d+(?:\.\d+)+$'-and-not$candidateVersions.Contains($version)){$null=$candidateVersions.Add($version)}}}catch{}
' if($CurrentReleaseVersion-match'^\d+(?:\.\d+)+$'-and-not$candidateVersions.Contains($CurrentReleaseVersion)){$null=$candidateVersions.Add($CurrentReleaseVersion)}
' try{
'  $stamp=[DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds();$webHeaders=@{'User-Agent'='NLH-Mod-Manager';'Cache-Control'='no-cache, no-store, max-age=0';'Pragma'='no-cache'};$feedUrl="https://github.com/$Owner/$Repository/commits/$Branch.atom?_nlh=$stamp";$feed=[string](Invoke-WebRequest -Uri $feedUrl -Headers $webHeaders -UseBasicParsing -TimeoutSec 15).Content;$commitMatch=[regex]::Match($feed,'(?i)/commit/([0-9a-f]{40})');if(-not$commitMatch.Success){throw 'Current branch commit could not be resolved.'};$commit=$commitMatch.Groups[1].Value
'  $headers=@{'User-Agent'='NLH-Mod-Manager';'Accept'='application/vnd.github+json';'X-GitHub-Api-Version'='2022-11-28';'Cache-Control'='no-cache, no-store, max-age=0';'Pragma'='no-cache'};$rootUrl="https://api.github.com/repos/$Owner/$Repository/contents?ref=$commit&_nlh=$stamp";$rootResponse=Invoke-RestMethod -Uri $rootUrl -Headers $headers -Method Get -TimeoutSec 15;$rootItems=@();foreach($rootEntry in $rootResponse){$rootItems+=,$rootEntry}
'  $script:PrivateMetadataRootItems=$rootItems
'  foreach($item in $rootItems){if(([string]$item.type)-ne'file'){continue};$match=[regex]::Match([string]$item.name,'(?i)^NLH Mod Manager Public Release V(\d+(?:\.\d+)+)\.vbs$');if($match.Success){$version=$match.Groups[1].Value;if(-not$candidateVersions.Contains($version)){$null=$candidateVersions.Add($version)}}}
' }catch{return $false}
' if($null-eq$rootItems-or@($rootItems).Count-eq0){return $false}
' $validReleases=New-Object System.Collections.Generic.List[string];$authorizedMap=New-Object System.Collections.Generic.List[string]
' foreach($version in @($candidateVersions)){
'  $versionName="NLH Mod Manager Public Release V${version}.vbs";$versionItems=@($rootItems|Where-Object{([string]$_.type)-eq'file'-and([string]$_.name)-ieq$versionName});$versionExists=$versionItems.Count-gt0;if($version-eq$CurrentReleaseVersion-and$versionExists){$script:CurrentReleaseRemoteRevision=([string]$versionItems[0].sha).Trim().ToLowerInvariant()};if(-not$versionExists){if($version-eq$CurrentReleaseVersion){$script:CurrentReleaseStillAuthorized=$false};continue}
'  $privateName="NLH Mod Manager Public Release V${version}_Private.txt";$privateItem=@($rootItems|Where-Object{([string]$_.type)-eq'file'-and([string]$_.name)-ieq$privateName}|Select-Object -First 1)
'  if($privateItem.Count-eq0){if(-not$validReleases.Contains($version)){$validReleases.Add($version)};continue}
'  $privateText='';try{$privateUrl=[string]$privateItem[0].download_url;if([string]::IsNullOrWhiteSpace($privateUrl)){throw 'Private release URL is unavailable.'};$privateText=Get-RemoteText $privateUrl $null}catch{}
'  if([string]::IsNullOrWhiteSpace($privateText)){if($version-eq$CurrentReleaseVersion-or(([string]$env:NLH_AVAILABLE_RELEASES)-split';')-contains$version){if(-not$validReleases.Contains($version)){$validReleases.Add($version)}};continue}
'  $hashMatch=[regex]::Match($privateText,'(?im)^\s*sha256\s*:\s*([0-9a-f]{64})\s*$');if(-not$hashMatch.Success){if($version-eq$CurrentReleaseVersion){$script:CurrentReleaseStillAuthorized=$false};continue}
'  $currentHash=$hashMatch.Groups[1].Value.ToLowerInvariant();$key=$null
'  try{$key=[Microsoft.Win32.Registry]::CurrentUser.OpenSubKey(('Software\NLH Mod Manager\PrivateAccess\ReleaseVersions\'+$version),$false);$savedHash=if($null-ne$key){([string]$key.GetValue('AuthorizedHash','')).Trim().ToLowerInvariant()}else{''};$explicit=if($null-ne$key){[int]$key.GetValue('ExplicitKey',0)}else{0}}finally{if($null-ne$key){$key.Dispose()}}
'  $allowed=($explicit-eq1-and$savedHash-eq$currentHash);if(-not$allowed){$allowed=Test-AndRestoreReleaseEntitlement $version $currentHash}
'  if($allowed){if(-not$validReleases.Contains($version)){$validReleases.Add($version)};$authorizedMap.Add($version+'='+$currentHash)}elseif($version-eq$CurrentReleaseVersion){$script:CurrentReleaseStillAuthorized=$false}
' }
' if(-not(Test-Path -LiteralPath $SettingsRegPath -PathType Container)){New-Item -Path $SettingsRegPath -Force|Out-Null}
' $privateSaved=@($authorizedMap|ForEach-Object{($_-split'=')[0]}|Sort-Object {[version]$_});New-ItemProperty -LiteralPath $SettingsRegPath -Name 'UnlockedReleaseVersions' -Value ($privateSaved-join',') -PropertyType String -Force|Out-Null
' $env:NLH_AUTHORIZED_RELEASES=(@($authorizedMap|Sort-Object)-join';');$env:NLH_AVAILABLE_RELEASES=(@($validReleases|Sort-Object {[version]$_})-join';');$script:AvailableReleaseCount=@($validReleases|Select-Object -Unique).Count
' return $true
'}
'function Show-NoAvailableReleaseAndClose {
' $script:AppClosing=$true
' if($null-ne$form-and-not$form.IsDisposed){$form.Opacity=0;$form.Hide();$form.Refresh();[Windows.Forms.Application]::DoEvents()}
' $dialog=New-Object Windows.Forms.Form;$dialog.Text='NLH Mod Manager';$dialog.ClientSize=New-Object Drawing.Size(470,190);$dialog.FormBorderStyle='FixedDialog';$dialog.MaximizeBox=$false;$dialog.MinimizeBox=$false;$dialog.ShowInTaskbar=$true;$dialog.StartPosition='CenterScreen';$dialog.TopMost=$true;$dialog.BackColor=[Drawing.Color]::FromArgb(24,24,27);$dialog.ForeColor=[Drawing.Color]::Gainsboro;$dialog.Font=New-Object Drawing.Font('Segoe UI',10);Set-NlhIcon $dialog
' $dialogAccent=New-Object Windows.Forms.Panel;$dialogAccent.SetBounds(0,0,470,3);$dialogAccent.BackColor=$C.Accent
' $dialogTitle=New-Object Windows.Forms.Label;$dialogTitle.SetBounds(22,22,426,28);$dialogTitle.Text='No version is available';$dialogTitle.ForeColor=[Drawing.Color]::Gainsboro;$dialogTitle.Font=New-Object Drawing.Font('Segoe UI Semibold',12)
' $dialogMessage=New-Object Windows.Forms.Label;$dialogMessage.SetBounds(22,59,426,54);$dialogMessage.Text='Access to the current release is no longer valid, and no other NLH Mod Manager release is currently available.';$dialogMessage.ForeColor=[Drawing.Color]::FromArgb(174,174,182);$dialogMessage.AutoSize=$false
' $dialogOk=New-Object Windows.Forms.Button;$dialogOk.SetBounds(346,132,102,34);$dialogOk.Text='OK';$dialogOk.DialogResult=[Windows.Forms.DialogResult]::OK;Style-Button $dialogOk $C.Accent $C.Text $C.Accent $C.AccentHot
' $dialog.AcceptButton=$dialogOk;$dialog.CancelButton=$dialogOk;$dialog.Controls.AddRange([Windows.Forms.Control[]]@($dialogAccent,$dialogTitle,$dialogMessage,$dialogOk))
' $fastClose={if($dialog.Opacity-ne0){$dialog.Opacity=0;$dialog.Refresh();[Windows.Forms.Application]::DoEvents()}}
' $dialogOk.Add_Click($fastClose);$dialog.Add_FormClosing($fastClose)
' try{$null=$dialog.ShowDialog()}finally{$dialog.Opacity=0;$dialog.Hide();$dialog.Dispose();if($null-ne$form-and-not$form.IsDisposed){$form.Close()}}
' return $true
'}
'function Restart-CurrentReleaseIfUpdated {
' if([string]::IsNullOrWhiteSpace([string]$script:CurrentReleaseStartupRevision)-or[string]::IsNullOrWhiteSpace([string]$script:CurrentReleaseRemoteRevision)){return $false}
' if(([string]$script:CurrentReleaseStartupRevision)-eq([string]$script:CurrentReleaseRemoteRevision)){return $false}
' $launcher=Join-Path ([IO.Path]::GetDirectoryName([string]$env:NLH_SELF)) 'NLH Mod Manager Public Release.vbs';if(-not(Test-Path -LiteralPath $launcher -PathType Leaf)){Show-NLHInfo 'Manager Update' 'An update is available, but NLH Mod Manager Public Release.vbs was not found beside this version.';return $false}
' try{New-ItemProperty -LiteralPath $SettingsRegPath -Name PreferredRelease -Value $CurrentReleaseVersion -PropertyType String -Force|Out-Null;$script:AppClosing=$true;$form.Hide();[Windows.Forms.Application]::DoEvents();$env:NLH_UPDATE_HANDOFF=$null;$env:NLH_LAUNCH_HANDOFF=$null;$env:NLH_STANDALONE_DIRECT=$null;Start-Process -FilePath (Join-Path $env:WINDIR 'System32\wscript.exe') -ArgumentList ('"'+$launcher+'"') -WorkingDirectory ([IO.Path]::GetDirectoryName($launcher)) -ErrorAction Stop|Out-Null;$form.Close();return $true}catch{$script:AppClosing=$false;$form.Show();Show-NLHInfo 'Manager Update' ('The updated manager could not be started: '+$_.Exception.Message);return $false}
'}
'function Restart-ToAvailablePublicRelease {
' try{Remove-ItemProperty -LiteralPath $SettingsRegPath -Name PreferredRelease -ErrorAction SilentlyContinue}catch{}
' $launcher=Join-Path ([IO.Path]::GetDirectoryName([string]$env:NLH_SELF)) 'NLH Mod Manager Public Release.vbs'
' if(-not(Test-Path -LiteralPath $launcher -PathType Leaf)){Show-NLHInfo 'Release Access' 'Access to this release is no longer valid. NLH Mod Manager Public Release.vbs was not found beside this version.';return $false}
' $script:AppClosing=$true;$form.Hide();[Windows.Forms.Application]::DoEvents();$env:NLH_UPDATE_HANDOFF=$null;$env:NLH_LAUNCH_HANDOFF=$null;$env:NLH_STANDALONE_DIRECT=$null
' try{Start-Process -FilePath (Join-Path $env:WINDIR 'System32\wscript.exe') -ArgumentList ('"'+$launcher+'"') -WorkingDirectory ([IO.Path]::GetDirectoryName($launcher)) -ErrorAction Stop|Out-Null;$form.Close();return $true}catch{$script:AppClosing=$false;$form.Show();Show-NLHInfo 'Release Access' ('Access to this release is no longer valid, but the public release could not be restarted: '+$_.Exception.Message);return $false}
'}
'function Get-UnlockedReleaseVersions {
' $versions=New-Object System.Collections.Generic.List[string];foreach($item in @(([string]$env:NLH_AVAILABLE_RELEASES)-split';')){$item=([string]$item).Trim();if($item-match'^\d+(?:\.\d+)+$'-and-not$versions.Contains($item)){$null=$versions.Add($item)}}
' try{foreach($releaseKey in @(Get-ChildItem -LiteralPath $ReleaseAccessRegPath -ErrorAction SilentlyContinue)){$item=([string]$releaseKey.PSChildName).Trim();if($item-match'^\d+(?:\.\d+)+$'){$rk=$null;try{$rk=[Microsoft.Win32.Registry]::CurrentUser.OpenSubKey(('Software\NLH Mod Manager\PrivateAccess\ReleaseVersions\'+$item),$false);$savedHash=if($null-ne$rk){([string]$rk.GetValue('AuthorizedHash','')).Trim().ToLowerInvariant()}else{''};$currentHash=if($null-ne$rk){([string]$rk.GetValue('CurrentHash','')).Trim().ToLowerInvariant()}else{''};$explicit=if($null-ne$rk){[int]$rk.GetValue('ExplicitKey',0)}else{0};if($explicit-eq1-and$savedHash-match'^[0-9a-f]{64}$'-and$savedHash-eq$currentHash-and-not$versions.Contains($item)){$null=$versions.Add($item)}}finally{if($null-ne$rk){$rk.Dispose()}}}}}catch{}
' if($versions.Count-eq0-and$CurrentReleaseVersion-match'^\d+(?:\.\d+)+$'){$null=$versions.Add($CurrentReleaseVersion)};$env:NLH_AVAILABLE_RELEASES=(@($versions|Sort-Object {[version]$_})-join';');@($versions|Sort-Object {[version]$_})
'}
'function Refresh-ReleaseVersionDropdown([string]$PreferredVersion=$CurrentReleaseVersion){
' if($null-eq$cmbReleaseVersion-or$cmbReleaseVersion.IsDisposed){return};$versions=@(Get-UnlockedReleaseVersions);$cmbReleaseVersion.Tag='Loading';$cmbReleaseVersion.BeginUpdate();try{$cmbReleaseVersion.Items.Clear();foreach($version in $versions){$null=$cmbReleaseVersion.Items.Add('V'+$version)};$selected='V'+$PreferredVersion;if($cmbReleaseVersion.Items.Contains($selected)){$cmbReleaseVersion.SelectedItem=$selected}elseif($cmbReleaseVersion.Items.Contains('V'+$CurrentReleaseVersion)){$cmbReleaseVersion.SelectedItem=('V'+$CurrentReleaseVersion)}else{$cmbReleaseVersion.SelectedItem='V1.0'}}finally{$cmbReleaseVersion.EndUpdate();$cmbReleaseVersion.Tag=$null};$showReleaseSelector=($script:LaunchedThroughManagerLauncher-and$versions.Count-gt1);if($showReleaseSelector){$lblReleaseVersion.Show();$cmbReleaseVersion.Show();$pnlReleaseVersion.Show();$pnlReleaseVersion.BringToFront()}else{$cmbReleaseVersion.Tag='Loading';$cmbReleaseVersion.Items.Clear();$cmbReleaseVersion.Tag=$null;$lblReleaseVersion.Hide();$cmbReleaseVersion.Hide();$pnlReleaseVersion.Hide()}
'}
'function Get-NlhMainFormScale{
' $bounds=[Windows.Forms.Screen]::PrimaryScreen.Bounds;if($bounds.Width-le0-or$bounds.Height-le0){return [single]1.0}
' $dpi=96.0;$graphics=$null;try{$graphics=[Drawing.Graphics]::FromHwnd([IntPtr]::Zero);$dpi=[double]$graphics.DpiX}catch{$dpi=96.0}finally{if($null-ne$graphics){$graphics.Dispose()}}
' if($dpi-le0){$dpi=96.0}
' $resolutionScale=[Math]::Sqrt(([double]$bounds.Width*[double]$bounds.Height)/(1920.0*1200.0));$dpiCompensation=120.0/$dpi
' $scale=[single]($resolutionScale*$dpiCompensation*1.136300249142)
' $working=[Windows.Forms.Screen]::PrimaryScreen.WorkingArea;$maximumLogicalHeight=[double]$working.Height*0.95*96.0/$dpi;$requestedLogicalHeight=931.0*$scale
' if($requestedLogicalHeight-gt$maximumLogicalHeight-and$requestedLogicalHeight-gt0){$scale=[single]($scale*($maximumLogicalHeight/$requestedLogicalHeight))}
' if($scale-le0){return [single]1.0};$scale=[single]($scale*1.020620726160);return $scale
'}
'$script:NlhMainScale=[single]1.0;$script:NlhMainBaseBounds=@{};$script:NlhMainBaseFonts=@{}
'function Initialize-NlhMainFormScale([Windows.Forms.Form]$MainForm){
' if($null-eq$MainForm-or$script:NlhMainScaleInitialized){return};$script:NlhMainScale=Get-NlhMainFormScale
' $stack=New-Object System.Collections.Stack;foreach($control in $MainForm.Controls){$stack.Push($control)}
' while($stack.Count-gt0){$control=$stack.Pop();$key=[Runtime.CompilerServices.RuntimeHelpers]::GetHashCode($control);$script:NlhMainBaseBounds[$key]=$control.Bounds;if($null-ne$control.Font){$script:NlhMainBaseFonts[$key]=$control.Font};foreach($child in $control.Controls){$stack.Push($child)}}
' $MainForm.MinimumSize=New-Object Drawing.Size(0,0);$MainForm.MaximumSize=New-Object Drawing.Size(0,0)
' $MainForm.Scale((New-Object Drawing.SizeF($script:NlhMainScale,$script:NlhMainScale)));$MainForm.ClientSize=New-Object Drawing.Size([int][Math]::Round(920.0*$script:NlhMainScale),[int][Math]::Round(931.0*$script:NlhMainScale))
' Restore-NlhMainScaledLayout $MainForm;$MainForm.MinimumSize=$MainForm.Size;$MainForm.MaximumSize=$MainForm.Size;$script:NlhMainScaleInitialized=$true
'}
'function Restore-NlhMainScaledLayout([Windows.Forms.Form]$MainForm){
' if($null-eq$MainForm-or$script:NlhMainScale-le0){return};$scale=[single]$script:NlhMainScale
' $stack=New-Object System.Collections.Stack;foreach($control in $MainForm.Controls){$stack.Push($control)}
' while($stack.Count-gt0){$control=$stack.Pop();$key=[Runtime.CompilerServices.RuntimeHelpers]::GetHashCode($control);if($script:NlhMainBaseBounds.ContainsKey($key)){$b=$script:NlhMainBaseBounds[$key];$control.SetBounds([int][Math]::Round($b.X*$scale),[int][Math]::Round($b.Y*$scale),[int][Math]::Round($b.Width*$scale),[int][Math]::Round($b.Height*$scale))};if($script:NlhMainBaseFonts.ContainsKey($key)){$font=$script:NlhMainBaseFonts[$key];$control.Font=New-Object Drawing.Font($font.FontFamily,[single]($font.SizeInPoints*$scale),$font.Style,[Drawing.GraphicsUnit]::Point)};foreach($child in $control.Controls){$stack.Push($child)}}
'}
'function Layout {
' $p=18;$w=$form.ClientSize.Width;$titleBar.SetBounds(0,0,$w,30);$titleText.Width=$w-31-92;$titleMin.Left=$w-92;$titleClose.Left=$w-46;$lblBar.SetBounds(0,30,$w,3);$lblTitle.SetBounds($p-5,42,655,44);$lblSub.SetBounds($p-2,84,722,24)
' $lblSearch.SetBounds($p-2,118,222,18);$txtSearch.SetBounds($p,140,330,27);$pnlReleaseVersion.SetBounds($w-198,500,180,60);$lblReleaseVersion.SetBounds(0,4,170,18);$cmbReleaseVersion.SetBounds(0,25,170,29);$btnPrivateKey.SetBounds($w-308,139,170,30);$btnRefresh.SetBounds($w-128,139,110,30)
' $pnlCatalogSurface.SetBounds($p,183,$w-36,260);$dgv.SetBounds($p,183,$w-36,260);Update-CatalogViewportSurface;$pnlBulk.SetBounds($p,405,$w-36,38);$pnlBulk.Visible=$true;$pnlBulk.BringToFront()
' $bulkWidth=$pnlBulk.ClientSize.Width
' $installCenter=[int][Math]::Round($bulkWidth*63.5/114);$configCenter=[int][Math]::Round($bulkWidth*92.5/114);$removeCenter=[int][Math]::Round($bulkWidth*107.5/114)
' $actionW=120;$configW=135;$removeW=95;$actionX=$installCenter-[int]($actionW/2);$configX=$configCenter-[int]($configW/2);$removeX=[Math]::Min($bulkWidth-$removeW,$removeCenter-[int]($removeW/2))
' $lblBulk.SetBounds(10,4,[Math]::Max(120,$actionX-20),30);$btnRedownloadAll.SetBounds($actionX,4,$actionW,30);$btnBulkConfig.SetBounds($configX,4,$configW,30);$btnDeleteAll.SetBounds($removeX,4,$removeW,30)
' $btnRedownloadAll.Font=New-Object Drawing.Font('Segoe UI',8);$btnBulkConfig.Font=New-Object Drawing.Font('Segoe UI',8);$btnDeleteAll.Font=New-Object Drawing.Font('Segoe UI',8)
' $btnChangeFolder.SetBounds($p-2,457,162,32);$btnOpen.SetBounds($p+168,457,152,32);$btnAll.SetBounds($w-218,457,200,32)
' $lblSummary.SetBounds($p+16,502,$w-52,20);$lblStaged.SetBounds($p+16,523,$w-186,24);$btnClearQueue.SetBounds($w-148,519,130,28);$lblFrostyPack.SetBounds($p+16,551,$w-52,20);$btnApplyOnly.SetBounds($p-2,579,412,34);$btnLaunchFrosty.SetBounds($p+420,579,$w-($p*2)-420,34)
' $chkCloseAfterLaunch.SetBounds($p-3,619,$w-33,24);$chkDeleteOldVersions.SetBounds($p-3,643,$w-33,24);$chkShowFilePaths.SetBounds($p-3,671,148,24);$lblFolder.SetBounds($p+16,695,$w-52,20)
' $pnlProgress.SetBounds($p,720,$w-36,42);$lblProgress.SetBounds(0,0,$pnlProgress.Width,24);$prg.SetBounds(0,28,$pnlProgress.Width,10)
' $lblActivity.SetBounds($p-2,774,102,18);$btnClearLog.SetBounds($w-128,768,110,30);$txtLog.SetBounds($p,802,$w-36,82);$lblCredit.SetBounds($w-268,895,250,30)
'}
'$form=New-Object NlhDarkForm;Set-NlhIcon $form;$form.Add_HandleCreated({Set-NlhIcon $form});$form.Add_Shown({Set-NlhIcon $form});$form.BackColor=$C.Form;$form.ForeColor=$C.Text;$form.ShowInTaskbar=$false;$form.StartPosition='CenterScreen';$form.Text='NLH Mod Manager Public Release V1.0';$form.ClientSize=New-Object Drawing.Size(920,901)
'$form.FormBorderStyle='None';$form.ClientSize=New-Object Drawing.Size(920,931);$form.MaximizeBox=$false;$form.MinimizeBox=$true;$form.BackColor=$C.Form;$form.Font=New-Object Drawing.Font('Segoe UI',9);$form.KeyPreview=$true
'$titleBar=New-Object Windows.Forms.Panel;$titleBar.SetBounds(0,0,$form.ClientSize.Width,30);$titleBar.Anchor='Top,Left,Right';$titleBar.BackColor=$script:NlhCustomAccent
'$titleIcon=New-Object Windows.Forms.PictureBox;$titleIcon.SetBounds(7,8,18,18);$titleIcon.SizeMode='StretchImage';$titleIcon.BackColor=[Drawing.Color]::Transparent;$titleIconBitmap=Get-NlhTitleIconBitmap;if($null-ne$titleIconBitmap){$titleIcon.Image=$titleIconBitmap}else{$titleIcon.Visible=$false}
'$titleText=New-Object Windows.Forms.Label;$titleText.SetBounds(31,5,790,25);$titleText.Anchor='Top,Left,Right';$titleText.Text='NLH Mod Manager Public Release V1.0';$titleText.ForeColor=$script:NlhCustomCaptionText;$titleText.BackColor=[Drawing.Color]::Transparent;$titleText.TextAlign='MiddleLeft';$titleText.Font=New-Object Drawing.Font('Segoe UI',9)
'$titleMin=New-Object Windows.Forms.Button;$titleMin.SetBounds(($form.ClientSize.Width-92),0,46,30);$titleMin.Anchor='Top,Right';$titleMin.Text=[char]0x2013;$titleMin.FlatStyle='Flat';$titleMin.FlatAppearance.BorderSize=0;$titleMin.BackColor=$script:NlhCustomAccent;$titleMin.ForeColor=$script:NlhCustomCaptionText;$titleMin.TabStop=$false;$titleMin.Font=New-Object Drawing.Font('Segoe UI Symbol',10)
'$titleClose=New-Object Windows.Forms.Button;$titleClose.SetBounds(($form.ClientSize.Width-46),0,46,30);$titleClose.Anchor='Top,Right';$titleClose.Text=[char]0x00D7;$titleClose.FlatStyle='Flat';$titleClose.FlatAppearance.BorderSize=0;$titleClose.BackColor=$script:NlhCustomAccent;$titleClose.ForeColor=$script:NlhCustomCaptionText;$titleClose.TabStop=$false;$titleClose.Font=New-Object Drawing.Font('Segoe UI Symbol',11)
'$titleMin.FlatAppearance.MouseOverBackColor=[Drawing.Color]::FromArgb(42,255,255,255);$titleMin.FlatAppearance.MouseDownBackColor=[Drawing.Color]::FromArgb(70,255,255,255)
'$titleClose.FlatAppearance.MouseOverBackColor=[Drawing.Color]::FromArgb(232,17,35);$titleClose.FlatAppearance.MouseDownBackColor=[Drawing.Color]::FromArgb(153,27,20)
'$dragTitle={param($sender,$e);if($e.Button-eq[Windows.Forms.MouseButtons]::Left){[NlhWindowIconNative]::ReleaseCapture()|Out-Null;[NlhWindowIconNative]::SendMessage($form.Handle,0x00A1,[IntPtr]2,[IntPtr]0)|Out-Null}}
'$titleBar.Add_MouseDown($dragTitle);$titleText.Add_MouseDown($dragTitle);$titleIcon.Add_MouseDown($dragTitle)
'$titleMin.Add_Click({$form.WindowState=[Windows.Forms.FormWindowState]::Minimized});$titleClose.Add_Click({$form.Close()})
'$titleBar.Controls.AddRange([Windows.Forms.Control[]]@($titleIcon,$titleText,$titleMin,$titleClose))
'$lblBar=New-Object Windows.Forms.Panel;$lblBar.BackColor=$C.Accent
'$lblTitle=New-Object Windows.Forms.Label;$lblTitle.Text='NLH Mod Manager Public Release V1.0';$lblTitle.Font=New-Object Drawing.Font('Segoe UI Semibold',18);$lblTitle.ForeColor=$C.Text
'$lblSub=New-Object Windows.Forms.Label;$lblSub.Text='Browse, Install, and Update No Life Hangout Mods';$lblSub.ForeColor=[Drawing.Color]::FromArgb(190,190,198)
'$lblSearch=New-Object Windows.Forms.Label;$lblSearch.Text='SEARCH CHARACTERS';$lblSearch.ForeColor=[Drawing.Color]::FromArgb(174,174,182);$lblSearch.Font=New-Object Drawing.Font('Segoe UI Semibold',8)
'$txtSearch=New-Object Windows.Forms.TextBox;$txtSearch.BackColor=$C.Surface2;$txtSearch.ForeColor=$C.Text;$txtSearch.BorderStyle='FixedSingle';$txtSearch.Font=New-Object Drawing.Font('Segoe UI',10)
'$lblReleaseVersion=New-Object Windows.Forms.Label;$lblReleaseVersion.Text='MANAGER RELEASE';$lblReleaseVersion.ForeColor=[Drawing.Color]::FromArgb(194,190,194);$lblReleaseVersion.Font=New-Object Drawing.Font('Segoe UI Semibold',7.5);$lblReleaseVersion.TextAlign='MiddleCenter';$lblReleaseVersion.AutoSize=$false;$lblReleaseVersion.Visible=$true
'$pnlReleaseVersion=New-Object Windows.Forms.Panel;$pnlReleaseVersion.BackColor=$C.Form;$pnlReleaseVersion.BorderStyle='None'
'$cmbReleaseVersion=New-Object Windows.Forms.ComboBox;$cmbReleaseVersion.DropDownStyle='DropDownList';$cmbReleaseVersion.DrawMode='OwnerDrawFixed';$cmbReleaseVersion.ItemHeight=22;$cmbReleaseVersion.IntegralHeight=$true;$cmbReleaseVersion.MaxDropDownItems=4;$cmbReleaseVersion.BackColor=[Drawing.Color]::FromArgb(40,40,45);$cmbReleaseVersion.ForeColor=$C.Text;$cmbReleaseVersion.FlatStyle='Flat';$cmbReleaseVersion.Font=New-Object Drawing.Font('Segoe UI Semibold',9);$cmbReleaseVersion.Visible=$true;$cmbReleaseVersion.Add_DrawItem({param($sender,$e);if($e.Index-lt0){return};$enabled=($sender.Enabled-and-not$script:NlhOwnedDialogActive);$selected=(($e.State-band[Windows.Forms.DrawItemState]::Selected)-ne0);$back=if(-not$enabled){[Drawing.Color]::FromArgb(45,44,49)}elseif($selected-and$sender.DroppedDown){[Drawing.Color]::FromArgb(72,76,84)}else{[Drawing.Color]::FromArgb(40,40,45)};$fore=if(-not$enabled){[Drawing.Color]::FromArgb(112,109,114)}elseif($selected-and$sender.DroppedDown){[Drawing.Color]::FromArgb(250,251,253)}else{$C.Text};$brush=New-Object Drawing.SolidBrush($back);try{$e.Graphics.FillRectangle($brush,$e.Bounds)}finally{$brush.Dispose()};[Windows.Forms.TextRenderer]::DrawText($e.Graphics,[string]$sender.Items[$e.Index],$sender.Font,$e.Bounds,$fore,[Windows.Forms.TextFormatFlags]::Left-bor[Windows.Forms.TextFormatFlags]::VerticalCenter)})
'$btnRefresh=New-Object Windows.Forms.Button;$btnRefresh.Text='Refresh';Style-Button $btnRefresh $C.Header $C.Text $C.Border ([Drawing.Color]::FromArgb(52,52,57))
'$btnPrivateKey=New-Object Windows.Forms.Button;$btnPrivateKey.Text='Enter Private Key';Style-Button $btnPrivateKey $C.Header $C.Text $C.Border ([Drawing.Color]::FromArgb(52,52,57))
'$pnlCatalogSurface=New-Object Windows.Forms.Panel;$pnlCatalogSurface.BackColor=$C.Surface;$pnlCatalogSurface.TabStop=$false
'$dgv=New-Object Windows.Forms.DataGridView;$dgv.ShowCellToolTips=$false;$dgv.AllowUserToOrderColumns=$false;$dgv.AllowUserToResizeColumns=$false;$dgv.AllowUserToAddRows=$false;$dgv.AllowUserToDeleteRows=$false;$dgv.AllowUserToResizeRows=$false;$dgv.RowHeadersVisible=$false;$dgv.SelectionMode='CellSelect';$dgv.MultiSelect=$false;$dgv.AutoSizeColumnsMode='Fill';$dgv.RowTemplate.Height=32;$dgv.ColumnHeadersHeight=33;$dgv.ColumnHeadersHeightSizeMode='DisableResizing';$dgv.BorderStyle='None';$dgv.CellBorderStyle='SingleHorizontal';$dgv.EnableHeadersVisualStyles=$false;$dgv.BackgroundColor=[Drawing.Color]::FromArgb(32,32,35);$dgv.GridColor=[Drawing.Color]::FromArgb(53,53,58);$dgv.ColumnHeadersDefaultCellStyle.BackColor=[Drawing.Color]::FromArgb(42,42,46);$dgv.ColumnHeadersDefaultCellStyle.ForeColor=[Drawing.Color]::FromArgb(238,238,242);$dgv.ColumnHeadersDefaultCellStyle.SelectionBackColor=$C.Header;$dgv.ColumnHeadersDefaultCellStyle.Font=New-Object Drawing.Font('Segoe UI Semibold',9);$dgv.DefaultCellStyle.BackColor=[Drawing.Color]::FromArgb(32,32,35);$dgv.DefaultCellStyle.ForeColor=[Drawing.Color]::FromArgb(232,232,236);$dgv.DefaultCellStyle.SelectionBackColor=[Drawing.Color]::FromArgb(48,48,52);$dgv.DefaultCellStyle.SelectionForeColor=$C.Text;$dgv.AlternatingRowsDefaultCellStyle.BackColor=[Drawing.Color]::FromArgb(35,35,38)
'function Update-CatalogViewportSurface {try{$targetHeight=$dgv.ColumnHeadersHeight+2;foreach($catalogRow in @($dgv.Rows)){if($catalogRow.Visible){$targetHeight+=$catalogRow.Height}};if($targetHeight-lt($dgv.ColumnHeadersHeight+2)){$targetHeight=$dgv.ColumnHeadersHeight+2};$catalogNeedsScroll=($targetHeight-gt260);if($catalogNeedsScroll){$targetHeight=260};$dgv.ScrollBars=if($catalogNeedsScroll){[Windows.Forms.ScrollBars]::Vertical}else{[Windows.Forms.ScrollBars]::None};$dgv.HorizontalScrollingOffset=0;$dgv.Height=$targetHeight;$pnlCatalogSurface.Visible=$true;$pnlCatalogSurface.SendToBack();$dgv.BringToFront()}catch{}}
'$n=New-Object Windows.Forms.DataGridViewTextBoxColumn;$n.Name='Character';$n.HeaderText='Character';$n.ReadOnly=$true;$n.DefaultCellStyle.ForeColor=[Drawing.Color]::FromArgb(242,243,246);$n.DefaultCellStyle.SelectionBackColor=$C.Surface;$n.DefaultCellStyle.SelectionForeColor=[Drawing.Color]::FromArgb(242,243,246);$n.FillWeight=25;$n.SortMode='NotSortable'
'$s=New-Object Windows.Forms.DataGridViewTextBoxColumn;$s.Name='Status';$s.HeaderText='Status';$s.ReadOnly=$true;$s.DefaultCellStyle.SelectionBackColor=$C.Surface;$s.DefaultCellStyle.SelectionForeColor=$C.Text;$s.FillWeight=16;$s.SortMode='NotSortable'
'$v=New-Object Windows.Forms.DataGridViewTextBoxColumn;$v.Name='Version';$v.HeaderText='Latest Version';$v.ReadOnly=$true;$v.DefaultCellStyle.ForeColor=[Drawing.Color]::FromArgb(218,194,126);$v.DefaultCellStyle.SelectionBackColor=$C.Surface;$v.DefaultCellStyle.SelectionForeColor=[Drawing.Color]::FromArgb(218,194,126);$v.FillWeight=16;$v.HeaderCell.Style.WrapMode=[Windows.Forms.DataGridViewTriState]::False;$v.SortMode='NotSortable'
'$a=New-Object Windows.Forms.DataGridViewButtonColumn;$a.Name='Action';$a.HeaderText='Install';$a.FlatStyle='Flat';$a.FillWeight=13;$a.DefaultCellStyle.BackColor=$C.Surface2;$a.DefaultCellStyle.ForeColor=$C.Text;$a.SortMode='NotSortable'
'$changelogColumn=New-Object Windows.Forms.DataGridViewButtonColumn;$changelogColumn.Name='Changelog';$changelogColumn.HeaderText='Changelog';$changelogColumn.FlatStyle='Flat';$changelogColumn.FillWeight=14;$changelogColumn.DefaultCellStyle.BackColor=$C.Surface2;$changelogColumn.DefaultCellStyle.ForeColor=$C.Text;$changelogColumn.SortMode='NotSortable'
'$f=New-Object Windows.Forms.DataGridViewButtonColumn;$f.Name='Frosty';$f.HeaderText='Config';$f.FlatStyle='Flat';$f.FillWeight=17;$f.DefaultCellStyle.BackColor=$C.Surface2;$f.DefaultCellStyle.ForeColor=$C.Text;$f.SortMode='NotSortable'
'$u=New-Object Windows.Forms.DataGridViewButtonColumn;$u.Name='Uninstall';$u.HeaderText='Remove';$u.FlatStyle='Flat';$u.FillWeight=13;$u.DefaultCellStyle.BackColor=$C.DangerBg;$u.DefaultCellStyle.ForeColor=$C.DangerFg;$u.SortMode='NotSortable'
'$gridBodyFont=New-Object Drawing.Font('Segoe UI',10);foreach($column in @($n,$s,$v,$a,$changelogColumn,$f,$u)){$column.DefaultCellStyle.Font=$gridBodyFont};foreach($column in @($n,$s,$v,$a,$changelogColumn,$f,$u)){$column.DefaultCellStyle.Alignment=[Windows.Forms.DataGridViewContentAlignment]::MiddleCenter};$dgv.Columns.AddRange([Windows.Forms.DataGridViewColumn[]]@($n,$s,$v,$a,$changelogColumn,$f,$u))
'$pnlBulk=New-Object Windows.Forms.Panel;$pnlBulk.BackColor=[Drawing.Color]::FromArgb(31,31,34);$pnlBulk.BorderStyle='FixedSingle';$pnlBulk.Visible=$true
'$lblBulk=New-Object Windows.Forms.Label;$lblBulk.Text='ALL CHARACTER MODS';$lblBulk.ForeColor=[Drawing.Color]::FromArgb(174,174,182);$lblBulk.Font=New-Object Drawing.Font('Segoe UI Semibold',8);$lblBulk.TextAlign='MiddleLeft'
'$btnRedownloadAll=New-Object Windows.Forms.Button;$btnRedownloadAll.Text='Re-download All';Style-Button $btnRedownloadAll $C.Header $C.Text $C.Border ([Drawing.Color]::FromArgb(52,52,57))
'$btnBulkConfig=New-Object Windows.Forms.Button;$btnBulkConfig.Text='Add All to Config';$btnBulkConfig.Tag=$false;Style-Button $btnBulkConfig ([Drawing.Color]::FromArgb(42,42,46)) ([Drawing.Color]::FromArgb(180,180,186)) ([Drawing.Color]::FromArgb(82,82,88)) ([Drawing.Color]::FromArgb(42,42,46));$btnBulkConfig.FlatAppearance.MouseDownBackColor=[Drawing.Color]::FromArgb(42,42,46);$btnBulkConfig.Cursor=[Windows.Forms.Cursors]::Default
'$btnDeleteAll=New-Object Windows.Forms.Button;$btnDeleteAll.Text='Delete All';$btnDeleteAll.Tag=$false;Style-Button $btnDeleteAll ([Drawing.Color]::FromArgb(42,42,46)) ([Drawing.Color]::FromArgb(180,180,186)) ([Drawing.Color]::FromArgb(82,82,88)) ([Drawing.Color]::FromArgb(42,42,46));$btnDeleteAll.FlatAppearance.MouseDownBackColor=[Drawing.Color]::FromArgb(42,42,46);$btnDeleteAll.Cursor=[Windows.Forms.Cursors]::Default
'$pnlBulk.Controls.AddRange([Windows.Forms.Control[]]@($lblBulk,$btnRedownloadAll,$btnBulkConfig,$btnDeleteAll))
'$btnOpen=New-Object Windows.Forms.Button;$btnOpen.Text='Open Mods Folder';Style-Button $btnOpen $C.Header $C.Text $C.Border ([Drawing.Color]::FromArgb(52,52,57))
'$btnChangeFolder=New-Object Windows.Forms.Button;$btnChangeFolder.Text='Change Mods Folder';Style-Button $btnChangeFolder $C.Header $C.Text $C.Border ([Drawing.Color]::FromArgb(52,52,57))
'$btnAll=New-Object Windows.Forms.Button;$btnAll.Text='Download / Update All';Style-Button $btnAll $C.Accent $C.Text $C.Accent $C.AccentHot
'$lblSummary=New-Object Windows.Forms.Label;$lblSummary.ForeColor=[Drawing.Color]::FromArgb(190,190,198)
'$lblFolder=New-Object Windows.Forms.Label;$lblFolder.Text='Install location: Hidden for privacy';$lblFolder.ForeColor=[Drawing.Color]::FromArgb(182,182,190);$lblFolder.AutoEllipsis=$true
'$chkShowFilePaths=New-Object Windows.Forms.CheckBox;$chkShowFilePaths.Text='Hide file path';$chkShowFilePaths.Checked=$true;$chkShowFilePaths.ForeColor=$C.Text;$chkShowFilePaths.BackColor=$C.Form;$chkShowFilePaths.Cursor=[Windows.Forms.Cursors]::Hand
'$lblStaged=New-Object Windows.Forms.Label;$lblStaged.Text='No character mods selected for Frosty';$lblStaged.ForeColor=$C.Text;$lblStaged.Font=New-Object Drawing.Font('Segoe UI Semibold',9);$lblStaged.AutoEllipsis=$true
'$btnClearQueue=New-Object Windows.Forms.Button;$btnClearQueue.Text='Clear Config Queue';Style-Button $btnClearQueue $C.Surface2 $C.Text $C.Border $C.Header;$btnClearQueue.Visible=$false
'$lblFrostyPack=New-Object Windows.Forms.Label;$lblFrostyPack.Text='Selected Frosty pack: Checking...';$lblFrostyPack.ForeColor=[Drawing.Color]::FromArgb(190,190,198);$lblFrostyPack.AutoEllipsis=$true
'$btnApplyOnly=New-Object Windows.Forms.Button;$btnApplyOnly.Text='Apply Config Changes Without Launching Frosty';$btnApplyOnly.TabStop=$false;Style-Button $btnApplyOnly $C.Header ([Drawing.Color]::White) $C.Muted $C.Surface2;Set-ApplyOnlyAvailable $false
'$btnLaunchFrosty=New-Object Windows.Forms.Button;$btnLaunchFrosty.Text='Launch Frosty Without Changes';Style-Button $btnLaunchFrosty $C.Accent ([Drawing.Color]::White) $C.Accent $C.AccentHot
'$chkDeleteOldVersions=New-Object Windows.Forms.CheckBox;$chkDeleteOldVersions.Text='When a mod update is available, delete the old version from my PC';$chkDeleteOldVersions.Checked=$script:DeleteOldVersions;$chkDeleteOldVersions.ForeColor=$C.Text;$chkDeleteOldVersions.BackColor=$C.Form;$chkDeleteOldVersions.Font=New-Object Drawing.Font('Segoe UI',9);$chkDeleteOldVersions.Cursor=[Windows.Forms.Cursors]::Hand
'$chkCloseAfterLaunch=New-Object Windows.Forms.CheckBox;$chkCloseAfterLaunch.Text='Close NLH Mod Manager when launching Frosty';$chkCloseAfterLaunch.Checked=$script:CloseAfterLaunch;$chkCloseAfterLaunch.ForeColor=$C.Text;$chkCloseAfterLaunch.BackColor=$C.Form;$chkCloseAfterLaunch.Font=New-Object Drawing.Font('Segoe UI',9);$chkCloseAfterLaunch.Cursor=[Windows.Forms.Cursors]::Hand
'$script:FrostyMonitorBusy=$false;$script:FrostyDetectedAt=$null;$frostyMonitor=New-Object Windows.Forms.Timer;$frostyMonitor.Interval=250
'$frostyMonitor.Add_Tick({if($script:AppClosing-or-not$script:MainScreenReady-or$script:FrostyMonitorBusy-or$null-eq$form-or$form.IsDisposed-or-not$form.Visible){return};$frostyOpen=@(Get-Process -Name 'Frosty','FrostyModManager' -ErrorAction SilentlyContinue).Count-gt0;if(-not$frostyOpen){$script:FrostyDetectedAt=$null;return};if($null-eq$script:FrostyDetectedAt){$script:FrostyDetectedAt=[DateTime]::UtcNow;return};if(([DateTime]::UtcNow-$script:FrostyDetectedAt).TotalMilliseconds-lt750){return};$script:FrostyDetectedAt=$null;$script:FrostyMonitorBusy=$true;$frostyMonitor.Stop();try{Assert-FrostyClosedForConfigChange}catch{}finally{$script:FrostyMonitorBusy=$false;if(-not$script:AppClosing-and$null-ne$form-and-not$form.IsDisposed){$frostyMonitor.Start()}}})
'$pnlProgress=New-Object Windows.Forms.Panel;$pnlProgress.BackColor=$C.Form;$pnlProgress.Visible=$false
'$lblProgress=New-Object Windows.Forms.Label;$lblProgress.ForeColor=$C.Text;$lblProgress.Font=New-Object Drawing.Font('Segoe UI Semibold',9);$lblProgress.AutoEllipsis=$true;$lblProgress.TextAlign='MiddleLeft'
'$prg=New-Object NlhBlueGlowProgress;$prg.Minimum=0;$prg.Maximum=100;$prg.Style=[Windows.Forms.ProgressBarStyle]::Continuous;Set-NlhBlueGlowProgress $prg
'$pnlProgress.Controls.AddRange([Windows.Forms.Control[]]@($lblProgress,$prg))
'$lblActivity=New-Object Windows.Forms.Label;$lblActivity.Text='ACTIVITY';$lblActivity.ForeColor=[Drawing.Color]::FromArgb(174,174,182);$lblActivity.Font=New-Object Drawing.Font('Segoe UI Semibold',8)
'$btnClearLog=New-Object Windows.Forms.Button;$btnClearLog.Text='Clear Log';$btnClearLog.TabStop=$false;Style-Button $btnClearLog $C.Header $C.Text $C.Border ([Drawing.Color]::FromArgb(52,52,57));Set-ClearLogAvailable $false
'$txtLog=New-Object Windows.Forms.RichTextBox;$txtLog.ReadOnly=$true;$txtLog.TabStop=$false;$txtLog.ShortcutsEnabled=$false;$txtLog.Cursor=[Windows.Forms.Cursors]::Arrow;$txtLog.Font=New-Object Drawing.Font('Consolas',9.5);$txtLog.BackColor=[Drawing.Color]::FromArgb(30,30,33);$txtLog.ForeColor=[Drawing.Color]::FromArgb(220,220,225);$txtLog.BorderStyle='FixedSingle';$txtLog.DetectUrls=$false
'$lblCredit=New-Object Windows.Forms.Label;$lblCredit.Text='created by Impulse_9003';$lblCredit.ForeColor=[Drawing.Color]::FromArgb(220,62,68);$lblCredit.Font=New-Object Drawing.Font('Segoe UI Semibold',10.5);$lblCredit.TextAlign='MiddleRight'
'$pnlReleaseVersion.Controls.AddRange([Windows.Forms.Control[]]@($lblReleaseVersion,$cmbReleaseVersion));$form.Controls.AddRange([Windows.Forms.Control[]]@($titleBar,$lblBar,$lblTitle,$lblSub,$lblSearch,$txtSearch,$pnlReleaseVersion,$btnPrivateKey,$btnRefresh,$pnlCatalogSurface,$dgv,$pnlBulk,$btnOpen,$btnChangeFolder,$btnAll,$lblSummary,$lblFolder,$chkShowFilePaths,$lblStaged,$btnClearQueue,$lblFrostyPack,$btnApplyOnly,$btnLaunchFrosty,$chkCloseAfterLaunch,$chkDeleteOldVersions,$pnlProgress,$lblActivity,$btnClearLog,$txtLog,$lblCredit))
'Layout;Initialize-NlhMainFormScale $form;$cmbReleaseVersion.Tag='Loading';Refresh-ReleaseVersionDropdown;$cmbReleaseVersion.Tag=$null;$pnlReleaseVersion.Visible=($script:LaunchedThroughManagerLauncher-and@(Get-UnlockedReleaseVersions).Count-gt1);$titleBar.SetBounds(0,0,$form.ClientSize.Width,30);$lblBar.SetBounds(0,30,$form.ClientSize.Width,3);$titleBar.BringToFront();Update-InstallLocationDisplay
'$script:AppClosing=$false
'$cmbReleaseVersion.Add_SelectedIndexChanged({if($cmbReleaseVersion.Tag-eq'Loading'){return};$selected=[string]$cmbReleaseVersion.SelectedItem;if([string]::IsNullOrWhiteSpace($selected)){return};$m=[regex]::Match($selected,'(?i)^V?(\d+(?:\.\d+)+)$');if(-not$m.Success){return};$version=$m.Groups[1].Value;if($version-eq$CurrentReleaseVersion){New-ItemProperty -LiteralPath $SettingsRegPath -Name PreferredRelease -Value $version -PropertyType String -Force|Out-Null;return};$available=@(Get-UnlockedReleaseVersions);if(-not($available-contains$version)){Show-NLHInfo 'Release Version' ('V'+$version+' is not currently authorized or available.');Refresh-ReleaseVersionDropdown $CurrentReleaseVersion;return};New-ItemProperty -LiteralPath $SettingsRegPath -Name PreferredRelease -Value $version -PropertyType String -Force|Out-Null;Show-ReleaseRestartChoice $version})
'$txtSearch.Add_TextChanged({$q=$txtSearch.Text.Trim();foreach($r in $dgv.Rows){$r.Visible=[string]::IsNullOrEmpty($q)-or$r.Tag.Character.IndexOf($q,[StringComparison]::OrdinalIgnoreCase)-ge0};Update-CatalogViewportSurface})
'$dgv.Add_RowsAdded({param($x,$e)
' for($rowIndex=$e.RowIndex;$rowIndex-lt($e.RowIndex+$e.RowCount);$rowIndex++){
'  if($rowIndex-lt0-or$rowIndex-ge$dgv.Rows.Count){continue}
'  $row=$dgv.Rows[$rowIndex]
'  $rowBack=if(($rowIndex%2)-eq1){$C.Surface2}else{$C.Surface}
'  foreach($columnName in @('Character','Status','Version')){
'   $cell=$row.Cells[$columnName]
'   $cell.Style.SelectionBackColor=$rowBack
'   if($columnName-eq'Character'){$cell.Style.ForeColor=[Drawing.Color]::FromArgb(242,243,246);$cell.Style.SelectionForeColor=[Drawing.Color]::FromArgb(242,243,246);$cell.Style.Font=New-Object Drawing.Font('Segoe UI Semibold',9)}else{$cell.Style.SelectionForeColor=$cell.Style.ForeColor}
'  }
' }
'})
'$dgv.Add_CellFormatting({param($x,$e)
' if($e.RowIndex-lt0-or$e.ColumnIndex-lt0){return}
' $col=$dgv.Columns[$e.ColumnIndex].Name
' if($col-in'Character','Status','Version'-or($col-eq'Changelog'-and-not$dgv.Rows[$e.RowIndex].Tag.HasChangelog)){
'  if(($e.RowIndex%2)-eq1){$e.CellStyle.SelectionBackColor=$C.Surface2}else{$e.CellStyle.SelectionBackColor=$C.Surface}
'  $e.CellStyle.SelectionForeColor=$e.CellStyle.ForeColor
' }
'})
'$dgv.Add_CellPainting({param($x,$e)
' if($e.RowIndex-lt0-or$e.ColumnIndex-lt0){return}
' $cell=$dgv.Rows[$e.RowIndex].Cells[$e.ColumnIndex];$tag=[string]$cell.Tag
' if($tag-ne'DisabledDelete'-and$tag-ne'DisabledConfig'-and$tag-ne'DisabledChangelog'){return}
' $e.PaintBackground($e.CellBounds,$false)
' $divider=New-Object Drawing.Pen([Drawing.Color]::FromArgb(218,218,222))
' try{
'  $left=$e.CellBounds.Left;$right=$e.CellBounds.Right-1;$top=$e.CellBounds.Top;$bottom=$e.CellBounds.Bottom-1
'  $e.Graphics.DrawLine($divider,$left,$top,$left,$bottom)
'  $e.Graphics.DrawLine($divider,$right,$top,$right,$bottom)
' }finally{$divider.Dispose()}
' $label=if($tag-eq'DisabledConfig'){'Add to Config'}elseif($tag-eq'DisabledChangelog'){'—'}else{'Delete'}
' [Windows.Forms.TextRenderer]::DrawText($e.Graphics,$label,$e.CellStyle.Font,$e.CellBounds,[Drawing.Color]::FromArgb(148,148,156),[Windows.Forms.TextFormatFlags]::HorizontalCenter-bor[Windows.Forms.TextFormatFlags]::VerticalCenter-bor[Windows.Forms.TextFormatFlags]::SingleLine)
' $e.Handled=$true
'})
'$dgv.Add_CellMouseMove({param($x,$e);if($e.RowIndex-lt0-or$e.ColumnIndex-lt0){$dgv.Cursor=[Windows.Forms.Cursors]::Default;return};$row=$dgv.Rows[$e.RowIndex];$col=$dgv.Columns[$e.ColumnIndex].Name;$disabled=($col-eq'Changelog'-and-not$row.Tag.HasChangelog)-or($col-eq'Uninstall'-and$row.Tag.Status-eq'NotInstalled')-or($col-eq'Frosty'-and$row.Tag.Status-eq'NotInstalled');$dgv.Cursor=if($disabled){[Windows.Forms.Cursors]::Arrow}elseif($col-in'Action','Changelog','Frosty','Uninstall'){[Windows.Forms.Cursors]::Hand}else{[Windows.Forms.Cursors]::Default}})
'$dgv.Add_MouseLeave({$dgv.Cursor=[Windows.Forms.Cursors]::Default})
'$dgv.Add_CellMouseUp({param($x,$e)
' if($e.RowIndex-lt0){return}
' $col=$dgv.Columns[$e.ColumnIndex].Name
' if($col-in'Character','Status','Version'-or($col-eq'Changelog'-and-not$dgv.Rows[$e.RowIndex].Tag.HasChangelog)){
'  $form.BeginInvoke([Action]{
'   $dgv.ClearSelection()
'   $form.ActiveControl=$null
'  })|Out-Null
' }
'})
'$dgv.Add_CellContentClick({param($x,$e);if($e.RowIndex-lt0){return};$r=$dgv.Rows[$e.RowIndex];$col=$dgv.Columns[$e.ColumnIndex].Name;if($col-notin'Action','Changelog','Frosty','Uninstall'){return};if($col-eq'Changelog'){if(-not$r.Tag.HasChangelog){$dgv.ClearSelection();$form.ActiveControl=$null;return};Show-Changelog $r.Tag;return};if($col-eq'Uninstall'-and$r.Tag.Status-eq'NotInstalled'){$dgv.ClearSelection();$form.ActiveControl=$null;return};if($col-eq'Frosty'){if($r.Tag.Status-eq'NotInstalled'){$dgv.ClearSelection();$form.ActiveControl=$null;return};try{if($script:StagedCharacters.Contains([string]$r.Tag.Character)){Unstage-Character $r;return};$fa=[string]$r.Cells['Frosty'].Value;if($fa-eq'Remove from Config'){Remove-CharacterFromFrostyConfig $r}else{Stage-Character $r}}catch{Log $_.Exception.Message Red;Show-NLHInfo 'NLH Mod Manager' $_.Exception.Message};return};try{if($col-eq'Action'){Set-Busy $true;try{Download-And-Extract $r.Tag;Update-Row $r}finally{Update-BulkConfigButton;Set-Busy $false}}else{$null=[NlhWindowIconNative]::ReleaseCapture();try{$dgv.EndEdit()|Out-Null}catch{};$dgv.ClearSelection();$form.ActiveControl=$null;[Windows.Forms.Application]::DoEvents();Uninstall-Mod $r}}catch{Log $_.Exception.Message Red;Show-NLHInfo 'NLH Mod Manager' $_.Exception.Message}})
'$btnPrivateKey.Add_Click({
' Start-NlhTextDisabledState;$key=Show-PrivateKeyDialog;if([string]::IsNullOrWhiteSpace([string]$key)){Stop-NlhTextDisabledState;return};$unlockedBefore=@(Get-UnlockedReleaseVersions);Activate-NlhExactOwnerDisabledState;Set-Progress $true 'Checking mod access...' 8;$form.Invalidate($true);$form.Update();[Windows.Forms.Application]::DoEvents();try{$releaseVersion=if($script:LaunchedThroughManagerLauncher){Test-AndSaveReleaseKey ([string]$key)}else{$null};Set-Progress $true 'Checking mod access...' 42;if(-not[string]::IsNullOrWhiteSpace([string]$releaseVersion)){$releaseAlreadyUnlocked=($unlockedBefore-contains$releaseVersion);Complete-PrivateKeyProgress $(if($releaseAlreadyUnlocked){'Release already unlocked.'}else{'Release unlocked.'});Set-Progress $false;Show-NLHInfo 'Private Key' $(if($releaseAlreadyUnlocked){'NLH Mod Manager V'+$releaseVersion+' was already unlocked.'}else{'Unlocked NLH Mod Manager V'+$releaseVersion+'.'});Save-KnownReleaseVersion $releaseVersion;$cmbReleaseVersion.Tag='Loading';$cmbReleaseVersion.BeginUpdate();try{$currentItem='V'+$CurrentReleaseVersion;if(-not$cmbReleaseVersion.Items.Contains($currentItem)){$null=$cmbReleaseVersion.Items.Add($currentItem)};$releaseItem='V'+$releaseVersion;if(-not$cmbReleaseVersion.Items.Contains($releaseItem)){$null=$cmbReleaseVersion.Items.Add($releaseItem)};$cmbReleaseVersion.SelectedItem=$currentItem;$lblReleaseVersion.Show();$cmbReleaseVersion.Show();$pnlReleaseVersion.Show();$pnlReleaseVersion.BringToFront()}finally{$cmbReleaseVersion.EndUpdate();$cmbReleaseVersion.Tag=$null};$pnlReleaseVersion.Invalidate($true);$pnlReleaseVersion.Update();$form.Invalidate($true);$form.Update();[Windows.Forms.Application]::DoEvents();Show-ReleaseRestartChoice $releaseVersion;return};$enteredHash=Get-KeyHash ([string]$key).Trim();$matched=New-Object System.Collections.Generic.List[object]
' $keyCheckMods=New-Object System.Collections.Generic.List[object]
' $catalogNames=New-Object System.Collections.Generic.HashSet[string]([StringComparer]::OrdinalIgnoreCase)
' try{
'  $wc=New-Object Net.WebClient;$wc.Headers['User-Agent']='Mozilla/5.0';$wc.Headers['Cache-Control']='no-cache, no-store, max-age=0';$wc.Headers['Pragma']='no-cache'
'  try{$treeHtml=[string]$wc.DownloadString("https://github.com/$Owner/$Repository/tree/${Branch}?_nlh=$([DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds())")}finally{$wc.Dispose()}
'  $blobPrefix="/$Owner/$Repository/blob/$Branch/"
'  foreach($m in [regex]::Matches($treeHtml,'href="([^"]+\.zip(?:\?[^"]*)?)"',[Text.RegularExpressions.RegexOptions]::IgnoreCase)){$href=[Net.WebUtility]::HtmlDecode($m.Groups[1].Value);$q=$href.IndexOf('?');if($q-ge0){$href=$href.Substring(0,$q)};if($href.StartsWith($blobPrefix,[StringComparison]::OrdinalIgnoreCase)){$name=[uri]::UnescapeDataString($href.Substring($blobPrefix.Length));if($name-notmatch'/'){$null=$catalogNames.Add($name)}}}
' }catch{}
' foreach($catalogMod in @($script:AllCatalogMods)){if($null-ne$catalogMod-and-not[string]::IsNullOrWhiteSpace([string]$catalogMod.FileName)){$null=$catalogNames.Add([string]$catalogMod.FileName)}}
' $zipPattern=[regex]::new('^(?<base>.+)\.zip$',[Text.RegularExpressions.RegexOptions]::IgnoreCase);$modPattern=[regex]::new('^(?<character>.+)_(?<version>[^_]+)$',[Text.RegularExpressions.RegexOptions]::IgnoreCase)
' foreach($catalogName in $catalogNames){$zipMatch=$zipPattern.Match($catalogName);if(-not$zipMatch.Success){continue};$modMatch=$modPattern.Match($zipMatch.Groups['base'].Value);if(-not$modMatch.Success){continue};$existing=$script:AllCatalogMods|Where-Object{([string]$_.FileName)-ieq$catalogName}|Select-Object -First 1;if($null-ne$existing){$keyCheckMods.Add($existing)}else{$encodedName=([uri]::EscapeDataString($catalogName)).Replace('%2F','/');$downloadUrl="https://raw.githubusercontent.com/$Owner/$Repository/$Branch/$encodedName";$keyCheckMods.Add([pscustomobject]@{Character=$modMatch.Groups['character'].Value.Trim();Version=$modMatch.Groups['version'].Value.Trim();DownloadUrl=$downloadUrl;DriveFolderId=$null;FileName=$catalogName;IsPrivate=$false;PrivateUrl=$null;PrivateApiUrl=$null;PrivateDriveFileId=$null;HasChangelog=$false})}}
' $keyCheckTotal=[Math]::Max(1,$keyCheckMods.Count);$keyCheckIndex=0
' foreach($mod in $keyCheckMods){$keyCheckIndex++;$keyCheckPercent=42+[int](50*$keyCheckIndex/$keyCheckTotal);if($keyCheckPercent-gt92){$keyCheckPercent=92};Set-Progress $true 'Checking private keys...' $keyCheckPercent
'  $zip=[string]$mod.FileName;if([string]::IsNullOrWhiteSpace($zip)){continue};$base=if($zip.EndsWith('.zip',[StringComparison]::OrdinalIgnoreCase)){$zip.Substring(0,$zip.Length-4)}else{$zip};$privateName=$base+'_Private.txt';$metadataKey=$privateName.ToLowerInvariant();$privateText=$null
'  try{$encoded=[uri]::EscapeDataString($privateName);$url="https://raw.githubusercontent.com/$Owner/$Repository/$Branch/${encoded}";$headers=@{'User-Agent'='NLH-Mod-Manager';'Cache-Control'='no-cache, no-store, max-age=0';'Pragma'='no-cache'};$response=Invoke-WebRequest -Uri $url -Headers $headers -UseBasicParsing -TimeoutSec 12;$privateText=[string]$response.Content}catch{continue}
'  if([string]::IsNullOrWhiteSpace($privateText)){continue};$script:BranchMetadataText[$metadataKey]=$privateText;$mod.IsPrivate=$true;$mod.PrivateUrl=$url
'  $trimmed=$privateText.Trim([char]0xFEFF,[char]0x200B,[char]0x00A0,[char]0x20,[char]0x09,[char]0x0D,[char]0x0A);$hashMatch=[regex]::Match($trimmed,'(?im)^\s*sha256\s*:\s*([0-9a-f]{64})\s*$');$expected=if($hashMatch.Success){$hashMatch.Groups[1].Value.ToLowerInvariant()}else{Get-KeyHash $trimmed}
'  if($enteredHash-eq$expected){$null=$matched.Add($mod)}
' }
' if($matched.Count-eq0){Complete-PrivateKeyProgress 'Private-key check complete.';Set-Progress $false;Show-NLHInfo 'Private Key' 'That private key did not match any current private key.';return}
' $alreadyUnlockedMods=@($matched|Where-Object{Test-ModUnlocked $_});$newlyUnlockedMods=@($matched|Where-Object{-not(Test-ModUnlocked $_)});$script:SavedPrivateUnlocks[$enteredHash]=$enteredHash;$script:AuthorizedPrivateHashes[$enteredHash]=$true;foreach($mod in $matched){$modId=Get-PrivateModId $mod;$script:KnownPrivateMods[$modId]=$true;$script:KnownPrivateHashes[$modId]=$enteredHash;$script:AuthorizedPrivateModHashes[$modId]=$enteredHash;$explicitPath=Join-Path $PrivateModRegPath $modId;if(-not(Test-Path -LiteralPath $explicitPath)){New-Item -Path $explicitPath -Force|Out-Null};Set-ItemProperty -LiteralPath $explicitPath -Name 'AuthorizedHash' -Value $enteredHash -Type String -Force;Set-ItemProperty -LiteralPath $explicitPath -Name 'CurrentHash' -Value $enteredHash -Type String -Force;Set-ItemProperty -LiteralPath $explicitPath -Name 'ExplicitKey' -Value 1 -Type DWord -Force;Set-ItemProperty -LiteralPath $explicitPath -Name 'Character' -Value ([string]$mod.Character) -Type String -Force;Set-ItemProperty -LiteralPath $explicitPath -Name 'Version' -Value ([string]$mod.Version) -Type String -Force;Set-ItemProperty -LiteralPath $explicitPath -Name 'FileName' -Value ([string]$mod.FileName) -Type String -Force;Set-ItemProperty -LiteralPath $explicitPath -Name 'DownloadUrl' -Value ([string]$mod.DownloadUrl) -Type String -Force;Set-ItemProperty -LiteralPath $explicitPath -Name 'DriveFolderId' -Value ([string]$mod.DriveFolderId) -Type String -Force;Set-ItemProperty -LiteralPath $explicitPath -Name 'PrivateUrl' -Value ([string]$mod.PrivateUrl) -Type String -Force;Set-ItemProperty -LiteralPath $explicitPath -Name 'PrivateApiUrl' -Value ([string]$mod.PrivateApiUrl) -Type String -Force;Set-ItemProperty -LiteralPath $explicitPath -Name 'PrivateDriveFileId' -Value ([string]$mod.PrivateDriveFileId) -Type String -Force};Save-PrivateUnlocks;Save-KnownPrivateHashes
' Complete-PrivateKeyProgress 'Private key verified.';Set-Progress $false
' $getPrivateName={param($m)if([string]::IsNullOrWhiteSpace([string]$m.Version)){[string]$m.Character}else{"$($m.Character) $($m.Version)"}};$newNames=@(Select-NewestPerCharacter $newlyUnlockedMods|ForEach-Object{&$getPrivateName $_});$existingNames=@(Select-NewestPerCharacter $alreadyUnlockedMods|ForEach-Object{&$getPrivateName $_});$parts=New-Object System.Collections.Generic.List[string];if($newNames.Count-gt0){$parts.Add('Unlocked access to: '+($newNames-join', '))};if($existingNames.Count-gt0){$parts.Add('Already unlocked: '+($existingNames-join', '))};Show-NLHInfo 'Private Key' ($parts-join"`r`n`r`n");foreach($mod in $matched){Register-VerifiedCatalogMod $mod};$cmbReleaseVersion.Tag='Loading';try{Refresh-ReleaseVersionDropdown $CurrentReleaseVersion;$pnlReleaseVersion.Visible=($script:LaunchedThroughManagerLauncher-and@(Get-UnlockedReleaseVersions).Count-gt1);$pnlReleaseVersion.Invalidate();$pnlReleaseVersion.Update()}finally{$cmbReleaseVersion.Tag=$null};Layout;[Windows.Forms.Application]::DoEvents()
' }finally{Set-Progress $false;Stop-NlhTextDisabledState}
'})
'$btnRefresh.Add_Click({$script:ManualHashRefresh=$true;try{if($script:LaunchedThroughManagerLauncher){$releaseStateChecked=Refresh-ReleaseAuthorizationState;if($releaseStateChecked-and-not$script:CurrentReleaseStillAuthorized){if($script:AvailableReleaseCount-eq0){$null=Show-NoAvailableReleaseAndClose;return};if(Restart-ToAvailablePublicRelease){return}};if($releaseStateChecked-and(Restart-CurrentReleaseIfUpdated)){return};Refresh-ReleaseVersionDropdown $CurrentReleaseVersion;$pnlReleaseVersion.Invalidate();$pnlReleaseVersion.Update();[Windows.Forms.Application]::DoEvents()};$script:SavedPrivateUnlocks=@{};$script:AuthorizedPrivateHashes=@{};$script:AuthorizedPrivateModHashes=@{};try{if(Test-Path -LiteralPath $PrivateHashRegPath){foreach($key in @(Get-ChildItem -LiteralPath $PrivateHashRegPath -ErrorAction SilentlyContinue)){if($key.PSChildName-match'^[0-9a-fA-F]{64}$'){$hash=$key.PSChildName.ToLowerInvariant();$script:SavedPrivateUnlocks[$hash]=$hash;$script:AuthorizedPrivateHashes[$hash]=$true}}};if(Test-Path -LiteralPath $PrivateModRegPath){foreach($key in @(Get-ChildItem -LiteralPath $PrivateModRegPath -ErrorAction SilentlyContinue)){if($key.PSChildName-match'^[0-9a-fA-F]{64}$'){$id=$key.PSChildName.ToLowerInvariant();$authorizedHash=[string](Get-ItemProperty -LiteralPath $key.PSPath -Name 'AuthorizedHash' -ErrorAction SilentlyContinue).AuthorizedHash;$explicitKey=[int](Get-ItemProperty -LiteralPath $key.PSPath -Name 'ExplicitKey' -ErrorAction SilentlyContinue).ExplicitKey;if($explicitKey-eq1-and$authorizedHash-match'^[0-9a-fA-F]{64}$'){$script:AuthorizedPrivateModHashes[$id]=$authorizedHash.ToLowerInvariant()}}}}}catch{};Stop-PrivateVerificationForRefresh;$txtSearch.Clear();$script:PrivateExpectedHashCache.Clear();$script:BranchMetadataText.Clear();Suspend-NlhMainRedraw;$refreshGridBack=$dgv.DefaultCellStyle.BackColor;$inactiveTopText=[Drawing.Color]::FromArgb(180,180,186);$refreshTopControls=@($titleText,$lblTitle,$lblSub,$lblSearch,$lblReleaseVersion,$lblBulk,$lblSummary,$lblFolder,$lblStaged,$lblFrostyPack,$lblProgress,$lblActivity,$chkCloseAfterLaunch,$chkDeleteOldVersions);$refreshTopColors=@($refreshTopControls|ForEach-Object{$_.ForeColor});foreach($topControl in $refreshTopControls){try{$topControl.ForeColor=$inactiveTopText;$topControl.Invalidate()}catch{}};$dgv.BackgroundColor=$refreshGridBack;try{$script:CatalogRowsReady=$false;$pnlBulk.Visible=$false;$refreshGridWidths=@($dgv.Columns|ForEach-Object{$_.Width});$dgv.AutoSizeColumnsMode='None';for($refreshColIndex=0;$refreshColIndex-lt$refreshGridWidths.Count;$refreshColIndex++){$dgv.Columns[$refreshColIndex].Width=$refreshGridWidths[$refreshColIndex]};$dgv.Rows.Clear();Update-CatalogViewportSurface;$dgv.BackgroundColor=$refreshGridBack;Start-NlhTextDisabledState;Apply-NlhRefreshGridDisabledStateImmediately;$form.Invalidate($true)}finally{Resume-NlhMainRedraw};[Windows.Forms.Application]::DoEvents();$script:AllCatalogMods=@();Load-Catalog $false $false;Suspend-NlhMainRedraw;try{Stop-NlhRefreshDisabledStateImmediately;for($refreshTopIndex=0;$refreshTopIndex-lt$refreshTopControls.Count;$refreshTopIndex++){try{$refreshTopControls[$refreshTopIndex].ForeColor=$refreshTopColors[$refreshTopIndex]}catch{}};$script:ManualHashRefresh=$false;try{if($null-ne$dgv-and-not$dgv.IsDisposed){$dgv.AutoSizeColumnsMode='Fill'}}catch{};if($script:NlhTextDisabledDepth-gt0){Stop-NlhTextDisabledState};Set-Busy $false;$form.Invalidate($true)}finally{Resume-NlhMainRedraw};[Windows.Forms.Application]::DoEvents()}finally{if($script:ManualHashRefresh){$script:ManualHashRefresh=$false;try{if($null-ne$dgv-and-not$dgv.IsDisposed){$dgv.AutoSizeColumnsMode='Fill'}}catch{};if($script:NlhTextDisabledDepth-gt0){Stop-NlhTextDisabledState};Set-Busy $false}}})
'$btnOpen.Add_Click({[IO.Directory]::CreateDirectory($DestRoot)|Out-Null;Start-Process explorer.exe -ArgumentList ('"'+$DestRoot+'"')})
'function Move-ModsFolderSafely([string]$OldRoot,[string]$NewRoot){
' $old=[IO.Path]::GetFullPath($OldRoot).TrimEnd([IO.Path]::DirectorySeparatorChar)
' $new=[IO.Path]::GetFullPath($NewRoot).TrimEnd([IO.Path]::DirectorySeparatorChar)
' if($old-ieq$new){return $false}
' if($new.StartsWith($old+[IO.Path]::DirectorySeparatorChar,[StringComparison]::OrdinalIgnoreCase)){throw 'The new mods folder cannot be inside the current mods folder.'}
' if(-not(Test-Path -LiteralPath $old)){[IO.Directory]::CreateDirectory($new)|Out-Null;return $false}
' [IO.Directory]::CreateDirectory($new)|Out-Null
' $sourceFiles=@(Get-ChildItem -LiteralPath $old -File -Recurse -Force -ErrorAction Stop)
' foreach($sourceFile in $sourceFiles){
'  $relative=$sourceFile.FullName.Substring($old.Length).TrimStart([IO.Path]::DirectorySeparatorChar)
'  $destination=Join-Path $new $relative
'  if(Test-Path -LiteralPath $destination){
'   $existing=Get-Item -LiteralPath $destination -Force
'   if($existing.Length-ne$sourceFile.Length){throw "A different file already exists at the new location: $relative"}
'   $sourceHash=(Get-FileHash -LiteralPath $sourceFile.FullName -Algorithm SHA256).Hash
'   $destinationHash=(Get-FileHash -LiteralPath $destination -Algorithm SHA256).Hash
'   if($sourceHash-cne$destinationHash){throw "A different file already exists at the new location: $relative"}
'  }else{
'   [IO.Directory]::CreateDirectory([IO.Path]::GetDirectoryName($destination))|Out-Null
'   Copy-Item -LiteralPath $sourceFile.FullName -Destination $destination -Force
'   if((Get-FileHash -LiteralPath $sourceFile.FullName -Algorithm SHA256).Hash-cne(Get-FileHash -LiteralPath $destination -Algorithm SHA256).Hash){throw "Verification failed while moving: $relative"}
'  }
' }
' foreach($sourceFile in $sourceFiles){
'  $relative=$sourceFile.FullName.Substring($old.Length).TrimStart([IO.Path]::DirectorySeparatorChar)
'  $destination=Join-Path $new $relative
'  if(-not(Test-Path -LiteralPath $destination)){throw "Verification failed while moving: $relative"}
' }
' Remove-Item -LiteralPath $old -Recurse -Force
' return $true
'}
'$btnChangeFolder.Add_Click({
' $picker=New-Object Windows.Forms.FolderBrowserDialog
' $picker.Description='Choose a location. An NLH Mods folder will be created there automatically.'
' $picker.ShowNewFolderButton=$true
' if(Test-Path -LiteralPath $DestRoot){$picker.SelectedPath=$DestRoot}
' try {
'  if($picker.ShowDialog($form)-eq[Windows.Forms.DialogResult]::OK){
'   $selectedBase=[IO.Path]::GetFullPath($picker.SelectedPath)
'   if([IO.Path]::GetFileName($selectedBase.TrimEnd([IO.Path]::DirectorySeparatorChar)) -ieq 'NLH Mods') {$newDestRoot=$selectedBase}else{$newDestRoot=Join-Path $selectedBase 'NLH Mods'}
'   $oldDestRoot=$script:DestRoot
'   $moved=Move-ModsFolderSafely $oldDestRoot $newDestRoot
'   $script:DestRoot=[IO.Path]::GetFullPath($newDestRoot)
'   if(-not(Test-Path $SettingsRegPath)){New-Item -Path $SettingsRegPath -Force|Out-Null}
'   New-ItemProperty -Path $SettingsRegPath -Name 'ModsFolder' -Value $script:DestRoot -PropertyType String -Force|Out-Null
'   if($moved){if(-not$chkShowFilePaths.Checked){Log "Moved all mods to: $script:DestRoot" LimeGreen}else{Log 'Moved all mods to the new folder.' LimeGreen}}
'   elseif(-not$chkShowFilePaths.Checked){Log "Mods folder changed to: $script:DestRoot" LimeGreen}else{Log 'Mods folder changed.' LimeGreen}
'   Update-InstallLocationDisplay
'   foreach($r in $dgv.Rows){Update-Row $r}
'  }
' } finally {$picker.Dispose()}
'})
'$btnRedownloadAll.Add_Click({
' $installed=@($dgv.Rows|Where-Object{$_.Tag.Status-ne'NotInstalled'});if($installed.Count-eq0){return}
' $installedNames=@($installed|ForEach-Object{"$($_.Tag.Character) $($_.Tag.Version)"})
' $message="Re-download and reinstall:`r`n`r`n$($installedNames-join"`r`n")"
' if(-not(Show-NLHConfirm 'Re-download All Installed Character Mods' $message 'Re-download All')){return}
' Set-Busy $true;try{foreach($row in $installed){Download-And-Extract $row.Tag;Update-Row $row};Update-BulkConfigButton}catch{Log $_.Exception.Message Red;Show-NLHInfo 'NLH Mod Manager' $_.Exception.Message}finally{Set-Busy $false}
'})
'$btnBulkConfig.Add_Click({
' if(-not[bool]$btnBulkConfig.Tag){return}
' $eligible=@($dgv.Rows|Where-Object{$_.Tag.Status-ne'NotInstalled'});if($eligible.Count-eq0){return}
' if($btnBulkConfig.Text-eq'Remove All from Config'){
'  $removeRows=@($eligible|Where-Object{$script:StagedCharacters.Contains($_.Tag.Character)-or(Test-CharacterInFrostyConfig $_.Tag)})
'  if($removeRows.Count-eq0){return}
'  $appliedRows=@($removeRows|Where-Object{Test-CharacterInFrostyConfig $_.Tag})
'  if($appliedRows.Count-gt0){
'   $removeNames=@($removeRows|ForEach-Object{"$($_.Tag.Character) $($_.Tag.Version)"})
'   $message="Remove from the selected Frosty config:`r`n`r`n$($removeNames-join"`r`n")"
'   if(-not(Show-NLHConfirm 'Remove All from Config' $message 'Remove All')){return}
'  }
'  foreach($row in $removeRows){
'   if($script:StagedCharacters.Contains($row.Tag.Character)){
'    $queuedItem=$script:StagedCharacters[$row.Tag.Character];$fileCount=@($queuedItem.Files).Count
'    $script:StagedCharacters.Remove($row.Tag.Character)
'    Log "Unqueued $($row.Tag.Character) from Frosty config ($fileCount file(s))." Silver
'   }
'   if(Test-CharacterInFrostyConfig $row.Tag){Remove-CharacterFromFrostyConfig $row}
'  }
'  foreach($row in $eligible){Update-FrostyRow $row}
' }else{
'  foreach($row in $eligible){if(-not(Test-CharacterInFrostyConfig $row.Tag)){try{Stage-Character $row}catch{Log $_.Exception.Message Red}}}
'  foreach($row in $eligible){Update-FrostyRow $row}
' }
' Update-StagedDisplay;Update-BulkConfigButton;$dgv.Invalidate();$dgv.Update()
'})
'$btnDeleteAll.Add_Click({
' if(-not[bool]$btnDeleteAll.Tag){return}
' $installed=@($dgv.Rows|Where-Object{$_.Tag.Status-ne'NotInstalled'});if($installed.Count-eq0){return}
' $installedNames=@($installed|ForEach-Object{"$($_.Tag.Character) $($_.Tag.Version)"})
' $message="Uninstall:`r`n`r`n$($installedNames-join"`r`n")`r`n`r`nThis removes the installed mods, archive companions, Frosty library files, and matching Frosty pack entries."
' if(-not(Show-NLHConfirm 'Uninstall Installed Mods' $message 'Uninstall All')){return}
' $btnDeleteAll.Enabled=$false;$btnRedownloadAll.Enabled=$false;$btnBulkConfig.Enabled=$false;$dgv.Enabled=$false;$form.UseWaitCursor=$true
' try{
'  foreach($row in $installed){Revoke-PrivateModAccess $row.Tag;Update-Row $row}
'  $script:StagedCharacters.Clear();Update-StagedDisplay;Update-FrostyPackDisplay;Update-BulkConfigButton
'  Log "Deleted all installed character mods from local storage and Frosty." LimeGreen
' }catch{Log $_.Exception.Message Red;Show-NLHInfo 'NLH Mod Manager' $_.Exception.Message}finally{$form.UseWaitCursor=$false;$form.Cursor=[Windows.Forms.Cursors]::Default;$dgv.Enabled=$true;Update-BulkConfigButton;Restore-PreferenceCheckboxes}
'})
'$btnClearQueue.Add_Click({foreach($row in $dgv.Rows){if($script:StagedCharacters.Contains($row.Tag.Character)){$script:StagedCharacters.Remove($row.Tag.Character);Update-FrostyRow $row}};Update-StagedDisplay;Log 'Cleared the Frosty config queue.' Silver})
'$txtLog.Add_MouseDown({$form.ActiveControl=$null})
'$txtLog.Add_Enter({$form.ActiveControl=$null})
'$txtLog.Add_GotFocus({$form.BeginInvoke([Action]{$form.ActiveControl=$null})|Out-Null})
'$btnClearLog.Add_MouseDown({if(-not[bool]$btnClearLog.Tag){$form.ActiveControl=$null}})
'$btnClearLog.Add_Enter({if(-not[bool]$btnClearLog.Tag){$form.ActiveControl=$null}})
'$btnClearLog.Add_Click({if(-not[bool]$btnClearLog.Tag){$form.ActiveControl=$null;Set-ClearLogAvailable $false;$btnClearLog.Invalidate();$btnClearLog.Update();return};$txtLog.Clear();$form.ActiveControl=$null;Set-ClearLogAvailable $false;$btnClearLog.Invalidate();$btnClearLog.Update()})
'$btnClearLog.Add_MouseUp({if(-not[bool]$btnClearLog.Tag){$form.ActiveControl=$null;Set-ClearLogAvailable $false;$btnClearLog.Invalidate();$btnClearLog.Update()}})
'$chkShowFilePaths.Add_CheckedChanged({if(-not(Test-Path $SettingsRegPath)){New-Item -Path $SettingsRegPath -Force|Out-Null};New-ItemProperty -Path $SettingsRegPath -Name 'ShowFilePaths' -Value ([int](-not$chkShowFilePaths.Checked)) -PropertyType DWord -Force|Out-Null;Update-InstallLocationDisplay})
'$chkDeleteOldVersions.Add_CheckedChanged({if(-not(Test-Path $SettingsRegPath)){New-Item -Path $SettingsRegPath -Force|Out-Null};New-ItemProperty -Path $SettingsRegPath -Name 'DeleteOldVersions' -Value ([int]$chkDeleteOldVersions.Checked) -PropertyType DWord -Force|Out-Null;$script:DeleteOldVersions=$chkDeleteOldVersions.Checked})
'$chkCloseAfterLaunch.Add_CheckedChanged({if(-not(Test-Path $SettingsRegPath)){New-Item -Path $SettingsRegPath -Force|Out-Null};New-ItemProperty -Path $SettingsRegPath -Name 'CloseAfterLaunch' -Value ([int]$chkCloseAfterLaunch.Checked) -PropertyType DWord -Force|Out-Null;$script:CloseAfterLaunch=$chkCloseAfterLaunch.Checked})
'$btnApplyOnly.Add_MouseDown({if(-not[bool]$btnApplyOnly.Tag){$form.ActiveControl=$null}})
'$btnApplyOnly.Add_Enter({if(-not[bool]$btnApplyOnly.Tag){$form.ActiveControl=$null}})
'$btnApplyOnly.Add_Click({if(-not[bool]$btnApplyOnly.Tag){$form.ActiveControl=$null;return};try{Apply-FrostyConfig $false}catch{Log $_.Exception.Message Red;Show-NLHInfo 'NLH Mod Manager' $_.Exception.Message}})
'$btnLaunchFrosty.Add_Click({try{Apply-FrostyConfig $true}catch{Log $_.Exception.Message Red;Show-NLHInfo 'NLH Mod Manager' $_.Exception.Message}})
'$btnAll.Add_Click({
' $rows=@($dgv.Rows|?{$_.Tag.Status-ne'UpToDate'})
' if(-not$rows.Count){Show-NLHInfo 'NLH Mod Manager' 'Everything is already up to date!';return}
' $downloadNames=@($rows|ForEach-Object{$action=if($_.Tag.Status-eq'UpdateAvailable'){'Update'}else{'Download'};"${action}: $($_.Tag.Character) $($_.Tag.Version)"})
' $message="The following character mods will be downloaded or updated:`r`n`r`n$($downloadNames-join"`r`n")"
' if(-not(Show-NLHConfirm 'Download / Update All' $message 'Continue')){return}
' Set-Busy $true
' try{foreach($r in $rows){Download-And-Extract $r.Tag;Update-Row $r}}
' catch{Log $_.Exception.Message Red;Show-NLHInfo 'NLH Mod Manager' $_.Exception.Message}
' finally{Update-BulkConfigButton;Set-Busy $false}
'})
'# NLH_MANAGER_IDEMPOTENT_SHUTDOWN
'$script:NlhShutdownStarted=$false
'function Invoke-NlhManagerShutdown {
' if($script:NlhShutdownStarted){return}
' $script:NlhShutdownStarted=$true
' $script:AppClosing=$true
' try{if($null-ne$form-and-not$form.IsDisposed){if($form.IsHandleCreated){[NlhWindowIconNative]::ShowWindow($form.Handle,0)|Out-Null};$form.ShowInTaskbar=$false;$form.Opacity=0;foreach($ownedForm in @($form.OwnedForms)){try{if($null-ne$ownedForm-and-not$ownedForm.IsDisposed){if($ownedForm.IsHandleCreated){[NlhWindowIconNative]::ShowWindow($ownedForm.Handle,0)|Out-Null};$ownedForm.ShowInTaskbar=$false;$ownedForm.Opacity=0}}catch{}}}}catch{}
' try{[Windows.Forms.Application]::DoEvents()}catch{}
' foreach($timerName in @('startupTimer','frostyMonitor','FrostyPostLoadTimer','PrivateMetadataCheckTimer','PrivateVerifyTimer')){
'  try{$timerVariable=Get-Variable -Name $timerName -Scope Script -ErrorAction SilentlyContinue;if($null-ne$timerVariable){$timer=$timerVariable.Value;if($null-ne$timer){try{$timer.Stop()}catch{};try{$timer.Dispose()}catch{}};Set-Variable -Name $timerName -Scope Script -Value $null}}catch{}
' }
' foreach($workerName in @('PrivateVerifyPowerShell','PrivateCommitPowerShell','FrostyBackgroundPowerShell')){
'  try{
'   $asyncName=$workerName.Replace('PowerShell','Async');$workerVariable=Get-Variable -Name $workerName -Scope Script -ErrorAction SilentlyContinue;$asyncVariable=Get-Variable -Name $asyncName -Scope Script -ErrorAction SilentlyContinue;$worker=if($null-ne$workerVariable){$workerVariable.Value}else{$null};$asyncResult=if($null-ne$asyncVariable){$asyncVariable.Value}else{$null}
'   if($null-ne$worker){try{if($null-ne$asyncResult){if(-not$asyncResult.IsCompleted){try{$worker.Stop()}catch{};try{$null=$asyncResult.AsyncWaitHandle.WaitOne(1500)}catch{}};if($asyncResult.IsCompleted){try{$null=$worker.EndInvoke($asyncResult)}catch{}}}}catch{};try{$worker.Dispose()}catch{}}
'   Set-Variable -Name $workerName -Scope Script -Value $null;Set-Variable -Name $asyncName -Scope Script -Value $null
'  }catch{}
' }
' try{if($null-ne$form-and-not$form.IsDisposed){foreach($ownedForm in @($form.OwnedForms)){try{if($null-ne$ownedForm-and-not$ownedForm.IsDisposed){$ownedForm.Close();$ownedForm.Dispose()}}catch{}}}}catch{}
' try{if($null-ne$script:NlhMainCloseBridge){$script:NlhMainCloseBridge.Dispose();$script:NlhMainCloseBridge=$null}}catch{}
' try{if($null-ne$script:InstanceMutex){try{$script:InstanceMutex.ReleaseMutex()}catch{};$script:InstanceMutex.Dispose();$script:InstanceMutex=$null}}catch{}
'}
'$applicationContext=New-Object Windows.Forms.ApplicationContext
'$startupTimer=New-Object Windows.Forms.Timer;$startupTimer.Interval=1
'$startupTimer.Add_Tick({
' $startupTimer.Stop();$startupTimer.Dispose()
' try{
'  $doubleBufferedProperty=[Windows.Forms.Control].GetProperty('DoubleBuffered',[Reflection.BindingFlags]'Instance,NonPublic')
'  $loadingForm=New-Object Windows.Forms.Form;Set-NlhIcon $loadingForm;$loadingForm.Text='NLH Mod Manager Public Release V1.0';$loadingForm.ClientSize=New-Object Drawing.Size(436,179);$loadingForm.FormBorderStyle='None';$loadingForm.MaximizeBox=$false;$loadingForm.MinimizeBox=$false;$loadingForm.StartPosition='CenterScreen';$loadingForm.ShowInTaskbar=$false;$loadingForm.BackColor=$C.Form;$loadingForm.ForeColor=$C.Text;$loadingForm.Font=New-Object Drawing.Font('Segoe UI',9)
'  $loadingForm.Add_FormClosing({[NlhPrecisionLoaderDrag]::Stop($loadingForm.Handle)});$loadingForm.Add_VisibleChanged({if(-not$loadingForm.Visible){[NlhPrecisionLoaderDrag]::Stop($loadingForm.Handle)}})
'  $loadingCaption=New-Object Windows.Forms.Panel;$loadingCaption.SetBounds(0,0,436,26);$loadingCaption.BackColor=$script:NlhCustomAccent
'  $loadingCaptionIcon=New-Object Windows.Forms.PictureBox;$loadingCaptionIcon.SetBounds(5,5,16,16);$loadingCaptionIcon.SizeMode='Normal';$loadingCaptionIcon.BackColor=$script:NlhCustomAccent;$loadingCaptionIconBitmap=Get-NlhTitleIconBitmap;if($null-ne$loadingCaptionIconBitmap){$loadingCaptionIcon.Image=$loadingCaptionIconBitmap}else{$loadingCaptionIcon.Visible=$false}
'  $loadingCaptionText=New-Object Windows.Forms.Label;$loadingCaptionText.SetBounds(25,7,406,19);$loadingCaptionText.Text='NLH Mod Manager';$loadingCaptionText.BackColor=$script:NlhCustomAccent;$loadingCaptionText.ForeColor=$script:NlhCustomCaptionText;$loadingCaptionText.Font=New-Object Drawing.Font('Segoe UI',8.25);$loadingCaption.Controls.AddRange([Windows.Forms.Control[]]@($loadingCaptionIcon,$loadingCaptionText))
'  $loadingAccent=New-Object Windows.Forms.Panel;$loadingAccent.SetBounds(0,26,436,3);$loadingAccent.BackColor=$C.Accent
'  $loadingTitle=New-Object Windows.Forms.Label;$loadingTitle.SetBounds(20,40,396,42);$loadingTitle.Text='NLH Mod Manager';$loadingTitle.Font=New-Object Drawing.Font('Segoe UI Semibold',18);$loadingTitle.ForeColor=$C.Text
'  $loadingText=New-Object Windows.Forms.Label;$loadingText.SetBounds(22,86,392,24);$loadingText.Text='Starting manager...';$loadingText.Font=New-Object Drawing.Font('Segoe UI',10);$loadingText.ForeColor=$C.Muted
'  $loadingProgress=New-Object NlhBlueGlowProgress;$loadingProgress.SetBounds(22,126,392,10);$loadingProgress.Style=[Windows.Forms.ProgressBarStyle]::Continuous;$loadingProgress.Minimum=0;$loadingProgress.Maximum=100;$loadingProgress.Value=10;Send-LauncherProgress 45 'Starting manager...'
'  $loadingForm.Controls.AddRange([Windows.Forms.Control[]]@($loadingCaption,$loadingAccent,$loadingTitle,$loadingText,$loadingProgress));Set-NlhBlueGlowProgress $loadingProgress;Set-NlhIcon $loadingForm
'  $doubleBufferedProperty.SetValue($loadingForm,$true,$null);$loadingForm.CreateControl();foreach($loadingControl in $loadingForm.Controls){$loadingControl.CreateControl();try{$doubleBufferedProperty.SetValue($loadingControl,$true,$null)}catch{}};$loadingForm.PerformLayout();$loadingBitmap=New-Object Drawing.Bitmap($loadingForm.ClientSize.Width,$loadingForm.ClientSize.Height);try{$loadingForm.DrawToBitmap($loadingBitmap,(New-Object Drawing.Rectangle(0,0,$loadingForm.ClientSize.Width,$loadingForm.ClientSize.Height)))}finally{$loadingBitmap.Dispose()};if(-not[string]::IsNullOrWhiteSpace([string]$env:NLH_LAUNCH_HANDOFF)){$loadingForm.ShowInTaskbar=$false;$loadingForm.Opacity=0}else{$loadingForm.ShowInTaskbar=$true;$loadingForm.Opacity=1;$loadingForm.TopMost=$false;$loadingForm.Show();[NlhPrecisionLoaderDrag]::Arm($loadingForm.Handle,26);$loadingForm.Refresh();$loadingForm.Update();[Windows.Forms.Application]::DoEvents()}
'  $loadingText.Text='Loading mod catalog...';$loadingProgress.Value=20;Send-LauncherProgress 50 'Loading mod catalog...';Write-NlhIpcProgress ([string]$env:NLH_LAUNCH_HANDOFF) 50 'Loading mod catalog...';$loadingForm.Refresh();[Windows.Forms.Application]::DoEvents()
'  $script:PrivateExpectedHashCache.Clear();$script:AllCatalogMods=@(Merge-SavedPrivateCandidates @(Get-Catalog));Send-LauncherProgress 65 'Catalog loaded';Write-NlhIpcProgress ([string]$env:NLH_LAUNCH_HANDOFF) 65 'Loading character list...';Load-Catalog $true $true;Send-LauncherProgress 68 'Updating character list...'
'  $loadingText.Text='Preparing interface...';$loadingProgress.Value=80;Send-LauncherProgress 70 'Preparing interface...';Write-NlhIpcProgress ([string]$env:NLH_LAUNCH_HANDOFF) 70 'Preparing interface...';$loadingForm.Refresh();[Windows.Forms.Application]::DoEvents()
'  $doubleBufferedProperty.SetValue($form,$true,$null);Send-LauncherProgress 74 'Configuring interface...';Write-NlhIpcProgress ([string]$env:NLH_LAUNCH_HANDOFF) 74 'Configuring interface...'
'  $form.CreateControl();Send-LauncherProgress 80 'Creating interface controls...';Write-NlhIpcProgress ([string]$env:NLH_LAUNCH_HANDOFF) 80 'Creating interface controls...'
'  foreach($control in $form.Controls){if($null-ne$control-and-not$control.IsDisposed){$control.CreateControl();try{$doubleBufferedProperty.SetValue($control,$true,$null)}catch{}}};Send-LauncherProgress 86 'Controls ready';Write-NlhIpcProgress ([string]$env:NLH_LAUNCH_HANDOFF) 86 'Preparing manager layout...'
'  if($dgv.Rows.Count-gt0){$script:CatalogRowsReady=$true;Update-BulkConfigButton;Layout;Restore-NlhMainScaledLayout $form;$pnlBulk.BringToFront();$pnlBulk.CreateControl();if($btnRedownloadAll.Visible){$btnRedownloadAll.CreateControl();$btnRedownloadAll.PerformLayout();$btnRedownloadAll.Invalidate($true);$btnRedownloadAll.Update()};$pnlBulk.PerformLayout();$pnlBulk.Invalidate($true);$pnlBulk.Update()}
'  $form.PerformLayout();Send-LauncherProgress 90 'Arranging interface...';Write-NlhIpcProgress ([string]$env:NLH_LAUNCH_HANDOFF) 90 'Arranging interface...'
'  if($btnRedownloadAll.Visible){$btnRedownloadAll.CreateControl();$btnRedownloadAll.Refresh();$btnRedownloadAll.Update()};$pnlBulk.Refresh();$pnlBulk.Update()
'  $prepaint=New-Object Drawing.Bitmap($form.ClientSize.Width,$form.ClientSize.Height)
'  try{$form.DrawToBitmap($prepaint,(New-Object Drawing.Rectangle(0,0,$form.ClientSize.Width,$form.ClientSize.Height)))}finally{$prepaint.Dispose()};Send-LauncherProgress 96 'Rendering interface...';Write-NlhIpcProgress ([string]$env:NLH_LAUNCH_HANDOFF) 96 'Rendering interface...'
'  $loadingText.Text='Opening manager...';$loadingProgress.Value=98;Send-LauncherProgress 98 'Opening manager...';Write-NlhIpcProgress ([string]$env:NLH_LAUNCH_HANDOFF) 98 'Opening manager...';$loadingProgress.Value=99;$loadingProgress.Value=100;$loadingForm.Refresh();$loadingForm.Update();$readyUntil=[DateTime]::UtcNow.AddMilliseconds(275);while([DateTime]::UtcNow-lt$readyUntil){[Windows.Forms.Application]::DoEvents();[Threading.Thread]::Sleep(10)}
'  $launchHandoff=[string]$env:NLH_LAUNCH_HANDOFF;$env:NLH_STANDALONE_DIRECT=$null;$pnlReleaseVersion.Visible=($script:LaunchedThroughManagerLauncher-and@(Get-UnlockedReleaseVersions).Count-gt1)
'  $script:RevealMainAfterInitialPrivateVerification={
'   if($script:MainScreenReady){return}
'   $launchHandoff=[string]$env:NLH_LAUNCH_HANDOFF;$env:NLH_STANDALONE_DIRECT=$null;$transitionFile=$null;$closeFile=$null;if(-not[string]::IsNullOrWhiteSpace($launchHandoff)){Set-NlhIpcEvent $launchHandoff 'Transition'};$promotionGate=[string]$env:NLH_PROMOTION_GATE;if(-not[string]::IsNullOrWhiteSpace($promotionGate)){Set-NlhIpcEvent $promotionGate 'Promotion'};$pnlReleaseVersion.Visible=($script:LaunchedThroughManagerLauncher-and@(Get-UnlockedReleaseVersions).Count-gt1);$form.ReadyToShow=$true;Set-NlhIcon $form;$form.ShowInTaskbar=$true;$form.TopMost=$true;$form.Opacity=0;$form.CreateControl();$mainHwnd=$form.Handle;[NlhWindowIconNative]::SendMessage($mainHwnd,0x000B,[IntPtr]::Zero,[IntPtr]::Zero)|Out-Null;$form.Show();Set-NlhIcon $form;$form.Activate();$form.BringToFront();$form.Focus();[Windows.Forms.Application]::DoEvents();$form.SuspendLayout();try{Update-BulkConfigButton;Layout;Restore-NlhMainScaledLayout $form;Layout;$form.PerformLayout();if($btnRedownloadAll.Visible){$btnRedownloadAll.CreateControl();$btnRedownloadAll.PerformLayout()};$pnlBulk.PerformLayout();$pnlBulk.BringToFront();$titleBar.BringToFront()}finally{$form.ResumeLayout($true)};$form.PerformLayout();[Windows.Forms.Application]::DoEvents();Layout;Restore-NlhMainScaledLayout $form;$form.PerformLayout();[Windows.Forms.Application]::DoEvents();$mainHwnd=$form.Handle;$loadingHwnd=[IntPtr]::Zero;if(-not[string]::IsNullOrWhiteSpace([string]$env:NLH_STANDALONE_LOADER_HWND)){try{$loadingHwnd=New-Object IntPtr([long]$env:NLH_STANDALONE_LOADER_HWND)}catch{};$env:NLH_STANDALONE_LOADER_HWND=$null};if($null-ne$loadingForm-and-not$loadingForm.IsDisposed){[NlhPrecisionLoaderDrag]::Stop($loadingForm.Handle);$loadingHwnd=$loadingForm.Handle;$loadingForm.TopMost=$false};if($loadingHwnd-ne[IntPtr]::Zero){[NlhWindowIconNative]::CommitMainAboveLoader($mainHwnd,$loadingHwnd)}else{[NlhWindowIconNative]::CommitMainAboveLoaders($mainHwnd)};[NlhWindowIconNative]::SendMessage($mainHwnd,0x000B,(New-Object IntPtr(1)),[IntPtr]::Zero)|Out-Null;Update-CatalogViewportSurface;$pnlCatalogSurface.SendToBack();$dgv.BringToFront();$catalogSurfaceHwnd=$pnlCatalogSurface.Handle;$catalogGridHwnd=$dgv.Handle;[NlhWindowIconNative]::RedrawWindow($catalogSurfaceHwnd,[IntPtr]::Zero,[IntPtr]::Zero,0x0001-bor 0x0004-bor 0x0080-bor 0x0100)|Out-Null;[NlhWindowIconNative]::UpdateWindow($catalogSurfaceHwnd)|Out-Null;[NlhWindowIconNative]::RedrawWindow($catalogGridHwnd,[IntPtr]::Zero,[IntPtr]::Zero,0x0001-bor 0x0004-bor 0x0080-bor 0x0100)|Out-Null;[NlhWindowIconNative]::UpdateWindow($catalogGridHwnd)|Out-Null;[NlhWindowIconNative]::RedrawWindow($mainHwnd,[IntPtr]::Zero,[IntPtr]::Zero,0x0001-bor 0x0004-bor 0x0080-bor 0x0100)|Out-Null;[NlhWindowIconNative]::UpdateWindow($mainHwnd)|Out-Null;[NlhWindowIconNative]::DwmFlush()|Out-Null;$form.Opacity=1;[NlhWindowIconNative]::RedrawWindow($mainHwnd,[IntPtr]::Zero,[IntPtr]::Zero,0x0001-bor 0x0004-bor 0x0080-bor 0x0100);[NlhWindowIconNative]::UpdateWindow($mainHwnd)|Out-Null;[NlhWindowIconNative]::DwmFlush()|Out-Null;[Windows.Forms.Application]::DoEvents();if($loadingHwnd-ne[IntPtr]::Zero){[NlhWindowIconNative]::CommitMainAboveLoader($mainHwnd,$loadingHwnd)};if($null-ne$loadingForm-and-not$loadingForm.IsDisposed){$loadingForm.TopMost=$false;$loadingForm.Opacity=0;$loadingForm.ShowInTaskbar=$false;$loadingForm.Hide();[Windows.Forms.Application]::DoEvents();try{$loadingForm.Close()}catch{};try{$loadingForm.Dispose()}catch{}};$loadingForm=$null;[NlhWindowIconNative]::CommitMainAboveLoaders($mainHwnd);if(-not[string]::IsNullOrWhiteSpace($launchHandoff)){Set-NlhIpcEvent $launchHandoff 'Close'};$settle=[DateTime]::UtcNow.AddMilliseconds(250);while([DateTime]::UtcNow-lt$settle){[Windows.Forms.Application]::DoEvents();[Threading.Thread]::Sleep(5)};[NlhWindowIconNative]::ReleaseMain($mainHwnd);$form.TopMost=$false;$form.Activate();$form.BringToFront();$form.Focus();$form.Refresh();$form.Update();if(-not[string]::IsNullOrWhiteSpace($launchHandoff)){Write-NlhIpcProgress $launchHandoff 100 'main-ready'}
'   $script:MainScreenReady=$true;$script:NlhPostStartupRenderingEnabled=$true
'  }
'$script:FrostyPostLoadTimer=New-Object Windows.Forms.Timer
'$script:FrostyPostLoadTimer.Interval=250
'$script:FrostyPostLoadTimer.Add_Tick({
' if(-not$script:MainScreenReady-or$null-eq$form-or$form.IsDisposed-or-not$form.Visible-or-not$form.ContainsFocus-or($null-ne$loadingForm-and-not$loadingForm.IsDisposed-and$loadingForm.Visible)){return}
' $script:FrostyPostLoadTimer.Stop()
' $script:FrostyPostLoadTimer.Dispose()
' $script:FrostyPostLoadTimer=$null
' try{Assert-FrostyClosedForConfigChange}catch{}finally{if(-not$script:AppClosing-and$null-ne$form-and-not$form.IsDisposed){$frostyMonitor.Start()}}
'})
'$script:FrostyPostLoadTimer.Start()
'  if($null-ne$txtSearch-and-not$txtSearch.IsDisposed){$txtSearch.Focus()}
'  $form.UseWaitCursor=$false;$dgv.Enabled=$true;$txtSearch.Enabled=$true;$btnRefresh.Enabled=$true;$btnOpen.Enabled=$true;$btnChangeFolder.Enabled=$true;$btnAll.Enabled=$true;$btnLaunchFrosty.Enabled=$true;$btnClearQueue.Enabled=$true;$btnRedownloadAll.Enabled=$true;$btnBulkConfig.Enabled=$true;$btnDeleteAll.Enabled=$true;$btnPrivateKey.Enabled=$true;$chkShowFilePaths.Enabled=$true;$chkCloseAfterLaunch.Enabled=$true;$chkDeleteOldVersions.Enabled=$true;Restore-PreferenceCheckboxes
'  $script:PrivateVerifyQueue=@(@($script:AllCatalogMods)+@(Get-InstalledVersionCandidates));$script:PrivateVerifyIndex=0;$script:PrivateVerifyPowerShell=$null;$script:PrivateVerifyAsync=$null;$script:PrivateVerifyCurrent=$null;$script:PrivateVerifyCommit=$null
'  $script:PrivateCommitPowerShell=[PowerShell]::Create();$commitScript=@'
'param($Owner,$Repository,$Branch)
'$uri="https://github.com/$Owner/$Repository/commits/$Branch.atom?_nlh=$([DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds())";$wc=New-Object Net.WebClient;$wc.Headers['User-Agent']='NLH-Mod-Manager';$wc.Headers['Cache-Control']='no-cache, no-store, max-age=0';$wc.Headers['Pragma']='no-cache';try{$feed=[string]$wc.DownloadString($uri);$match=[regex]::Match($feed,'/commit/([0-9a-f]{40})');if($match.Success){$match.Groups[1].Value}}finally{$wc.Dispose()}
''@;$null=$script:PrivateCommitPowerShell.AddScript($commitScript).AddArgument($Owner).AddArgument($Repository).AddArgument($Branch);$script:PrivateCommitAsync=$script:PrivateCommitPowerShell.BeginInvoke()
'  if($script:PrivateVerifyQueue.Count-gt0){
'   $script:PrivateVerifyTimer=New-Object Windows.Forms.Timer;$script:PrivateVerifyTimer.Interval=50
'   $script:PrivateVerifyTimer.Add_Tick({
'    try{
'     if($null-eq$script:PrivateVerifyCommit){if(-not$script:PrivateCommitAsync.IsCompleted){return};$script:PrivateVerifyCommit=(@($script:PrivateCommitPowerShell.EndInvoke($script:PrivateCommitAsync))|Where-Object{$_}|Select-Object -First 1);$script:PrivateCommitPowerShell.Dispose();$script:PrivateCommitPowerShell=$null;$script:PrivateCommitAsync=$null;if([string]::IsNullOrWhiteSpace([string]$script:PrivateVerifyCommit)){throw 'Current branch revision could not be determined.'}}
'     if($null-eq$script:PrivateVerifyAsync){
'      if($script:PrivateVerifyIndex-ge$script:PrivateVerifyQueue.Count){$script:PrivateVerifyTimer.Stop();$script:PrivateVerifyTimer.Dispose();$script:PrivateVerifyTimer=$null;& $script:RevealMainAfterInitialPrivateVerification;Start-FrostyBackgroundSearch;return}
'      $script:PrivateVerifyCurrent=$script:PrivateVerifyQueue[$script:PrivateVerifyIndex];$script:PrivateVerifyIndex++;$zip=[string]$script:PrivateVerifyCurrent.FileName;$base=if($zip.EndsWith('.zip',[StringComparison]::OrdinalIgnoreCase)){$zip.Substring(0,$zip.Length-4)}else{$zip};$name=$base+'_Private.txt'
'      $workerScript=@'
'param($Name,$Owner,$Repository,$Commit)
'$encoded=[uri]::EscapeDataString($Name);$url="https://raw.githubusercontent.com/$Owner/$Repository/$Commit/${encoded}";$status=0;$text=$null
'try{$headers=@{'User-Agent'='NLH-Mod-Manager';'Cache-Control'='no-cache, no-store, max-age=0';'Pragma'='no-cache'};$response=Invoke-WebRequest -Uri $url -Headers $headers -UseBasicParsing -TimeoutSec 12;$status=[int]$response.StatusCode;$text=[string]$response.Content}catch{if($null-ne$_.Exception.Response){try{$status=[int]$_.Exception.Response.StatusCode}catch{}}}
'[pscustomobject]@{Status=$status;Text=$text;Url=$url}
''@
'      $script:PrivateVerifyPowerShell=[PowerShell]::Create();$null=$script:PrivateVerifyPowerShell.AddScript($workerScript).AddArgument($name).AddArgument($Owner).AddArgument($Repository).AddArgument([string]$script:PrivateVerifyCommit);$script:PrivateVerifyAsync=$script:PrivateVerifyPowerShell.BeginInvoke();return
'     }
'     if(-not$script:PrivateVerifyAsync.IsCompleted){return}
'     $result=@($script:PrivateVerifyPowerShell.EndInvoke($script:PrivateVerifyAsync))|Select-Object -First 1;$mod=$script:PrivateVerifyCurrent;$script:PrivateVerifyPowerShell.Dispose();$script:PrivateVerifyPowerShell=$null;$script:PrivateVerifyAsync=$null;$script:PrivateVerifyCurrent=$null
'     if($null-eq$result){return};if($result.Status-eq404){$mod.IsPrivate=$false;if($null-eq$mod.PSObject.Properties['VerifyOnly']){Add-VerifiedCatalogRow $mod};return};if($result.Status-ne200-or[string]::IsNullOrWhiteSpace([string]$result.Text)){return}
'     $privateText=[string]$result.Text;$privateName=([IO.Path]::GetFileNameWithoutExtension([string]$mod.FileName)+'_Private.txt');$script:BranchMetadataText[$privateName.ToLowerInvariant()]=$privateText;$privateId=Get-PrivateModId $mod;$trimmed=$privateText.Trim([char]0xFEFF,[char]0x200B,[char]0x00A0,[char]0x20,[char]0x09,[char]0x0D,[char]0x0A);$hashMatch=[regex]::Match($trimmed,'(?im)^\s*sha256\s*:\s*([0-9a-f]{64})\s*$');$currentPrivateHash=if($hashMatch.Success){$hashMatch.Groups[1].Value.ToLowerInvariant()}else{Get-KeyHash $trimmed}
'     $wasKnown=$script:KnownPrivateMods.ContainsKey($privateId);$hadKnownHash=$script:KnownPrivateHashes.ContainsKey($privateId);$hashChanged=($hadKnownHash-and(([string]$script:KnownPrivateHashes[$privateId]).Trim().ToLowerInvariant()-ne$currentPrivateHash))
'     $accessValid=Test-PrivateModAuthorization $mod $currentPrivateHash
'     if($hashChanged){$accessValid=Test-PrivateModAuthorization $mod $currentPrivateHash}
'     $mod.IsPrivate=$true;$mod.PrivateUrl=[string]$result.Url
'     if($accessValid){$script:AuthorizedPrivateModHashes[$privateId]=$currentPrivateHash;$script:AuthorizedPrivateHashes[$currentPrivateHash]=$true;$script:SavedPrivateUnlocks[$currentPrivateHash]=$currentPrivateHash;if($null-eq$mod.PSObject.Properties['VerifyOnly']){Add-VerifiedCatalogRow $mod}}else{foreach($visibleRow in @($dgv.Rows)){if($null-ne$visibleRow.Tag-and(Get-PrivateModId $visibleRow.Tag)-eq$privateId){$dgv.Rows.Remove($visibleRow)}};$dgv.ClearSelection();$dgv.CurrentCell=$null;Update-Summary;$installedPrivatePath=Join-Path $DestRoot (Join-Path (Safe-Name $mod.Character) (Safe-Name $mod.Version));if($wasKnown-or(Test-Path -LiteralPath $installedPrivatePath -PathType Container)){$script:AuthorizedPrivateModHashes.Remove($privateId);$preserveNames=@(Install-ValidVersionBeforeRevoke $mod);Revoke-PrivateModAccess $mod $preserveNames}}
'     $script:KnownPrivateMods[$privateId]=$true;$script:KnownPrivateHashes[$privateId]=$currentPrivateHash;Save-KnownPrivateHashes
'    }catch{if($null-ne$script:PrivateVerifyPowerShell){try{$script:PrivateVerifyPowerShell.Dispose()}catch{};$script:PrivateVerifyPowerShell=$null};$script:PrivateVerifyAsync=$null;$script:PrivateVerifyCurrent=$null}
'   })
'   $script:PrivateVerifyTimer.Start()
'  }else{& $script:RevealMainAfterInitialPrivateVerification;Start-FrostyBackgroundSearch}
' }catch{if($null-ne$loadingForm-and-not$loadingForm.IsDisposed){$loadingForm.Close();$loadingForm.Dispose()};$applicationContext.ExitThread();throw}
'})
'function Restore-NlhWindowRendering([bool]$RevealWhenReady=$false){
' if($null-eq$form-or$form.IsDisposed-or$form.WindowState-eq[Windows.Forms.FormWindowState]::Minimized){return}
' try{
'  Update-BulkConfigButton;Update-CatalogViewportSurface
'  if($script:CatalogRowsReady-and$null-ne$pnlBulk-and-not$pnlBulk.IsDisposed){$pnlBulk.Visible=$true;$pnlBulk.BringToFront()}
'  $renderQueue=New-Object System.Collections.ArrayList;[void]$renderQueue.Add($form)
'  while($renderQueue.Count-gt0){$renderControl=$renderQueue[0];$renderQueue.RemoveAt(0);if($null-eq$renderControl-or$renderControl.IsDisposed){continue};try{$renderControl.Invalidate($true)}catch{};foreach($renderChild in @($renderControl.Controls)){[void]$renderQueue.Add($renderChild)}}
'  if($null-ne$dgv-and-not$dgv.IsDisposed){$dgv.ClearSelection();$dgv.CurrentCell=$null;$dgv.InvalidateColumn($dgv.Columns['Uninstall'].Index);$dgv.Invalidate()}
'  [NlhWindowIconNative]::RedrawWindow($form.Handle,[IntPtr]::Zero,[IntPtr]::Zero,[uint32]0x0585)|Out-Null
' }catch{try{$form.Invalidate($true)}catch{}}
' [Windows.Forms.Form]$restoreForm=$form
' $revealAfterRestore=[bool]$RevealWhenReady
' $finishRestore={
'  try{
'   if($null-ne$dgv-and-not$dgv.IsDisposed){$dgv.Invalidate()}
'   if($null-ne$restoreForm-and-not$restoreForm.IsDisposed){[NlhWindowIconNative]::RedrawWindow($restoreForm.Handle,[IntPtr]::Zero,[IntPtr]::Zero,[uint32]0x0585)|Out-Null;if($revealAfterRestore){$restoreForm.Opacity=1}}
'   $restoreDialog=$script:NlhActiveOwnedDialog;if($script:NlhOwnedDialogSuspended-and$null-ne$restoreDialog-and-not$restoreDialog.IsDisposed){$restoreDialog.Owner=$restoreForm;$restoreDialog.Show();$restoreDialog.Activate();$restoreDialog.BringToFront();$script:NlhOwnedDialogSuspended=$false}
'  }catch{}finally{$script:NlhRestoreInProgress=$false}
' }.GetNewClosure()
' if($null-ne$restoreForm-and-not$restoreForm.IsDisposed){$restoreForm.BeginInvoke([Action]$finishRestore)|Out-Null}else{$script:NlhRestoreInProgress=$false}
'}
'$script:NlhWasMinimized=$false
'$script:NlhRestoreInProgress=$false
'$script:NlhPostStartupRenderingEnabled=$false
'$script:NlhActivationRevealPending=$false
'$form.Add_Deactivate({
' if(-not$script:NlhPostStartupRenderingEnabled-or$script:NlhOwnedDialogActive-or$script:NlhRestoreInProgress-or$form.IsDisposed-or$form.WindowState-eq[Windows.Forms.FormWindowState]::Minimized){return}
' $script:NlhActivationRevealPending=$true
' $form.Opacity=0
'})
'$form.Add_Resize({
' if(-not$script:NlhPostStartupRenderingEnabled){return}
' if($form.WindowState-eq[Windows.Forms.FormWindowState]::Minimized){$script:NlhWasMinimized=$true;$form.BeginInvoke([Action]{$owned=$script:NlhActiveOwnedDialog;if($form.WindowState-eq[Windows.Forms.FormWindowState]::Minimized-and$null-ne$owned-and-not$owned.IsDisposed-and$owned.Visible){$owned.Hide();$owned.Owner=$null;$script:NlhOwnedDialogSuspended=$true}})|Out-Null;return}
' if($script:NlhWasMinimized){
'  $script:NlhWasMinimized=$false;$script:NlhRestoreInProgress=$true;$form.Opacity=0
'  $form.BeginInvoke([Action]{Restore-NlhWindowRendering $true})|Out-Null
' }elseif(-not$script:NlhRestoreInProgress){$form.BeginInvoke([Action]{Restore-NlhWindowRendering})|Out-Null}
'})
'$form.Add_Activated({
' if(-not$script:NlhPostStartupRenderingEnabled-or$form.WindowState-eq[Windows.Forms.FormWindowState]::Minimized-or$script:NlhRestoreInProgress-or$script:NlhOwnedDialogActive){return}
' if($script:NlhActivationRevealPending){$script:NlhActivationRevealPending=$false;$script:NlhRestoreInProgress=$true;$form.BeginInvoke([Action]{Restore-NlhWindowRendering $true})|Out-Null}
' else{$form.BeginInvoke([Action]{Restore-NlhWindowRendering})|Out-Null}
'})
'$form.Add_FormClosing({Invoke-NlhManagerShutdown})
'$form.Add_FormClosed({try{if($null-ne$titleIcon.Image){$titleIcon.Image.Dispose();$titleIcon.Image=$null}}catch{};Invoke-NlhManagerShutdown;$applicationContext.ExitThread()})
'if($null-ne('NlhMainCloseBridge'-as[type])){$script:NlhMainCloseBridge=New-Object NlhMainCloseBridge($form)}
'$startupTimer.Start()
'try{[Windows.Forms.Application]::Run($applicationContext)}
'finally{Invoke-NlhManagerShutdown}
