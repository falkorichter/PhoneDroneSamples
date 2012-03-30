// Disable JTAG interface in AVR Studio fuse controls for PC and PF to work

void PORT_F(void)
{
  PinWrite(DDRF, 0, INPUT); //PF0 -> PC0
  PinWrite(DDRF, 1, INPUT); //PF1 -> PC1
  PinWrite(DDRF, 2, INPUT); //PF2 -> PC2
  PinWrite(DDRF, 3, INPUT); //PF3 -> PC3
  PinWrite(DDRF, 4, INPUT); //PF4 -> PC4
  PinWrite(DDRF, 5, INPUT); //PF5 -> PC5
  PinWrite(DDRF, 6, INPUT); //PF6 -> PC6
  PinWrite(DDRF, 7, INPUT); //PF7 -> PC7

  //Outputs
  PinWrite(DDRC, 0, OUTPUT); //PF0 -> PC0
  PinWrite(DDRC, 1, OUTPUT); //PF1 -> PC1
  PinWrite(DDRC, 2, OUTPUT); //PF2 -> PC2
  PinWrite(DDRC, 3, OUTPUT); //PF3 -> PC3
  PinWrite(DDRC, 4, OUTPUT); //PF4 -> PC4
  PinWrite(DDRC, 5, OUTPUT); //PF5 -> PC5
  PinWrite(DDRC, 6, OUTPUT); //PF6 -> PC6
  PinWrite(DDRC, 7, OUTPUT); //PF7 -> PC7

  //Extra output next to this port:
  PinWrite(DDRK, 0, OUTPUT);

  //Test one:
  PinWrite(PORTC, 0, LOW);  //
  PinWrite(PORTC, 1, HIGH); //
  PinWrite(PORTC, 2, LOW);  //
  PinWrite(PORTC, 3, HIGH); //
  PinWrite(PORTC, 4, LOW);  //
  PinWrite(PORTC, 5, HIGH); //
  PinWrite(PORTC, 6, LOW);  //
  PinWrite(PORTC, 7, HIGH); //
  PinWrite(PORTK, 0, LOW);  //

  //Testing:
  PinTest(PINF, 0, LOW,  "OK: PF0", "EError: PF0 & PC0, Also check pin VREF");
  PinTest(PINF, 1, HIGH, "OK: PF1", "EError: PF1 & PC1");
  PinTest(PINF, 2, LOW,  "OK: PF2", "EError: PF2 & PC2");
  PinTest(PINF, 3, HIGH, "OK: PF3", "EError: PF3 & PC3");
  PinTest(PINF, 4, LOW,  "OK: PF4", "EError: PF4 & PC4");
  PinTest(PINF, 5, HIGH, "OK: PF5", "EError: PF5 & PC5");
  PinTest(PINF, 6, LOW,  "OK: PF6", "EError: PF6 & PC6");
  PinTest(PINF, 7, HIGH, "OK: PF7", "EError: PF7 & PC7, Also check pin PK0");

  //Test Two:
  PinWrite(PORTC, 0, HIGH); //
  PinWrite(PORTC, 1, LOW);  //
  PinWrite(PORTC, 2, HIGH); //
  PinWrite(PORTC, 3, LOW);  //
  PinWrite(PORTC, 4, HIGH); //
  PinWrite(PORTC, 5, LOW);  //
  PinWrite(PORTC, 6, HIGH); //
  PinWrite(PORTC, 7, LOW);  //
  PinWrite(PORTK, 0, HIGH); //

  PinTest(PINF, 0, HIGH, "OK: PF0", "EError: PF0 & PC0, Also check pin VREF");
  PinTest(PINF, 1, LOW,  "OK: PF1", "EError: PF1 & PC1");
  PinTest(PINF, 2, HIGH, "OK: PF2", "EError: PF2 & PC2");
  PinTest(PINF, 3, LOW,  "OK: PF3", "EError: PF3 & PC3");
  PinTest(PINF, 4, HIGH, "OK: PF4", "EError: PF4 & PC4");
  PinTest(PINF, 5, LOW,  "OK: PF5", "EError: PF5 & PC5");
  PinTest(PINF, 6, HIGH, "OK: PF6", "EError: PF6 & PC6");
  PinTest(PINF, 7, LOW,  "OK: PF7", "EError: PF7 & PC7, Also check pin PK0");
}

