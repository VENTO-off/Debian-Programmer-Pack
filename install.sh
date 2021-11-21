#!/bin/bash

clear

reset_color=`echo "\033[m"`
green_color=`echo "\033[0;32m"`
bold_green_color=`echo "\033[1;32m"`
yellow_color=`echo "\033[0;31m"`
printf "${green_color}**************************************************${reset_color}\n"
printf "${green_color}* ${bold_green_color}Debian Programmer Pack v1.0 (Powered by VENTO) ${green_color}*${reset_color}\n"
printf "${green_color}**************************************************${reset_color}\n"
printf "${green_color}* ${yellow_color}[1]${green_color} Install GNOME theme & extensions \t\t${green_color} *${reset_color}\n"
printf "${green_color}* ${yellow_color}[2]${green_color} Install applications for programming \t${green_color} *${reset_color}\n"
printf "${green_color}* ${yellow_color}[3]${green_color} Install JetBrains Toolbox \t\t${green_color} *${reset_color}\n"
printf "${green_color}* ${yellow_color}[4]${green_color} Install JDK${reset_color} \t\t\t\t${green_color} *\n"
printf "${green_color}* ${yellow_color}[5]${green_color} Install favorites applications & shortcuts ${green_color}*${reset_color}\n"
printf "${green_color}**************************************************${reset_color}\n\n"

echo "Install all the components in the correct order!"
echo -n "Enter component number to install (q - quit): "

read opt
while [ $opt != '' ]
	do
	if [ $opt = '' ]; then
		exit;
	else
		case $opt in
		1) 	bash scripts/01_theme_setup.sh
			break;
			;;
		2) 	sudo bash scripts/02_programs_setup.sh
			break;
			;;
		3) 	bash scripts/03_jetbrains_setup.sh
			break;
			;;
		4) 	sudo bash scripts/04_jdk_setup.sh
			break;
			;;
		5) 	bash scripts/05_favorites_setup.sh
			break;
			;;
		q) 	exit;
			;;
		*) 	echo "Invalid input! Try again.";
			break;
			;;
		esac
	fi
done
