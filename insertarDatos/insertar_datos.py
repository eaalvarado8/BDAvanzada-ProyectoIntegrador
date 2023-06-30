import csv
import mysql.connector

conexion = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="mydb"
)

cursor = conexion.cursor()

datos_csv = []

with open('datos.csv', 'r') as archivo_csv:
    lector_csv = csv.DictReader(archivo_csv)

    # Almacena los datos del archivo CSV en una lista
    datos_csv = list(lector_csv)

print("Ingresando datos de viviendas")
# Itera sobre los datos almacenados en la lista
for fila in datos_csv:
    try:
        # Inserta los datos en la tabla "Vivienda"
        cursor.execute('INSERT IGNORE INTO vivienda (idVivienda,conglomerado,area,numero,ciudad_idCiudad,periodo_idPeriodo,ViaAccesoPrincipalVivienda_idViaAccesoPrincipalVivienda,TipoVivienda_idTipoVivienda) VALUES (%s, %s, %s, %s,%s, %s, %s, %s)',
                    (fila['id_vivienda'], 
                        None if fila['conglomerado'] == '' else fila['conglomerado'],
                        'u' if fila['area'] == '1' else 'r',
                        None if fila['vivienda'] == '' else fila['vivienda'],
                        '999999' if fila['ciudad'] == '230200' else fila['ciudad'],
                        None if fila['periodo'] == '' else fila['periodo'],
                        None if fila['ViaAccesoPrincipalVivienda'] == '' else fila['ViaAccesoPrincipalVivienda'],
                        None if fila['TipoVivienda'] == '' else fila['TipoVivienda'],
                    ))
    except mysql.connector.IntegrityError as e:
            # Imprime el valor de "id_vivienda" que está causando el error
            print(f'Error de integridad referencial. Valor de id_vivienda: {fila["id_vivienda"]} ')
conexion.commit()
print("Ingresando datos de hogares")

