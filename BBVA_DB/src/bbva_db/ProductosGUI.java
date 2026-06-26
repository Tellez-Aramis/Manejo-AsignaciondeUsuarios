/**
 * ProductosGUI - Ventana Principal de Gestión de Productos BBVA
 * 
 * Interfaz gráfica para la gestión y visualización de productos del BBVA.
 * Muestra datos en tabla, permite actualizar y cerrar sesión.
 * 
 * @author BBVA Development Team
 * @version 1.0
 * @since 2024
 */

package bbva_db;

// =========================================================================
// IMPORTACIONES DE BIBLIOTECAS
// =========================================================================
import javax.swing.*;              // Componentes de interfaz gráfica Swing
import javax.swing.table.*;        // Componentes para tablas (TableModel, etc.)
import java.awt.*;                 // Layout managers y contenedores
import java.awt.event.*;           // Manejo de eventos
import java.util.List;             // Para trabajar con listas de objetos

public class ProductosGUI extends JFrame {  // Hereda de JFrame para ventana principal
    
    // =========================================================================
    // DECLARACIÓN DE COMPONENTES DE LA INTERFAZ
    // =========================================================================
    private final JTable table;              // Tabla para mostrar productos
    private final DefaultTableModel model;   // Modelo de datos para la tabla
    private ProductosDAO productosDAO;       // DAO para acceso a datos (no final para re-conexión)
    private JButton btnActualizar;           // Botón para actualizar datos
    private String usuario;                  // Usuario autenticado
    private String password;                 // Password del usuario

    // =========================================================================
    // CONSTRUCTOR - INICIALIZACIÓN CON CREDENCIALES
    // =========================================================================
    public ProductosGUI(String usuario, String password) {
        // Almacena credenciales para futuras reconexiones
        this.usuario = usuario;
        this.password = password;
        
        // =========================================================================
        // INICIALIZACIÓN DEL DAO (Data Access Object)
        // =========================================================================
        try {
            // Crea instancia del DAO con las credenciales del usuario
            this.productosDAO = new ProductosDAO(usuario, password);
            System.out.println("ProductosDAO creado exitosamente");
        } catch (Exception e) {
            // Manejo de errores en la creación del DAO
            System.out.println("Error al crear ProductosDAO: " + e.getMessage());
            e.printStackTrace();  // Log detallado del error
        }
        
        // =========================================================================
        // CONFIGURACIÓN DEL MODELO DE TABLA
        // =========================================================================
        // Nombres de columnas para la tabla de productos
        String[] columnNames = {"ID del producto", "Nombre del producto", "Descripción", 
                               "Tipo de producto", "Estado", "Fecha de lanzamiento"};
        
        // Creación del modelo de tabla con columnas definidas y 0 filas iniciales
        model = new DefaultTableModel(columnNames, 0) {
            @Override
            public boolean isCellEditable(int row, int column) {
                // Hace que todas las celdas sean de solo lectura
                return false;
            }
        };
        
        // =========================================================================
        // CREACIÓN DE LA TABLA CON EL MODELO
        // =========================================================================
        table = new JTable(model);  // Tabla usando el modelo configurado
        
        // =========================================================================
        // INICIALIZACIÓN DE COMPONENTES Y CARGA DE DATOS
        // =========================================================================
        initComponents();    // Configura la interfaz gráfica
        cargarDatos();       // Carga datos iniciales desde la base de datos
    }
    
    // =========================================================================
    // MÉTODO DE INICIALIZACIÓN DE COMPONENTES GRÁFICOS
    // =========================================================================
    private void initComponents() {
        // Configuración básica de la ventana
        setTitle("Sistema BBVA - Gestión de Productos - Usuario: " + usuario);  // Título personalizado
        setSize(1000, 700);                          // Tamaño de ventana
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE); // Cierra solo esta ventana al salir
        setLocationRelativeTo(null);                 // Centra ventana en pantalla

