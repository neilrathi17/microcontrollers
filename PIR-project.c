#include<reg51.h>

sbit PIR=P2^0;

 void delay(int itime)
{
    int i,j;
    for(i=0;i<itime;i++)
    for(j=0;j<1275;j++);
}

void Serialbegin()
{
 TMOD=0x20;
 SCON=0x50;
 TH1=0xfd;
 TR1=1;
}

void Serialwrite(char dat)
{
  SBUF=dat;
  while(!TI);
  TI=0;
}

void Serialprintln(char *p)
{
  while(*p)
  {
    Serialwrite(*p);
    p++;
  }
  Serialwrite(0x0d);
}  

void main()
{
    //P2=0x00;
    Serialbegin();
    Serialprintln("ATE0");
    delay(50);
    while(1)
    {
      if(PIR)
      {
        Serialprintln("ATD+919821757249;");
        delay(1000);
    //    lcdcmd(192);
   //     lcdprint("Message Sending.");
        Serialprintln("AT+CMGF=1");
        delay(50);
        Serialprintln("AT+CMGS=\"+919821757249\"");
        delay(50);
        Serialprintln("Someone is Enter in your Place.");
        delay(50);
        Serialwrite(26);
      }
    }
}
