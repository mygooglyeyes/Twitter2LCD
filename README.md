# Twitter2LCD
Twitter to scrolling LCD display ( Adafruit LCD backpack for Arduino)

This project querries Twitter (default is 'adafruit') and then scrolls the tweets accross a 16 x 2 LCD screen.
In my case I am using one of the RGB LCD shields from Adafruit (SPI based, not plain serial) on an Arduino Duo, or clone.
This will require the Adafruit libraries for the LCD shield. See thier tutorial, or find the required ones in the .ino file.

Also needed is Processing 2 which does the actual querry and serial write to the arduino.
Laslty you will need token and keys from a twitter APP - http://apps.twitter.com - register an App, and then copy the keys and token to the procesing scetch in two places.

Both of these programs were adaptations of existing ones I found on the web, but were fixed or modified.

Full instructions, code, and attributions are found in my blog post: http://resistanceisfundamental.blogspot.com/2015/01/let-it-scroll-let-it-scroll-let-it.html
