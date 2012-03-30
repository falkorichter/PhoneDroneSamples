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

void PinWrite(volatile unsigned char &Port, byte Pin, boolean Set);

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

  PinWrite(DDRD,2,OUTPUT); //GPS port signals
  PinWrite(DDRD,3,OUTPUT);

  digitalWrite(4,LOW); //PG5 por esto
  pinMode(4,INPUT);

  PORT_A();
  PORT_B();
  PORT_C();
  PORT_D();
  PORT_E();
  PORT_F();
  PORT_K();
  TEST_GPS_PORT();

  Init_PWM1();      //OUT2&3
  Init_PWM3();      //OUT6&7
  Init_PWM5();      //OUT0&1
  Init_PPM_PWM4();  //OUT4&5

  test_AT328();
}

void loop()
{
  //Switch low, forward the PPM

  //GPS_LED();

  //Printing all values.
  if((millis()- timer) >= 250)
  {
    timer=millis();
    Serial.print("Ch0:");
    Serial.print(InputCh(0));
    Serial.print(" Ch1:");
    Serial.print(InputCh(1));
    Serial.print(" Ch2:");
    Serial.print(InputCh(2));
    Serial.print(" Ch3:");
    Serial.print(InputCh(3));
    Serial.print(" Ch4:");
    Serial.print(InputCh(4));
    Serial.print(" Ch5:");
    Serial.print(InputCh(5));
    Serial.print(" Ch6:");
    Serial.print(InputCh(6));
    Serial.print(" Ch7:");
    Serial.println(InputCh(7));
  }

  delay(20);
}

void PinWrite(volatile unsigned char &Port, byte Pin, boolean Set)
{
  if(Set)
  {
    Port |=   (1 << Pin);
  }
  else
  {
    Port &=  ~(1 << Pin);
  }
}

boolean PinRead(volatile unsigned char &Port, byte Pin)
{
  if(Port  &  (1 << Pin))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}

void PinTest(volatile unsigned char &Port, byte Pin, boolean Set, char msgOK[], char msgER[])
{
  if(PinRead(Port,Pin) == Set)
  {
    Serial.println(msgOK);
  }
  else
  {
    Serial.print(msgER);

    if(Set)
      Serial.println(" is not reading HIGH");
    else
      Serial.println(" is not reading LOW");

    Stop();
  }
}

void Stop(void)
{
  Serial.println("Press Y to continue...");
  while(1)
  {
    if(Serial.available() >0)
    {
      char data = Serial.read();

      if((data == 'y')||(data == 'Y'))
        break;
    }
    GPS_LED();
  }
}

