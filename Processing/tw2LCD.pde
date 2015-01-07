//Build an ArrayList to hold all of the words that we get from the imported tweets
//Needs SerialStandard for Arduino
ArrayList<String> words = new ArrayList();

import processing.serial.*;
import java.util.Date;

Serial my_port;                          // Create object from Serial class
int rx_byte;                             // Variable for data received from the serial port

void setup() {
//Set the size of the stage, and the background to black.
size(200, 200);
background(0);
smooth();

String portName = "COM16";
println(Serial.list());
my_port = new Serial( this, portName, 115200 );

//Credentials – YOU NEED TO HAVE GENERATED TWITTER API TOKENS FIRST FOR THIS TO WORK -
ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setOAuthConsumerKey("Kh43hX4CxAU7IZIp8Ob7f3urb");
cb.setOAuthConsumerSecret("OuvD2A8yHrb7XvgC1qlStjZBcqlNrlP6urSPMdlDlAi8q3ZD7R");
cb.setOAuthAccessToken("77117171-UkGGqPgXcNEiTFAJPxcDSwrVlJoYjLihfJyWDKvnn");
cb.setOAuthAccessTokenSecret("1mMeQU00SM2Vbxwg1dNKaVE9VW69Kdx61MNe8qfDDtNEl");

//Make the twitter object and prepare the query – YOU NEED TO HAVE IMPORTED THE TWITTER 4J LIBRARIES FOR THIS TO WORK -
Twitter twitter = new TwitterFactory(cb.build()).getInstance();

  Query query = new Query("adafruit");
  query.count(1);

//Try making the query request.
try {

//Status status = twitter.updateStatus(“Processing to Arduino Now”); //message needs to change per tweet

QueryResult result = twitter.search(query);
ArrayList tweets = (ArrayList) result.getTweets();

for (int i = 0; i < tweets.size(); i++) {
Status t = (Status) tweets.get(i);
User u=(User) t.getUser();
String user = u.getName();
String msg = t.getText();
Date d = t.getCreatedAt();


//Break the tweet into words
String[] input = msg.split("");
for (int j = 1;  j < input.length; j++) {
//Put each word into the words ArrayList
words.add(input[j]);
my_port.write(input[j]);
}
};
}
catch (TwitterException te) {
println("Couldn’t connect: " + te + "\n");
};
}

void draw() {
//Draw a faint black rectangle over what is currently on the stage so it fades over time.
fill(0, 25);
rect(0, 0, width, height);

//Draw a word from the list of words that we’ve built
int k = (frameCount % words.size());
String word = words.get(k);
/*
  if (word.equals("adafruit") == true) {
     my_port.write(255);
     delay(4);    
     my_port.write(0);
  }
*/

if (k == words.size()-1) {
    println("new query");
    

//Credentials – YOU NEED TO HAVE GENERATED TWITTER API TOKENS FIRST FOR THIS TO WORK -
ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setOAuthConsumerKey("Kh43hX4CxAU7IZIp8Ob7f3urb");
cb.setOAuthConsumerSecret("OuvD2A8yHrb7XvgC1qlStjZBcqlNrlP6urSPMdlDlAi8q3ZD7R");
cb.setOAuthAccessToken("77117171-UkGGqPgXcNEiTFAJPxcDSwrVlJoYjLihfJyWDKvnn");
cb.setOAuthAccessTokenSecret("1mMeQU00SM2Vbxwg1dNKaVE9VW69Kdx61MNe8qfDDtNEl");

//Make the twitter object and prepare the query
Twitter twitter = new TwitterFactory(cb.build()).getInstance();

Query query = new Query("adafruit");
query.count(1);

//Try making the query request.
try {

//Status status = twitter.updateStatus(“Processing to Arduino Now”); //message needs to change per tweet

QueryResult result = twitter.search(query);
ArrayList tweets = (ArrayList) result.getTweets();

for (int i = 0; i < tweets.size(); i++) {
Status t = (Status) tweets.get(i);
//User u=(User) t.getUser();
//String user = u.getName();
String msg = t.getText();
//Date d = t.getCreatedAt();


//Break the tweet into words
String[] input = msg.split("");
for (int j = 1;  j < input.length; j++) {
//Put each word into the words ArrayList
words.add(input[j]);
my_port.write(input[j]);
}
};
delay(30000);
}
catch (TwitterException te) {
println("Couldn’t connect: " + te);
};
}
}


