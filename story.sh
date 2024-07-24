#!/bin/bash
#Script file that makes all the decisions

#health variable
health=40
#formatting
bold=$(tput bold)
entry='\033[0;32m'
other='\033[0;34m'

while (( $health > 0 )) ; do
figlet Escape the City
echo -e "${entry}${bold}"
cat entry
cd day1
echo -e "${entry}${bold}"
figlet Day 1
cat day1entry


echo -e "${other}"
read input
if [[ "$input" == "s" ]]; then
cd home
cat stay
display home.jpg
echo Health: $health
elif [[ "$input" == "g" ]]; then
cd grocery
echo -e "${entry}${bold}"
#this part of the story measures how much common sense the player has
#not done in separate file since the users choices in the terminal will add to a variable that is used to determine how much health is added
echo You made it to the grocery store safely. You see some items on the shelves.
display grocery.jpg
echo You have limited space in your bag for only four items.
echo Choose wisely. Your decisions impact how much health you get.

echo -e "${other}"
#begin decisions
echo Pick a drink. Type g for gatorade, w for water, or j for juice
read input
if [[ "$input" == "g" ]]; then
let health+=10
fi
echo Next, choose a weapon. Type m for machette, b for baseball bat, or p for pocketknife
read input
if [[ "$input" == "m" ]]; then
let health+=10
fi
echo Next, choose a clothing item. Type s for sweater, so for socks, or d for dress
read input
if [[ "$input" == "s" ]]; then
let health+=10
fi
echo Lastly, choose a food: c for chips, ch for chocolate, or cb for canned beans
read input
if [[ "$input" == "cb" ]]; then
let health+=10
fi
echo Lets see how good your decisions were. Health: $health

#end of item selection, enter zombie
cat wayback
read input
if [[ "$input" == "f" ]]; then
	echo "You touched a zombie while fighting and died."
	break
elif [[ "$input" == "h" ]]; then
	echo "Good call. You hide behind the nearest building until the zombie loses trace of you. You survived, but all the running made you tired and you lose health."
	let health-=10
	echo Health: $health
#end of wayback
fi
cd ..
cd home
cat returned
fi #grocery store end
figlet Day 2
cd ..
cd ..
echo -e "${entry}${bold}"
cd day2
cat day2entry
echo -e "${other}"
let health-=20
echo Health: $health
read input
if [[ "$input" == "c" ]]; then
    cd closed
    echo -e "${entry}${bold}"
    cat closedentry
    echo -e "${other}"
    magick display hallway.jpg
    read input
    if [[ "$input" == "r" ]]; then
    echo "You find an elevator and safely reach the medicine cabinet on the ground floor and safely make it back to your hotel room"
    echo "The rest of the day passes by smoothly"
    let health+=20
    cd ..
    cd ..
    
	elif [[ "$input" == "l" ]]; then
    cd lefthallway
    cat lefthallwayentry
    read input
    if [[ "$input" == "d" ]]; then
    echo "You successfully dodge once, but the zombie goes back for another hit and strikes. You've been infected! Instant death."
    break
    elif [[ "$input" == "w" ]]; then
    echo "You attack with your weapon, and luckily, you strike. The zombie is beheaded and you are left untouched. You make it safely to the medicine cabinet and back"
    let health+=20
    echo Health: $health
    cd ..
    cd ..
    cd ..
    
    fi
	#end of hallway
	fi

   
elif [[ "$input" == "o" ]]; then
   cd opened
   echo -e "${entry}${bold}"
   cat openedentry
   echo -e "${other}"
   let health+=20
   echo Health: $health
   aafire
   cat openedcont
   read input
   #choosing to kick out or save coworker
   if [[ "$input" == "k" ]]; then
    echo "How cruel! Your coworker was just nervous! Soon after you kick him out, you hear him scream and realize you wrongfully accused him of being infected. You become guilty and depressed for the remainder of the night"
    let health-=10
    elif [[ "$input" == "s" ]]; then
    echo "Good decision. Your coworker is in fact fine, and proves himself useful to you and boosts your morale"
    let health+=10
    fi
    echo Health: $health
    cd ..
    cd ..

#day 2 end
fi

figlet Day 3
cd day3
echo -e "${entry}${bold}"
let health-=20
echo Health: $health
cat day3entry
echo -e "${other}"
#returns reverse of whatever string you type
echo Type letter as shown to decrypt: noitats niart
echo Press enter and ctrl+c when finished
rev
cat day3cont
sl
#enter decision for trains
read input
#train a=instnat success
if [[ "$input" == "a" ]]; then
    cat traina
    figlet Success!
elif [[ "$input" == "b" ]]; then
    cd trainb
    echo -e "${entry}${bold}"
    cat trainbentry
    echo -e "${other}"
    read input
    if [[ "$input" == "r" ]]; then
    	cat run
   		let health-=100
    elif [[ "$input" == "f" ]]; then
    	cat fight
    	read input
    	if [[ "$input" == "a" ]]; then
    		#switching results in success
    		#move path A's end to this directory and run
    		mv ../traina .
    		cat traina
    		figlet Success!
    	elif [[ "$input" == "b" ]]; then
    		#staying results in death
    		cat run
    		break
    	#train b path end
    	fi
    	
    #run or fight end
    fi
#train choice end
fi
#when health drops below zero
done
figlet "You lost. Better luck next time"
