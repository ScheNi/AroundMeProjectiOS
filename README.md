# AroundMe

AroundMe is een applicatie waarmee je heel gemakkelijk bedrijven (restaurants, winkels, café,...) in uw buurt kunt vinden. Je geeft simpelweg een term in en hij zal relevante bedrijven weergeven, dit kan zelfs gewoon 'Pizza' zijn en hij zal bedrijven die met pizza te maken hebben (restaurants) weergeven. Naast een term je ook keuze maken uit 3 filter. De beste match voor jou, afstand, en score. 

Je ziet een mooi overzicht en kunt dan nog een 

### Applicatie draaien
Normaal zitten de pods mee in het github project, maar voor de zekerheid run je eerst het volgende commando vanuit de terminal:  
```sh
$ pod install
```

Na het uitvoeren van het vorige commando is het belangrijk dat je de 'AroundMe.xcworkspace' in plaats van de 'AroundMe.xcodeproj', dit doe als je volgende vanuit de terminal: 
```sh
$ open AroundMe.xcworkspace
```
> Opmerking: Ik heb al gemerkt dat hij de pods soms niet vind bij mij, dit los ik op door Product > Build For Testing uit te voeren. Ik heb nog niet kunnen vinden wat de oorzaak hiervoor is.