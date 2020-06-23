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

chown -R oracle:oinstall /u01/app/oracle/oradata/MOSAproy/Scripts
chmod -R 755 /u01/app/oracle/oradata/MOSAproy/Scripts

cat <<'EOF' >> /etc/crontab
0   0   *   *   0   oracle   export ORACLE_SID=mosaproy; $ORACLE_HOME/bin/rman target / cmdfile=/u01/app/oracle/oradata/MOSAproy/Scripts/respaldo_nivel_0.rman
0   0   *   *   1   oracle   export ORACLE_SID=mosaproy; $ORACLE_HOME/bin/rman target / cmdfile=/u01/app/oracle/oradata/MOSAproy/Scripts/respaldo_nivel_1.rman  
0   0   *   *   2   oracle   export ORACLE_SID=mosaproy; $ORACLE_HOME/bin/rman target / cmdfile=/u01/app/oracle/oradata/MOSAproy/Scripts/respaldo_nivel_1.rman
0   0   *   *   3   oracle   export ORACLE_SID=mosaproy; $ORACLE_HOME/bin/rman target / cmdfile=/u01/app/oracle/oradata/MOSAproy/Scripts/respaldo_nivel_1.rman
0   0   *   *   4   oracle   export ORACLE_SID=mosaproy; $ORACLE_HOME/bin/rman target / cmdfile=/u01/app/oracle/oradata/MOSAproy/Scripts/respaldo_nivel_1.rman
0   0   *   *   5   oracle   export ORACLE_SID=mosaproy; $ORACLE_HOME/bin/rman target / cmdfile=/u01/app/oracle/oradata/MOSAproy/Scripts/respaldo_nivel_1.rman
0   0   *   *   6   oracle   export ORACLE_SID=mosaproy; $ORACLE_HOME/bin/rman target / cmdfile=/u01/app/oracle/oradata/MOSAproy/Scripts/respaldo_nivel_1.rman 
EOF
