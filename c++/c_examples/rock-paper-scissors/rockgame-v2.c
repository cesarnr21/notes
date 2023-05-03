//this is a new version of the rock, paper, scissors game.
#include <stdio.h>

void select_winner(char choice, int computer_choice);
void play(int *choice, int *compturer_choice);



int main(void) {
    printf("Type in your name\n");
    char player[0];
    scanf("%s", &player);
    printf("Hello %s!. Let's play some Rock, Paper, Scissors.", player);

    char choice;
    int computer_choice;
    scanf("%d", &choice);

    play(&choice, &computer_choice);

    return 0;
}



void play(int *choice, int *computer_choice) {
    printf("type your choice below:");
    *computer_choice = rand()%3 + 1;
    scanf("%d", *choice);

    select_winner(choice, computer_choice);
}



void select_winner(int choice, int computer_choice) {
    char results[] = {
        "Both sides selected rocks, tie",       // 0
        "Both sides selected scissors, tie",    // 1
        "Both sides selected paper, tie",       // 2
        "Paper wraps rock",                     // 3
        "scissor cuts paper",                   // 4
        "rock breaks scissors",                 // 5
        "computer wins",                        // 6
        "player wins"                           // 7
    };

    if (choice == "rock") {
        switch(computer_choice) {
            case 1:
                printf("%s", results[0]);
                play();
                break;
            case 2:
                print("%s\n%s", results[3], results[7]);
                break;
            case 3:
                print("%s\n%s", results[5], results[6]);
                break;
        }
    }

    else if (choice == "paper") {
        switch(computer_choice) {
                case 1:
                    printf("%s\n%s", results[3], results[7]);
                    break;
                case 2:
                    print("%s", results[2]);
                    play();
                    break;
                case 3:
                    print("%s\n%s", results[4], results[6]);
                    break;
        }
    }

    else if (choice == "scissors") {
        switch(computer_choice) {
                case 1:
                    printf("%s\n%s", results[6]);
                    break;
                case 2:
                    print("%s\n%s", results[7]);
                    break;
                case 3:
                    print("%s", results[1]);
                    play();
                    break;
            }
    }

    else {
        print("wrong input, try again");
        play();
    }

}
