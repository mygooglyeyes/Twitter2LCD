// include the library code:
#include <Wire.h>
#include <Adafruit_MCP23017.h>
#include <Adafruit_RGBLCDShield.h>
Adafruit_RGBLCDShield lcd = Adafruit_RGBLCDShield();
#define WHITE 0x7
char data[256]; //allow as many values as the Serial buffer will accept
int idx = 0;
int wait = 150;  //control the speed of that the text sent over Serial is printed

void setup()
{
  lcd.begin(16, 2);
  lcd.clear();
  lcd.setCursor(16, 0);
  //lcd.rightToLeft();
  //lcd.autoscroll();
  Serial.begin(115200);

}

void loop ()
{

  while (idx != 200) // this while statement will allow a 2 x 16 lcd display to print 32 characters, then set idx to 0, thus resetting the loop
  {
    lcd.clear();
    lcd.noAutoscroll();
    while (Serial.available())
    {
      delay(10);
      
      if (Serial.available() > 0 )
      {
        if (idx <= 16) // then check that we are not at the end of the second line
        {

          data[idx++] = Serial.read(); //if we are not, take the value from the serial and advance the array
          lcd.print(data[idx - 1]); //print the value from whereever the cursor is
          delay(wait);
        }

        else             //otherwise the value equals 32 and we are at the end of the second line
        {


          //lcd.setCursor(0,1);
          lcd.autoscroll();
          while (idx <= 39) // then check that we are not at the end of the second line
          {
            data[idx++] = Serial.read(); //if we are not, take the value from the serial and advance the array
            lcd.print(data[idx - 1]); //print the value from whereever the cursor is
            delay(wait);
          }
          idx = 0;
          lcd.setCursor(0,0);

        }
      }
    }
    lcd.clear();
    idx = 0;
  }
}

