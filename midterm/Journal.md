# Midterm Documentation



## The idea over time

My idea for this project was to create a language learning game. Initially, I wanted the game to be a race where the user races to collect letters. A word would pop up on the screen in a language, and then the user would collect the letter of the word's meaning in english, testing himself on the langauge. After some work, I found it easier if the user would simply control an object that goes left anf right to try and collect the letters as they fall down which is a little bit different from a racing game. 

## Progress so far

So far, I managed to create 2 different classes for the obstacles and the user. I created functions to place the obstacles and draw the objects. In terms of the implementation I drew inspiration from an open source sketch linked below. It was helpful for me to look at how the game was structured there and how they created the continuos scroll effect. So far, I have a piece of paper (image) that the user can move from left to right while letters flow down. If a letter is caught a variable is iincremented but nothing happens yet in terms of collecting the word.


### February 20:

Researched examples online to see how feasible my idea is. Started the sketch by simply adding an object that can be moved from left to right.

### February 21:

Created a class for the object and called it user and added an image instead of a simple square.

### February 22:

Found a sketch that had a similar idea so learned how to create the infinite scroll and then wrote the majority of the rest of the sketch. I created two classes for obstacles and user and created functins to run the game. I also created the home screen (very basic for now).

[!](sample.gif)

## Steps to come

1. My first step is writing a function that keeps track of the letters collected and to see if they form a word.
2. Create an array of different words that increase by difficulty, so each level is a harder word.
3. Some of the images go off the edges of the screen so I should fix that.
4. Get better quality images.
5. Work on the aesthetics of the game (v important).
6. Add a message when the game ends.


