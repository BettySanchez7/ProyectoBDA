--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 18 de junio de 2020
--@Descripción: 
--         Se habilita el modo compartido de la base de datos


alter system set dispatchers='(dispatchers=3)(protocol=tcp)';
alter system set shared_servers=20;