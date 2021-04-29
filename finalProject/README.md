# How to break your Arduino?

## Creating Art with Arduino + Processing

My final project idea is to build a processing sketch that creates a art of some sort using input from the Arduino board. This will be a project that will allow the user to interact with project and create their unique artwork. I chose this project because I wanted to take advantage of the arduino sensors to their full capacity and make use of how unreliable the values can be if you're creating a set thing. In this project, you can mess around with the sensors and inputs as much as you want to see how interesting it will turn out to be. I titled this project how to break your arduino because the crazier your sensor values get, the more interesting the art becomes.


## Structure

The project is made up of 2 games. Each game uses the sensors to create a different type of artwork.

### Game 1

[![Game 1](https://img.youtube.com/vi/5QQpoS2_hdg/0.jpg)](https://www.youtube.com/watch?v=5QQpoS2_hdg)

![art](art.jpeg)

Game 1 is inspired by pour art or pour painting. 

In this type of work, acrylic paint is poured all over the sketch in an effor to create interesting looking patterns. The first step was to research and look for ways to implement that in my processing sketch. I looked all over the internet and managed to find a sketch on openprocessing that I based this game off of. I altered the sketch to match the pour art theme. The game consists of three different functions. One function controls the bruch stroke, and the two other control the paint splatter. 

### Game 2

[![Game 2](https://img.youtube.com/vi/vgzu1cLNwTI/0.jpg)](https://www.youtube.com/watch?v=vgzu1cLNwTI)


Game 2 uses circles and their strokes to create intersting looking overlapping shapes. The shapes overlap and as you click the mouse they increase.

## Production

1. LOTS of looking at code online.
2. Once I was sure of my idea, and I had found the openprocessing sktech to help me, I spent a lot of time going through the whole code so I can have a very thorough understanding of it. 
3. After that, I went ahead and started implementing the first game.
4. Implementing the secong game was pretty easy going.
5. After that I built my circuit and connected my arduino to my processing sketch which went very smoothly (practice makes perfect!)
6. After everything was done, I worked on the homepage and aesthetics.

## Controls

A unique thing about the project is that I don't specify anywhere which sensor controls what. To run the sketches you have to use the mouse and then sensors at the same time. The whole point was to see how people can experiment with the arduino and try to compe up with interesting works of art. It is part of the experience to try and figure what each sensor controls on the sketch.

## Schematic

![schematic](images/schematic.png)

## Circuit

![circuit](images/circuit1.png)
![circuit](images/circuit2.png)

## Challenges

My main challenges in this project were related more to the processing side than to the arduino side. I had organizational problems in my processing code because I had everyhting in the same file. Looking back, I would definitely try to put each game in its own processing file. 

## Interesting takes

I was very happy with how much I improved in building the circuits compared to the first time.

