#include <stdio.h> 
#include <stdlib.h> 
  
int main() 
{ 
  int arr[10]; 
  char buf[20]; 
   
  printf("Enter 10 integers, pressing enter after each:\n"); 

  for (int i = 0; i < 10; ++i) 
  { 
    // Print a prompt and make it visible. 
    printf("%02d:  ", i); 
    fflush(stdout); 
   
    // Get a line of input from the user. 
    if (!fgets(buf, sizeof(buf), stdin)) 
    { 
      fprintf(stderr, 
              "Unexpected input error or EOF.  Terminating.\n"); 
      exit(1); 
    } 
  
    // Convert the input and store it in array. 
    // If an error occurs, ask the user to try again.
    if (sscanf(buf, "%d", &arr[i]) != 1) 
    { 
      printf("I did not understand your input.  Try again.\n"); 
      --i;  // Retry the same index. 
    } 
  } 
   
  printf("You entered:\n"); 
  for (int i = 0; i < 10; ++i) 
  { 
    printf("%d\n", arr[i]); 
  } 
  
  printf("Press enter to continue.\n"); 
  fgets(buf, sizeof(buf), stdin); 
} 
