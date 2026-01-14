# URL do arquivo de controle (ex: status.txt contendo "0" ou "1")
$urlControle = "https://raw.githubusercontent.com/Thiii123/Penthi/main/status.txt"
# URL do vídeo que você deseja abrir
$videoYoutube = "https://www.youtube.com/watch?v=u1nOENqdpwU"

while ($true) {
    try {
        # Consulta o status no GitHub
        $status = Invoke-RestMethod -Uri $urlControle -UseBasicParsing
        
        # Se o valor for "1", ele executa a ação
        if ($status.Trim() -eq "1") {
            # Abre o navegador padrão no link do vídeo
            Start-Process $videoYoutube
            
            # Opcional: Aguarda o valor mudar para "0" antes de permitir nova execução
            # Isso evita que ele abra 100 abas se você esquecer o status em "1"
            while ((Invoke-RestMethod -Uri $urlControle -UseBasicParsing).Trim() -eq "1") {
                Start-Sleep -Seconds 60
            }
        }
    }
    catch {
        # Erro de conexão (ex: PC sem internet), tenta novamente no próximo ciclo
    }

    # Verifica a cada 60 segundos (ajuste conforme necessário)
    Start-Sleep -Seconds 60
}