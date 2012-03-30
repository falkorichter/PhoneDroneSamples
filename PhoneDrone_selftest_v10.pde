//Realeased under Creative Commons!
//This just a basic demo code...
//By Jordi Munoz

//Added GPS port testing

#include <avr/interrupt.h>

#define VERSION 0 //Old version =0;

#define PORTK_HIGH(x)   (PORTK |=   (1 << x))
#define PORTK_LOW(x)    (PORTK &=  ~(1 << x))
#define PORTK_OUTPUT(x) (DDRK  |=   (1 << x))
#define PORTK_INPUT(x)  (DDRK  &=  ~(1 << x))
#define PORTK_READ(x)   (PINK   &   (1 << x))

volatile unsigned int Start_Pulse =0;
volatile unsigned int Stop_Pulse =0;
volatile unsigned int Pulse_Width =0;

volatile int Test=0;
volatile int Test2=0;
volatile int Temp=0;
volatile int Counter=0;
volatile byte PPM_Counter=0;
volatile int PWM_RAW[8] = {
  2400,2400,2400,2400,2400,2400,2400,2400};
int All_PWM=1500;

long timer=0;
long timer2=0;
byte Status=0;

void setup()
{

  /*
  MCUCR = 0x80; //Disable JTAG
   MCUCR = 0x80;
   */

  /*
  //This also works
   bitSet(MCUCR,JTD); 
   bitSet(MCUCR,JTD);
   */

  Serial.begin(57600);


  digitalWrite(4,LOW); //PG5 por esto
  pinMode(4,INPUT);
  
  Init_PWM1();      //OUT2&3
  Init_PWM3();      //OUT6&7
  Init_PWM5();      //OUT0&1
  Init_PPM_PWM4();  //OUT4&5

//  test_AT328();
}

void loop()
{
  //Switch low, forward the PPM

  //GPS_LED();

  //Printing all values.
  
//    Serial.print("Ch0:");
//    Serial.print(InputCh(0));
    OutputCh(0,InputCh(0));
    
//    Serial.print(" Ch1:");
//    Serial.print(InputCh(1));
    OutputCh(1,InputCh(1));      
    
//    Serial.println("");
  
}



