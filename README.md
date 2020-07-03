


# Mysql / Mariadb Auto Backup 

This container allows automatic backup of a mysql container at the time you want.

Data is stored in /backup

## Environment variables:

* DBHOST (defaults: db)
* DBPORT (defaults: 3306)
* DBLOGIN (defaults: root)
* DBPASS
* CRONH (defaults: 02)
* CRONM (defaults: 00)


## Exemple with docker-compose:

A backup of mysql for 02:30

```
  db:
    image: mysql:5.7
    environment:
       MYSQL_ROOT_PASSWORD: xxxxxxxxx
       MYSQL_DATABASE: exemple
    volumes:
       - /data/db
    deploy:
      replicas: 1
      restart_policy:
        condition: any

  backup:
    image: kiwibackup/mysqlbackup
    environment:
      - DBHOST=db
      - DBPASS=xxxxxxxxx
      - CRONH=02
      - CRONM=30
    volumes:
      - data/backup:/backup
    deploy:
      replicas: 1
      restart_policy:
        condition: any

```


# Mysql / Mariadb Backup Automatique

Ce container permet de sauvegarde automatiquement un containers mysql à l'heure que vous voulez

Les données sont stockées dans /backup 

## Variables d'environnements:

* DBHOST (défaut: db)
* DBPORT (défaut: 3306)
* DBLOGIN (défaut: root)
* DBPASS
* CRONH (défaut: 2)
* CRONM (défaut: 0)


## Exemple avec docker-compose:

Un backup du mysql pour 02:30

```
  db:
    image: mysql:5.7
    environment:
       MYSQL_ROOT_PASSWORD: xxxxxxxxx
       MYSQL_DATABASE: exemple
    volumes:
       - /data/db
    deploy:
      replicas: 1
      restart_policy:
        condition: any

  backup:
    image: kiwibackup/mysqlbackup
    environment:
      - DBHOST=db
      - DBPASS=xxxxxxxxx
      - CRONH=02
      - CRONM=30
    volumes:
      - /data/backup:/backup
    deploy:
      replicas: 1
      restart_policy:
        condition: any

```
