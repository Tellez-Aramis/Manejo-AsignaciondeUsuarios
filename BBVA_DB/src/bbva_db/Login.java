/**
 * Login - Ventana de Autenticación BBVA
 * 
 * Interfaz gráfica para el sistema de login del BBVA.
 * Gestiona la autenticación de usuarios y redirección a la aplicación principal.
 * 
 * @author BBVA Development Team
 * @version 1.0
 * @since 2024
 */

package bbva_db;

// =========================================================================
// IMPORTACIONES DE BIBLIOTECAS
// =========================================================================
import javax.swing.*;           // Componentes de interfaz gráfica Swing
import java.awt.*;              // Gestión de layout y contenedores
import java.awt.event.*;        // Manejo de eventos (clic, teclado, etc.)

public class Login extends JFrame {  // Hereda de JFrame para crear ventana
    // =========================================================================
    // DECLARACIÓN DE COMPONENTES DE LA INTERFAZ
    // =========================================================================
    private JTextField txtUsuario;      // Campo de texto para nombre de usuario
    private JPasswordField txtPassword; // Campo especial para contraseña (oculta caracteres)
    private JButton btnLogin;           // Botón para iniciar sesión
    private JButton btnCancelar;        // Botón para cancelar/cerrar aplicación
    private validarUsuario validador;   // Instancia del validador de credenciales

    // =========================================================================
    // CONSTRUCTOR - INICIALIZACIÓN DE LA VENTANA
    // =========================================================================
    public Login() {
        validador = new validarUsuario();  // Crea instancia del validador
        initComponents();                  // Llama al método de inicialización de componentes
    }

