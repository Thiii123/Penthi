try {
    Write-Host "Iniciando script..." -ForegroundColor Cyan
    $urlControle = "https://raw.githubusercontent.com/Thiii123/Penthi/refs/heads/main/check-thi.ps1"
    
    # Tenta baixar o status
    Write-Host "Verificando conexao com o GitHub..."
    $status = Invoke-RestMethod -Uri $urlControle -UseBasicParsing
    Write-Host "Status atual: $status"

    if ($status.Trim() -eq "1") {
        Write-Host "Abrindo YouTube..."
        Start-Process "https://www.youtube.com/watch?v=vttgm4EcIFQ&list=RDvttgm4EcIFQ&start_radio=1"
    }
}
catch {
    Write-Host "ERRO DETECTADO:" -ForegroundColor Red
    $PSItem.Exception.Message  # Mostra o erro exato na tela
}

Write-Host "Pressione ENTER para fechar."
Read-Host # Trava a janela aberta para voce ler


