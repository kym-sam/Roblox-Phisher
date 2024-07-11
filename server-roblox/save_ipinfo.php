<?php

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $postData = file_get_contents('php://input');


    $data = json_decode($postData, true);

    if ($data === null && json_last_error() !== JSON_ERROR_NONE) {
        http_response_code(400); 
        die('Erro ao decodificar os dados JSON.');
    }

 
    $file = 'ipinfo.json';

    
    $fp = fopen($file, 'w');

    if (!$fp) {
        http_response_code(500); 
        die('Erro ao abrir o arquivo para escrita.');
    }

    
    fwrite($fp, json_encode($data, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));

    
    fclose($fp);

    http_response_code(200); 
    echo 'Dados de IP recebidos e salvos com sucesso.';
} else {
    http_response_code(405); 
    echo 'Método não permitido.';
}
?>
