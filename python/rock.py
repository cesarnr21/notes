"""
this version 1 of this game

improve by: 
* limiting the number of game by changing the while loop and adding a score system


"""

from random import randint
import time

t=["rock","paper","scissors"]
computer=t[randint(0,2)]
player = False
name = input("What is your name? ")
print("Hello "+name+".","""Time to play rock, paper, scissors.
Just type in your answer and hit enter.""")
time.sleep(2)

while player == False:
	player  = input("rock, paper, scissors? ")
	if player == computer :
		print("Tie! Try again")
	elif player == "rock":
		if computer == "paper":
		    print("You lose!", computer, "covers", player)
		else:
		    print("You win!", player, "smashes", computer)
	elif player == "paper":
		if computer == "scissors":
                    print("You lose!", computer, "cut", player)
		else:
		    print("You win!", player, "covers", computer)
	elif player == "scissors":
		if computer == "rock":
		    print("You lose!", computer,"smashes", player)
		else:
		    print("You win!", player, "cut", computer)
	else:
	    print("That's not a valid play. Check your spelling")

	player = False
	
	computer = t[randint(0,2)]


