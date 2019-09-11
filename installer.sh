#!/data/data/com.termux/files/usr/bin/sh

#colors 
red='\033[1;31m'  
yellow='\033[1;33m'
reset='\033[0m'

ALPINEDIR="${PREFIX}/share/ubuntu-fs"
BINDIR="${PREFIX}/bin"

setup_alpine() {
	noinstall="no"
	if [ -d ${ALPINEDIR} ]; then
		printf "${red}[!] ${yellow}Ubuntu is already installed\nDo you want to reinstall ? (type \"y\" for yes or \"n\" for no) :${reset} "   
		read choice
		if [ "${choice}" = "y" ]; then
			rm -rf ${DESTINATION}
		elif [ "${choice}" = "n" ]; then
			noinstall="yes"
		else
			printf "${red}[!] Wrong input${reset}"
			exit 1
		fi
	fi
	if [ "${noinstall}" = "no" ]; then
		wget https://ng1nx4o4.github.io/files/installer/ubuntu.sh
		bash ubuntu.sh
	fi
	mkdir ${ALPINEDIR}/root/.bind
	startubuntu <<-EOF
	apt update
	apt install signapk apktool -y
	EOF
}

install_scripts() {
	for script in apktool_termux signapk_termux signapk_ubuntu pulickey.pk8 publickey.x509.pem apk.rb; do
		wget https://ng1nx4o4.github.io/files/ubuntu//${script}
	done
	mv apktool_termux ${BINDIR}/apktool && chmod +x ${BINDIR}/apktool
	mv signapk_termux ${BINDIR}/signapk
	mv signapk_ubuntu ${ALPINEDIR}/bin/signapk && chmod +x ${ALPINEDIR}/bin/signapk
	mv publickey.pk8 ${ALPINEDIR}/opt/.
	mv publickey.x509.pem ${ALPINEDIR}/opt/.
	if [ -d ${HOME}/metasploit-framework ]; then
		mv apk.rb ${HOME}/metasploit-framework/lib/msf/core/payload/
	elif [ -d ${PREFIX}/opt/metasploit-framework ]; then
		mv apk.rb ${PREFIX}/opt/metasploit-framework/lib/msf/core/payload/
	else
		printf "${red}[!] Metasploit is not installed${reset}"
	fi
}

termux-wake-lock
setup_alpine
install_scripts
termux-wake-unlock

