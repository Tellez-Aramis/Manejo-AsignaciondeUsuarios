/**
 * BBVA_DB - Sistema de Gestión de Base de Datos BBVA
 * 
 * Clase principal que sirve como punto de entrada de la aplicación.
 * Se encarga de la configuración inicial y lanzamiento del sistema de login.
 * 
 * @author BBVA Development Team
 * @version 1.0
 * @since 2024
 */

package bbva_db;

public class BBVA_DB {
    
    /**
     * Método principal - Punto de entrada de la aplicación
     * 
     * Flujo de ejecución:
     * 1. Configura el Look and Feel del sistema operativo
     * 2. Inicializa la interfaz gráfica en el Event Dispatch Thread
     * 3. Lanza la ventana de autenticación
     * 
     * @param args Argumentos de línea de comandos (no utilizados)
     */
    public static void main(String[] args) {
        
        // =========================================================================
        // CONFIGURACIÓN DE APARIENCIA DEL SISTEMA
        // =========================================================================
        try {
            // Establece el Look and Feel nativo del sistema operativo
            // Esto hace que la aplicación se vea integrada con Windows, Mac o Linux
            javax.swing.UIManager.setLookAndFeel(
                javax.swing.UIManager.getSystemLookAndFeelClassName());
            
        } catch (Exception e) {
            // Manejo de errores en la configuración de apariencia
            // Si falla, la aplicación continuará con el Look and Feel por defecto
            e.printStackTrace();
        }
        
        // =========================================================================
        // INICIALIZACIÓN DE LA INTERFAZ GRÁFICA
        // =========================================================================
        java.awt.EventQueue.invokeLater(new Runnable() {
            /**
             * Método run ejecutado en el Event Dispatch Thread (EDT)
             * Garantiza thread safety para operaciones Swing
             */
            public void run() {
                // Crea y muestra la ventana de login
                new Login().setVisible(true);
            }
        });
    }
}

// =========================================================================
// COMENTARIOS ADICIONALES DE ARQUITECTURA
// =========================================================================

/*
 * PATRÓN DE DISEÑO IMPLEMENTADO:
 * - Main como inicializador minimalista
 * - Delegación inmediata al módulo de autenticación
 * - Separación clara entre configuración y lógica de negocio
 * 
 * CONSIDERACIONES DE SEGURIDAD:
 * - El sistema inicia siempre con el módulo de login
 * - No hay acceso directo a la base de datos sin autenticación
 * - Configuración centralizada en clase principal
 * 
 * EXTENSIBILIDAD:
 * - Fácil modificación del Look and Feel
 * - Inicialización modularizada
 * - Manejo robusto de excepciones en startup
 */