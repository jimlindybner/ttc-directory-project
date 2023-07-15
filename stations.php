<?php

include( 'includes/database.php' );
include( 'includes/config.php' );
include( 'includes/functions.php' );

secure();

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

include( 'includes/header.php' );

$query = 'SELECT *
  FROM `stations`
  ORDER BY `station_name` ASC';
$result = mysqli_query( $connect, $query );

?>

<h2>Manage Stations</h2>

<table>
  <tr>
    <th align="left">Station Name</th>
    <th align="center">Washroom</th>
    <th align="center">Accessibility</th>
    <th align="center">Streetcar</th>
    <th></th>
    <th></th>
  </tr>
  <?php while( $record = mysqli_fetch_assoc( $result ) ): ?>
    <tr>
      <td align="left"><?php echo htmlentities( $record['station_name'] ); ?></td>
      <td align="center"><?php echo $record['washroom']; ?></td>
      <td align="center"><?php echo $record['accessibility']; ?></td>
      <td align="center"><?php echo $record['streetcar']; ?></td>
      <td align="center"><a href="stations_edit.php?station_id=<?php echo $record['station_id']; ?>">Edit</a></td>
      <td align="center">
        <a href="stations.php?delete=<?php echo $record['station_id']; ?>" onclick="javascript:return confirm('Are you sure you want to delete this station?');">Delete</a>
      </td>
    </tr>
  <?php endwhile; ?>
</table>

<p><a href="stations_add.php"><i class="fas fa-plus-square"></i> Add Station</a></p>

<?php

include( 'includes/footer.php' );

?>
