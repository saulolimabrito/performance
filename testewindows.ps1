# Configurações
$filePath = "C:\Temp\testfile.dat"  # Caminho do arquivo temporário
$fileSize = 1GB                     # Tamanho do arquivo (1GB)
$blockSize = 64KB                   # Tamanho do bloco para operações de I/O
$testDuration = 10                  # Duração do teste em segundos

# Função para medir o desempenho de escrita
function Test-WritePerformance {
    param (
        [string]$path,
        [int64]$size,
        [int]$blockSize,
        [int]$duration
    )
    $bytes = New-Object byte[] $blockSize
    $rnd = New-Object Random
    $rnd.NextBytes($bytes)
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    $totalBytesWritten = 0
    $iterations = 0

    while ($sw.Elapsed.TotalSeconds -lt $duration) {
        $stream = [System.IO.File]::OpenWrite($path)
        try {
            while ($stream.Length -lt $size) {
                $stream.Write($bytes, 0, $bytes.Length)
                $totalBytesWritten += $bytes.Length
                $iterations++
            }
        } finally {
            $stream.Close()
        }
    }
    $sw.Stop()

    $throughput = [math]::Round(($totalBytesWritten / $sw.Elapsed.TotalSeconds) / 1MB, 2)
    $iops = [math]::Round($iterations / $sw.Elapsed.TotalSeconds, 2)

    return @{
        ThroughputMBps = $throughput
        IOPS = $iops
    }
}

# Função para medir o desempenho de leitura
function Test-ReadPerformance {
    param (
        [string]$path,
        [int]$blockSize,
        [int]$duration
    )
    $bytes = New-Object byte[] $blockSize
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    $totalBytesRead = 0
    $iterations = 0

    while ($sw.Elapsed.TotalSeconds -lt $duration) {
        $stream = [System.IO.File]::OpenRead($path)
        try {
            while ($stream.Read($bytes, 0, $bytes.Length) -gt 0) {
                $totalBytesRead += $bytes.Length
                $iterations++
            }
        } finally {
            $stream.Close()
        }
    }
    $sw.Stop()

    $throughput = [math]::Round(($totalBytesRead / $sw.Elapsed.TotalSeconds) / 1MB, 2)
    $iops = [math]::Round($iterations / $sw.Elapsed.TotalSeconds, 2)

    return @{
        ThroughputMBps = $throughput
        IOPS = $iops
    }
}

# Executar teste de escrita
Write-Host "Iniciando teste de escrita..."
$writeResult = Test-WritePerformance -path $filePath -size $fileSize -blockSize $blockSize -duration $testDuration
Write-Host "Desempenho de Escrita:"
Write-Host "  Throughput: $($writeResult.ThroughputMBps) MB/s"
Write-Host "  IOPS: $($writeResult.IOPS)"

# Executar teste de leitura
Write-Host "Iniciando teste de leitura..."
$readResult = Test-ReadPerformance -path $filePath -blockSize $blockSize -duration $testDuration
Write-Host "Desempenho de Leitura:"
Write-Host "  Throughput: $($readResult.ThroughputMBps) MB/s"
Write-Host "  IOPS: $($readResult.IOPS)"

# Limpar arquivo temporário
if (Test-Path $filePath) {
    Remove-Item $filePath -Force
}

Write-Host "Teste concluído."