# Itera nuevamente sobre los datos almacenados en la lista
for fila in datos_csv:
    try:
        # Inserta los datos en la tabla "Hogar"
        cursor.execute('INSERT INTO Hogar (idHogar,NumVehiculos,tieneEspacioCocina,NumMotos,IncluyePagoAguaArriendo,IncluyePagoLuzArriendo,ValorArriendoMensual,NumCuartos,NumDormitorios,NumCuartosNegocio,MiembrosSinServicioHigienico_idMiembrosSinServicioHigienico,InstalacionSanitariaPrincipal_idInstalacionSanitariaPrincipal,TipoAguaVivienda_idTipoAguaVivienda,EliminacionBasura_idEliminacionBasura,FormaTenenciaVivienda_idFormaTenenciaVivienda,TipoServicioHigienico_idTipoServicioHigienico,MaterialPiso_idMaterialPiso,MaterialParedes_idMaterialParedes,MaterialTechoCubierta_idMaterialTechoCubierta,EstadoPiso_idEstadoPiso,EstadoParedes_idEstadoParedes,EstadoTecho_idEstadoTecho,FuenteAgua_idFuenteAgua,TipoAlumbrado_idTipoAlumbrado,MaterialCocina_idMaterialCocina,ServicioDucha_idServicioDucha,vivienda_idVivienda) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)',
                    (fila['id_hogar'], 
                        None if fila['NumVehiculos'] == '' else fila['NumVehiculos'], 
                        True if fila['EspacioCocinar'] == '1' else False,
                        None if fila['NumMotos'] == '' else fila['NumMotos'] , 
                        True if fila['IncluyePagoAguaArriendo'] == '1' else False, 
                        True if fila['IncluyePagoLuzArriendo'] == '1' else False, 
                        None if fila['ValorArriendoMensual'] == '' else fila['ValorArriendoMensual'] ,
                        None if fila['NumCuartos'] == '' else fila['NumCuartos'] ,
                        None if fila['NumDormitorios'] == '' else fila['NumDormitorios'] ,
                        None if fila['NumCuartosNegocio'] == '' else fila['NumCuartosNegocio'] ,
                        None if fila['MiembrosSinServicioHigienico'] == '' else fila['MiembrosSinServicioHigienico'] ,
                        None if fila['InstalacionSanitariaPrincipal'] == '' else fila['InstalacionSanitariaPrincipal'] ,
                        None if fila['TipoAguaVivienda'] == '' else fila['TipoAguaVivienda'] ,
                        None if fila['EliminacionBasura'] == '' else fila['EliminacionBasura'] ,
                        None if fila['FormaTenenciaVivienda'] == '' else fila['FormaTenenciaVivienda'] ,
                        None if fila['TipoServicioHigienico'] == '' else fila['TipoServicioHigienico'] ,
                        None if fila['MaterialPiso'] == '' else fila['MaterialPiso'] ,
                        None if fila['MaterialParedes'] == '' else fila['MaterialParedes'] ,
                        None if fila['MaterialTechoCubierta'] == '' else fila['MaterialTechoCubierta'] ,
                        None if fila['EstadoPiso'] == '' else fila['EstadoPiso'] ,
                        None if fila['EstadoParedes'] == '' else fila['EstadoParedes'] ,
                        None if fila['EstadoTecho'] == '' else fila['EstadoTecho'] ,
                        None if fila['FuenteAgua'] == '' else fila['FuenteAgua'] ,
                        None if fila['TipoAlumbrado'] == '' else fila['TipoAlumbrado'] ,
                        None if fila['MaterialCocina'] == '' else fila['MaterialCocina'] ,
                        None if fila['ServicioDucha'] == '' else fila['ServicioDucha'],
                        fila['id_vivienda']
                        ))
        conexion.commit()
        hogar_idHogar = fila['id_hogar']
        
        # Verifica el tipo de combustible y realiza la inserción en la tabla "HogarCombustible"
        if fila['AbastecimientoFrecuenciaSuper'] == '1':
            combustible_idcombustible = 1
            gasto = fila['GastoCombustibleSuper']
            
            cursor.execute('INSERT INTO HogarCombustible (hogar_idHogar, combustible_idcombustible, gasto) VALUES (%s, %s, %s)', (hogar_idHogar, combustible_idcombustible, gasto))
            
        elif fila['AbastecimientoFrecuenciaExtra'] == '1':
            combustible_idcombustible = 2
            gasto = fila['GastoCombustibleExtra']
            
            cursor.execute('INSERT INTO HogarCombustible (hogar_idHogar, combustible_idcombustible, gasto) VALUES (%s, %s, %s)', (hogar_idHogar, combustible_idcombustible, gasto))
            
        elif fila['AbastecimientoFrecuenciaDiesel'] == '1':
            combustible_idcombustible = 3
            gasto = fila['GastoCombustibleDiesel']
            
            cursor.execute('INSERT INTO HogarCombustible (hogar_idHogar, combustible_idcombustible, gasto) VALUES (%s, %s, %s)', (hogar_idHogar, combustible_idcombustible, gasto))
            
        elif fila['AbastecimientoFrecuenciaEcopais'] == '1':
            combustible_idcombustible = 4
            gasto = fila['GastoCombustibleEcopais']
            
            cursor.execute('INSERT INTO HogarCombustible (hogar_idHogar, combustible_idcombustible, gasto) VALUES (%s, %s, %s)', (hogar_idHogar, combustible_idcombustible, gasto))
            
        elif fila['AbastecimientoFrecuenciaElectricidad'] == '1':
            combustible_idcombustible = 5
            gasto = fila['GastoCombustibleElectricidad']
            
            cursor.execute('INSERT INTO HogarCombustible (hogar_idHogar, combustible_idcombustible, gasto) VALUES (%s, %s, %s)', (hogar_idHogar, combustible_idcombustible, gasto))
            
        elif fila['AbastecimientoFrecuenciaGas'] == '1':
            combustible_idcombustible = 6
            gasto = fila['GastoCombustibleGas']
            
            cursor.execute('INSERT INTO HogarCombustible (hogar_idHogar, combustible_idcombustible, gasto) VALUES (%s, %s, %s)', (hogar_idHogar, combustible_idcombustible, gasto))
    except mysql.connector.IntegrityError as e:
            # Imprime el valor de "id_vivienda" que está causando el error
            print(f'Error de integridad referencial. Valor de id_vivienda: {fila["id_vivienda"]} - Valor de hogar {fila["id_hogar"]}')
            continue
conexion.commit()
conexion.close()
