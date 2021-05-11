<?php

$cfg['blowfish_secret'] = '12345';

$i = 1;

$cfg['Servers'][$i]['auth_type'] = 'cookie';

$cfg['Servers'][$i]['port'] = '3306';
$cfg['Servers'][$i]['host'] = 'mysql-svc';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;

 $cfg['Servers'][$i]['user'] = 'admin';
 $cfg['Servers'][$i]['password'] = 'admin';

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
