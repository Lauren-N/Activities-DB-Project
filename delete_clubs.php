<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adding Clubs</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffddf4;
        }

        header {
            font-size: 30px;
            color: #fff;
            text-align: center;
            padding: 1em;
            background-color: #e75480;
        }
        nav form {
        display: inline-block;
        }

        nav {
            background-color: #f49ac2;
            padding: 1em;
            text-align: center;
        }

        nav a:hover {
            background-color: #ddd;
        }

        section {
            padding: 2em;
        }
        form input[type="submit"] {
            padding: 1em 2em;
            border: none;
            border-radius: 8px;
            margin-right: 50px;
            display: inline-block; /* Display the elements inline */
            vertical-align: middle; /* Align vertically with each other */
            font-size: 10px;
            text-decoration: none;
            color: #fff; 
            padding: 0.5em 1em;
            margin: 0 1em;
            border-radius: 5px;
            background-color: #9f4576;
            font-family: 'Roboto', sans-serif; 
        }

        form input[type="submit"]:hover {
            background-color: #7c3250; 
        }


        form input[type="text"] {
            padding: 0.5em;
            font-size: 16px;
            display: inline-block; /* Display the elements inline */
            vertical-align: middle; /* Align vertically with each other */
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #9f4576;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

    </style>
</head>
<body>
<header>
    <h1>Deleting Club Data!</h1>
    </header>
<?php
  // get connection info
  $config = parse_ini_file("config.ini"); 
  $server = $config["host"];
  $username = $config["user"];
  $password = $config["password"];
  $database = $config["database"];

  // create the connection
  $cn = mysqli_connect($server, $username, $password, $database);
 
// get the username from the form:
  $username = $_POST["userName"];
  $clubName = $_POST["clubName"];

  // create the prepared statement for club information
  $q_club = "DELETE FROM Clubs_in WHERE student_id=? AND student_club_name=?";
  $st_club = $cn->stmt_init();
  $st_club->prepare($q_club);
  $st_club->bind_param("ss", $username, $clubName); // "s" for string
  
  // execute the statement
  $insertResult = $st_club->execute();

  $q_club_view = "SELECT * FROM Clubs_in WHERE student_id = ?";
  $st_club_view = $cn->stmt_init();
  $st_club_view->prepare($q_club_view);
  $st_club_view->bind_param("s", $username); // "s" for string

  // execute the statement and bind the result (to vars)
  $st_club_view->execute();
  $st_club_view->bind_result($student_id, $club_name, $year, $role, $desc, $size);
  
  // check if the insertion was successful
  if ($insertResult) {
      echo "<p>Club information deleted successfully!</p>";
  } else {
      echo "<p>Error deleting club information: " . $st_club->error . "</p>";
  }

    // output club information
    echo "<h2>Club Information</h2>";
    echo "<table border='1'>";
    echo "<thead><tr><th>ID</th><th>Club Name</th><th>Year</th><th>Role</th><th>Description</th><th>Size</th></tr></thead>";
    echo "<tbody>";
    while ($st_club_view->fetch()) {
      echo "<tr>";
      echo "<td>$student_id</td>";
      echo "<td>$club_name</td>";
      echo "<td>$year</td>";
      echo "<td>$role</td>";
      echo "<td>$desc</td>";
      echo "<td>$size</td>";
      echo "</tr>";
    }
    echo "</tbody></table>";

  // clean up
  $st_club_view->close();
  $st_club->close();
  $cn->close();
?>
</body>
</html>