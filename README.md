# Twitter2Display
Twitter to scrolling LCD display ( Adafruit LCD backpack for Arduino)

This project querries Twitter (default querry is 'adafruit') and then depending on your display, scrolls the tweets accross a 16 x 2 LCD screen or neopixel matrix.
In my case I am using one of the RGB LCD shields from Adafruit (SPI based), or the Adafruit NeoPixel matrix shield on an Arduino Duo, or clone.

This will require the Adafruit libraries for the LCD shield or neopixel shields. See thier tutorials, or find the required ones in the .ino files.

Also needed is Processing 2 which does the actual querry and serial write to the arduino.

You will need token and keys from a twitter APP - http://apps.twitter.com - register an App, and then copy the keys and token to the procesing scetch in two places.

Lastly you will need to hack the Arduino IDE to change the serial buffer to 256 bytes.(see blog post for details)

All of these programs were adaptations of existing ones that were either demos, or I found on the web, but were fixed or modified.

Full instructions, and attributions are found in my blog post: http://resistanceisfundamental.blogspot.com/2015/01/let-it-scroll-let-it-scroll-let-it.html

Please note, the post is about the neopixel shield, - but the LCD and NeoPixels work in almost the same way, so just use the appropriate arduino code. 
