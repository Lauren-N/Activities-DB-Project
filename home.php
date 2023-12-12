<html>
<body>
<h1>Pets by Type</h1>
<?php
  // get connection info
  $config = parse_ini_file("config.ini");  
  $server = $config["host"];
  $username = $config["user"];
  $password = $config["password"];
  $database = $config["database"];

  // create the connection
  $cn = mysqli_connect($server, $username, $password, $database);
 
  // get the pet type from the form:
  $pet_type = $_POST["userChoice"];
  echo "<p>Category: " . $username . "</p>";

  // create the prepared statement
  $q = "SELECT * FROM Student WHERE student_id = ?";
  $st = $cn->stmt_init();
  $st->prepare($q);
  $st->bind_param("s", $username); // "s" for string

  // execute the statement and bind the result (to vars)
  $st->execute();
  $st->bind_result($student_id, $first_name, $last_name, $age, $college, $major);

  // output result
  echo "<p>Pet ids, names, and appearances:</p>\n";
  echo "<ul>\n";
  while ($st->fetch()) {
    echo "<li>" . $student_id . ", " . $first_name . ", " . $last_name . $age . ", "  . $college . ", " . $major . ", " . "</li>\n";
  }
  echo "</ul>\n";

  // clean up
  $st->close();
  $cn->close();
?>
</body>
</html>