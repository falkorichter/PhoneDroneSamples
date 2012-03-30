void TEST_GPS_PORT()
{
  PinWrite(DDRD, 2, INPUT);
  PinWrite(DDRD, 3, OUTPUT);
  PinWrite(PORTD, 3, HIGH);
  PinTest(PIND, 2, HIGH, "OK: PD2 (GPS)", "EError: PD2 & PD3");

  PinWrite(DDRD, 2, OUTPUT);
  PinWrite(DDRD, 3, INPUT);
  PinWrite(PORTD, 2, LOW);
  PinTest(PIND, 3, LOW, "OK: PD3 (GPS)", "EError: PD3 & PD2");
}

void GPS_LED(void)
{
  static short pos=0;

  if((millis()-timer2) > 500)
  {
    timer2=millis();
    if(pos==0)
    {
      pos=1;
      PinWrite(PORTD, 2, LOW);
      PinWrite(PORTD, 3, HIGH);
    }
    else
    {
      pos=0;
      PinWrite(PORTD, 2, HIGH);
      PinWrite(PORTD, 3, LOW);
    }
  }
}
