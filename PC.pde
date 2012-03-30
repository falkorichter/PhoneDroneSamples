// Disable JTAG interface in AVR Studio fuse controls for PC and PF to work

void PORT_C(void)
{
  PinWrite(DDRC, 0, INPUT); //PC0 -> PF0
  PinWrite(DDRC, 1, INPUT); //PC1 -> PF1
  PinWrite(DDRC, 2, INPUT); //PC2 -> PF2
  PinWrite(DDRC, 3, INPUT); //PC3 -> PF3
  PinWrite(DDRC, 4, INPUT); //PC4 -> PF4
  PinWrite(DDRC, 5, INPUT); //PC5 -> PF5
  PinWrite(DDRC, 6, INPUT); //PC6 -> PF6
  PinWrite(DDRC, 7, INPUT); //PC7 -> PF7

  //Outputs
  PinWrite(DDRF, 0, OUTPUT); //PF0 -> PC0
  PinWrite(DDRF, 1, OUTPUT); //PF1 -> PC1
  PinWrite(DDRF, 2, OUTPUT); //PF2 -> PC2
  PinWrite(DDRF, 3, OUTPUT); //PF3 -> PC3
  PinWrite(DDRF, 4, OUTPUT); //PF4 -> PC4
  PinWrite(DDRF, 5, OUTPUT); //PF5 -> PC5
  PinWrite(DDRF, 6, OUTPUT); //PF6 -> PC6
  PinWrite(DDRF, 7, OUTPUT); //PF7 -> PC7

  //Extra output next to this port:
  PinWrite(DDRG, 1, OUTPUT); //PG1 ->

  //Test one
  PinWrite(PORTG, 1, HIGH); //Pulling if is shorten the PC0 will fail
  PinWrite(PORTF, 0, LOW);  //
  PinWrite(PORTF, 1, HIGH); //
  PinWrite(PORTF, 2, LOW);  //
  PinWrite(PORTF, 3, HIGH); //
  PinWrite(PORTF, 4, LOW);  //
  PinWrite(PORTF, 5, HIGH); //
  PinWrite(PORTF, 6, LOW);  //
  PinWrite(PORTF, 7, HIGH); //

  //Testing:
  PinTest(PINC, 0, LOW,  "OK: PC0", "EError: PC0 & PF0, Also check pin PG1");
  PinTest(PINC, 1, HIGH, "OK: PC1", "EError: PC1 & PF1");
  PinTest(PINC, 2, LOW,  "OK: PC2", "EError: PC2 & PF2");
  PinTest(PINC, 3, HIGH, "OK: PC3", "EError: PC3 & PF3");
  PinTest(PINC, 4, LOW,  "OK: PC4", "EError: PC4 & PF4");
  PinTest(PINC, 5, HIGH, "OK: PC5", "EError: PC5 & PF5");
  PinTest(PINC, 6, LOW,  "OK: PC6", "EError: PC6 & PF6");
  PinTest(PINC, 7, HIGH, "OK: PC7", "EError: PC7 & PF7, Also check pin VCC next to it");

  //Test Two:
  PinWrite(PORTG, 1, LOW);
  PinWrite(PORTF, 0, HIGH); //
  PinWrite(PORTF, 1, LOW);  //
  PinWrite(PORTF, 2, HIGH); //
  PinWrite(PORTF, 3, LOW);  //
  PinWrite(PORTF, 4, HIGH); //
  PinWrite(PORTF, 5, LOW);  //
  PinWrite(PORTF, 6, HIGH); //
  PinWrite(PORTF, 7, LOW);  //

  PinTest(PINC, 0, HIGH, "OK: PF0", "EError: PC0 & PF0, Also check pin PG1");
  PinTest(PINC, 1, LOW,  "OK: PF1", "EError: PC1 & PF1");
  PinTest(PINC, 2, HIGH, "OK: PF2", "EError: PC2 & PF2");
  PinTest(PINC, 3, LOW,  "OK: PF3", "EError: PC3 & PF3");
  PinTest(PINC, 4, HIGH, "OK: PF4", "EError: PC4 & PF4");
  PinTest(PINC, 5, LOW,  "OK: PF5", "EError: PC5 & PF5");
  PinTest(PINC, 6, HIGH, "OK: PF6", "EError: PC6 & PF6");
  PinTest(PINC, 7, LOW,  "OK: PF7", "EError: PC7 & PF7, Also check VCC pin next to it");
}

