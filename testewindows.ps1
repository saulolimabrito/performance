$file = "C:\testfile.dat"
$size = 1GB
$data = New-Object byte[] $size
$rnd = New-Object Random
$rnd.NextBytes($data)
[System.IO.File]::WriteAllBytes($file, $data)
