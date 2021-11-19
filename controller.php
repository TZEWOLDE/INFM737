<?php
$servername = "localhost";
$username = "root";
$password = "";

$conn = mysqli_connect($servername, $username, $password);


if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}


mysqli_select_db ( $conn , 'kpi' );


//pull form data
$creteria = mysqli_real_escape_string($conn, $_REQUEST['creteria']);
$searchvalue = mysqli_real_escape_string($conn, $_REQUEST['search']);

if($creteria == "name"){
  $sql="SELECT A.dataset_Name, C.dataset_owner_name, C.dataset_owner_email, C.dataset_owner_phone,
      B.dataset_steward_email, B.dataset_steward_phone, B.dataset_steward_name,D.kpi_name,D.strat_priority_ID
   from dataset A 
    inner join dataset_steward B on A.dataset_steward_ID = B.dataset_steward_ID
    inner join dataset_owner C on A.dataset_owner_ID=C.dataset_owner_ID
    inner join kpi D on A.dataset_ID=D.dataset_ID";
    if ($result = mysqli_query($conn, $sql)) {
    /* fetch associative array */
    while ($row = $result->fetch_assoc()) {
      if($row["dataset_Name"]== $searchvalue){
          $dataset_name = $row["dataset_Name"]; 
          $dataset_owner_name = $row["dataset_owner_name"]; 
          $dataset_owner_email = $row["dataset_owner_email"]; 
          $dataset_owner_phone = $row["dataset_owner_phone"]; 
           $dataset_steward_name = $row["dataset_steward_name"];
           $dataset_steward_email = $row["dataset_steward_email"];
           $dataset_steward_phone = $row["dataset_steward_phone"];
           $kpi_name = $row["kpi_name"];
        $strat_priority_ID = $row["strat_priority_ID"];
          echo "<strong>Dataset Name- </strong>". $dataset_name. " <strong>Owner-</strong> ". $dataset_owner_name . 
          " <strong>Owner Email-</strong> ". $dataset_owner_email . " <strong>Owner Phone-</strong> ". $dataset_owner_phone
          . "<br>". " <strong>Steward Name-</strong> ". $dataset_steward_name . " <strong>Steward Email-</strong> ". $dataset_steward_email
          . " <strong>Steward Phone-</strong> ". $dataset_steward_phone. " <strong>KPI Name-</strong> ". $kpi_name . " <strong>Strategic Priority-</strong> ". $strat_priority_ID . "<br>". "<br>"; 
      }           
      }
    
    }
    else{
      echo "No result";
    }
}else if($creteria=="ownername"){
      $sql="SELECT A.dataset_Name, C.dataset_owner_name, C.dataset_owner_email, C.dataset_owner_phone,
        B.dataset_steward_email, B.dataset_steward_phone, B.dataset_steward_name,D.kpi_name,D.strat_priority_ID
      from dataset A 
        inner join dataset_steward B on A.dataset_steward_ID = B.dataset_steward_ID
        inner join dataset_owner C on A.dataset_owner_ID=C.dataset_owner_ID
        inner join kpi D on A.dataset_ID=D.dataset_ID";

      if ($result = mysqli_query($conn, $sql)) {
    /* fetch associative array */
    while ($row = $result->fetch_assoc()) {
      if($row["dataset_owner_name"]== $searchvalue){
          $dataset_name = $row["dataset_Name"]; 
          $dataset_owner_name = $row["dataset_owner_name"]; 
          $dataset_owner_email = $row["dataset_owner_email"]; 
          $dataset_owner_phone = $row["dataset_owner_phone"]; 
           $dataset_steward_name = $row["dataset_steward_name"];
           $dataset_steward_email = $row["dataset_steward_email"];
           $dataset_steward_phone = $row["dataset_steward_phone"];
           $kpi_name = $row["kpi_name"];
         $strat_priority_ID = $row["strat_priority_ID"];
          echo "<strong>Dataset Name- </strong>". $dataset_name. " <strong>Owner-</strong> ". $dataset_owner_name . 
          " <strong>Owner Email-</strong> ". $dataset_owner_email . " <strong>Owner Phone-</strong> ". $dataset_owner_phone
          . "<br>". " <strong>Steward Name-</strong> ". $dataset_steward_name . " <strong>Steward Email-</strong> ". $dataset_steward_email
          . " <strong>Steward Phone-</strong> ". $dataset_steward_phone. " <strong>KPI Name-</strong> ". $kpi_name . " <strong>Strategic Priority-</strong> ". $strat_priority_ID . "<br>". "<br>"; 
      }           
      }
    
    }
    else{
      echo "No result";
    }
    }else if($creteria=="stewardname"){
      $sql="SELECT A.dataset_Name, C.dataset_owner_name, C.dataset_owner_email, C.dataset_owner_phone,
        B.dataset_steward_email, B.dataset_steward_phone, B.dataset_steward_name,D.kpi_name,D.strat_priority_ID
      from dataset A 
        inner join dataset_steward B on A.dataset_steward_ID = B.dataset_steward_ID
        inner join dataset_owner C on A.dataset_owner_ID=C.dataset_owner_ID
        inner join kpi D on A.dataset_ID=D.dataset_ID";

      if ($result = mysqli_query($conn, $sql)) {
    /* fetch associative array */
    while ($row = $result->fetch_assoc()) {
      if($row["dataset_steward_name"]== $searchvalue){
          $dataset_name = $row["dataset_Name"]; 
          $dataset_owner_name = $row["dataset_owner_name"]; 
          $dataset_owner_email = $row["dataset_owner_email"]; 
          $dataset_owner_phone = $row["dataset_owner_phone"]; 
           $dataset_steward_name = $row["dataset_steward_name"];
           $dataset_steward_email = $row["dataset_steward_email"];
           $dataset_steward_phone = $row["dataset_steward_phone"];
           $kpi_name = $row["kpi_name"];
         $strat_priority_ID = $row["strat_priority_ID"];
          echo "<strong>Dataset Name- </strong>". $dataset_name. " <strong>Owner-</strong> ". $dataset_owner_name . 
          " <strong>Owner Email-</strong> ". $dataset_owner_email . " <strong>Owner Phone-</strong> ". $dataset_owner_phone
          . "<br>". " <strong>Steward Name-</strong> ". $dataset_steward_name . " <strong>Steward Email-</strong> ". $dataset_steward_email
          . " <strong>Steward Phone-</strong> ". $dataset_steward_phone. " <strong>KPI Name-</strong> ". $kpi_name . " <strong>Strategic Priority-</strong> ". $strat_priority_ID . "<br>". "<br>"; 
      }           
      }
    
    }
    else{
      echo "No result";
    }
    }else if($creteria=="kpiname"){
      $sql="SELECT A.dataset_Name, C.dataset_owner_name, C.dataset_owner_email, C.dataset_owner_phone,
        B.dataset_steward_email, B.dataset_steward_phone, B.dataset_steward_name,D.kpi_name,D.strat_priority_ID
      from dataset A 
        inner join dataset_steward B on A.dataset_steward_ID = B.dataset_steward_ID
        inner join dataset_owner C on A.dataset_owner_ID=C.dataset_owner_ID
        inner join kpi D on A.dataset_ID=D.dataset_ID";

      if ($result = mysqli_query($conn, $sql)) {
    /* fetch associative array */
    while ($row = $result->fetch_assoc()) {
      if($row["kpi_name"]== $searchvalue){
          $dataset_name = $row["dataset_Name"]; 
          $dataset_owner_name = $row["dataset_owner_name"]; 
          $dataset_owner_email = $row["dataset_owner_email"]; 
          $dataset_owner_phone = $row["dataset_owner_phone"]; 
           $dataset_steward_name = $row["dataset_steward_name"];
           $dataset_steward_email = $row["dataset_steward_email"];
           $dataset_steward_phone = $row["dataset_steward_phone"];
          $strat_priority_ID = $row["strat_priority_ID"];
          echo "<strong>Dataset Name- </strong>". $dataset_name. " <strong>Owner-</strong> ". $dataset_owner_name . 
          " <strong>Owner Email-</strong> ". $dataset_owner_email . " <strong>Owner Phone-</strong> ". $dataset_owner_phone
          . "<br>". " <strong>Steward Name-</strong> ". $dataset_steward_name . " <strong>Steward Email-</strong> ". $dataset_steward_email
          . " <strong>Steward Phone-</strong> ". $dataset_steward_phone. " <strong>KPI Name-</strong> ". $kpi_name . " <strong>Strategic Priority-</strong> ". $strat_priority_ID . "<br>". "<br>"; 
      }           
      }
    
    }
    else{
      echo "No result";
    }
    }else if($creteria=="strategicpriority"){
      $sql="SELECT A.dataset_Name, C.dataset_owner_name, C.dataset_owner_email, C.dataset_owner_phone,
        B.dataset_steward_email, B.dataset_steward_phone, B.dataset_steward_name,D.kpi_name,D.strat_priority_ID
      from dataset A 
        inner join dataset_steward B on A.dataset_steward_ID = B.dataset_steward_ID
        inner join dataset_owner C on A.dataset_owner_ID=C.dataset_owner_ID
        inner join kpi D on A.dataset_ID=D.dataset_ID";

      if ($result = mysqli_query($conn, $sql)) {
    /* fetch associative array */
    while ($row = $result->fetch_assoc()) {
      if($row["strat_priority_ID"]== $searchvalue){
          $dataset_name = $row["dataset_Name"]; 
          $dataset_owner_name = $row["dataset_owner_name"]; 
          $dataset_owner_email = $row["dataset_owner_email"]; 
          $dataset_owner_phone = $row["dataset_owner_phone"]; 
           $dataset_steward_name = $row["dataset_steward_name"];
           $dataset_steward_email = $row["dataset_steward_email"];
           $dataset_steward_phone = $row["dataset_steward_phone"];
           $kpi_name = $row["strat_priority_ID"];
           $strat_priority_ID = $row["strat_priority_ID"];
          echo "<strong>Dataset Name- </strong>". $dataset_name. " <strong>Owner-</strong> ". $dataset_owner_name . 
          " <strong>Owner Email-</strong> ". $dataset_owner_email . " <strong>Owner Phone-</strong> ". $dataset_owner_phone
          . "<br>". " <strong>Steward Name-</strong> ". $dataset_steward_name . " <strong>Steward Email-</strong> ". $dataset_steward_email
          . " <strong>Steward Phone-</strong> ". $dataset_steward_phone. " <strong>KPI Name-</strong> ". $kpi_name . " <strong>Strategic Priority-</strong> ". $strat_priority_ID . "<br>". "<br>"; 
      }           
      }
    
    }
    else{
      echo "No result";
    }
    }
// Close connection
mysqli_close($conn);
?>