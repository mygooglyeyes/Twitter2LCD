# Twitter2Display
Twitter to scrolling LCD display ( Adafruit LCD backpack for Arduino)

This project querries Twitter (default is 'adafruit') and then depending on your display, scrolls the tweets accross a 16 x 2 LCD screen or neopixel matrix.
In my case I am using one of the RGB LCD shields from Adafruit (SPI based, not plain serial) on an Arduino Duo, or clone, or the Adafruit NeoPixel matrix shield.

This will require the Adafruit libraries for the LCD shield or neopixels. See thier tutorials, or find the required ones in the .ino files.

Also needed is Processing 2 which does the actual querry and serial write to the arduino.
Laslty you will need token and keys from a twitter APP - http://apps.twitter.com - register an App, and then copy the keys and token to the procesing scetch in two places.

Both of these programs were adaptations of existing ones I found on the web, but were fixed or modified.

Full instructions, and attributions are found in my blog post: http://resistanceisfundamental.blogspot.com/2015/01/let-it-scroll-let-it-scroll-let-it.html

Please note, the post is about the neopixel shield, - they both work in almost the same way, so just use the appropriate arduino code. 
