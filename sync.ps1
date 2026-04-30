# sync.ps1 — simples sincronizador one-shot
# Executar no Windows: powershell -ExecutionPolicy Bypass -File .\sync.ps1
$repo = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $repo
# Puxa alterações remotas (rebase para evitar commits de merge automáticos)
git pull --rebase origin main
# Adiciona e commita alterações locais, se houver
git add -A
if (-not (git diff --cached --quiet)) {
  $msg = "auto-sync: $(Get-Date -Format o)"
  git commit -m $msg
  git push origin main
} else {
  Write-Output "Sem alterações a commitar"
}
