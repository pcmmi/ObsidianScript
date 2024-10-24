# カレントディレクトリを取得
$location = Get-Location
do {
    # 画面のクリア
    Clear-Host
    # 現在日時の取得(formt: yyyy-MM-dd HH:mm:ss)
    $datetime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    # タイトルと選択肢の表示
    Write-Host "---Obsidian Backup Script---" -BackgroundColor White -ForegroundColor Black
    Write-Host "Location: $location`n" -ForegroundColor Yellow
    Write-Host "[p] Post Changes to Remote" -ForegroundColor Green
    Write-Host "[g] Get Updates from Remote" -ForegroundColor Cyan
    Write-Host "[e] Exit" -ForegroundColor Red
    $selected = Read-Host "`nSelect an option"
    
    # 選択肢による処理
    if ($selected -eq "p") {
        Write-Host "Post Changes to Remote" -ForegroundColor Green
        git add .
        git commit -m "backup: $datetime"
        git push
        break
    } elseif ($selected -eq "g") {
        Write-Host "Get Updates from Remote" -ForegroundColor Cyan
        git pull
        break
    } elseif ($selected -eq "e") {
        Write-Host "Exit" -ForegroundColor Red
        Start-Sleep -Seconds 1
        exit
    } else {
        continue
    }
} while($true)

# 終了処理
Read-Host -Prompt "`nPress Enter to exit"
