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

if( isset( $_GET['delete'] ) )
{
  $query = 'DELETE FROM `stations`
    WHERE `station_id` = '.$_GET['delete'].'
    LIMIT 1';
  mysqli_query( $connect, $query );
    
  set_message( 'Station information has been deleted' );
  
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

<h2><?php echo htmlentities( $record['station_name'] ); ?></h2>

<div>Washroom:<?php echo $record['washroom']; ?></div>
<div>Accessible:<?php echo $record['accessibility']; ?></div>
<div>Streetcar:<?php echo $record['streetcar']; ?></div>

<a href="stations_edit.php?station_id=<?php echo $record['station_id']; ?>">Edit</a> |

<a href="stations.php?delete=<?php echo $record['station_id']; ?>" onclick="javascript:return confirm('Are you sure you want to delete this station?');">Delete</a>

<p><a href="stations.php"><i class="fas fa-arrow-circle-left"></i> Return to Station List</a></p>

<?php

include( 'includes/footer.php' );

?>
