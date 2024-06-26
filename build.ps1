Write-Host "Script build.ps1 está rodando..."

# Verificar se o contêiner está em execução antes de parar e remover
if (docker ps -a -q -f name=rails_incendiar) {
    Write-Host "Parando o contêiner..."
    docker stop rails_incendiar
    Write-Host "Removendo o contêiner..."
    docker rm -f rails_incendiar
} else {
    # Write-Host "O contêiner não está em execução ou não existe."
    Write-Host ".."
}

# Verificar se a imagem existe antes de tentar removê-la
if (docker images -q rails_incendiar) {
    Write-Host "Removendo a imagem..."
    docker rmi rails_incendiar
} else {
    # Write-Host "A imagem não existe."
    Write-Host "..."
}

Write-Host "Construindo..."
if (docker build -t rails_incendiar .) {
    Write-Host "Executando..."
    docker run -p 3000:3000 --name rails_incendiar rails_incendiar
}

Write-Host "Script build.ps1 finalizado."
