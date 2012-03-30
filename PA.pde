void PORT_A(void)
{
  //PinWrite(DDRA, 0, INPUT); //PA0 -> NA
  //PinWrite(DDRA, 1, INPUT); //PA1 -> NA
  //PinWrite(DDRA, 2, INPUT); //PA2 -> NA
  //PinWrite(DDRA, 3, INPUT); //PA3 -> NA
  //PinWrite(DDRA, 4, INPUT); //PA4 -> NA
  //PinWrite(DDRA, 5, INPUT); //PA5 -> NA
  PinWrite(DDRA, 6, INPUT); //PA6 -> PK7
  PinWrite(DDRA, 7, INPUT); //PA7 -> PG1

  //Outputs
  PinWrite(DDRK, 7, OUTPUT); //PK7
  PinWrite(DDRG, 1, OUTPUT); //PG1

  //Test one
  PinWrite(PORTK, 7, HIGH);
  PinWrite(PORTG, 1, LOW);

  PinTest(PINA, 6, HIGH, "OK: PA6", "EError: PA6 & PK7");
  PinTest(PINA, 7, LOW,  "OK: PA7", "EError: PA7 & PG1");

  //Test two
  PinWrite(PORTK, 7, LOW);
  PinWrite(PORTG, 1, HIGH);

  PinTest(PINA, 6, LOW,  "OK: PA6", "EError: PA6 & PK7");
  PinTest(PINA, 7, HIGH, "OK: PA7", "EError: PA7 & PG1");
}

