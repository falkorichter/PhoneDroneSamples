void test_AT328(void)
{
  for(int out=0; out<=6; out++)
    OutputCh(out, 1500);

  delay(200);

  for(int out=0; out<=6; out++)
  {
    for(int c=1000; c<=2000; c+=500)
    {
      feedbackTest(out, c, 120);
    }
  }

  /*
  for(int c=1000; c<2000; c+=500)
  {
    feedbackTest(6, c, 10);
  }
  */

  for(int out=0; out<=6; out++)
    OutputCh(out, 1500);

  /********************************************************************************/

  Serial.println("After pressing Y the Yellow LED will flash!");
  while(1)
  {
    if(Serial.available() >0)
    {
      char data = Serial.read();

      if((data == 'y')||(data == 'Y'))
        break;
    }
  }

  OutputCh(7, 1900);
  Serial.println("Please cycle power to re-test!");
  delay(1000);
}

void feedbackTest(byte in, int pulse, int tolerance)
{
  int pulse2;
  int out=in;

  Serial.print("PWM set-> ");
  Serial.print((int)in);
  Serial.print(" set-> ");
  Serial.print(pulse);
  OutputCh(out, pulse);
  delay(100);

  if(pulse>1500)
    pulse2=1000;
  else
    pulse2=2000;

  if(out == 0)
  {
    OutputCh(out+1, pulse2);
  }

  if(out >= 6)
  {
    OutputCh(out-1, pulse2);
  }


  if((out>0)&&(out<6))
  {
    OutputCh(out-1, pulse2);
    OutputCh(out+1, pulse2);
  }

  delay(100);
  int pulseIN = InputCh(in);
  Serial.print(" PWM captured-> ");
  Serial.print(pulseIN);

  if((pulseIN >= (pulse-tolerance))&&(pulseIN <= (pulse+tolerance)))
  {
    Serial.println(" PASSED!");
    //return 1;
  }
  else
  {
    if((pulseIN >= (pulse-(tolerance+5)))&&(pulseIN <= (pulse+(tolerance+5))))
    {
      Serial.println(" Mmmhh... I will check again just is case.");
      delay(1000);
    }
    else
    {
      Serial.println(" FAILED!");
      Stop();
    }
    //return 0;
  }
}
