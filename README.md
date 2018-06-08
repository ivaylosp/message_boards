# Live scoreboard / messageboard for Exile Mod

## Description
I wanted to create a live scoreboard for Altis Life a few years back but i never managed to find a suitable way so it can work live in game and it wont hurt perfomance bad. Recently i discovered a GitHub hosted package by https://github.com/Cenwulf which pointed me in the right direction to create my scoreboard. I consulted with a few very bright guys in the Arma 3 scripting discord channel which helped me get the script optimized and once i got it to a level that i like i used it on 2 of our Neutralgaming servers. I was pleasantly surprised the excitement these boards created for the players and i saw an aspect of Exile i haven't seen before. Everyone was pushing hard to be the top on each board except the deaths board of course. So i decided that this is something all of you Exile server hosts should get and use and enjoy.   

 - When you see `##arma_3_server##` that refers to the root directory of your Arma 3 setup.
 - When you see `##exile_mission##` that refers to the folder name of your mission

## Installation Fresh
- Convert the `exile_ng` into a PBO using PBO manager and copy the PBO into into ##arma_3_server##/@ExileServer/addons/
- Open `exile.ini` file and copy all the text and paste it right at the bottom of your `##arma3server##/@ExileServer/extDB/sql_custom_v2/exile.ini`
- Copy the textures folder to your `##arma_3_server##/mpmissions/##exile_mission##/` if you already have a textures folder than just copy the contents of my textures folder into yours
- Open clientside_code/config.cpp and copy all the text and paste it at the bottom of your `##arma_3_server##/mpmissions/##exile_mission##/config.cpp`
- Open your map editor and place the standard `Land_Billboard_F` billboard where you would like the live scoreboard to initialize and export them using the Exile tools for exporting map objects. The exported lines will contain object similar to the following:
```
["Land_Billboard_F", [8066.36, 9722.94, 31.9463], [1, -4.37114e-008, 0], [0, 0, 1], true],
["Land_Billboard_F", [3628.18, 3212.83, 4.30319], [-0.200219, -0.979751, 0], [0, 0, 1], true],
```
- Copy the coordinates from the placed billboards and update the settings you put under `##arma_3_server##/mpmissions/##exile_mission##/config.cpp`

## TODOs
I would love to utilize the try catch blocks properly as they are designed but i wanted to get it live so people can enjoy. I will release an update as i go and than it will be a matter of copy paste the new files to get it going

## Contribution
Please feel free to submit pull requests and bugs and i will attend to them as soon as i have a gap. Feel free to fork the repo and do as you please with it. And above all enjoy it!

## Mentions
The idea was inspired by https://github.com/Cenwulf/A3RifleRange script
A big thank you to Commy2 and Dedmen from https://discord.gg/vefhvm Arma 3 discord channel for their advice