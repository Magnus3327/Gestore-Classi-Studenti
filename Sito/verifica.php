<?php
// Connessione al database
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "myDB";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica la connessione
if ($conn->connect_error) {
  die("Connessione fallita: " . $conn->connect_error);
}

// Verifica se il form è stato inviato
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  // Recupera i dati dal form
  $username = $_POST["username"];
  $password = $_POST["password"];

  // Verifica se il nome utente e la password sono presenti nel database
  $sql = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
    // L'utente ha inserito le credenziali corrette
    header("Location: listaAnno.html");
    exit();
  } else {
    // L'utente ha inserito credenziali errate
    echo "Accesso negato";
  }
}

$conn->close();
?>