    // =========================================================================
    // MÉTODO DE INICIALIZACIÓN DE COMPONENTES GRÁFICOS
    // =========================================================================
    private void initComponents() {
        // Configuración básica de la ventana
        setTitle("BBVA - Sistema de Login");      // Título de la ventana
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // Cierra aplicación al salir
        setResizable(false);                       // Evita redimensionado de ventana
        setLocationRelativeTo(null);               // Centra ventana en pantalla

        // =========================================================================
        // PANEL PRINCIPAL CON CONFIGURACIÓN DE LAYOUT
        // =========================================================================
        JPanel panel = new JPanel(new GridBagLayout()); // Layout de cuadrícula flexible
        panel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20)); // Márgenes internos
        
        // Configuración de restricciones para posicionamiento de componentes
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(5, 5, 5, 5);      // Espaciado entre componentes
        gbc.fill = GridBagConstraints.HORIZONTAL;  // Componentes se expanden horizontalmente

        // =========================================================================
        // TÍTULO DE LA APLICACIÓN
        // =========================================================================
        gbc.gridx = 0;          // Columna 0
        gbc.gridy = 0;          // Fila 0
        gbc.gridwidth = 2;      // Ocupa 2 columnas
        JLabel titulo = new JLabel("BBVA - Acceso al Sistema", JLabel.CENTER);
        titulo.setFont(new Font("Arial", Font.BOLD, 16)); // Fuente negrita, tamaño 16
        panel.add(titulo, gbc); // Agrega título al panel

        // =========================================================================
        // CAMPO DE USUARIO
        // =========================================================================
        gbc.gridwidth = 1;      // Vuelve a ocupar 1 columna
        gbc.gridx = 0;          // Columna 0
        gbc.gridy = 1;          // Fila 1
        panel.add(new JLabel("Usuario:"), gbc); // Etiqueta "Usuario"

        gbc.gridx = 1;          // Columna 1
        gbc.gridy = 1;          // Fila 1
        txtUsuario = new JTextField(15); // Campo de texto de 15 caracteres de ancho
        panel.add(txtUsuario, gbc);      // Agrega campo al panel

        // =========================================================================
        // CAMPO DE CONTRASEÑA
        // =========================================================================
        gbc.gridx = 0;          // Columna 0
        gbc.gridy = 2;          // Fila 2
        panel.add(new JLabel("Contraseña:"), gbc); // Etiqueta "Contraseña"

        gbc.gridx = 1;          // Columna 1
        gbc.gridy = 2;          // Fila 2
        txtPassword = new JPasswordField(15); // Campo de contraseña (oculta texto)
        panel.add(txtPassword, gbc);           // Agrega campo al panel

        // =========================================================================
        // PANEL DE BOTONES
        // =========================================================================
        gbc.gridx = 0;          // Columna 0
        gbc.gridy = 3;          // Fila 3
        gbc.gridwidth = 2;      // Ocupa 2 columnas
        JPanel panelBotones = new JPanel(new FlowLayout()); // Layout fluido para botones

        // Creación de botones
        btnLogin = new JButton("Login");
        btnCancelar = new JButton("Cancelar");

        // Agregar botones al panel de botones
        panelBotones.add(btnLogin);
        panelBotones.add(btnCancelar);

        // Agregar panel de botones al panel principal
        panel.add(panelBotones, gbc);

        // =========================================================================
        // CONFIGURACIÓN DE MANEJADORES DE EVENTOS (ACTION LISTENERS)
        // =========================================================================

        // Evento para botón Login - Valida credenciales al hacer clic
        btnLogin.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                validarLogin(); // Llama método de validación
            }
        });

        // Evento para botón Cancelar - Cierra la aplicación
        btnCancelar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                System.exit(0); // Termina la aplicación con código 0 (éxito)
            }
        });

        // Evento para campo contraseña - Valida al presionar Enter
        txtPassword.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                validarLogin(); // Llama método de validación al presionar Enter
            }
        });

        // =========================================================================
        // FINALIZACIÓN DE CONFIGURACIÓN DE VENTANA
        // =========================================================================
        add(panel);     // Agrega panel principal a la ventana
        pack();         // Ajusta tamaño de ventana al contenido
    }

    // =========================================================================
    // MÉTODO PRINCIPAL DE VALIDACIÓN DE LOGIN
    // =========================================================================
    private void validarLogin() {
        // Obtiene y limpia datos de los campos
        String usuario = txtUsuario.getText().trim();           // Usuario sin espacios
        String password = new String(txtPassword.getPassword()); // Convierte char[] a String
        
        // =========================================================================
        // VALIDACIÓN DE CAMPOS VACÍOS
        // =========================================================================
        if (usuario.isEmpty() || password.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Usuario y contraseña son requeridos");
            return; // Detiene ejecución si hay campos vacíos
        }
        
        // =========================================================================
        // LOGGING DE INTENTO DE LOGIN
        // =========================================================================
        System.out.println("=== INTENTANDO LOGIN ===");
        System.out.println("Usuario: " + usuario);
        
        // =========================================================================
        // VALIDACIÓN CONTRA BASE DE DATOS
        // =========================================================================
        if (validarUsuario.ValidarUsuario(usuario, password)) {
            // =========================================================================
            // LOGIN EXITOSO
            // =========================================================================
            System.out.println("✓ Login exitoso para: " + usuario);
            
            try {
                // Crear una NUEVA conexión para ProductosGUI
                ProductosGUI productosGUI = new ProductosGUI(usuario, password);
                productosGUI.setVisible(true);  // Muestra ventana principal
                this.dispose();                 // Cierra ventana de login
                
            } catch (Exception e) {
                // =========================================================================
                // MANEJO DE ERRORES AL INICIAR APLICACIÓN PRINCIPAL
                // =========================================================================
                System.out.println("Error al crear ProductosGUI: " + e.getMessage());
                JOptionPane.showMessageDialog(this, 
                    "Error al iniciar la aplicación: " + e.getMessage(),
                    "Error", 
                    JOptionPane.ERROR_MESSAGE);
            }
            
        } else {
            // =========================================================================
            // LOGIN FALLIDO
            // =========================================================================
            System.out.println("✗ Login fallido para: " + usuario);
            JOptionPane.showMessageDialog(this, 
                "Usuario o contraseña incorrectos.\n\n" +
                "Verifique que:\n" +
                "- El usuario exista en la base de datos\n" +
                "- La contraseña sea correcta\n" +
                "- El usuario tenga permisos de lectura",
                "Error de autenticación", 
                JOptionPane.ERROR_MESSAGE);
            txtPassword.setText("");           // Limpia campo de contraseña
            txtUsuario.requestFocus();         // Coloca foco en campo de usuario
        }
    }
}

// =========================================================================
// COMENTARIOS ADICIONALES DE ARQUITECTURA
// =========================================================================

/*
 * PATRONES DE DISEÑO IMPLEMENTADOS:
 * - MVC (Model-View-Controller): Esta clase actúa como View + Controller
 * - Observer Pattern: ActionListeners observan eventos de componentes
 * - Separation of Concerns: Lógica de UI separada de lógica de validación
 * 
 * CARACTERÍSTICAS DE USABILIDAD:
 * - Validación con Enter en campo contraseña
 * - Mensajes de error descriptivos
 * - Limpieza automática de campos en errores
 * - Foco automático en campo usuario tras error
 * 
 * SEGURIDAD:
 * - Uso de JPasswordField para ocultar contraseña
 * - Validación en dos capas (frontend + backend)
 * - Limpieza segura de datos sensibles
 * - Mensajes de error genéricos (no revelan información específica)
 * 
 * FLUJO DE NAVEGACIÓN:
 * Login → Validación → ProductosGUI (éxito) → Mensaje Error (fallo)
 */