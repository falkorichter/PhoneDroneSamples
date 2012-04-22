//Realeased under Creative Commons!
//This just a basic demo code...
//By Jordi Munoz

//Added GPS port testing

#include <avr/interrupt.h>

#define VERSION 0 //Old version =0;

volatile unsigned int Start_Pulse =0;
volatile unsigned int Stop_Pulse =0;
volatile unsigned int Pulse_Width =0;

volatile int Counter=0;
volatile byte PPM_Counter=0;
volatile int PWM_RAW[8] = {
  2400,2400,2400,2400,2400,2400,2400,2400};
int All_PWM=1500;

#include <Max3421e.h>
#include <Usb.h>
#include <AndroidAccessory.h>


long timer=0;
long timer2=0;
byte Status=0;

int offset0 = 0;
int offset1 = 0;

int loopCount = 0;

AndroidAccessory acc("Google, Inc.",
             "PhoneDrone",
             "Phone Drone ADK by 3DRobotics",
             "1.0",
             "http://www.falkorichter.de",
             "0000000012345678");


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

  acc.powerOn();
//  test_AT328();
}

void loop()
{
  //Switch low, forward the PPM

  //GPS_LED();

  //Printing all values.
  
    Serial.print("Ch0:");
    Serial.print(InputCh(0));
    
    Serial.print(" Ch1:");
    Serial.print(InputCh(1));
    
    byte msg[5];
 
  if (acc.isConnected()) {
    Serial.print(" connected");    
    int len = acc.read(msg, sizeof(msg), 1);
    if (len > 0) {
        Serial.print(" msg[0] ");
        Serial.print(msg[0],DEC);
        Serial.print(" msg[1]: ");
        Serial.print(msg[1],DEC);
        Serial.print(" msg[2]: ");
        Serial.print(msg[2],DEC);

      if (msg[0] == 0x2) {
        offset0 = msg[1];
        offset0 += msg[2]*256;
        offset0 = offset0 -1000;
        
      } 
      else if (msg[0] == 0x3) {
        offset1 = msg[1];
        offset1 += msg[2]*256;
        offset1 = offset1 - 1000;

      } 
    }
        Serial.print(" offset 0: ");
        Serial.print(offset0,DEC);
        Serial.print(" offset 1: ");
        Serial.print(offset1,DEC);

    loopCount++;
    if (loopCount == 10){
      loopCount = 0;
      int ch0 = InputCh(0);
      int ch1 = InputCh(1);
      msg[0] = 0x1;
      msg[1] = highByte(ch0);
      msg[2] = lowByte(ch0);
      msg[3] = highByte(ch1);
      msg[4] = lowByte(ch1);
      acc.write(msg, 5);
    }

     
    OutputCh(0,InputCh(0)+offset0);   
    OutputCh(1,InputCh(1)+offset1);
  } 
  else {
    OutputCh(0,InputCh(0));
    OutputCh(1,InputCh(1));      
  }
//   Serial.print(" ");
//  Serial.print(highByte(InputCh(1)),DEC);
//  Serial.print(" ");
//  Serial.print(lowByte(InputCh(1)),DEC);
  Serial.println(" ");
  
   OutputCh(2,InputCh(1));      
    
//    Serial.println("");
  
}



