#!/bin/bash

#script para instalar tudo que é útil para a utilização do linux após instalação do SO

#################################################################################################################################
#																#
#																#
#	ESTE SCRIPT PRECISA SER EXECUTADO COM PRIVILÉGIOS DE SUPERUSUÁRIO E SALVA ARQUIVOS NO DIRETÓRIO EM QUE É EXECUTADO	#
#																#
#																#
#################################################################################################################################

DESTDIR=${DESTDIR:-$(pwd)}

main(){
	echo Instalador de pacotes automatico!
	echo
	echo Pacotes e funções disponíveis:
	echo 1 - Atualizar sistema
	echo 2 - Atom
	echo 3 - Chrome
	echo 4 - Dropbox
	echo 5 - Opera
	echo 6 - Spotify
	echo 7 - Telegram
	echo 8 - Virtualbox
	echo 9 - Vim
	echo 10 - Vlc
	echo 11 - Whatsapp
	echo 12 - Instalar tudo
	echo 13 - Cancelar
	echo
	echo -n Selecione um pacote para baixar e instalar: ; read opcao
	clear
	
	tratativa
	escolhas "$opcao"
}

tratativa(){
	while [ $opcao -le 0 -o $opcao -ge 14 ]
	do
		main
	done
}


escolhas(){
	case $1 in
	
		"1")
			opcao_1
		;;

		"2")
			opcao_2
		;;

		"3")
			opcao_3
		;;

		"4")
			opcao_4
		;;
		
		"5")
			opcao_5
		;;

		"6")
			opcao_6
		;;

		"7")
			opcao_7
		;;

		"8")
			opcao_8
		;;

		"9")
			opcao_9
		;;

		"10")
			opcao_10
		;;

		"11")
			opcao_11
		;;
		
		"12")
			opcao_12
		;;

		"13")
			clear
			echo -n Voce realmente deseja sair? [Y/n] ; read opcao
			while [ $opcao != "y" ] && [ $opcao != "n" ]
			do
				clear
				echo -n Voce realmente deseja sair? [Y/n] ; read opcao
			done
				if [ $opcao = "n" ]
				then
					main
				elif [ $opcao = "y" ]
				then
					fim
				fi
		;;
	esac
}

opcao_1(){
	clear
	echo Atualizando sistema!
	sudo apt-get update
	sudo apt-get upgrade -y
	forca_instalacao
	echo Atualizacao concluida!
	main
}

opcao_2(){	
	echo Baixando e instalando Atom!
	wget https://atom.io/download/deb -O "${DESTDIR}"/atom
	sudo dpkg -i atom
	forca_instalacao
	clear
	echo Insltalacao concluida!
	main
}

opcao_3(){	
	echo Baixando e instalando Chrome
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O "${DESTDIR}"/chrome
	sudo dpkg -i chrome
	forca_instalacao
	clear
	echo Insltalacao concluida!
	main
}

opcao_4(){
	echo Baixando e instalando Dropbox
	wget https://www.dropbox.com/download?dl=packages/debian/dropbox_2015.10.28_amd64.deb -O "${DESTDIR}"/dropbox
	sudo dpkg -i dropbox
	forca_instalacao
	clear
	echo Insltalacao concluida!
	main
}

opcao_5(){
	echo Baixando e instalando Opera
	sudo apt-get install apt-transport-https
	wget http://deb.opera.com/opera/pool/non-free/o/opera-stable/opera-stable_43.0.2442.806_amd64.deb -O "${DESTDIR}"/opera
	sudo dpkg -i opera
	forca_instalacao
	clear
	echo Insltalacao concluida!
	main
}

opcao_6(){
	echo Baixando e instalando Spotify
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get update
	sudo apt-get install spotify-client
	forca_instalacao
	clear
	echo Insltalacao concluida!
	main
}

opcao_7(){
	echo Baixando e instalando Telegram
	wget https://telegram.org/dl/desktop/linux -O "${DESTDIR}"/telegram
	tar xvf telegram
	cd Telegram
	chmod +x Telegram
	./Telegram
	forca_instalacao
	clear
	echo Insltalacao concluida!
	main
}

opcao_8(){
	echo Baixando e instalando virtualbox
	wget download.virtualbox.org/virtualbox/5.1.14/virtualbox-5.1_5.1.14-112924~Debian~jessie_amd64.deb -O "${DESTDIR}"/virtualbox
	sudo dpkg -i virtualbox
	forca_instalacao
	clear
	echo Insltalacao concluida!
	main
}

