<?php
$CONFIG = array (
  'memcache.local' => '\\OC\\Memcache\\Redis',
  'memcache.distributed' => '\\OC\\Memcache\\Redis',
  'memcache.locking' => '\\OC\\Memcache\\Redis',
  'redis' => 
  array (
    'host' => 'cache',
    'port' => 6379,
    'password' => 'root',
  ),
  'filelocking.enabled' => true,
  'filesystem_check_changes' => true,
  'check_data_directory_permissions' => false,
  'preview_max_memory' => 512,
  'enable_previews' => true,
  'enabledPreviewProviders' =>
  array (
    0 => 'OC\\Preview\\Image',
    1 => 'OC\\Preview\\Movie',
    2 => 'OC\\Preview\\MarkDown',
    3 => 'OC\\Preview\\TXT',
  ),
  'default_phone_region' => 'CN',
  'trusted_domains' => 
  array (
    0 => 'localhost',
    1 => '127.0.0.1',
    2 => '192.168.1.200',
  ),
  'apps_paths' => 
  array (
    0 => 
    array (
      'path' => '/var/www/html/apps',
      'url' => '/apps',
      'writable' => false,
    ),
    1 => 
    array (
      'path' => '/var/www/html/custom_apps',
      'url' => '/custom_apps',
      'writable' => true,
    ),
  ),
  'instanceid' => '',
  'passwordsalt' => '',
  'secret' => '',
  'datadirectory' => '/var/www/html/data',
  'dbtype' => 'mysql',
  'version' => '24.0.6.1',
  'overwrite.cli.url' => 'https://127.0.0.1:7433',
  'dbname' => 'nextcloud',
  'dbhost' => 'db',
  'dbport' => '',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => 'nextcloud',
  'dbpassword' => 'nextcloud',
  'installed' => true,
  'mail_from_address' => 'pp_nas',
  'mail_smtpmode' => 'smtp',
  'mail_sendmailmode' => 'smtp',
  'mail_domain' => '163.com',
  'mail_smtpauthtype' => 'LOGIN',
  'mail_smtpauth' => 1,
  'mail_smtphost' => 'smtp.163.com',
  'mail_smtpport' => '465',
  'mail_smtpsecure' => 'ssl',
  'mail_smtpname' => 'pp_nas@163.com',
  'mail_smtppassword' => 'TQQJOHGDFNJCDSWP',
);
