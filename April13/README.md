# Bouncing Ball with Arduino Controller

## Idea

In this project, I created a bouncing ball sketch with a paddle that is controlled by the switches on the breadboard. The swithes control the paddle's movement left and right to bounce the ball of the paddle.
There is a ascore to keep track of how many times you bounce the ball. 

## Changes

My initial idea was to create a puzzle withmultuple shapes on the screen that flash in a certain order and then you have to replicate that order on your arduino. I worked on this idea for several days but I wasn't able to complete it so I switched to the bouncing ball.
My main problem was that I was unable to figure out how to get the processing sketch to wait while the Arduino input is coming in. I had boolean variables to execute different functions but the process never matched up.
Even though I wasn't able to get this to work, I learned a lot about the handshaking process and about timing in both Arduino and Processing. It is really interesting that you can use millis in processing too.

## Circuit

![](circuit.png =250x)
## Schematic
![](schematic.png =250x)
## Video

## Challenges

Since my processing code was similar to things we did before and I found a lot of help online, I didn't face a lot of challenges working with it. I think I made some mistakes when I was trying to edit the writing / reading to the port but they helped me understand much more deeply.
Another thing I wanted to try but wasn't able to was using the potentiometer as a joystick controller kind of thing. I was trying to map the values to position but it wasn't working like I exprcted it too so I went with the switches.
