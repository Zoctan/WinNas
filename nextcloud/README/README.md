## 用docker-compose构建并开启

```
docker-compose build
docker-compose up -d
```

## 删除默认文件

```
rm -rf /var/www/html/core/skeleton/*
```

## 修改config.php（参考nextcloud_config_sample.php）

```php
// 您的数据目录可被其他用户读取, 请更改权限为 0770 以避免其他用户查看目录
'check_data_directory_permissions' => false,
// 设置默认的电话区域
'default_phone_region' => 'CN',
// 开启预览
'enable_previews' => true,
'preview_max_memory' => 512,
'enabledPreviewProviders' =>
array (
  0 => 'OC\\Preview\\Image',
  1 => 'OC\\Preview\\Movie',
  2 => 'OC\\Preview\\MarkDown',
  3 => 'OC\\Preview\\TXT',
),
// 启用缓存
'memcache.local' => '\\OC\\Memcache\\Redis',
'memcache.locking' => '\\OC\\Memcache\\Redis',
'memcache.distributed' => '\\OC\\Memcache\\Redis',
'filelocking.enabled' => true,
'redis' => [
  'host' => 'cache',
  'port' => 6379,
  'password' => 'root',
],
// 通过不被信任的域名访问
'trusted_domains' =>
  array (
   0 => 'localhost',
   1 => '127.0.0.1',
   2 => '192.168.1.200',
),
```

## 更新源并安装需要的软件

```
# 更新源
sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
apt-get update
# 容器默认没有
apt-get -y install sudo vim 
# php-imagick模块支持SVG
apt-get -y install libmagickcore-6.q16-6-extra
# 视频/图片显示缩略图
apt-get -y install software-properties-common ffmpeg exiftool imagemagick imagemagick-common
# 容器默认没有cron，并且重启容器后也要手动启动cron
apt-get -y install cron
# 清理缓存
apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*
```

## 配置定时任务Cron

Nextcloud的后台任务执行方式分为三种：AJAX、Webcron、Cron，将该方式设置为Cron。

```
service cron start
service cron status
service cron restart
```

添加每5分钟执行的任务：

```
crontab -e

*/5  *  *  *  * sudo -u www-data php -d memory_limit=-1 -f /var/www/html/cron.php 2>&1 /dev/null
```

## php memory_limit问题（参考nextcloud_sample.ini）

修改/usr/local/etc/php/conf.d/nextcloud.ini

## 提前生成缩略图

如果无法在线安装插件，请手动下载，解压到apps目录，然后到admin设置页面启用：https://apps.nextcloud.com/apps/previewgenerator

```
sudo -u www-data php -d memory_limit=-1 occ preview:generate-all
```

每晚2点半执行：

```
crontab -e

30  2  *  *  * sudo -u www-data php -d memory_limit=-1 occ preview:pre-generate
```

更多cron配置请参照 Nextcloud 文档：https://docs.nextcloud.com/server/23/admin_manual/configuration_server/background_jobs_configuration.html

## 更新文件缓存

```
sudo -u www-data php -d memory_limit=-1 occ files:scan --all
```

## 局域网上传速度优化

```
sudo -u www-data php -d memory_limit=-1 occ config:app:set files max_chunk_size --value 0
```
