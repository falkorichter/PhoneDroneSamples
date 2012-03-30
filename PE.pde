void PORT_E(void)
{
  PinWrite(DDRE, 3, INPUT); //PE3 -> PH1
  //PinWrite(DDRE, 6, INPUT); //PE6 -> PB0
  PinWrite(DDRE, 7, INPUT); //PE7 -> PH6

  //Outputs
  PinWrite(DDRH, 1, OUTPUT); //PH1
  //PinWrite(DDRB, 0, OUTPUT); //PB0
  PinWrite(DDRH, 6, OUTPUT); //PH6

  //Extra output next to this port:
  PinWrite(DDRE, 2, OUTPUT); //PE2
  PinWrite(DDRE, 4, OUTPUT); //PE4
  PinWrite(DDRE, 5, OUTPUT); //PE5

  //Test one:

  //Setting pins signals
  PinWrite(PORTE, 2, HIGH); //PE2
  PinWrite(PORTH, 1, LOW);  //PE3
  PinWrite(PORTE, 4, HIGH); //PE4
  PinWrite(PORTE, 5, LOW);  //PE5
  //PinWrite(PORTB, 0, HIGH); //PE6
  PinWrite(PORTH, 6, LOW);  //PE7


  //Testing:
  PinTest(PINE, 3, LOW,  "OK: PE3", "EError: PE3 & PH1, Also check pin PE2, PE4");
  //PinTest(PINE, 6, HIGH, "OK: PE6", "EError: PE6 & PB0, Also check pin PE5, PE7");
  PinTest(PINE, 7, LOW,  "OK: PE7", "EError: PE7 & PH6, Also check pin PE6, VCC");

  //Test Two:

  //Setting pins signals
  PinWrite(PORTE, 2, LOW);  //PE2
  PinWrite(PORTH, 1, HIGH); //PE3
  PinWrite(PORTE, 4, LOW);  //PE4
  PinWrite(PORTE, 5, HIGH); //PE5
  //PinWrite(PORTB, 0, LOW);  //PE6
  PinWrite(PORTH, 6, HIGH); //PE7

  //Testing:
  PinTest(PINE, 3, HIGH, "OK: PE3", "EError: PE3 & PH1, Also check pin PE2, PE4");
  //PinTest(PINE, 6, LOW,  "OK: PE6", "EError: PE6 & PB0, Also check pin PE5, PE7");
  PinTest(PINE, 7, HIGH, "OK: PE7", "EError: PE7 & PH6, Also check pin PE6, VCC");
}

