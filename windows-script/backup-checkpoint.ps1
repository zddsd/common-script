# 备份路径（备份路径不要和虚拟机位置在一个盘）
$exportPath = "D:\hyper-backup\"
# 需要备份的虚拟机列表
$vmNames = "guojizhan-centos7"
#pause
$vmNames | ForEach-Object -Process {
    Write-Host "准备备份 $_"
    #pause
    # 设置备份路径
    $path = [System.IO.Path]::Combine($exportPath, $_, [System.DateTime]::Now.ToString("yyyy-MM-dd"))
    [System.IO.Directory]::CreateDirectory($path)

    if ([System.IO.Directory]::GetDirectories($path).Length -eq 0) {
        Write-Host "备份路径 $path"

        Write-Host "正在创建检查点 $_"
        # 创建检查点
        Checkpoint-VM -Name $_
        $checkPoint = Get-VMSnapshot -VMName $_ | Select-Object -Last 1

        Write-Host "正在导出检查点 $_"
        # 导出检查点到备份路径
        Export-VMSnapshot -VMName $_ -Name $checkPoint.Name -Path $path

        Write-Host "备份已完成 $_"
    }else {
        Write-Host "备份已存在 $_"
    }
	
}