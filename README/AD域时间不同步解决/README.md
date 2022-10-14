1、运行timezone.bat，在AD服务器上开启时间同步；
2、导入timezone.reg，设置主域控制器与国家授时中心服务器时间同步，同步周期为1天；
3、配置组策略，设置时间同步：
	1、Win+R 运行窗口：gpedit.msc 打开组策略管理；
	2、计算机配置—管理模板—系统—Windows时间服务，双击“全局配置设置”，选择“已启用”，
	修改MaxNegPhaseCorrection的值为600（即为600秒，10分钟）修改MaxPosPhaseCorrection的值为600（即为600秒，10分钟）修改AnnounceFlags的值为5点“应用”，“确定”。
	3、计算机配置—管理模板—系统—Windows时间服务—时间提供程序，“启用Windows NTP客户端”，选择“已启用”，修改NtpSever的值为ntp.dtops.cc，修改Type的值为NTP，修改SpecialPollInterval的值为600（10分钟）
	4、CMD运行：
		gpupdate /force             # 更新组策略
		w32tm /query /source        # 查看时间服务器是否为更改过的ntp.dtops.cc
		w32tm /resync /rediscover   # 手工同步时间