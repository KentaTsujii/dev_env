oh-my-posh init pwsh --config "C:\Users\kenta.tsujii\Documents\PowerShell\fish.omp.json" | Invoke-Expression
# PowerShell Core7でもConsoleのデフォルトエンコーディングはsjisなので必要
[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
[System.Console]::InputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")

# git logなどのマルチバイト文字を表示させるため (絵文字含む)
$env:LESSCHARSET = "utf-8"

Set-PSReadLineOption -EditMode Emacs

