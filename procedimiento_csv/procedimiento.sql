USE mydb;
DELIMITER //
CREATE PROCEDURE exportar_csv(
    IN nombre_tabla VARCHAR(100),
    IN ruta VARCHAR(255)
)
BEGIN
    DECLARE nombre_archivo VARCHAR(255);

    -- Concatenar la ruta y el nombre de la tabla para formar el nombre de archivo
    SET nombre_archivo := CONCAT(ruta, '/', nombre_tabla, '.csv');

    SET @query := CONCAT(
        'SELECT * INTO OUTFILE \'', nombre_archivo, '\' ',
        'FIELDS TERMINATED BY \',\' ',
        'ENCLOSED BY \'"\' ',
        'LINES TERMINATED BY \'\n\' ',
        'FROM ', nombre_tabla
    );

    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;

SHOW VARIABLES LIKE 'secure_file_priv';
