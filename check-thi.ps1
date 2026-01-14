# Configurações de links
$urlStatus = "https://raw.githubusercontent.com/Thiii123/Penthi/main/status.txt"
$videoUrl = "https://www.youtube.com/watch?v=vttgm4EcIFQ"

# Loop infinito para manter o script "vivo"
while ($true) {
    try {
        # Lê o conteúdo do arquivo status.txt
        $status = (Invoke-RestMethod -Uri $urlStatus -UseBasicParsing).Trim()

        # Se o status for 1, abre o YouTube
        if ($status -eq "1") {
            Start-Process $videoUrl
            # Espera o status mudar no GitHub para não abrir mil abas
            while ((Invoke-RestMethod -Uri $urlStatus -UseBasicParsing).Trim() -eq "1") { 
                Start-Sleep -Seconds 30 
            }
        }
        # Se o status for "apagar", deleta o arquivo e encerra
        elseif ($status -eq "apagar") {
            Remove-Item $PSCommandPath -Force
            exit
        }
    }
    catch {
        # Se der erro de internet, apenas ignora e tenta no próximo ciclo
    }

    # Dorme por 60 segundos antes de checar o GitHub novamente
    Start-Sleep -Seconds 60
}
