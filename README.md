# AroundMe
### Wat is AroundMe
AroundMe is een applicatie waarmee je heel makkelijk bedrijven (restaurants, winkels, cafés,...) rondom jezelf kunt vinden door middel van jouw gps positie. Je geeft simpelweg een term in en hij zal relevante bedrijven weergeven, dit kan zelfs gewoon 'Pizza' zijn en hij zal bedrijven die met pizza te maken hebben (restaurants) weergeven. Je kan kiezen om deze zaken te sorteren op de volgende filters: 'Meest relevante resultaten', 'Dichtste resultaten' en 'Beste score'. De resultaten kan je dan op verschillende manieren bekijken, wat hieronder uitgebreider besproken wordt. 

### Welke zaken zijn geïmplementeerd
##### Zoeken
Zoals al eerder vermeld is bestaat de basisch van de applicatie uit het zoeken van bedrijven rondom jezelf aan de hand van een term dat je opgeeft en deze kan je sorteren aan de hand van een filter. De applicatie zal eerst een locatie proberen zoeken alvorens er een zoekopdracht kan uitgevoerd worden. Als hij een locatie te pakken heeft kan er een zoekopdracht uitgevoerd worden. Als de zoekopdracht uitgevoerd wordt en er konden geen resultaten gevonden worden komt er een boodschap op het scherm dat dit meldt. Als er wel resultaten gevonden worden zal er een nieuw scherm met een lijst worden weergegeven. Hier heb je door middel van een tab bar ook de keuze om de resultaten op een map te bekijken.

##### Lijst
Bij het succesvol uitvoeren van een zoekterm zal er als eerste een scherm met een lijst van bedrijven worden weergeven. Hierop kan je per bedrijf een afbeelding en gegevens zoals de afstand, de score, het adres, de naam en dergelijke zien. Er worden 20 bedrijven per keer geladen. Als je bij het laatste bedrijf komt gaan er telkens 20 extra bedrijven bijgeladen worden, dit tot er geen extra resultaten meer zijn. Er kan ook een bedrijf aangeduid worden en dan wordt er een detail pagina voor dit bedrijf geopend, dit staat hieronder beschreven.

##### Map
Naast het weergeven van de bedrijven in een lijst kan men ook de bedrijven op een map weergeven. Hier wordt een dan een ‘pin’ voor elk bedrijf op de map geplaatst en wordt de map op een manier gepositioneerd dat alle ‘pins’ zichtbaar zijn. Naast de pins staat ook jouw eigen locatie op de map aangeduid. Als je meer informatie over een bedrijf wilt klik je op een pin, dan zal er een ‘popupje’ komen met de naam van het bedrijf en het adres. Als je nog meer informatie wilt over dit bedrijf kan je op deze ‘popup’ klikken. Dan ga je naar de detail pagina voor dat bedrijf, wat staat hieronder beschreven. 

##### Detail pagina
Op deze pagina zie je de gegevens van een geselecteerd bedrijf. Deze kan vanuit de lijst geselecteerd zijn, maar ook van op de map. Hier zie je een afbeelding van het bedrijf en relevante bedrijfsgegevens zoals de naam, het adres en hoe ver het van jouw positie is. Hiernaast kan je ook een score van het bedrijf zien en ook het aantal reviews er voor dit bedrijf geschreven zijn. Het bedrijf wordt ook op een map weergeven. Op deze map kan je ook jouw eigen positie terugvinden. 

### Gebruikte technologieën

### Applicatie gebruiken
Ik maak gebruik van CocoaPods als dependency manager. Normaal zitten de pods mee in het github project, maar voor de zekerheid run je eerst het volgende commando vanuit de terminal:  
```sh
$ pod install
```

Na het uitvoeren van het vorige commando is het belangrijk dat je de 'AroundMe.xcworkspace' in plaats van de 'AroundMe.xcodeproj', dit doe als je volgende vanuit de terminal: 
```sh
$ open AroundMe.xcworkspace
```
> Opmerking: Ik heb al gemerkt dat hij de pods soms niet vindt, dit kan opgelost worden door Product > Build For Testing uit te voeren. De oorzaak van dit probleem heb ik nog niet kunnen vinden.



