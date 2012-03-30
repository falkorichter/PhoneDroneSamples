void PORT_K(void)
{
  PinWrite(DDRK, 0, INPUT); //PK0 -> PL2
  PinWrite(DDRK, 1, INPUT); //PK1 -> PD4
  PinWrite(DDRK, 2, INPUT); //PK2 -> PL0
  PinWrite(DDRK, 3, INPUT); //PK3 -> PD0
  PinWrite(DDRK, 4, INPUT); //PK4 -> PD1
  PinWrite(DDRK, 5, INPUT); //PK5 -> PL6
  PinWrite(DDRK, 6, INPUT); //PK6 -> PL7
  PinWrite(DDRK, 7, INPUT); //PK7 -> PA6

  //Outputs
  PinWrite(DDRL, 2, OUTPUT); //PL2
  PinWrite(DDRD, 4, OUTPUT); //PD4
  PinWrite(DDRL, 0, OUTPUT); //PL0
  PinWrite(DDRD, 0, OUTPUT); //PD0
  PinWrite(DDRD, 1, OUTPUT); //PD1
  PinWrite(DDRL, 6, OUTPUT); //PL6
  PinWrite(DDRL, 7, OUTPUT); //PL7
  #if VERSION == 0
  PinWrite(DDRA, 6, OUTPUT); //PA6
  #endif

  //Extra output/INPUTS next to this port:
  PinWrite(DDRF, 7, OUTPUT); //PF7 -> PC7
  PinWrite(DDRC, 7, INPUT);  //Declaring PC7 as input

  //Test one:
  PinWrite(PORTF, 7, HIGH); //PF7 Pulling if is shorten the PC0 will fail
  PinWrite(PORTL, 2, LOW);  //PL2
  PinWrite(PORTD, 4, HIGH); //PD4
  PinWrite(PORTL, 0, LOW);  //PL0
  PinWrite(PORTD, 0, HIGH); //PD0
  PinWrite(PORTD, 1, LOW);  //PD1
  PinWrite(PORTL, 6, HIGH); //PL6
  PinWrite(PORTL, 7, LOW);  //PL7
  PinWrite(PORTA, 6, HIGH); //PA6

  //Testing:
  PinTest(PINK, 0, LOW,  "OK: PK0", "EError: PK0 & PL2, Also check pin PF7 next to it");
  PinTest(PINK, 1, HIGH, "OK: PK1", "EError: PK1 & PD4");
  PinTest(PINK, 2, LOW,  "OK: PK2", "EError: PK2 & PL0");
  PinTest(PINK, 3, HIGH, "OK: PK3", "EError: PK3 & PD0");
  PinTest(PINK, 4, LOW,  "OK: PK4", "EError: PK4 & PD1");
  PinTest(PINK, 5, HIGH, "OK: PK5", "EError: PK5 & PL6");
  PinTest(PINK, 6, LOW,  "OK: PK6", "EError: PK6 & PL7");
  PinTest(PINK, 7, HIGH, "OK: PK7", "EError: PK7 & PA6, Also check GND pin next to it");

  //Test Two:
  PinWrite(PORTF, 7, LOW);   //Pulling if is shorten the PC0 will fail
  PinWrite(PORTL, 2, HIGH);  //PK0
  PinWrite(PORTD, 4, LOW);   //PK1
  PinWrite(PORTL, 0, HIGH);  //PK2
  PinWrite(PORTD, 0, LOW);   //PK3
  PinWrite(PORTD, 1, HIGH);  //PK4
  PinWrite(PORTL, 6, LOW);   //PK5
  PinWrite(PORTL, 7, HIGH);  //PK6
  PinWrite(PORTA, 6, LOW);   //PK7

  PinTest(PINK, 0, HIGH, "OK: PK0", "EError: PK0 & PL2, Also check pin PF7 next to it");
  PinTest(PINK, 1, LOW,  "OK: PK1", "EError: PK1 & PD4");
  PinTest(PINK, 2, HIGH, "OK: PK2", "EError: PK2 & PL0");
  PinTest(PINK, 3, LOW,  "OK: PK3", "EError: PK3 & PD0");
  PinTest(PINK, 4, HIGH, "OK: PK4", "EError: PK4 & PD1");
  PinTest(PINK, 5, LOW,  "OK: PK5", "EError: PK5 & PL6");
  PinTest(PINK, 6, HIGH, "OK: PK6", "EError: PK6 & PL7");
  PinTest(PINK, 7, LOW,  "OK: PK7", "EError: PK7 & PA6, Also check GND pin next to it");
}

