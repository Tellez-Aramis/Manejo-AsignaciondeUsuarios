/**
 * validarUsuario - Módulo de Autenticación de Usuarios BBVA
 * 
 * Clase encargada de validar credenciales de usuarios contra la base de datos BBVA.
 * Implementa el proceso de autenticación y verificación de permisos.
 * 
 * @author BBVA Development Team
 * @version 1.0
 * @since 2024
 */

package bbva_db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class validarUsuario {
    
    /**
     * Valida las credenciales de un usuario y verifica sus permisos en la base de datos
     * 
     * Flujo de validación:
     * 1. Intenta conexión a la BD con las credenciales proporcionadas
     * 2. Verifica que la conexión sea exitosa y esté activa
     * 3. Valida permisos de acceso a tablas específicas
     * 4. Cierra la conexión de validación de forma segura
     * 
     * @param usuario Nombre de usuario para autenticación
     * @param password Contraseña del usuario
     * @return true si las credenciales son válidas y el usuario tiene permisos, false en caso contrario
     */
    public static boolean ValidarUsuario(String usuario, String password) {
        Connection con = null;
        try {
            // =========================================================================
            // ETAPA 1: CONEXIÓN Y AUTENTICACIÓN INICIAL
            // =========================================================================
            
            // Intenta establecer conexión con las credenciales proporcionadas
            con = DBconexion.conectar(usuario, password);
            
            // Verifica que la conexión sea exitosa y esté activa
            if (con != null && !con.isClosed()) {
                System.out.println("✓ Usuario " + usuario + " autenticado correctamente 1");
                
                // =========================================================================
                // ETAPA 2: VERIFICACIÓN DE PERMISOS ESPECÍFICOS
                // =========================================================================
                
                try {
                    // Query de prueba para verificar acceso a la tabla 'productos'
                    String testQuery = "SELECT 1 FROM productos LIMIT 1";
                    PreparedStatement stmt = con.prepareStatement(testQuery);
                    ResultSet rs = stmt.executeQuery();
                    
                    // Cierre seguro de recursos
                    rs.close();
                    stmt.close();
                    System.out.println("✓ Usuario tiene acceso a la tabla productos");
                    
                } catch (SQLException e) {
                    // El usuario se autenticó pero no tiene permisos para acceder a la tabla
                    System.out.println("✗ Usuario no tiene acceso a la tabla productos");
                    return false;
                }
                
                // =========================================================================
                // ETAPA 3: VALIDACIÓN EXITOSA
                // =========================================================================
                return true;
            }
            
            // Conexión fallida o cerrada
            return false;
            
        } catch (Exception e) {
            // =========================================================================
            // MANEJO DE ERRORES DE AUTENTICACIÓN
            // =========================================================================
            System.out.println("Error en validación: " + e.getMessage());
            return false;
            
        } finally {
            // =========================================================================
            // LIMPIEZA DE RECURSOS - GARANTÍA DE CERRADO SEGURO
            // =========================================================================
            
            // Siempre cierra la conexión de validación independientemente del resultado
            if (con != null) {
                try { 
                    con.close();
                    System.out.println("Conexión de validación cerrada");
                } catch (SQLException e) { 
                    // Log del error de cierre sin afectar el resultado de validación
                    e.printStackTrace(); 
                }
            }
        }
    }
}

