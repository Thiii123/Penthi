try {
    # LINK CORRETO: Apontando para o status.txt e não para o .ps1
    $urlControle = "https://raw.githubusercontent.com/Thiii123/Penthi/main/status.txt"
    $videoYoutube = "https://www.youtube.com/watch?v=vttgm4EcIFQ"

    # Faz a leitura do status
    $statusRaw = Invoke-RestMethod -Uri $urlControle -UseBasicParsing
    $status = $statusRaw.Trim()

    if ($status -eq "1") {
        Start-Process $videoYoutube
        # Para o script para não abrir mil abas (ou use um loop se quiser que continue rodando)
        exit 
    }
    elseif ($status -eq "apagar") {
        # Autodestruição
        Remove-Item $PSCommandPath -Force
        exit
    }
}
catch {
    # Erro silencioso para não alertar o usuário
    exit
}
