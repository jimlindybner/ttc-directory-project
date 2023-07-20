<?php

$connect = mysqli_connect( 
    "<<DB HOST>>", // Host
    "<<DB USER>>", // Username
    "<<DB PASSWORD>>", // Password
    "<<DATABASE>>" // Database
);

mysqli_set_charset( $connect, 'UTF8' );
