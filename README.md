# Twitter2LCD
Twitter to scrolling LCD display ( Adafruit LCD backpack for Arduino)

This project querries Twitter (default is 'adafruit') and then scrolls the tweets accross a 16 x 2 LCD screen.
In my case I am using one of the RGB LCD shields from Adafruit (SPI based, not plain serial) on an Arduino Duo, or clone.

Also needed is Processing 2 which does the actual querry and serial write to the arduino.
Laslty you will need token and keys from a twitter APP - http://apps.twitter.com - register an App, and then copy the keys and token to the procesing scetch in two places.
