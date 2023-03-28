Xcopy "C:\Program Files\Atlassian\Application Data\Confluence\backups" D:\backups /s /e /y
d:
cd D:\winscp\WinSCP
WinSCP.exe /console /script=D:\confluence_backup_upload.txt