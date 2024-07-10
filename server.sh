#!/bin/bash

# ─╔═══╗─╔═══╗─╔══╗──╔╗────╔═══╗─╔═╗╔═╗
# ─║╔═╗║─║╔═╗║─║╔╗║──║║────║╔═╗║─╚╗╚╝╔╝
# ─║╚═╝║─║║─║║─║╚╝╚╗─║║────║║─║║──╚╗╔╝─
# ─║╔╗╔╝─║║─║║─║╔═╗║─║║─╔╗─║║─║║──╔╝╚╗─
# ─║║║╚╗─║╚═╝║─║╚═╝║─║╚═╝║─║╚═╝║─╔╝╔╗╚╗
# ─╚╝╚═╝─╚═══╝─╚═══╝─╚═══╝─╚═══╝─╚═╝╚═╝
#   Start Script ==> Termux : bash start.sh

if [[ ! -d ".history" ]]; then
	mkdir -p ".history"
fi

if [[ -e ".server/.loclx" ]]; then
	rm -rf ".server/.loclx"

fi

if [[ -d ".server/.cld.log" ]]; then
	rm -rf ".server/.cld.log"    
fi
 printf "\e[1;92m"

whoami=$(command whoami)
pwd=$(command pwd)
date_time=$(date "+%Y-%m-%d %H:%M:%S")


start(){
echo -e "\n\033[37m[::] Loading Program..."
timeout 3s curl -fIs "https://www.youtube.com/" > /dev/null
if [[ $? -eq 0 ]]; then
echo -e "\n\033[32mUser Conected!\033[37m"
echo -e "WELCOME!"
echo -e "Date : $date_time\nUser : $whoami"
node index.js
else
echo -e ""
echo -e "\033[33mroblox \033[37mHello $whoami :)"
echo -e "\033[33mroblox \033[37mSoftware P 8080 $pwd"
echo -e "\033[33mroblox \033[37mstatus \033[31moff-line\033[37m..."

echo -e "\033[33mroblox \033[37mErro de Conexão| $date_time"

echo -e "\033[33mroblox \033[37mVerifique a sua rede wi-fi..."
start
fi
}

start;