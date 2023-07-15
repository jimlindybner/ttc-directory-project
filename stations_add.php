<?php

include( 'includes/database.php' );
include( 'includes/config.php' );
include( 'includes/functions.php' );

// secure();

if( isset( $_POST['station_name'] ) )
{
  
  if( $_POST['station_name'] and $_POST['washroom'] and $_POST['accessibility'] and $_POST['streetcar'] )
  {
    
    $query = 'INSERT INTO `stations` (
        `station_name`,
        `washroom`,
        `accessibility`,
        `streetcar`
      ) VALUES (
         "'.mysqli_real_escape_string( $connect, $_POST['station_name'] ).'",
         "'.mysqli_real_escape_string( $connect, $_POST['washroom'] ).'",
         "'.mysqli_real_escape_string( $connect, $_POST['accessibility'] ).'",
         "'.mysqli_real_escape_string( $connect, $_POST['streetcar'] ).'"
      )';
    mysqli_query( $connect, $query );
    
    set_message( 'Station has been added' );
    
  }
  
  header( 'Location: stations.php' );
  die();
  
}

include( 'includes/header.php' );

?>

<h2>Add Station</h2>

<form method="post">
  
  <label for="station_name">Station Name:</label>
  <input type="text" name="station_name" id="station_name">
    
  <br>
  
  <label for="washroom">Washroom:</label>
  <select name="washroom" id="washroom">
    <option value="Y">Yes</option>
    <option value="N">No</option>
  </select>

  <br>

  <label for="accessibility">Accessibility:</label>
  <select name="accessibility" id="accessibility">
    <option value="Y">Yes</option>
    <option value="N">No</option>
  </select>

  <br>

  <label for="streetcar">Streetcar:</label>
  <select name="streetcar" id="streetcar">
    <option value="Y">Yes</option>
    <option value="N">No</option>
  </select>
  
  <br>
  
  <input type="submit" value="Add Station">
  
</form>

<p><a href="stations.php"><i class="fas fa-arrow-circle-left"></i> Return to Station List</a></p>


<?php

include( 'includes/footer.php' );

?>
