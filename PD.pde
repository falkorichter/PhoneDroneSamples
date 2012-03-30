void PORT_D(void)
{
  //PD2, PD3, PD5, PD6, PD7 not tested on APM v14

  PinWrite(DDRD, 0, INPUT);   //PD0 -> PK3
  PinWrite(DDRD, 1, INPUT);   //PD1 -> PK4
  //PinWrite(DDRD, 2, INPUT); //PD2 ->
  //PinWrite(DDRD, 3, INPUT); //PD3 ->
  PinWrite(DDRD, 4, INPUT);   //PD4 -> PK1
  //PinWrite(DDRD, 5, INPUT); //PD5 ->
  //PinWrite(DDRD, 6, INPUT); //PD6 ->
  //PinWrite(DDRD, 7, INPUT); //PD7 ->

  //Outputs
  PinWrite(DDRK, 3, OUTPUT);   //PD0 -> PK3
  PinWrite(DDRK, 4, OUTPUT);   //PD1 -> PK4
  //PinWrite(DDRD, 2, OUTPUT); //PD2 ->
  //PinWrite(DDRD, 3, OUTPUT); //PD3 ->
  PinWrite(DDRK, 1, OUTPUT);   //PD4 -> PK1
  //PinWrite(DDRD, 5, OUTPUT); //PD5 ->
  //PinWrite(DDRD, 6, OUTPUT); //PD6 ->
  //PinWrite(DDRD, 7, OUTPUT); //PD7 ->

  //Extra output next to this port:
  PinWrite(DDRL, 7, OUTPUT);

  //Test one
  PinWrite(PORTL, 7, HIGH);   //Pulling if is shorten the PC0 will fail
  PinWrite(PORTK, 3, LOW);    //PD0
  PinWrite(PORTK, 4, HIGH);   //PD1
  //PinWrite(PORTD, 2, LOW);
  //PinWrite(PORTD, 3, HIGH);
  PinWrite(PORTK, 1, LOW);    //PD4
  //PinWrite(PORTD, 5, HIGH);

  //Testing:
  PinTest(PIND, 0, LOW,  "OK: PD0", "EError: PD0 & PK3, Also check pin PL7, PD1");
  PinTest(PIND, 1, HIGH, "OK: PD1", "EError: PD1 & PK4, Also check pin PD0, PD2");
  PinTest(PIND, 4, LOW,  "OK: PD4", "EError: PD4 & PK1, Also check pin PD3, PD5");

  //Test Two:
  PinWrite(PORTL, 7, LOW);   //Pulling if is shorten the PC0 will fail
  PinWrite(PORTK, 3, HIGH);  //PD0
  PinWrite(PORTK, 4, LOW);   //PD1
  //PinWrite(PORTD, 2, HIGH);
  //PinWrite(PORTD, 3, LOW);
  PinWrite(PORTK, 1, HIGH);  //PD4
  //PinWrite(PORTD, 5, LOW);

  //Testing:
  PinTest(PIND, 0, HIGH, "OK: PD0", "EError: PD0 & PK3, Also check pin PL7, PD1");
  PinTest(PIND, 1, LOW,  "OK: PD1", "EError: PD1 & PK4, Also check pin PD0, PD2");
  PinTest(PIND, 4, HIGH, "OK: PD4", "EError: PD4 & PK1, Also check pin PD3, PD5");
}