        // =========================================================================
        // PANEL PRINCIPAL CON BORDERLAYOUT
        // =========================================================================
        JPanel mainPanel = new JPanel(new BorderLayout(10, 10));  // Layout con espaciado
        mainPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));  // Márgenes internos

        // =========================================================================
        // PANEL SUPERIOR CON BOTONES DE ACCIÓN
        // =========================================================================
        JPanel panelSuperior = new JPanel(new FlowLayout(FlowLayout.LEFT));  // Botones alineados a la izquierda
        btnActualizar = new JButton("Actualizar Datos");    // Botón para refrescar datos
        JButton btnCerrar = new JButton("Cerrar Sesión");   // Botón para cerrar sesión
        
        // Agrega botones al panel superior
        panelSuperior.add(btnActualizar);
        panelSuperior.add(btnCerrar);
        
        // =========================================================================
        // CONFIGURACIÓN DE LA TABLA CON SCROLL
        // =========================================================================
        JScrollPane scrollPane = new JScrollPane(table);    // Tabla dentro de panel desplazable
        table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);  // Ajuste automático de columnas
        
        // =========================================================================
        // CONFIGURACIÓN DE ANCHOS PREFERIDOS DE COLUMNAS
        // =========================================================================
        table.getColumnModel().getColumn(0).setPreferredWidth(80);   // ID del producto
        table.getColumnModel().getColumn(1).setPreferredWidth(150);  // Nombre del producto
        table.getColumnModel().getColumn(2).setPreferredWidth(200);  // Descripción
        table.getColumnModel().getColumn(3).setPreferredWidth(120);  // Tipo de producto
        table.getColumnModel().getColumn(4).setPreferredWidth(80);   // Estado
        table.getColumnModel().getColumn(5).setPreferredWidth(120);  // Fecha de lanzamiento

        // =========================================================================
        // ENSAMBLAJE DE COMPONENTES EN PANEL PRINCIPAL
        // =========================================================================
        mainPanel.add(panelSuperior, BorderLayout.NORTH);   // Botones en norte
        mainPanel.add(scrollPane, BorderLayout.CENTER);     // Tabla en centro
        
        // =========================================================================
        // PANEL INFERIOR CON INFORMACIÓN
        // =========================================================================
        JLabel lblInfo = new JLabel("Total de productos: 0");  // Etiqueta contadora
        mainPanel.add(lblInfo, BorderLayout.SOUTH);         // Contador en sur

        add(mainPanel);  // Agrega panel principal a la ventana

        // =========================================================================
        // CONFIGURACIÓN DE MANEJADORES DE EVENTOS
        // =========================================================================

        // Evento para botón Actualizar - Recarga datos desde BD
        btnActualizar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                cargarDatos();  // Llama método de carga de datos
            }
        });
        
        // Evento para botón Cerrar Sesión - Vuelve al login
        btnCerrar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                cerrarSesion();  // Llama método de cierre de sesión
            }
        });
        
        setVisible(true);  // Hace visible la ventana
    } 
    
    // =========================================================================
    // MÉTODO PARA CARGAR DATOS DESDE LA BASE DE DATOS
    // =========================================================================
    private void cargarDatos() {
        // Verifica que el DAO esté inicializado
        if (productosDAO == null) {
            JOptionPane.showMessageDialog(this, 
                "No hay conexión a la base de datos",
                "Error", 
                JOptionPane.ERROR_MESSAGE);
            return;  // Sale si no hay conexión
        }
        
        // Limpia tabla antes de cargar nuevos datos
        model.setRowCount(0);
        
        try {
            // Obtiene lista de productos desde la base de datos
            List<Object[]> productos = productosDAO.obtenerTodosLosProductos();
            
            // Itera sobre cada producto y lo agrega a la tabla
            for (Object[] producto : productos) {
                model.addRow(producto);  // Agrega fila al modelo
            }
            
            // Actualiza el contador en la interfaz
            actualizarContador(productos.size());
            
            // Muestra confirmación al usuario
            JOptionPane.showMessageDialog(this, 
                "Datos actualizados. Total de productos: " + productos.size(),
                "Información", 
                JOptionPane.INFORMATION_MESSAGE);
                
        } catch (Exception e) {
            // Manejo de errores en la carga de datos
            JOptionPane.showMessageDialog(this, 
                "Error al cargar datos: " + e.getMessage(),
                "Error", 
                JOptionPane.ERROR_MESSAGE);
        }
    }
    
    // =========================================================================
    // MÉTODO PARA ACTUALIZAR CONTADOR DE PRODUCTOS
    // =========================================================================
    private void actualizarContador(int total) {
        Container contentPane = getContentPane();  // Obtiene el contenedor principal
        
        // Verifica que el contentPane sea un JPanel
        if (contentPane instanceof JPanel) {
            JPanel mainPanel = (JPanel) contentPane;
            Component[] components = mainPanel.getComponents();  // Obtiene todos los componentes
            
            // Busca la etiqueta del contador
            for (Component comp : components) {
                if (comp instanceof JLabel) {
                    // Actualiza el texto del contador
                    ((JLabel) comp).setText("Total de productos: " + total);
                    break;  // Sale del loop una vez actualizado
                }
            }
        }
    }
    
    // =========================================================================
    // MÉTODO PARA CERRAR SESIÓN Y VOLVER AL LOGIN
    // =========================================================================
    private void cerrarSesion() {
        // Dialogo de confirmación para cerrar sesión
        int respuesta = JOptionPane.showConfirmDialog(this,
            "¿Está seguro que desea cerrar sesión?",
            "Confirmar cierre de sesión",
            JOptionPane.YES_NO_OPTION);
            
        // Si usuario confirma el cierre
        if (respuesta == JOptionPane.YES_OPTION) {
            // Cierra conexión a base de datos si existe
            if (productosDAO != null) {
                productosDAO.cerrarConexion();
            }
            this.dispose();           // Cierra ventana actual
            new Login().setVisible(true);  // Abre ventana de login
        }
    }
}
