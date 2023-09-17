<?php

include "../database/connection.php";

if (isset($_POST['email'], $_POST['password'])) {

    $email = $_POST['email'];
    $password = $_POST['password'];

    global $CON;

    $sql = "select * from users where email ='$email'";

    $result = mysqli_query($CON, $sql);

    if ($result) {
        $count = mysqli_num_rows($result);
        if ($count == 0) {
            echo json_encode(array([
                "success" => false,
                "message" => "User does not exists!"
            ]));
            die();
        }

        $row = mysqli_fetch_assoc($result);
        $hashed_password = $row['password'];
        $is_correct = password_verify($password, $hashed_password);

        if (!$is_correct) {
            echo json_encode(array([
                "success" => false,
                "message" => "Password is incorrect!"
            ]));
            die();
        }

        $token = bin2hex(random_bytes(32));
        $userId = $row['user_id'];
        $role = $row['role'];

        $sql = "insert into personal_access_token (user_id,token) values ('$userId','$token')";
        $result = mysqli_query($CON, $sql);

        if ($result) {
            echo json_encode(array([
                "success" => true,
                "message" => "User logged in Successfully!",
                "token" => $token,
                "role" => $role
            ]));
        } else {

            echo json_encode(array([
                "success" => false,
                "message" => "User login failed!"
            ]));
        }
    } else {
        echo json_encode(array([
            "success" => false,
            "message" => "Something went wrong!"
        ]));
        die();
    }
} else {
    echo json_encode(array([
        "success" => false,
        "message" => "Email and password is required!"
    ]));
}
