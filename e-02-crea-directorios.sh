#!/bin/bash
#@Integrantes: 
#       Morales Téllez Carlos Gamaliel
#       Sanchez Díaz María Beatriz
#@Fecha de creación: 11 de junio de 2020
#@Descripción: 
#       Creación de los directorios necesarios para la base de datos

mkdir -p /u01/app/oracle/oradata/MOSAproy/disk_1
mkdir -p /u01/app/oracle/oradata/MOSAproy/disk_2
mkdir -p /u01/app/oracle/oradata/MOSAproy/disk_3

chown -R oracle:oinstall /u01/app/oracle/oradata/MOSAproy/disk_1/*

chmod 755 /u01/app/oracle/oradata/MOSAproy