<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Data</title>
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
<header>
    <h1>Viewing Activity Data!</h1>
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
$originalActivityName = $_POST["activityName"];
$year = $_POST["year"];
$desc = $_POST["desc"];
$newActivityName = $_POST["newActivityName"];  // Add this line

// get the new activity name from the form
$newActivityName = $_POST["newActivityName"];

// Check if the new activity name is the same as the original one
if ($newActivityName == $originalActivityName) {
    // Update the other columns without modifying the primary key
    $q_activity = "UPDATE Activities_in SET year_joined = ?, long_desc = ? WHERE student_id = ? AND activity_name = ?";
    $st_activity = $cn->stmt_init();
    $st_activity->prepare($q_activity);
    $st_activity->bind_param("ssss", $year, $desc, $username, $originalActivityName); // "s" for string
    $updateResult = $st_activity->execute();
} else {
    // Check if the new activity name already exists for the user
    $checkDuplicateQuery = "SELECT COUNT(*) FROM Activities_in WHERE student_id = ? AND activity_name = ?";
    $st_checkDuplicate = $cn->stmt_init();
    $st_checkDuplicate->prepare($checkDuplicateQuery);
    $st_checkDuplicate->bind_param("ss", $username, $newActivityName);
    $st_checkDuplicate->execute();
    $st_checkDuplicate->bind_result($count);
    $st_checkDuplicate->fetch();
    $st_checkDuplicate->close(); // Close the statement here

    if ($count == 0) {
        // The new activity name doesn't exist, proceed with the update
        $q_activity = "UPDATE Activities_in SET activity_name = ?, year_joined = ?, long_desc = ? WHERE student_id = ? AND activity_name = ?";
        $st_activity = $cn->stmt_init();
        $st_activity->prepare($q_activity);
        $st_activity->bind_param("sssss", $newActivityName, $year, $desc, $username, $originalActivityName); // "s" for string
        $updateResult = $st_activity->execute();
    } else {
        // The new activity name already exists, display an error message
        echo "<p>Error: The new activity name already exists for the user.</p>";
    }
}

$q_activity_view = "SELECT * FROM Activities_in WHERE student_id = ?";
$st_activity_view = $cn->stmt_init();
$st_activity_view->prepare($q_activity_view);
$st_activity_view->bind_param("s", $username); // "s" for string

// execute the statement and bind the result (to vars)
$st_activity_view->execute();
$st_activity_view->bind_result($student_id, $activityName, $year, $desc);
    // output club information
    echo "<h2>Activity Information</h2>";
    echo "<table border='1'>";
    echo "<thead><tr><th>ID</th><th>Activity Name</th><th>Year</th><th>Description</th></tr></thead>";
    echo "<tbody>";
    while ($st_activity_view->fetch()) {
      echo "<tr>";
      echo "<td>$student_id</td>";
      echo "<td>$activityName</td>";
      echo "<td>$year</td>";
      echo "<td>$desc</td>";
      echo "</tr>";
    }
    echo "</tbody></table>";

  // clean up
  $st_activity->close();
  $st_activity_view->close();
  $cn->close();
?>
</body>
</html>