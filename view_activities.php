<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Website</title>
    <!-- Add your CSS styling here if needed -->
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
            color: #fff; /* Text color for the form buttons */
            padding: 0.5em 1em;
            margin: 0 1em;
            border-radius: 5px;
            background-color: #9f4576;
            font-family: 'Roboto', sans-serif; /* Choose your desired font */
        }

        form input[type="submit"]:hover {
            background-color: #7c3250; /* Change the background color of the submit button on hover */
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
<h1>Viewing Data!</h1>
<?php
  // get connection info
  $config = parse_ini_file("config.ini");   // better to hide this!
  $server = $config["host"];
  $username = $config["user"];
  $password = $config["password"];
  $database = $config["database"];

  // create the connection
  $cn = mysqli_connect($server, $username, $password, $database);
 
// get the username from the form:
  $username = $_POST["userName"];

  // create the prepared statement for student information
  $q_student = "SELECT * FROM Student WHERE student_id = ?";
  $st_student = $cn->stmt_init();
  $st_student->prepare($q_student);
  $st_student->bind_param("s", $username); // "s" for string

  // execute the statement and bind the result (to vars)
  $st_student->execute();
  $st_student->bind_result($student_id, $first_name, $last_name, $age, $college, $major);

  // output student information
  echo "<h2>Student Information</h2>";
  echo "<table border='1'>";
  echo "<thead><tr><th>ID</th><th>First Name</th><th>Last Name</th><th>Age</th><th>College</th><th>Major</th></tr></thead>";
  echo "<tbody>";
  while ($st_student->fetch()) {
    echo "<tr>";
    echo "<td>$student_id</td>";
    echo "<td>$first_name</td>";
    echo "<td>$last_name</td>";
    echo "<td>$age</td>";
    echo "<td>$college</td>";
    echo "<td>$major</td>";
    echo "</tr>";
  }
  echo "</tbody></table>";

  // create the prepared statement for club information
  $q_activity = "SELECT * FROM Activities_in WHERE student_id = ?";
  $st_activity = $cn->stmt_init();
  $st_activity->prepare($q_activity);
  $st_activity->bind_param("s", $username); // "s" for string

  // execute the statement and bind the result (to vars)
  $st_activity->execute();
  $st_activity->bind_result($student_id, $activity_name, $year, $desc);

  // output club information
  echo "<h2>Activity Information</h2>";
  echo "<table border='1'>";
  echo "<thead><tr><th>ID</th><th>Activity Name</th><th>Year</th><th>Description</th></tr></thead>";
  echo "<tbody>";
  while ($st_activity->fetch()) {
    echo "<tr>";
    echo "<td>$student_id</td>";
    echo "<td>$activity_name</td>";
    echo "<td>$year</td>";
    echo "<td>$desc</td>";
    echo "</tr>";
  }
  echo "</tbody></table>";

  // clean up
  $st_student->close();
  $st_activity->close();
  $cn->close();
?>
</body>
</html>