#include <stdio.h>
#include <string.h>
#include <math.h>

// this program will be made to convert between numbers in hex, binary and decimal

char inum, outnum;

prinft("Pick an input and an output in order to convert\n 1.Binary 2.Hex 3.Decimal");
printf("Enter Input Number: ");
scanf("%s", inum);
printf("Enter Output Number: ");
scanf("%s", outnum);


/*
The functions below will be used for each individual conversion
convert1 - binary to hex
convert2 - binary to decimal
convert3 - hex to binary
convert4 - hex to decimal
convert5 - decimal to binary
convert6 - decimal to hex
*/

int convert1(char);
int convert2(char);
int convert3(char);
int convert4(char);
int convert5(char);
int convert6(char);

int main() {
   int i = 0; num = 0;
   char binary[20];
   char hex[20];
   char decimal[20];
   char newNum[20];

   // a switch function might be better than a bunch of if statemetns. still need to check if that would work

   if(inum == 1 && outnum == 2){
      printf("Enter a Binary Number: ");
      scanf("%s", &binary);
   }
   if(inum == 1 && outnum == 3){
      printf("Enter a Binary Number: ");
      scanf("%s", &binary);
   }
   if(inum == 2 && outnum == 1){
      printf("Enter a Hex Number: ");
      scanf("%s", &hex);
   }
   if(inum == 2 && outnum == 3){
      printf("Enter a Binary Number: ");
      scanf("%s", &hex);
   }
   if(inum == 3 && outnum == 1){
      printf("Enter a Decimal Number: ");
      scanf("%s", &decimal);
   }
   if(inum == 3 && outnum == 2){
      printf("Enter a Binary Number: ");
      scanf("%s", &decimal);
   }
   else{
      printf("invalid option, try again");
   }
   
   printf("The new number is %d\n", newNum);
   return 0;
}

int convert1(char ch) {
   
   return value;
}

int convert2(char ch) {
   
   return value;
}

int convert1(char ch) {
  
   return value;
}

int convert1(char ch) {
 
   return value;
}

int convert1(char ch) {

   return value;
}

int convert1(char ch) {

   return value;
}

/*
int convert(char);  //function prototype of conversion function

int main () {
   int i = 0, num = 0;
   char romanNumber[100]; //array for storing roman number

   printf("Enter Roman number: ");
   scanf("%s", romanNumber);

   while(romanNumber[ i ]) {
      //if condition for checking validity of roman number
      if(convert(romanNumber[ i ]) < 0 ) {
         printf("\nInvalid Roman Number.\n");
         return 0;
      }

      //if condition for checking validity of roman number
      if((strlen(romanNumber) - i ) > 2) {
         if(convert(romanNumber[ i ]) < convert(romanNumber[i + 2])) {
            printf("\nInvalid Roman Number.\n");
            return 0;
         }
      }

      //if condition for converting roman number into decimal number
      if(convert(romanNumber[ i ]) >= convert(romanNumber[i + 1])) //true is first roman number is greater or equal to second
         num = num + convert(romanNumber[ i ]);
      else {
         num = num + (convert(romanNumber[i + 1]) - convert(romanNumber[ i ]));
         i++;
      }
      i++;
   }

   //displaying converted number
   printf("\nEquivalent decimal number: %d\n", num);
   return 0;
}

//converting roman number into equivalent decimal value
int convert(char ch) {
   int value = 0;

   switch(ch) {
      case 'I': value = 1; break;
      case 'V': value = 5; break;
      case 'X': value = 10; break;
      case 'L': value = 50; break;
      case 'C': value = 100; break;
      case 'D': value = 500; break;
      case 'M': value = 1000; break;
      case '\0': value = 0; break;
      default: value = -1;
   }
   return value;
}
*/