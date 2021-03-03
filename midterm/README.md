# INTRO TO IM: MIDTERM PROJECT

## The Letters Race

### Introduction

My idea for my midterm was to create a language learning game. Initially, I wanted the game to be a race where the user races to collect letters. A word would pop up on the screen in a language, and then the user would collect the letter of the word's meaning in english, testing himself on the langauge. After some work, I found it easier if the user would simply control an object that goes left and right to try and collect the letters as they fall down which is a little bit different from a racing game. 
My final design was very similar. I ended up using an image of a paper that the user moves left and right, following the mouse and collects the letters that correspond to the word on the screen.
In each level, a word appears on the screen in Arabic. The objective of the user is to collect the letters that form the English translation of the word to test their knowledge of Arabic vocab.


<iframe width="560" height="315" src="https://www.youtube.com/watch?v=TNp3gXrII1E" frameborder="0" allowfullscreen></iframe>

### Game Instructions

When you first launch the game you are faced with a home screen. Upon clicking start, the game starts. To control the game you move your mouse left and right to move the piece of paper.
On the top left corner of the screen, you have an Arabic word that you're supposed to figure out the meaning of. To test your knowledge, you move the paper to collect the letters that make up the word. Once you're done the level increases and another word is show. Once you're done with all the words the game restarts. You can also click r in the middle of the game to restart.

### Design Choices

A lot of my design choices in this game were based on finding good images for the letter. I wanted the theme to be consistent so when I found letters that were also of the same style, I based the rest of my project on that. The color theme of the project is neon pink. I looked for fonts that were different so they were aesthetically more pleasing. I found a font that looked like grafitti and used that for my home screen but used a more basic font inside the game so it would not distract from the game itself.

### Code

To structure my code, I created 2 classes. One for the paper and one for the letters. The paper class contains 3 classes. One to display the paper, one to move the paper, and one to detect collisions. The collisions function is the only complex one. It loops through the letters and checks if any of them collided sith the paper. If a collision happens it calls the checlWordCollected function. The function checks if the letter exists in the current level (word). In the letters class, the letter are shown and moved. Outside the classes, there is a function to create the letters and place them randomly. And a game function to control all of the above.

### Challenges

1. Changed my idea a few times which was hard as I kept making starting over every few days.
2. Had a top down approach as opposed to a bottom up approach which I learned is a bad way to approach things. Instead of modilarizing my code and making sure the small stuff worked first I jumped into the big ideas which made me spend a lot of time debugging mistakes I could have avoided in the first place. 
3. Having a continuos track on the screen. I looked at different games online that employed the same method and did the same thing.
4. Faced a lot of trouble making the game look aessthetically pleasing.
5. Struggle a little bit with using ArrayLists. I ended up rewatching the Daniel Shiffman videos on them which were super heplfu.
6. The images were always being displayes over the edge of the screen and it took me a while to figure it out.
7. Finding a way to increase the levels of the game. Ended up using array lists since normal arrays did not support what I wanted to do.

### Citation

This sketch from the open processing website really helped me figure out how to detect collisions and place the objects around. 
https://openprocessing.org/sketch/492906
