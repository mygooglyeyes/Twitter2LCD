// include the library code:
#include <Wire.h>
#include <Adafruit_MCP23017.h>
#include <Adafruit_RGBLCDShield.h>
Adafruit_RGBLCDShield lcd = Adafruit_RGBLCDShield();
#define WHITE 0x7
char data; //allow as many values as the Serial buffer will accept
char *idx;
int loops = 0;
int wait = 150;  //control the speed of that the text sent over Serial is printed

void setup()
{
  lcd.begin(16, 2);  // Initalize the LCD
  lcd.clear();  // Clear the display
  lcd.setCursor(16, 0);  //Set the cursor position
  //lcd.rightToLeft();
  //lcd.autoscroll();
  Serial.begin(115200);  //Start the serial port and set it to 115200 Baud

}

void loop ()
{

  lcd.clear();  //Clear the display
  lcd.noAutoscroll();  //make sure autoscrolling is off
  while (Serial.available())  //While there is data in the serial buffer
  {
    delay(10);  //Wait a bit to make sure the data has time to transfer

    if (Serial.available() > 0 )  //If there is data in the serial buffer
    {
      if (loops <= 16) // check that we are not at the end of the first line
      {
        idx = &data;  //set the pointer idx to the address of the current character in 'data'
        data = Serial.read(); // take the value from the serial buffer
        lcd.print(*idx); //print the value from wherever the pointer is set to
        loops++;  // advance the array
        delay(wait);  //delay the period in 'wait'
      }

      else             //otherwise the value equals 17 and we are at the end of the first line
      {
        lcd.autoscroll();  //turn on autoscroll so the characters move ticker style left to right
        do 
        {
          idx = &data;  //set the pointer idx to the address of the current character in 'data'
          data = Serial.read(); //take the value from the serial buffer
          lcd.print(*idx); //print the value from wherever the pointer is set to
          loops++;  //advance the array
          delay(wait); //delay the period in 'wait'
        } while (loops <=39 && data >31 && data <128); // then check that the LCD's buffer is not 
                                                       //more than 39 (the max for one line) or 
                                                       //anything but standard characters
        loops = 0;  //reset 'loops' to 0
        lcd.setCursor(0,0);  //move the cursor back to 0,0

      }  
    }
  }
  lcd.clear();  //clear the display
  loops = 0;  //reset 'loops' to 0
}
