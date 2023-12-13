<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Stats</title>
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
            font-family: 'Roboto', sans-serif; 
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
    <h1>Viewing Statistical Data!</h1>
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

  // create the prepared statement for activity information
  $q_activity = "SELECT COUNT(*), MIN(year_joined), MAX(year_joined) FROM Activities_in";
  $st_activity = $cn->stmt_init();
  $st_activity->prepare($q_activity);

  // execute the statement and bind the result (to vars)
  $st_activity->execute();
  $st_activity->bind_result($activityCount, $activityMinYear, $activityMaxYear);

    // output activity information
  echo "<h2>Activity Information</h2>";
  echo "<table border='1'>";
  echo "<thead><tr><th># of Activities</th><th>Earliest Activity Year</th><th>Latest Activity Year</th></tr></thead>";
  echo "<tbody>";
  while ($st_activity->fetch()) {
    echo "<tr>";
    echo "<td>$activityCount</td>";
    echo "<td>$activityMinYear</td>";
    echo "<td>$activityMaxYear</td>";
    echo "</tr>";
  }
  echo "</tbody></table>";
  $st_activity->close();
  $cn->close();

   // create the connection
  $cn = mysqli_connect($server, $username, $password, $database);

  // create the prepared statement for activity information
  $q_activity = "SELECT student_id, COUNT(activity_name) AS activity_count
  FROM Activities_in
  GROUP BY student_id
  ORDER BY activity_count DESC
  LIMIT 5;";
  $st_activity = $cn->stmt_init();
  $st_activity->prepare($q_activity);

  // execute the statement and bind the result (to vars)
  $st_activity->execute();
  $st_activity->bind_result($studentID, $count);

    // output activity information
  echo "<h2>Activity Amounts Per Student</h2>";
  echo "<table border='1'>";
  echo "<thead><tr><th># of Activities</th><th>Activity Count</th></tr></thead>";
  echo "<tbody>";
  while ($st_activity->fetch()) {
    echo "<tr>";
    echo "<td>$studentID</td>";
    echo "<td>$count</td>";
    echo "</tr>";
  }
  echo "</tbody></table>";
  $st_activity->close();
  $cn->close();

  $cn = mysqli_connect($server, $username, $password, $database);
  
  // create the prepared statement for club information
  $q_club = "SELECT COUNT(*), MIN(year_joined), MAX(year_joined), AVG(club_size) FROM Clubs_in";
  $st_club = $cn->stmt_init();
  $st_club->prepare($q_club);

  // execute the statement and bind the result (to vars)
  $st_club->execute();
  $st_club->bind_result($clubCount, $clubMinYear, $clubMaxYear, $avg_club_size);

    // output club information
  echo "<h2>Club Information</h2>";
  echo "<table border='1'>";
  echo "<thead><tr><th># of Clubs</th><th>Earliest Joining Year</th><th>Latest Joining Year</th><th>AVG Club Size</th></tr></thead>";
  echo "<tbody>";
  while ($st_club->fetch()) {
    echo "<tr>";
    echo "<td>$clubCount</td>";
    echo "<td>$clubMinYear</td>";
    echo "<td>$clubMaxYear</td>";
    echo "<td>$avg_club_size</td>";
    echo "</tr>";
  }
  echo "</tbody></table>";
  $st_club->close();
  $cn->close();

  $cn = mysqli_connect($server, $username, $password, $database);
  
  // create the prepared statement for club information
  $q_club = "SELECT club_role, COUNT(*) FROM Clubs_in GROUP BY club_role";
  $st_club = $cn->stmt_init();
  $st_club->prepare($q_club);

  // execute the statement and bind the result (to vars)
  $st_club->execute();
  $st_club->bind_result($clubRole, $count);

    // output club information
  echo "<h2>Club Role Count</h2>";
  echo "<table border='1'>";
  echo "<thead><tr><th>Club Role</th><th>Count</th></tr></thead>";
  echo "<tbody>";
  while ($st_club->fetch()) {
    echo "<tr>";
    echo "<td>$clubRole</td>";
    echo "<td>$count</td>";
    echo "</tr>";
  }
  echo "</tbody></table>";
  $st_club->close();
  $cn->close();

  $cn = mysqli_connect($server, $username, $password, $database);

  // create the prepared statement for course information
  $q_course = "SELECT COUNT(*), MIN(year_completed), MAX(year_completed) FROM Courses_in";
  $st_course = $cn->stmt_init();
  $st_course->prepare($q_course);

  // execute the statement and bind the result (to vars)
  $st_course->execute();
  $st_course->bind_result($courseCount, $courseMinYear, $courseMaxYear);

  // output course information
  echo "<h2>Course Information</h2>";
  echo "<table border='1'>";
  echo "<thead><tr><th># of Courses</th><th>Earliest Completion Year</th><th>Latest Completion Year</th></tr></thead>";
  echo "<tbody>";
  while ($st_course->fetch()) {
    echo "<tr>";
    echo "<td>$courseCount</td>";
    echo "<td>$courseMinYear</td>";
    echo "<td>$courseMaxYear</td>";
    echo "</tr>";
  }
  echo "</tbody></table>";

  $st_course->close();
  $cn->close();

  $cn = mysqli_connect($server, $username, $password, $database);

  // create the prepared statement for course information
  $q_course = "SELECT class_id, COUNT(*) FROM Courses_in GROUP BY class_id ORDER BY COUNT(*) DESC LIMIT 5;";
  $st_course = $cn->stmt_init();
  $st_course->prepare($q_course);

  // execute the statement and bind the result (to vars)
  $st_course->execute();
  $st_course->bind_result($courseID, $Count);

  // output course information
  echo "<h2>Top Class Enrollments</h2>";
  echo "<table border='1'>";
  echo "<thead><tr><th>CID</th><th>Count</th></tr></thead>";
  echo "<tbody>";
  while ($st_course->fetch()) {
    echo "<tr>";
    echo "<td>$courseID</td>";
    echo "<td>$Count</td>";
    echo "</tr>";
  }
  echo "</tbody></table>";

  $st_course->close();
  $cn->close();
?>
</body>
</html>