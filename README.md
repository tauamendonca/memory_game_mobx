# DRAGON MEMORY
## A Dragon Quest memory game
A memory card game using Provider, MobX and storage with Hive. The theme is Dragon Quest (or Dragon Warrior depending where are you from) and it was based on a youtube showcase from professor Diego Antunes

Link for the course/showcase: https://www.youtube.com/watch?v=hU8ht030JUM&list=PL_wKlpKIC9vVOZxwQyNzuD1lL9cJgPiiE

[
    <img
        src="https://raw.githubusercontent.com/tauamendonca/memory_game_mobx/refs/heads/main/assets/other/readme.png" 
        width=65%
        title="Prof Diego Antunes - Jogo da Memória em Flutter"
        alt="Prof Diego Antunes - Jogo da Memória em Flutter"
    />
](https://www.youtube.com/watch?v=hU8ht030JUM&list=PL_wKlpKIC9vVOZxwQyNzuD1lL9cJgPiiE)


Some changes, besides the theme, where made - mostly involving the use of a package to limit window resizing in Windows - I am using this project to test changes in Windows' windows according to content size.
Changes where needed in very few points, thanks to the fact that in the last two or three years (now being June, 2025)


Known bugs after following the tutorial: 
- still has to refresh cache when it starts a new level after clearing or losing one
- sometimes if you click very fast you can click one card before starting a new level, and that leaves the first move in a new level opening only one card. Perhaps when clearing the cache this will be solved too.

Improvement topics:
- overall UI and layout
- card sizing specially
- cache
- web version
- change theme to avoid Nintendo's lawyers (!) 
- publishing

# Changelog
June, 03rd, 2025 - V 1.0 - Game working fully and saving high scores, windows limiting size so it won't overflow in Windows.    
