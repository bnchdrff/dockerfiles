# build detroitledger!
cd /srv/www
drush make --working-copy https://raw.github.com/detroitledger/gnl_profile/7.x-1.x/distro.make drupal
cd drupal
mysql -uroot -h $DB_PORT_3306_TCP_ADDR -e 'create database gnl_test'
drush site-install gnl_profile  --account-name=admin --account-pass=admin --db-url=mysql://root@$DB_PORT_3306_TCP_ADDR/gnl_test --yes
drush cc all
bash ./profiles/gnl_profile/modules/custom/migrate_gnl/download.sh # requires write access to /tmp
drush mreg
drush mi OrgNTEETypes
drush mi GrantTypes
drush mi Orgs
drush mi Grants

