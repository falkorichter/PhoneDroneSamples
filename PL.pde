void PORT_L(void)
{
  PinWrite(DDRL, 0, INPUT); //PL0 -> PK2
  PinWrite(DDRL, 1, INPUT); //PL1 -> PB5
  PinWrite(DDRL, 2, INPUT); //PL2 -> PK0
  PinWrite(DDRL, 3, INPUT); //PL3 -> PG0
  /*
  #if VERSION == 0
  PinWrite(DDRL, 4, INPUT); //PL4 -> PK7 (PK7 is now tested by PA6)
  PinWrite(DDRL, 5, INPUT); //PL5 -> PG1 (PG1 is now tested by PA7)
  #endif
  */
  PinWrite(DDRL, 6, INPUT); //PL6 -> PK5
  PinWrite(DDRL, 7, INPUT); //PL7 -> PK6

  //Outputs:
  PinWrite(DDRK, 2, OUTPUT); //PK2
  PinWrite(DDRB, 5, OUTPUT); //PB5
  PinWrite(DDRK, 0, OUTPUT); //PK0
  PinWrite(DDRG, 0, OUTPUT); //PG0
  /*
  #if VERSION == 0
  PinWrite(DDRK, 7, OUTPUT); //PK7
  PinWrite(DDRG, 1, OUTPUT); //PG1
  #endif
  */
  PinWrite(DDRK, 5, OUTPUT); //PK5
  PinWrite(DDRK, 6, OUTPUT); //PK6

  //Extra output:
  PinWrite(DDRD, 0, OUTPUT); //PDO SCL

  //Test one
  PinWrite(PORTK, 2, LOW);   //PK2
  PinWrite(PORTB, 5, HIGH);  //PB5
  PinWrite(PORTK, 0, LOW);   //PK0
  PinWrite(PORTG, 0, HIGH);  //PG0
  /*
  #if VERSION == 0
  PinWrite(PORTK, 7, LOW);   //PK7
  PinWrite(PORTG, 1, HIGH);  //PG1
  #endif
  */
  PinWrite(PORTK, 5, LOW);   //PK5
  PinWrite(PORTK, 6, HIGH);  //PK6
  PinWrite(PORTD, 0, LOW);   //PD0 SCL

  //Testing:
  PinTest(PINL, 0, LOW,  "OK: PL0", "EError: PL0, also check pin XTAL1");
  PinTest(PINL, 1, HIGH, "OK: PL1", "EError: PL1");
  PinTest(PINL, 2, LOW,  "OK: PL2", "EError: PL2");
  PinTest(PINL, 3, HIGH, "OK: PL3", "EError: PL3");
  //PinTest(PINL, 4, LOW,  "OK: PL4", "EError: PL4");
  //PinTest(PINL, 5, HIGH, "OK: PL5", "EError: PL5");
  PinTest(PINL, 6, LOW,  "OK: PL6", "EError: PL6");
  PinTest(PINL, 7, HIGH, "OK: PL7", "EError: PL7, also check pin PD0");

  //Test Two:

  //setting pints as low
  PinWrite(PORTK, 2, HIGH); //PK2
  PinWrite(PORTB, 5, LOW);  //PB5
  PinWrite(PORTK, 0, HIGH); //PK0
  PinWrite(PORTG, 0, LOW);  //PG0
  /*
  #if VERSION == 0
  PinWrite(PORTK, 7, HIGH); //PK7
  PinWrite(PORTG, 1, LOW);  //PG1
  #endif
  */
  PinWrite(PORTK, 5, HIGH); //PK5
  PinWrite(PORTK, 6, LOW);  //PK6
  PinWrite(PORTD, 0, HIGH); //PD0 SCL

  //Testing:
  PinTest(PINL, 0, HIGH, "OK: PL0", "EError: PL0");
  PinTest(PINL, 1, LOW,  "OK: PL1", "EError: PL1");
  PinTest(PINL, 2, HIGH, "OK: PL2", "EError: PL2");
  PinTest(PINL, 3, LOW,  "OK: PL3", "EError: PL3");
  //PinTest(PINL, 4, HIGH, "OK: PL4", "EError: PL4");
  //PinTest(PINL, 5, LOW,  "OK: PL5", "EError: PL5");
  PinTest(PINL, 6, HIGH, "OK: PL6", "EError: PL6");
  PinTest(PINL, 7, LOW,  "OK: PL7", "EError: PL7");
}

