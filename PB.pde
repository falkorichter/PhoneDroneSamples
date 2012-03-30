void PORT_B(void)
{
  // PB1, PB2, PB3, PB6, PB7 not tested on APM v14
  
  //PinWrite(DDRB, 0, INPUT);   //PB0 -> PE6
  //PinWrite(DDRB, 1, INPUT); //PB1 ->
  //PinWrite(DDRB, 2, INPUT); //PB2 ->
  //PinWrite(DDRB, 3, INPUT); //PB3 ->
  PinWrite(DDRB, 4, INPUT);   //PB4 -> PH3
  PinWrite(DDRB, 5, INPUT);   //PB5 -> PL1
  //PinWrite(DDRB, 6, INPUT); //PB6 ->
  //PinWrite(DDRB, 7, INPUT); //PB7 ->
  
  //Outputs
  //PinWrite(DDRE, 6, OUTPUT); //
  PinWrite(DDRH, 3, OUTPUT); //
  PinWrite(DDRL, 1, OUTPUT); //
  
  //Extra output next to this port:
  PinWrite(DDRH, 6, OUTPUT); //PH6 NEXT TO PB0
  //PinWrite(DDRB, 1, OUTPUT); //
  //PinWrite(DDRB, 3, OUTPUT); //
  //PinWrite(DDRB, 6, OUTPUT); //
  
  //Test one
  PinWrite(PORTH, 6, HIGH); //Pulling if is shorten the PC0 will fail
  
  //Setting pins signals
  //PinWrite(PORTE, 6, LOW);  //PB0
  //PinWrite(PORTB, 1, HIGH); //
  //PinWrite(PORTB, 3, LOW);  //
  PinWrite(PORTH, 3, HIGH); //PB4
  PinWrite(PORTL, 1, LOW);  //PB5
  //PinWrite(PORTB, 6, HIGH); //
  
  //Testing:
  //PinTest(PINB, 0, LOW,  "OK: PB0", "EError: PB0 & PE6, Also check pin PH6, PB1");
  PinTest(PINB, 4, HIGH, "OK: PB4", "EError: PB4 & PH3, Also check pin PB3, PB5");
  PinTest(PINB, 5, LOW,  "OK: PB5", "EError: PB5 & PL1, Also check pin PB4, PB6");
  
  //Test Two:
  PinWrite(PORTH, 6, LOW);  //Pulling if is shorten the PC0 will fail
  
  //Setting pins signals
  //PinWrite(PORTE, 6, HIGH); //PB0
  //PinWrite(PORTB, 1, LOW);  //
  //PinWrite(PORTB, 3, HIGH); //
  PinWrite(PORTH, 3, LOW);  //PB4
  PinWrite(PORTL, 1, HIGH); //PB5
  //PinWrite(PORTB, 6, LOW);  //
  
  //Testing:
  //PinTest(PINB, 0, HIGH, "OK: PB0", "EError: PB0 & PE6, Also check pin PH6, PB1");
  PinTest(PINB, 4, LOW,  "OK: PB4", "EError: PB4 & PH3, Also check pin PB3, PB5");
  PinTest(PINB, 5, HIGH, "OK: PB5", "EError: PB5 & PL1, Also check pin PB4, PB6");
}

