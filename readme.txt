readme.txt

Shell scripting terminal game that inspired by Netflix Show All of Us Are Dead. Short zombie simulation game involving user choices/input in terminal. Paths can lead to survival or death (immediate death if your health drops to zero or if you are killed by a zombie -- explained in more detail in entry file once player initiates game). Made with Bash shell scripting. Must be ran on Linux (I recommend Kali and ParrotOS).


Please install the following programs
aafire - animation of coworker's fire making abilities on day 2
imagemagick - displays image every time you change location 
sl - train animation for day 3
rev - used to decrypt message on day 3

All the files containing the word "entry" are explainer files that are first run when you enter the directory. They lead to other paths.

Major decision points have two major choices, one of which is the "boring" choice, or the easy way out, such as staying at home, boarding the A train, turning left, etc. (explained below). The other choice leads to more decision making that impacts your health and can result in success or death.

CONTAINS ALL SPOILERS
----------------------

Start at entry
entry - explains the game and rules about health

.../day1 Directory:
day1entry - explains the choice to stay at home or go to the grocery store

.../day1/home Directory:
stay - if you stay at home, it will run the stay file, a short file confirming your decision to remain at home. (easy play)
returned - the returned file in the code is a file that only runs if you went to the grocery store and made it back alive. 

.../day1/grocery Directory:
wayback - after you pick your items (done within the story.sh file), you can choose to fight or hide from a zombie. The results (live or die) are controlled by story.sh depending on user input. 

.../day2 Directory
day2entry - explains that you lost 20 health points (happens each night) and that you hear a knock on the door, which you can either answer or ignore. You are also sick and have to get medicine at some point during day 2.

.../day2/closed Directory
closedentry - run upon choosing to keep door closed. Explains that you didn't answer the door for whoever knocked, but you later venture out of your hotel room to the medicine cabinet. If you choose the right hallway, you return safely (easy play), but if you choose the left hallway there are more decisions because you encounter a zombie.

.../day2/closed/lefthallway Directory
lefthallwayentry - run upon entering left hallway. Explains that you can either dodge or fight the zombie's attack. The results (live or die) are controlled by story.sh depending on user input. 

.../day2/opened Directory
openedentry - run upon choosing to open door. Explains that when you answer the door you see a classmate who has medicine and can light a fire (aafire) and restores your health points
openedcont - after running aafire, openedcont explains that you can choose to host or kick out your coworker under the suspicion that he has been infected. The results (kick out or keep) are controlled by story.sh depending on user input and affect player health.

.../day3 Directory
day3entry - file that is run upon entering Day 3. Explains that you get a paper message, which the user is prompted to decode in the terminal using rev (in story.sh)
day3cont - gives user the choice of which train to board
traina - (easy play) leads user straight to success

.../day3/trainb Directory
trainbentry - file that is run upon choosing Train B. Explains that there is a zombie attack that you can choose to run or fight 
run - instant death
fight - you live and have the option to leave and board Train A (leads you to succcess by moving the success file to current directory) or stay on train B (leads you to death by running the run file that explains your death)

 {entry} format is used for formatting the important entry files. {other} is used for formatting other files.
