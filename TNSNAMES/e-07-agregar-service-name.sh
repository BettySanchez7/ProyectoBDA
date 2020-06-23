#!/bin/bash
#@Integrantes: 
#       Morales Téllez Carlos Gamaliel
#       Sanchez Díaz María Beatriz
#@Fecha de creación: 18 de junio de 2020
#@Descripción: 
#       AGREGA NUEVO SERVICE NAME A tnsnames.ora



cat <<'EOF' >> ${ORACLE_HOME}/network/admin/tnsnames.ora
MOSAproy =
  (DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = pc-cgmt.fi.unam)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = mosaproy.fi.unam)
    )
  )
MOSAproy_SHARED =
  (DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = pc-cgmt.fi.unam)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SERVICE_NAME = mosaproy.fi.unam)
    )
  )
EOF

