
#@Integrantes: 
#       Morales Téllez Carlos Gamaliel
#       Sanchez Díaz María Beatriz
#@Fecha de creación: 11 de junio de 2020
#@Descripción: 
#       Creación del archivo de passwords con SYS y SYSBACKUP
#       y creación del archivo de parámetros

#usar la contraseña hola123# para no tener errores en la creación del archivo de passwords
orapwd FILE='/u01/app/oracle/product/18.0.0/dbhome_1/dbs/orapwmosaproy' SYS=password SYSBACKUP=password

cat <<'EOF' > "${ORACLE_HOME}"/dbs/initmosaproy.ora

db_name='MOSAproy'
memory_target=768M
control_files = (
/u01/app/oracle/oradata/MOSAproy/disk_1/control01.ctl
/u01/app/oracle/oradata/MOSAproy/disk_2/control02.ctl
/u01/app/oracle/oradata/MOSAproy/disk_3/control03.ctl
)
EOF