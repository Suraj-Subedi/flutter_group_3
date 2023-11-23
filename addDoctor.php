<?php

if (!isset($_POST['token'])) {
    echo json_encode([
        "success" => false,
        "message" => "Token not found!"
    ]);
    die();
}

include "./database/connection.php";
include "./helpers/auth.php";

$token = $_POST['token'];

if (!isHospital($token)) {
    echo json_encode([
        "success" => false,
        "message" => "You are not authorized!"
    ]);
    die();
}

global $CON;

if (isset($_POST['name'])) {

    $name = $_POST['name'];
    $consultation_charge = $_POST['consultation_charge'];
    $hospital_id = $_POST['hospital_id'];
    $specialization_id = $_POST['specialization_id'];
    $avatar = $_POST['avatar'];
    $experience = $_POST['experience'];

    $sql = "INSERT INTO doctors (name, consultation_charge, hospital_id, specialization_id, avatar, experience) VALUES ('$name', '$consultation_charge', '$hospital_id', '$specialization_id', '$avatar', '$experience')";

    $result = mysqli_query($CON, $sql);

    if (!$result) {
        echo json_encode([
            "success" => false,
            "message" => "Doctor not added!"
        ]);
        die();
    } else {
        echo json_encode([
            "success" => true,
            "message" => "Doctor added successfully!"
        ]);
        die();
    }
} else {
    echo json_encode([
        "success" => false,
        "message" => "name, consultation_charge, hospital_id, specialization_id, avatar, experience are required!"
    ]);
    die();
}
