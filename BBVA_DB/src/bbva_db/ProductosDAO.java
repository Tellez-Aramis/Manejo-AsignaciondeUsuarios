/**
 * ProductosDAO - Data Access Object para Gestión de Productos BBVA
 * 
 * Clase responsable de todas las operaciones de base de datos relacionadas con productos.
 * Implementa el patrón DAO para separar la lógica de acceso a datos.
 * 
 * @author BBVA Development Team
 * @version 1.0
 * @since 2024
 */

package bbva_db;

// =========================================================================
// IMPORTACIONES DE BIBLIOTECAS
// =========================================================================
import java.sql.*;       // API JDBC para conexión y operaciones con base de datos
import java.util.*;      // Utilidades Java (List, ArrayList)

public class ProductosDAO {
    // =========================================================================
    // DECLARACIÓN DE VARIABLES DE INSTANCIA
    // =========================================================================
    private Connection conexion;  // Conexión activa a la base de datos
    private String usuario;       // Usuario actual para auditoría y logging
    
    // =========================================================================
    // CONSTRUCTOR - INICIALIZACIÓN CON CREDENCIALES
    // =========================================================================
    public ProductosDAO(String usuario, String password) {
        // Almacena el usuario para propósitos de logging y auditoría
        this.usuario = usuario;
        
        // Log de inicio de creación del DAO
        System.out.println("=== CREANDO PRODUCTOSDAO ===");
        System.out.println("Usuario: " + usuario);
        
        // Establece conexión a la base de datos usando las credenciales proporcionadas
        this.conexion = DBconexion.conectar(usuario, password);
        
        // Verifica si la conexión fue exitosa
        if (conexion != null) {
            try {
                // Log exitoso con información de la base de datos conectada
                System.out.println("✓ Conexión establecida. Base de datos: " + conexion.getCatalog());
            } catch (SQLException e) {
                // Error al obtener información del catálogo (nombre de BD)
                e.printStackTrace();  // Imprime stack trace para debugging
            }
        } else {
            // Log de error crítico - conexión fallida
            System.out.println("✗ ERROR: No se pudo establecer la conexión");
        }
    }
    
    // =========================================================================
    // MÉTODO PRINCIPAL - OBTENER TODOS LOS PRODUCTOS
    // =========================================================================
    public List<Object[]> obtenerTodosLosProductos() {
        // Crea una lista vacía para almacenar los productos
        List<Object[]> productos = new ArrayList<>();
        
        // Validación de seguridad: verifica que exista conexión activa
        if (conexion == null) {
            System.out.println("ERROR: No hay conexión a la base de datos");
            return productos;  // Retorna lista vacía si no hay conexión
        }
        
        // Consulta SQL para obtener todos los registros de la tabla productos
        String sql = "SELECT * FROM productos";
        System.out.println("Ejecutando consulta: " + sql);
        
        // =========================================================================
        // BLOQUE TRY-WITH-RESOURCES (cierre automático de recursos)
        // =========================================================================
        try (PreparedStatement stmt = conexion.prepareStatement(sql);  // Prepara la consulta
             ResultSet rs = stmt.executeQuery()) {                     // Ejecuta y obtiene resultados
            
            // =========================================================================
            // METADATA - INFORMACIÓN SOBRE LA ESTRUCTURA DE LA TABLA
            // =========================================================================
            
            // Obtiene metadata del ResultSet para conocer estructura de columnas
            ResultSetMetaData metaData = rs.getMetaData();
            
            // Obtiene el número total de columnas en el resultado
            int columnCount = metaData.getColumnCount();
            System.out.println("Número de columnas en la tabla: " + columnCount);
            
            // Log de nombres de columnas para debugging y verificación
            System.out.println("Columnas encontradas:");
            for (int i = 1; i <= columnCount; i++) {
                // Itera desde 1 (JDBC usa índices base 1 para columnas)
                System.out.println("  " + i + ": " + metaData.getColumnName(i));
            }
            
            // =========================================================================
            // PROCESAMIENTO DE FILAS - ITERACIÓN SOBRE EL RESULTSET
            // =========================================================================
            int rowCount = 0;  // Contador de filas procesadas
            
            // Itera sobre cada fila del ResultSet
            while (rs.next()) {
                rowCount++;  // Incrementa contador de filas
                
                // Crea un array de Objects para almacenar los datos de la fila actual
                Object[] fila = new Object[columnCount];
                
                // Itera sobre cada columna de la fila actual
                for (int i = 1; i <= columnCount; i++) {
                    // Obtiene el valor de la columna i (índice base 1)
                    fila[i-1] = rs.getObject(i);  // Almacena en array (índice base 0)
                    
                    // Log detallado de cada valor de columna (para debugging)
                    System.out.println("  Columna " + i + ": " + rs.getObject(i));
                }
                
                // Agrega la fila completa a la lista de productos
                productos.add(fila);
                
                // Separador visual en logs entre filas
                System.out.println("--- Fila " + rowCount + " completada ---");
            }
            
            // Log resumen del total de registros procesados
            System.out.println("Total de registros encontrados: " + rowCount);
            
        } catch (SQLException e) {
            // =========================================================================
            // MANEJO DETALLADO DE ERRORES SQL
            // =========================================================================
            System.out.println("ERROR SQL: " + e.getMessage());        // Mensaje de error
            System.out.println("Código error: " + e.getErrorCode());   // Código específico del vendor
            System.out.println("Estado SQL: " + e.getSQLState());      // Estado SQL estándar
            e.printStackTrace();  // Stack trace completo para debugging
        }
        
        // Retorna la lista de productos (vacía si hubo error)
        return productos;
    }
    
    // =========================================================================
    // MÉTODO PARA CERRAR LA CONEXIÓN - GESTIÓN DE RECURSOS
    // =========================================================================
    public void cerrarConexion() {
        // Verifica que exista una conexión activa antes de intentar cerrarla
        if (conexion != null) {
            try {
                conexion.close();  // Cierra la conexión con la base de datos
                System.out.println("Conexión cerrada");  // Log de confirmación
            } catch (SQLException e) {
                // Manejo de errores durante el cierre de conexión
                e.printStackTrace();  // Log del error
            }
        }
    }
}
