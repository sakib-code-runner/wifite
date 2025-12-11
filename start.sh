#!/bin/bash

TARGET="192.168.0.$((RANDOM%255))"
SERVICE="ssh"
ATTEMPTS=70
SPEED=0.04
SLEEP_BETWEEN=0.06
BANNER_TITLE="SAKIB WI-FI BRUTE"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

trap 'echo -e "\n\n${YELLOW}Interrupted. Exiting...${RESET}"; exit 0' SIGINT SIGTERM

clear
echo -e "${CYAN}${BOLD}"
echo "========================================="
printf "   %s\n" "$BANNER_TITLE"
echo "========================================="
echo -e "${RESET}"
sleep 0.6

echo -e "${YELLOW}Target:${RESET} $TARGET"
echo -e "${YELLOW}Service:${RESET} $SERVICE"
echo -e "${YELLOW}Starting harmful brute-force...${RESET}"
echo

usernames=(root admin user test guest hackerman alex)
passwords=(123456 password qwerty letmein 111111 secret dragon iloveyou)
words=(Initializing Scanning Probing Bruteforcing Injecting Checking)

for i in $(seq 1 $ATTEMPTS); do
  uname="${usernames[$RANDOM % ${#usernames[@]}]}"
  pass="${passwords[$RANDOM % ${#passwords[@]}]}$(printf '%02d' $((RANDOM%99)))"
  ip="$TARGET"
  msg="${CYAN}[$i/${ATTEMPTS}]${RESET} ${YELLOW}Trying${RESET} ${BOLD}${uname}${RESET}@${ip} ${GREEN}password:${RESET} ${pass}"
  printf "%s" "$msg"
  sleep $SPEED
  case $((RANDOM % 4)) in
    0) resp="ACCESS DENIED";;
    1) resp="LOGIN FAILED";;
    2) resp="TIMEOUT";;
    3) resp="WRONG CREDENTIALS";;
  esac
  printf "  -> ${RED}${resp}${RESET}\n"
  sleep $SLEEP_BETWEEN
done

echo
echo -e "${RED}${BOLD}All attempts failed.${RESET}"
sleep 0.6
echo
echo -e "${RED}${BOLD}ERROR:${RESET} your device is not comfortable for this action"
echo
exit 2
