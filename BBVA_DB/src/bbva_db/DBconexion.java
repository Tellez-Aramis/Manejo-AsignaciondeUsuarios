/**
 * DBconexion - Clase de Gestión de Conexiones a Base de Datos BBVA
 * 
 * Clase utilitaria para establecer conexiones con la base de datos MySQL.
 * Maneja la configuración, autenticación y manejo de errores de conexión.
 * 
 * @author BBVA Development Team
 * @version 1.0
 * @since 2024
 */

package bbva_db;

// =========================================================================
// IMPORTACIONES DE BIBLIOTECAS JDBC
// =========================================================================
import java.sql.Connection;      // Interfaz para conexiones de base de datos
import java.sql.SQLException;   // Excepciones específicas de SQL
import java.sql.DriverManager;  // Gestor de drivers y conexiones JDBC

public class DBconexion {
    // =========================================================================
    // CONSTANTE DE CONFIGURACIÓN - URL DE CONEXIÓN
    // =========================================================================
    static String url = "jdbc:mysql://192.168.0.16:3306/bd_datos";
    // Formato: jdbc:mysql://[host]:[puerto]/[nombre_base_datos]
    // - 172.20.10.3: Dirección IP del servidor de base de datos
    // - 3306: Puerto por defecto de MySQL
    // - bd_datos: Nombre de la base de datos
    
    // =========================================================================
    // MÉTODO ESTÁTICO - ESTABLECER CONEXIÓN CON LA BASE DE DATOS
    // =========================================================================
    public static Connection conectar(String usuario, String password) {
        Connection con = null;  // Inicializa la conexión como nula
        
        try {
            // =========================================================================
            // LOGGING DE INTENTO DE CONEXIÓN
            // =========================================================================
            System.out.println("=== INTENTANDO CONEXIÓN ===");
            System.out.println("URL: " + url);
            System.out.println("Usuario: " + usuario);
            
            // =========================================================================
            // CARGA DEL DRIVER JDBC DE MYSQL
            // =========================================================================
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Carga explícitamente la clase del driver MySQL
            // com.mysql.cj.jdbc.Driver: Driver oficial de MySQL Connector/J
            
            // =========================================================================
            // CONFIGURACIÓN DE PARÁMETROS ADICIONALES DE CONEXIÓN
            // =========================================================================
            String fullUrl = url + "?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
            // Parámetros URL:
            // - useSSL=false: Desactiva SSL (útil para entornos de desarrollo)
            // - serverTimezone=UTC: Establece zona horaria UTC para evitar problemas de fecha/hora
            // - allowPublicKeyRetrieval=true: Permite recuperación de clave pública para autenticación
            
            // =========================================================================
            // ESTABLECIMIENTO DE LA CONEXIÓN
            // =========================================================================
            con = DriverManager.getConnection(fullUrl, usuario, password);
            // DriverManager: Clase que gestiona los drivers JDBC
            // getConnection: Intenta establecer conexión con credenciales proporcionadas
            
            // =========================================================================
            // LOGGING DE CONEXIÓN EXITOSA
            // =========================================================================
            System.out.println("✓ CONEXIÓN EXITOSA para: " + usuario);
            
        } catch(ClassNotFoundException e) {
            // =========================================================================
            // MANEJO DE ERROR - DRIVER NO ENCONTRADO
            // =========================================================================
            System.out.println("✗ Driver no encontrado: " + e.getMessage());
            // Esto ocurre cuando:
            // - El JAR de MySQL Connector no está en el classpath
            // - El nombre de la clase del driver es incorrecto
            // - Hay problemas de versionado del driver
            
        } catch(SQLException e) {
            // =========================================================================
            // MANEJO DE ERRORES ESPECÍFICOS DE SQL
            // =========================================================================
            System.out.println("✗ Error SQL:");
            System.out.println("  Código: " + e.getErrorCode());      // Código de error específico del vendor
            System.out.println("  Estado: " + e.getSQLState());       // Código de estado SQL estándar
            System.out.println("  Mensaje: " + e.getMessage());       // Mensaje descriptivo del error
            
            // =========================================================================
            // ANÁLISIS ESPECÍFICO DE CÓDIGOS DE ERROR COMUNES
            // =========================================================================
            
            // Error 1045: Acceso denegado por credenciales incorrectas
            if (e.getErrorCode() == 1045) {
                System.out.println("  → ERROR: Acceso denegado - Usuario/contraseña incorrectos");
                // Posibles causas:
                // - Usuario no existe en la base de datos
                // - Contraseña incorrecta
                // - Usuario no tiene privilegios de conexión
                
            } 
            // Error 1044: Acceso denegado a la base de datos específica
            else if (e.getErrorCode() == 1044) {
                System.out.println("  → ERROR: Acceso denegado a la base de datos");
                // El usuario existe pero no tiene permisos para la base de datos 'bd_datos'
                
            } 
            // Error 0: Problemas de conectividad de red
            else if (e.getErrorCode() == 0) {
                System.out.println("  → ERROR: No se puede conectar al servidor");
                // Posibles causas:
                // - Servidor MySQL no está ejecutándose
                // - Dirección IP o puerto incorrectos
                // - Firewall bloqueando la conexión
                // - Problemas de red
            }
        }
        
        // =========================================================================
        // RETORNO DE LA CONEXIÓN (NULL SI FALLÓ)
        // =========================================================================
        return con;
        // Retorna:
        // - Objeto Connection válido si la conexión fue exitosa
        // - null si ocurrió cualquier error durante la conexión
    }
}

// =========================================================================
// COMENTARIOS ADICIONALES DE ARQUITECTURA
// =========================================================================

/*
 * PATRÓN DE DISEÑO: Singleton implícito (métodos estáticos)
 * - No requiere instanciación
 * - Proporciona un punto único de acceso para conexiones
 * 
 * SEGURIDAD:
 * - Validación de credenciales a nivel de base de datos
 * - Parámetros de conexión seguros (SSL configurable)
 * - Manejo seguro de información de autenticación
 * 
 * MANEJO DE ERRORES DETALLADO:
 * - Diferenciación entre tipos de errores
 * - Mensajes específicos según códigos de error MySQL
 * - Logging informativo para debugging
 * 
 * CONFIGURACIÓN FLEXIBLE:
 * - URL configurable estáticamente
 * - Parámetros de conexión adaptables
 * - Fácil modificación para diferentes entornos
 * 
 * CONSIDERACIONES DE PERFORMANCE:
 * - Driver cargado una vez por Class.forName()
 * - Conexiones creadas bajo demanda
 * - Reutilización de configuración estática
 * 
 * CÓDIGOS DE ERROR MYSQL MANEJADOS:
 * - 1045: ERROR_ACCESS_DENIED_ERROR (credenciales)
 * - 1044: ERROR_ACCESS_DENIED_ERROR (permisos BD)
 * - 0: Communications link failure (conectividad)
 */