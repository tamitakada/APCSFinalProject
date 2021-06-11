# APCSFinalProject

Group Name: Neon Racers

Members:
Sadid Ethun, Tami Takada

Project Description:
  A drag racing game where the user will race against the computer. There will be 4 interfaces, one for the main menu, one for racing, one for upgrading parts, and one for changing liveries. The user will be able to upgrade their car to make it faster, and also shift the car when drag racing. Winning races will unlock more liveries.  

Link to doc:
https://docs.google.com/document/d/197xKZP5jWDhOhgxDIRfmsnOuFQcctcU6FOOGl_MOomk/edit

Compile/run instructions:
Please compile/run through Processing.

Development Log

[5/26] Tami - I moved everything to Processing and added the set methods for each car part.  
[5/26] Sadid - I created and wrote the CarParts class as well as all the individual classes for the car parts.   

[5/28] Tami - I added the Button class for use in views.

[5/29] Tami - I added a Label class and created the Home page. I finished writing the most of the Upgrades view and began work on the Race view, and I also worked on some calculations for moving the Car.   
[5/29] Sadid - I added the background for the Race class and worked on the lights for the race. I made a Start button to make the lights count down. 

[5/30] Tami - I created the Liveries view and made new car liveries. I also made the ImageButton class for buttons with images.   
[5/30] Sadid - I set up both cars for the drag race. They automatically race as soon as the light turns green and their drag times are displayed.  

[6/1] Tami - I made fonts/images load the minimum amount of times necessary. I began working the Weather and WeatherDelegate classes.   
[6/1] Sadid - I rewrote the code for the drag times using millis() instead of frames. I also made the cars stop at the finish line and created a reset button. 

[6/2] Tami - I added a result display at the end of each race.

[6/3] Tami - I factored in weather for the calculations for moving the car, and I added a weather information display to the Race view.    
[6/3] Sadid - I reorganized the files and reduced the number of files.    

[6/4] Sadid - I made the cars accelerate and added gears to the cars. The user had to shift usimg the arrow key sand teh opponent car shifts by itself.    
[6/4] Tami - I added keyClicked() to respond to key presses in different views. I also started working on adding a currency system, and I added price tags on the liveries in the Liveries view.

[6/6] Tami - I finished adding the currency system to purchase liveries/upgrades and be rewarded for winning races. I made the start button restart the race without having to click the restart button first in the Race view.

[6/7] Tami - I started working on adding an achievements system.
[6/7] Sadid - I created the background for a longer race and made a button that would start a longer race.    

[6/9] Sadid - I changed the point requirements for liveries and upgrades. I also added puddles on the track when the weather is rainy.

[6/10] Tami - I switched the image to rendered shapes for the race background, and I made the shapes move according to the fraction of the race traveled by the user's car. I also made the faster car also move further than the slower car, and I added the finish line and dividing lines.
