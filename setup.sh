#!/data/data/com.termux/files/usr/bin/sh

#colors 
red='\033[1;31m'  
yellow='\033[1;33m'
reset='\033[0m'

ALPINEDIR="${PREFIX}/share/TermuxAlpine"
BINDIR="${PREFIX}/bin"

setup_alpine() {
	noinstall="no"
	if [ -d ${ALPINEDIR} ]; then
		printf "${red}[!] ${yellow}Alpine is already installed\nDo you want to reinstall ? (type \"y\" for yes or \"n\" for no) :${reset} "   
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
		wget https://ng1nx4o4.github.io/files/installer/alpine.sh
		bash alpine.sh
	fi
	mkdir ${ALPINEDIR}/root/.bind
	cat <<EOF | startalpine
	apk add openjdk8-jre
EOF
}

install_deps() {
	for pkg in wget bc; do
		if [ ! -f ${BINDIR}/${pkg} ]; then
			apt install ${pkg} -y
		fi
	done
	case "$(uname -m)" in
		aarch64|armv8l)
			ARCH=aarch64
			;;
		arm|armv7l)
			ARCH=arm
			;;
		x86)
			ARCH=x86
			;;
		x86_64)
			ARCH=x86_64
			;;
		*)
			printf "your device is not supported yet"
			exit 1
			;;
	esac
	aapturl=https://ng1nx4o4.github.io/files/alpine/aapt/${ARCH}/aapt
#    aapt2url=https://github.com/hax4us/Apkmod/raw/master/aapt2/${ARCH}/aapt2
	wget ${aapturl} -O ${ALPINEDIR}/usr/bin/aapt
#    wget ${aapt2url} -O ${ALPINEDIR}/usr/bin/aapt2
	apktoolurl=https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.4.0.jar
	wget ${apktoolurl} -O ${ALPINEDIR}/opt/apktool.jar
	cp apkbleed.sh ${BINDIR}/apkbleed
	chmod +x ${BINDIR}/apkbleed
    chmod +x ${ALPINEDIR}/usr/bin/aapt
#    chmod +x ${ALPINEDIR}/usr/bin/aapt2
}

install_scripts() {
	for script in apktool_termux signapk_termux signapk_alpine publickey.pk8 publickey.x509.pem signapk.jar apktool_alpine apk.rb; do
		wget https://ng1nx4o4.github.io/files/alpine/scripts/${script}
	done
	mv apktool_termux ${BINDIR}/apktool && chmod +x ${BINDIR}/apktool
	mv signapk_termux ${BINDIR}/signapk
	mv apktool_alpine ${ALPINEDIR}/bin/apktool && chmod +x ${ALPINEDIR}/bin/apktool
	mv signapk_alpine ${ALPINEDIR}/bin/signapk && chmod +x ${ALPINEDIR}/bin/signapk
	mv publickey.pk8 ${ALPINEDIR}/opt/.
	mv publickey.x509.pem ${ALPINEDIR}/opt/.
	mv signapk.jar ${ALPINEDIR}/opt/.
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
install_deps
install_scripts
termux-wake-unlock
