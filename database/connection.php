<?php

$HOST = 'localhost';
$USER = 'root';
$PASS = '';
$DB = 'doctor_appointment_system_database';

$CON = mysqli_connect($HOST, $USER, $PASS, $DB);

if (!$CON) {

    echo 'Connection failed';
}
