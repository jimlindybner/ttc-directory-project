<?php

include( 'includes/database.php' );
include( 'includes/config.php' );
include( 'includes/functions.php' );

secure();

if( !isset( $_GET['station_id'] ) )
{
  header( 'Location: stations.php' );
  die();
}

if( isset( $_POST['station_name'] ) )
{
  if( $_POST['station_name'] and $_POST['washroom'] and $_POST['accessibility'] and $_POST['streetcar'] )
  {
    $query = 'UPDATE `stations` SET
      `station_name` = "'.mysqli_real_escape_string( $connect, $_POST['station_name'] ).'",
      `washroom` = "'.mysqli_real_escape_string( $connect, $_POST['washroom'] ).'",
      `accessibility` = "'.mysqli_real_escape_string( $connect, $_POST['accessibility'] ).'",
      `streetcar` = "'.mysqli_real_escape_string( $connect, $_POST['streetcar'] ).'"
      WHERE `station_id` = '.$_GET['station_id'].'
      LIMIT 1';
      
    mysqli_query( $connect, $query );
    
    set_message( 'Station information has been updated' );
  }

  header( 'Location: stations.php' );
  die();
}

if( isset( $_GET['station_id'] ) )
{
  $query = 'SELECT *
    FROM `stations`
    WHERE `station_id` = '.$_GET['station_id'].'
    LIMIT 1';
    
  $result = mysqli_query( $connect, $query );
  
  if( !mysqli_num_rows( $result ) )
  {
    header( 'Location: stations.php' );
    die();
  }
  
  $record = mysqli_fetch_assoc( $result );
}

include( 'includes/header.php' );

?>

<h2>Edit Station Information</h2>

<form method="post">
  <label for="station_name">Station Name:</label>
  <input type="text" name="station_name" id="station_name" value="<?php echo htmlentities( $record['station_name'] ); ?>">
  
  <br>
  
  <label for="washroom">Washroom Available:</label>
  <select name="washroom" id="washroom">
    <option value="Y" <?php if( $record['washroom'] == 'Y' ) echo 'selected="selected"'; ?>>Yes</option>
    <option value="N" <?php if( $record['washroom'] == 'N' ) echo 'selected="selected"'; ?>>No</option>
  </select>

  <br>

  <label for="accessibility">Accessibility:</label>
  <select name="accessibility" id="accessibility">
    <option value="Y" <?php if( $record['accessibility'] == 'Y' ) echo 'selected="selected"'; ?>>Yes</option>
    <option value="N" <?php if( $record['accessibility'] == 'N' ) echo 'selected="selected"'; ?>>No</option>
  </select>

  <br>

  <label for="streetcar">Streetcar Available:</label>
  <select name="streetcar" id="streetcar">
    <option value="Y" <?php if( $record['streetcar'] == 'Y' ) echo 'selected="selected"'; ?>>Yes</option>
    <option value="N" <?php if( $record['streetcar'] == 'N' ) echo 'selected="selected"'; ?>>No</option>
  </select>
  
  <br>
  
  <input type="submit" value="Edit Station">
  
</form>

<p><a href="stations.php"><i class="fas fa-arrow-circle-left"></i> Return to Station List</a></p>

<?php

include( 'includes/footer.php' );

?>
