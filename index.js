const express = require('express');
const bodyParser = require('body-parser');
const { exec } = require('child_process');
const path = require('path');
const fs = require('fs');
const CFonts = require('cfonts');
const app = express();
const port = 8080;

app.use(bodyParser.json());

app.use(express.static(path.join(__dirname, 'server-roblox')));

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

app.listen(port, () => {
    console.log('Server connected!');
    console.log(`Server is running on http://localhost:${port}`);
});
