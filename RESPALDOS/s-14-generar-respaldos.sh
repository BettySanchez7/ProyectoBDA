#!/bin/bash
#@Integrantes: 
#       Morales Téllez Carlos Gamaliel
#       Sanchez Díaz María Beatriz
#@Fecha de creación: 23 de junio de 2020
#@Descripción: 
#       GENERA EL ESQUEMA DE RESPALDOS PLANEADO


mkdir -p /u01/app/oracle/oradata/MOSAproy/Scripts

cat <<'EOF' > /u01/app/oracle/oradata/MOSAproy/Scripts/respaldo_nivel_0.rman
run {
    backup as backupset incremental level 0 database plus archivelog tag backup_nivel_0;
    delete obsolete;
}
EOF

cat <<'EOF' > /u01/app/oracle/oradata/MOSAproy/Scripts/respaldo_nivel_1.rman
run {
    backup as backupset incremental level 1 database plus archivelog tag backup_nivel_1;
    delete obsolete;
}
EOF

cat <<'EOF' > /u01/app/oracle/oradata/MOSAproy/Scripts/run_0.sh
#!/bin/bash
ORACLE_SID=mosaproy; export ORACLE_SID
ORACLE_TERM=xterm; export ORACLE_TERM
ORACLE_HOME=/u01/app/oracle/product/18.0.0/dbhome_1; export ORACLE_HOME
PATH=/usr/sbin:$PATH; export PATH
PATH=$ORACLE_HOME/bin:$PATH; export PATH
LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib; export LD_LIBRARY_PATH
CLASSPATH=$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib; export CLASSPATH

rman target / @'/u01/app/oracle/oradata/MOSAproy/Scripts/respaldo_nivel_0.rman'
EOF

cat <<'EOF' > /u01/app/oracle/oradata/MOSAproy/Scripts/run_1.sh
#!/bin/bash
ORACLE_SID=mosaproy; export ORACLE_SID
ORACLE_TERM=xterm; export ORACLE_TERM
ORACLE_HOME=/u01/app/oracle/product/18.0.0/dbhome_1; export ORACLE_HOME
PATH=/usr/sbin:$PATH; export PATH
PATH=$ORACLE_HOME/bin:$PATH; export PATH
LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib; export LD_LIBRARY_PATH
CLASSPATH=$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib; export CLASSPATH

rman target / @'/u01/app/oracle/oradata/MOSAproy/Scripts/respaldo_nivel_1.rman'
EOF


chown -R oracle:oinstall /u01/app/oracle/oradata/MOSAproy/Scripts
chmod -R 755 /u01/app/oracle/oradata/MOSAproy/Scripts

cat <<'EOF' > /var/spool/cron/oracle
0 0 * * 0 /u01/app/oracle/oradata/MOSAproy/Scripts/run_0.sh
0 0 * * 1,2,3,4,5,6 /u01/app/oracle/oradata/MOSAproy/Scripts/run_1.sh 
EOF

chmod 600 /var/spool/cron/oracle