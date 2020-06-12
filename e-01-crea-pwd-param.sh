
#@Integrantes: 
#       Morales Téllez Carlos Gamaliel
#       Sanchez Díaz María Beatriz
#@Fecha de creación: 11 de junio de 2020
#@Descripción: 
#       Creación del archivo de passwords con SYS y SYSBACKUP
#       y creación del archivo de parámetros

export ORACLE_SID=MOSAproy

orapwd FILE='/u01/app/oracle/product/18.0.0/dbhome_1/dbs/orapwmosaproy' SYS=password SYSBACKUP=password

cat <<'EOF' > "${ORACLE_HOME}"/dbs/initmosaproy.ora

db_name='MOSAproy'
memory_target=768M
control_files = (
/u01/app/oracle/oradata/"${ORACLE_SID}"/control01.ctl
/u02/app/oracle/oradata/"${ORACLE_SID}"/control02.ctl
/u03/app/oracle/oradata/"${ORACLE_SID}"/control03.ctl
)

