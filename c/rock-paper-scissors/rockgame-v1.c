#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/* 

Rock - Paper - Scissors game. Version 1

to keep trying later go to this link:
https://adv-computers-c-programs.weebly.com/rock--paper-scissors.html
this is where the rest of the game is.

this is version 1 of this game. Started on 12/30/2019
I started out by seeing what I remember from programming a little during class 

There are some issues with this version of the game. also the readability is pretty bad.
try to change that by either creating a header file or by simplifying and reducing the amount 
of if statements and use the switch() function instead

*/

int main(void) {
    printf("Type in your name\n");
    char player[0];
    scanf("%s", &player);
    printf("Hello %s!. Let's play some Rock, Paper, Scissors.\n", player);

    int R =1; int P = 2; int S = 3;
    int i; int choice; int pscore; int cscore;
    srand(time(NULL));

    for(i = 0; i < 5; i++) {
        printf("\nWhat is you choice?\n");
        printf("Rock = 1, Paper = 2, Scissors = 3\n");
        scanf("%d", &choice);
        int computer = rand()%3 + 1;

        if (computer == choice) {
            printf("Draw. Play Again.\n");
        }

        if (computer == 1) {
            if (choice  == 2) {
                printf("You win. Paper Covers rock.\n"); pscore = pscore + 1;
            }

            else if (choice == 3) {
                printf("You lose. Rock breaks Scissors\n"); cscore = cscore + 1;
            }
        }

        if (computer == 2) {
            if (choice  == 3) {
                printf("You win. Scissors cut paper.\n"); pscore = pscore + 1;
            }

            else if (choice == 1) { 
                printf("You lose. Paper Covers rock.\n"); cscore = cscore + 1;
            }
        }

        if (computer == 3) {
            if (choice  == 1) {
                printf("You win. Rock breaks scisssors.\n"); pscore = pscore + 1;
            }

            else if (choice == 2) { 
                printf("You lose. Scissors cut paper.\n"); cscore = cscore + 1;
            }
        }

        else {
            printf("Wrong Answer. Try again.\n");
        }
    }

    if (cscore < pscore) {
        printf("Player wins %d - %d \n", pscore, cscore);
    }

    else if (cscore > pscore) {
        printf("Computer wins %d - %d \n", cscore, pscore);
    }

    else if (cscore == pscore) {
        printf("Draw. Player and Cmputer are tied %d - %d \n.", pscore, cscore);
    }

    return 0;
}
