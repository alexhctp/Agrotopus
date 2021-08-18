$getString_b1 = (netstat -anop TCP | findstr 20256)
$getString_b2 = (netstat -anop TCP | findstr 20257)
foreach($z1 in $getString_b1.Substring($getString_b1.Length-5)) {
    taskkill.exe /pid $z1 /F
    Start-Sleep -s 0.8
}

foreach($z2 in $getString_b2.Substring($getString_b2.Length-5)) {
    taskkill.exe /pid $z2 /F
    Start-Sleep -s 0.8
}
