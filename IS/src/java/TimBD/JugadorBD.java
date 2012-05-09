/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package TimBD;

import TimLog.Jugador;
import java.sql.*;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.postgresql.util.PSQLException;

/**
 *
 * @author Jonas
 */
public class JugadorBD {

    private static String driver = "org.postgresql.Driver";
    private static String baseDatos = "jbcd:postgresql://localhost:5432/TimbiricheBD";
    private static String user = "postgres";
    private static String password = "leonardo";
    //private static Connection conexion;
    protected String usuario;
    protected String correo;
    protected String nombre;
    protected String apellido;

    /**
     * Inicia el nombre de usuario de un JugadorBD Asignando null a los demas
     * atributos
     *
     * @param user Usuario del JugadorBD
     */
    public JugadorBD(String user) {
        usuario = user.toLowerCase();

        correo = nombre = apellido = null;

    }

    public JugadorBD() {
        usuario = nombre = apellido = correo = null;
    }

    /**
     * Verifica que la contraseña y el usuario coincidan con algun registro
     * existente.
     *
     * @return Jugador segun usuario en otro caso null
     * @throws ClassNotFoundException Si el driver de la base de Datos no es
     * encontrada
     * @throws SQLException Si la consulta no es correcta o se pierde la
     * Conexion
     */
    public Jugador autenticarse(String pwd) throws ClassNotFoundException, SQLException {
        Jugador res = null;
        Connection conexion;
        Class.forName(driver);
        conexion = DriverManager.getConnection(baseDatos, user, password);

        Statement comando = conexion.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                                                           java.sql.ResultSet.CONCUR_UPDATABLE);
        String sql = "SELECT nombre, apellido,correo,verificacion FROM jugador WHERE usuario = '" + usuario + "' AND contrasena = '" + pwd + "'";
        //+ "AND contrasena = "+pwd+";";
        ResultSet resultado = comando.executeQuery(sql);

        if (resultado.next() && resultado != null) {
            correo = resultado.getString("correo");
            nombre = resultado.getString("nombre");
            apellido = resultado.getString("apellido");
            boolean ver = resultado.getBoolean("verificacion");
            res = new Jugador(usuario, correo, nombre, apellido);
            Jugador.conectar(res);
        }
        resultado.close();
        comando.close();
        conexion.close();
        return res;
    }

    public boolean registrarse(String nom, String ap, String mail, String user) {
        boolean res = false;
        Connection conexion = null;
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            return false;
        }
        try {
            conexion = DriverManager.getConnection(baseDatos, JugadorBD.user, password);
            Statement comando = conexion.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                                                           java.sql.ResultSet.CONCUR_UPDATABLE);
            String sql = "SELECT nombre, apellido,correo FROM jugador WHERE usuario = '" + user + "';";
            ResultSet resultado = comando.executeQuery(sql);
            if (resultado.next()) {
                return false;
            }
            sql = "SELECT nombre, apellido,correo FROM jugador WHERE correo = '" + mail + "';";
            resultado = comando.executeQuery(sql);
            if (resultado.next()) {
                return false;
            }
            resultado.close();
        } catch (SQLException ex) {
            Logger.getLogger(JugadorBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        String pwd = generarPwd();
        nombre = nom;
        apellido = ap;
        correo = mail;
        usuario = user.toLowerCase();
        if (enviarPwd(pwd, mail, user)) {
            String sql = "INSERT INTO jugador (nombre,apellido,correo,contrasena,usuario)VALUES ('" + nombre + "','";
            sql += apellido + "','" + correo + "','" + pwd + "','" + usuario + "');";
            try {
                try {
                    Statement comando = conexion.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                                                           java.sql.ResultSet.CONCUR_UPDATABLE);
                    ResultSet resultado = comando.executeQuery(sql);
                    comando.executeQuery(sql);
                    resultado.close();
                    comando.close();
                    conexion.close();
                    res = true;
                } catch (PSQLException e) {
                    conexion.close();
                    return true;
                } 
            } catch (SQLException e) {
                return false;
            }
        }
        return res;
    }

    private static boolean enviarPwd(String pwd, String mail, String user) {
        boolean res = false;
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class",
                    "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            //Nos autentificamos
            Session session = Session.getDefaultInstance(props,
                    new javax.mail.Authenticator() {

                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication("timbirilina@gmail.com", "jrp25PG=@J");
                        }
                    });
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("timbirilina@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(mail));
            message.setSubject("Registro Timbirilina");
            message.setText("Bienvenido " + user + " a Timbirilina.Este es tu password:\n" + pwd);
            Transport.send(message);
            res = true;
        } catch (MessagingException ex) {
            Logger.getLogger(JugadorBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }

    private static String generarPwd() {
        String alf = "QWERTYUIOPASDGHJKLÑZXCVBNMqwertyuiopasdfghklñzxcvbnm1234567890";
               // + "!#$%&()*+-./:;<=>?@_~*";
        String res = "";
        for (byte i = 0; i < 5; i++) {
            res += alf.charAt((int) (Math.random() * alf.length()));
        }
        return res;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        String correo = "JOjsahhasnsa@jashkdha.com";
        Pattern p = Pattern.compile("([a-zA-Z]|[.-/_])+(@)([a-zA-Z]|[.-/_])+(.com)");
        Matcher m = p.matcher(correo);
        JugadorBD jonas = new JugadorBD();
        System.out.print(jonas.registrarse("Jonathan", "Blasio", "blsjona@gmail.com", "leonardo"));
        java.util.Date actual = new java.util.Date();
        System.out.println(actual.toLocaleString());

    }
}
