<?php

include( 'includes/database.php' );
include( 'includes/config.php' );
include( 'includes/functions.php' );

secure();

if( isset( $_GET['delete'] ) )
{
  
  $query = 'DELETE FROM users
    WHERE user_id = '.$_GET['delete'].'
    LIMIT 1';
  mysqli_query( $connect, $query );
  
  set_message( 'User has been deleted' );
  
  header( 'Location: users.php' );
  die();
  
}

include( 'includes/header.php' );

$query = 'SELECT *
  FROM users 
  '.( ( $_SESSION['user_id'] != 1 and $_SESSION['user_id'] != 4 ) ? 'WHERE id = '.$_SESSION['user_id'].' ' : '' ).'
  ORDER BY last,first';
$result = mysqli_query( $connect, $query );

?>

<h2>Manage Users</h2>

<table>
  <tr>
    <th align="center">ID</th>
    <th align="left">Name</th>
    <th align="left">Email</th>
    <th></th>
    <th></th>
    <th>Active</th>
  </tr>
  <?php while( $record = mysqli_fetch_assoc( $result ) ): ?>
    <tr>
      <td align="center"><?php echo $record['user_id']; ?></td>
      <td align="left"><?php echo htmlentities( $record['first'] ); ?> <?php echo htmlentities( $record['last'] ); ?></td>
      <td align="left"><a href="mailto:<?php echo htmlentities( $record['email'] ); ?>"><?php echo htmlentities( $record['email'] ); ?></a></td>
      <td align="center"><a href="users_edit.php?user_id=<?php echo $record['user_id']; ?>">Edit</a></td>
      <td align="center">
        <?php if( $_SESSION['user_id'] != $record['user_id'] ): ?>
          <a href="users.php?delete=<?php echo $record['user_id']; ?>" onclick="javascript:confirm('Are you sure you want to delete this user?');">Delete</a>
        <?php endif; ?>
      </td>
      <td align="center">
        <?php echo $record['active']; ?>
      </td>
    </tr>
  <?php endwhile; ?>
</table>

<p><a href="users_add.php"><i class="fas fa-plus-square"></i> Add User</a></p>


<?php

include( 'includes/footer.php' );

?>