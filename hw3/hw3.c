/***********************************************************************
 * Name: Arjuna Herbst
 * Date: 2/10/2023
 * File: hw3.c
 * Desc: Program for representing pairs of 4-bit values (nibbles) in a
 *       single byte. To compile: gcc hw3.c -o hw3
 ***********************************************************************/

#include <stdio.h>


/* Alias pair to an unsigned 8-bit byte (char). */
typedef unsigned char pair;


/* Helper function raise 2 to the given exponent power. */
int pow2(int exponent)
{
  int x = 1 << exponent;
  return x;
}


/* Create a pair (x,y) out of the first 4 low-order bits ("nibble") of
   x and y. */
pair create_pair(int x, int y)
{
  int a = x << 4;  //shift x to the left 4: xxxx0000
  pair z = a | y;  //bit-wise OR: xxxxyyyy
  return z;
}


/* Given a pair (x,y) returns x. */
int first(pair p)
{
  int x = p & 240;
  return x >> 4;
}


/* Given a pair (x,y) returns y. */
int second(pair p)
{ 
  return p & 15;
}


/* Print the given pair to standard output as two 4-digit binary
   values (x,y). */
void print_bin(pair p)
{
  printf("(");

  //loop to find binary value of first pair value
  unsigned char byte1;
  unsigned char firstValue = p >> 4;
  int j;
  
    for (j = 3; j >= 0; j--) {
            byte1 = (firstValue >> j) & 1;
            printf("%u", byte1);
    }
  

  printf(", ");

  
  //loop to find binary value of second pair value
  unsigned char byte2;
  int i;
    
    for (i = 3; i >= 0; i--) {
            byte2 = (p >> i) & 1;
            printf("%u", byte2);
    }

  printf(")");

}


/* Print the given pair as two 4-digit unsigned decimal values
   (x,y). */
void print_unsigned(pair p)
{
  printf(" (");
  printf("%d", first(p));
  printf(", ");
  printf("%d", second(p));
  printf(")");
}


/* Print the given pair to standard output as two 4-digit signed
   decimal values (x,y) */
void print_signed(pair p)
{
  printf(" (");

  //find first value signed
  if((first(p) >> 3) & 1 == 1){
    int x = first(p) & 7;
    printf("%d", -8 + x);
  }else{
    printf("%d", first(p));
  }

  printf(", ");

  //find second value signed
  if((second(p) >> 3) & 1 == 1){
    int x = second(p) & 7;
    printf("%d", -8 + x);
  }else{
    printf("%d", second(p));
  }

  printf(")");
 
}


/* Given a pair (x,y) returns x + y. */
int add(pair p)
{
  return (first(p) + second(p)) & 15;
}


/* Given a pair (x,y) returns x - y. */
int sub(pair p)
{
  return (first(p) - second(p)) & 15;
}

/* Given a pair (x, y) returns x * y */
int mult(pair p){
  int product = 0;
  int multiplier = second(p);
  int multiplicand = first(p);

  if(multiplier == 0 || multiplicand == 0){
    return 0;
  }

  while(multiplier > 0){
    if(multiplier & 1){
      product += multiplicand;
    }
    multiplicand = multiplicand << 1;
    multiplier = multiplier >> 1;

  }
  return product;
}

/* given a pair (x, y) returns the value of x * y as signed values */
int signed_mult(pair p){

  int multiplier, multiplicand;
  int product = 0;

  //find first value signed
  if((first(p) >> 3) & 1 == 1){
    int x = first(p) & 7;
    multiplicand = -8 + x;
  }else{
    multiplicand = first(p);
  }

  //find second value signed
  if((second(p) >> 3) & 1 == 1){
    int x = second(p) & 7;
    multiplier =  (~8 + 1) + x;
  }else{
    multiplier = second(p);
  }

  // if(multiplier == 0 || multiplicand == 0){
  //   return 0;
  // }

  while(multiplier > 0){
    if(multiplier & 1){
      product += multiplicand;
    }
    multiplicand = multiplicand << 1;
    multiplier = multiplier >> 1;

  }
  return product;
  
}

int div(pair p){
  short quotient = 0;
  char remainder = first(p);
  char divisor = second(p) << 4;

  for(int i = 0; i < 5; i++){
    //fix line below
    remainder = remainder + (~divisor + 1);
    
    quotient = quotient << 1;
    if(remainder >= 0){
      quotient += 1;
    }else{
      remainder += divisor;
    } 
    divisor >> 1;
  }

  return quotient;
}

int signed_div(pair p){

  int firstValueSigned, secondValueSigned;

  //find first value signed
  if((first(p) >> 3) & 1 == 1){
    int x = first(p) & 7;
    firstValueSigned = -8 + x;
  }else{
    firstValueSigned = first(p);
  }

  //find second value signed
  if((second(p) >> 3) & 1 == 1){
    int x = second(p) & 7;
    secondValueSigned =  -8 + x;
  }else{
    secondValueSigned = second(p);
  }

  pair z = create_pair(firstValueSigned, secondValueSigned);
  int quotient = div(z);

  return quotient;
}

/* For each pair of values (x,y) such that x is between 0 and 15
   (inclusive) and y is between 0 and 15 (inclusive), prints per line
   (x,y) as two binary values, (x,y) as two unsigned decimal values,
   (x,y) as two signed decimal values, x + y, and x - y. */
int main()
{
  for(int i = 0; i <= 15; i++){
    for(int j = 0; j <= 15; j++){
      pair p = create_pair(i, j);
      print_bin(p);
      print_unsigned(p);
      print_signed(p);
      printf(" ");

      printf("%d", add(p));
      printf(" ");

      printf("%d", sub(p));
      printf(" ");

      
      printf("%d", mult(p));
      printf(" ");

      printf("%d", signed_mult(p));
      printf(" ");

      if(second(p) == 0){
        printf(" na");
      }else{
        printf("%d", div(p));
      }
      printf(" ");

      if(second(p) == 0){
        printf(" na");
      }else{
        printf("%d", signed_div(p));
      }
      
      printf("\n");
    }
  }



  
 
}

