DIRS=(bitnami)
DOMAIN=dimondnews.org

for dir in ${DIRS[@]}
do
        echo ${dir}
        sudo /opt/${dir}/ctlscript.sh stop apache
        sudo mv /opt/${dir}/apache2/conf/server.crt /opt/${dir}/apache2/conf/server.crt.old
        sudo mv /opt/${dir}/apache2/conf/server.key /opt/${dir}/apache2/conf/server.key.old
        sudo ln -s /etc/letsencrypt/live/${DOMAIN}/privkey.pem /opt/${dir}/apache2/conf/server.key
        sudo ln -s /etc/letsencrypt/live/${DOMAIN}/fullchain.pem /opt/${dir}/apache2/conf/server.crt
        sudo /opt/${dir}/ctlscript.sh start apache
done
