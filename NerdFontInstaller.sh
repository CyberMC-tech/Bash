#!/bin/bash

TEMP=$(mktemp)
FONTS=(
"3270"
"Agave"
"AnonymicePro"
"Arimo"
"AurulentSansM"
"BigBlueTerm"
"BitstromWera"
"CaskaydiaCove"
"BlexMono"
"CodeNewRoman"
"ComicShannsMono"
"Cousine"
"DaddyTimeMono"
"DejaVuSansM"
"DroidSansM"
"EnvyCodeR"
"FantasqueSansM"
"FiraCode"
"FiraMono"
"GohuFont"
"GoMono"
"Hack"
"Hasklug"
"HeavyData"
"Hurmit"
"iMWriting"
"Inconsolata"
"InconsolataGo"
"InconsolataLGC"
"Iosevka"
"IosevkaTerm"
"JetBrainsMono"
"Lekton"
"LiterationMono"
"Lilex"
"MesloLG"
"Monofur"
"Monoid"
"Mononoki"
"MPlus"
"Noto"
"OpenDyslexic"
"Overpass"
"ProFont"
"ProggyClean"
"RobotoMono"
"ShureTechMono"
"SauceCodePro"
"SpaceMono"
"Symbols"
"Terminess"
"Tinos"
"Ubuntu"
"UbuntuMono"
"VictorMono"
)

 bold=$(echo -en "\e[1m")
 underline=$(echo -en "\e[4m")
 dim=$(echo -en "\e[2m")
 strickthrough=$(echo -en "\e[9m")
 blink=$(echo -en "\e[5m")
 reverse=$(echo -en "\e[7m")
 hidden=$(echo -en "\e[8m")
 normal=$(echo -en "\e[0m")
 black=$(echo -en "\e[30m")
 red=$(echo -en "\e[31m")
 green=$(echo -en "\e[32m")
 orange=$(echo -en "\e[33m")
 blue=$(echo -en "\e[34m")
 purple=$(echo -en "\e[35m"2)
 aqua=$(echo -en "\e[36m")
 gray=$(echo -en "\e[37m")
 darkgray=$(echo -en "\e[90m")
 lightred=$(echo -en "\e[91m")
 lightgreen=$(echo -en "\e[92m")
 lightyellow=$(echo -en "\e[93m")
 lightblue=$(echo -en "\e[94m")
 lightpurple=$(echo -en "\e[95m")
 lightaqua=$(echo -en "\e[96m")
 white=$(echo -en "\e[97m")
 default=$(echo -en "\e[39m")
 BLACK=$(echo -en "\e[40m")
 RED=$(echo -en "\e[41m")
 GREEN=$(echo -en "\e[42m")
 ORANGE=$(echo -en "\e[43m")
 BLUE=$(echo -en "\e[44m")
 PURPLE=$(echo -en "\e[45m")
 AQUA=$(echo -en "\e[46m")
 GRAY=$(echo -en "\e[47m")
 DARKGRAY=$(echo -en "\e[100m")
 LIGHTRED=$(echo -en "\e[101m")
 LIGHTGREEN=$(echo -en "\e[102m")
 LIGHTYELLOW=$(echo -en "\e[103m")
 LIGHTBLUE=$(echo -en "\e[104m")
 LIGHTPURPLE=$(echo -en "\e[105m")
 LIGHTAQUA=$(echo -en "\e[106m")
 WHITE=$(echo -en "\e[107m")
 DEFAULT=$(echo -en "\e[49m")

_help(){
    echo -e "\n${lightblue}Usage: ${lightpurple}$0 ${green}[OPTION]... -f, --font <font_name> | -a, --all${normal}"
    echo -e "\n${lightpurple} -a, --all       ${green}Install all fonts"
    echo -e "\n${lightpurple} -f, --font      ${green}Follow with <font_name>"
    echo -e "\n${lightpurple} -h, --help      ${green}Print this dialog and exit"
    echo -e "\n${lightpurple} -l, --list      ${green}List all available fonts"
    echo -e "\n\n${lightpurple} EXAMPLE: ${green}$0 -f VictorMono${normal}\n"
    exit 0
}


_all(){
echo -e "\n${lightred}${blink}${bold}CAUTION: ${normal}${lightaqua}This will install every font.\n"
printf "\nTo continue please type \"YES\" :"
read -r confirm
if [[ $confirm == "YES" ]]; then
    for i in "${FONTS[@]}"; do
        $0 -f "$i"
    done
else
    echo -e "\nAborting installation..."
    sleep 1
    exit 0
fi
}


_list_fonts(){
local num=1
for i in "${FONTS[@]}"; do
    echo "${lightaqua}${num}.) ${lightyellow}${i}${normal}"
    (( num++ ))
done


}


_install(){
sudo mkdir "$DIR" 
wget -q --show-progress "$URL" -O "$TEMP"
sudo unzip "$TEMP" -d "$DIR"
sudo rm -rf "$TEMP"
echo "${aqua}$font Nerd Font ${normal}has been successfully installed."
sleep 1
exit 0
}

_begin(){
if [[ -d "$DIR" ]];
then
    echo -e "\n${DIR} already exists."
    echo -e "\nWould you like to remove it and try again?\n"
    echo -en "[${lightgreen}Yes${normal}|${lightred}no${normal}] :"
    read -r ans
    _check_ans
else
    _install
fi
}

_check_ans(){
  case "$ans" in
    yes|Yes|YES|Y|y|" ")
        sudo rm -rf "$DIR" && _install
        ;;
    no|No|NO|n|N)
        echo -e "\nAborting installation"
        sleep 1
        exit 1
        ;;
    *)
        _valid_answer
        ;;
esac
}


_valid_answer(){
echo -e "\n Please enter a valid response"
echo -e "\nWould you like to remove it and try again?\n"
printf "[Yes|no] :"
read -r ans
_check_ans
}

if (( $# > 0 )); then
    case $1 in
        -l|--list)
            _list_fonts
            ;;
        -h|--help)
            _help
            ;;
        -f|--font)
            font="$2"
            URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/${font}.zip"
            DIR="/usr/share/fonts/truetype/${font}"
            _begin
            ;;
        -a|--all)
            _all
            ;;
    esac
else
    _help
fi


