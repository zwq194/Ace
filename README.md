# Ace
AceFx 项目使用 ASP.NET CORE 开发(src/DotNetCore目录)，需要使用 vs2017 打开。

数据库默认使用 SQLite，启动运行前请在配置文件中（configs/appsettings.json）配置好 SQLite 的db文件（db文件位于项目db文件夹中）。

亦支持 SqlServer 和 MySql，在项目db文件夹中找到相应的数据库脚本，创建相关的表后修改配置文件（configs/appsettings.json）内数据库连接配置即可。

后台默认登录帐号 admin，密码 52chloe

本项目仅供学习参考，不建议用于实际生产！！