opcao_9(){
	echo Baixando e instalando Vim
	sudo apt-get install vim -y
	forca_instalacao
	clear
	echo Insltalacao concluida!
	menu
}

opcao_10(){
	echo Baixando e instalando Vlc
	sudo apt-get install vlc -y
	forca_instalacao
	clear
	echo Insltalacao concluida!
	menu
}

opcao_11(){
	echo Baixando e instalando Whatsapp
	wget "https://etecspgov-my.sharepoint.com/personal/weslei_pinto_etec_sp_gov_br/_layouts/15/guestaccess.aspx?docid=19ed46acea92b4954b9ad85ca31b04b41&authkey=AYA1XB8vdIevrDSE-SO0m-I" -O "${DESTDIR}"/whatsie
	dpkg -i whatsie
	forca_instalacao
	clear
	echo Insltalacao concluida!
	main
}	

opcao_12(){
	clear
	echo Atualizando sistema!
	sudo apt-get update
	sudo apt-get upgrade -y
	forca_instalacao
	echo Atualizacao concluida!
	echo Baixando e instalando Atom!
	wget https://atom.io/download/deb -O "${DESTDIR}"/atom
	sudo dpkg -i atom
	forca_instalacao
	echo Insltalacao concluida!
	echo Baixando e instalando Chrome
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O "${DESTDIR}"/chrome
	sudo dpkg -i chrome
	forca_instalacao
	echo Insltalacao concluida!
	echo Baixando e instalando Dropbox
	wget https://www.dropbox.com/download?dl=packages/debian/dropbox_2015.10.28_amd64.deb -O "${DESTDIR}"/dropbox
	sudo dpkg -i dropbox
	forca_instalacao
	echo Insltalacao concluida!
	echo Baixando e instalando Opera
	wget http://deb.opera.com/opera/pool/non-free/o/opera-stable/opera-stable_43.0.2442.806_amd64.deb -O "${DESTDIR}"/opera
	sudo dpkg -i opera
	forca_instalacao
	echo Insltalacao concluida!
	echo Baixando e instalando Spotify
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get update
	sudo apt-get install spotify-client -y
	forca_instalacao
	echo Insltalacao concluida!
	echo Baixando e instalando virtualbox
	wget download.virtualbox.org/virtualbox/5.1.14/virtualbox-5.1_5.1.14-112924~Debian~jessie_amd64.deb -O "${DESTDIR}"/virtualbox
	sudo dpkg -i virtualbox
	forca_instalacao
	echo Insltalacao concluida!
	echo Baixando e instalando Vim
	sudo apt-get install vim -y
	forca_instalacao
	echo Insltalacao concluida!
	echo Baixando e instalando Vlc
	sudo apt-get install vlc -y
	forca_instalacao
	echo Baixando e instalando Whatsapp
	wget "https://etecspgov-my.sharepoint.com/personal/weslei_pinto_etec_sp_gov_br/_layouts/15/guestaccess.aspx?docid=19ed46acea92b4954b9ad85ca31b04b41&authkey=AYA1XB8vdIevrDSE-SO0m-I" -O "${DESTDIR}"/whatsie
	dpkg -i whatsie
	forca_instalacao
	echo Insltalacao concluida!
	echo Baixando e instalando Telegram
	wget https://telegram.org/dl/desktop/linux -O "${DESTDIR}"/telegram
	tar xvf telegram
	cd Telegram
	chmod +x Telegram
	./Telegram
	forca_instalacao
	echo Insltalacoes concluidas!
	echo -n Voce deseja ficar com os pacotes em sua maquina? [Y/n] ; read opcao
	while [ $opcao != "y" ] && [ $opcao != "n" ]
		do
			clear
			echo -n Voce deseja ficar com os pacotes em sua maquina? [Y/n] ; read opcao
		done
			if [ $opcao = "n" ]
			then
				rm "${DESTDIR}"/atom; rm "${DESTDIR}"/chrome; rm "${DESTDIR}"/dropbox; rm "${DESTDIR}"/opera; rm "${DESTDIR}"/telegram; rm "${DESTDIR}"/virtualbox; rm "${DESTDIR}"/whatsie
			elif [ $opcao = "y" ]
			then
				fim
			fi
}

forca_instalacao(){
	sudo apt-get install -f -y
}

fim(){
	exit
}
main
