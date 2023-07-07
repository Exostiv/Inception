cd /var/www/

wp core install --path=/var/www/ --url=${DOMAIN_NAME} --title=inceptionicoue --admin_user=${NICK_WPADM} --admin_password=${MDP_WPADM} --admin_email=${MAIL_ADM} --skip-email --allow-root

wp theme install twentytwentytwo --path=/var/www/ --activate --allow-root

wp user create ${NICK_WPUSR} ${MAIL_USR} --role=author --path=/var/www/ --user_pass=${MDP_WPUSR} --allow-root


exec /usr/sbin/php-fpm81 -F
