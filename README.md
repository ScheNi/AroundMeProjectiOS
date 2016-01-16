# AroundMe
### Wat is AroundMe
AroundMe is een applicatie waarmee je heel makkelijk bedrijven (restaurants, winkels, cafés,...) rondom jezelf kunt vinden door middel van jouw gps positie. Je geeft simpelweg een term in en hij zal relevante bedrijven weergeven, dit kan zelfs gewoon 'Pizza' zijn en hij zal bedrijven die met pizza te maken hebben (restaurants) weergeven. Je kan kiezen om deze zaken te sorteren op de volgende filters: 'Meest relevante resultaten', 'Dichtste resultaten' en 'Beste score'. De resultaten kan je dan op verschillende manieren bekijken, wat hieronder uitgebreider besproken wordt. 

### Welke zaken zijn geïmplementeerd
##### Zoeken
Zoals al eerder vermeld is bestaat de basisch van de applicatie uit het zoeken van bedrijven rondom jezelf aan de hand van een term dat je opgeeft. Deze resultaten kan je dan sorteren aan de hand van een filter. De applicatie zal eerst een locatie proberen zoeken alvorens er een zoekopdracht kan uitgevoerd worden. Als hij een locatie te pakken heeft kan er een zoekopdracht uitgevoerd worden. Als de zoekopdracht uitgevoerd wordt en er konden geen resultaten gevonden worden komt er een boodschap op het scherm dat dit meldt. Als er wel resultaten gevonden worden zal er een nieuw scherm met een lijst worden weergegeven. Hier heb je door middel van een tab bar ook de keuze om de resultaten op een map te bekijken.

##### Lijst
Bij het succesvol uitvoeren van een zoekterm zal er als eerste een scherm met een lijst van bedrijven worden weergeven. Hierop kan je per bedrijf een afbeelding en gegevens zoals de afstand, de score, het adres, de naam en dergelijke zien. Er worden 20 bedrijven per keer geladen. Als je bij het laatste bedrijf komt gaan er telkens 20 extra bedrijven bijgeladen worden, dit tot er geen extra resultaten meer zijn. Er kan ook een bedrijf aangeduid worden en dan wordt er een detail pagina voor dit bedrijf geopend, dit staat hieronder beschreven.

##### Map
Naast het weergeven van de bedrijven in een lijst kan men ook de bedrijven op een map weergeven. Hier wordt er dan een ‘pin’ voor elk bedrijf op de map geplaatst en wordt de map op een manier gepositioneerd dat alle ‘pins’ zichtbaar zijn. Naast de pins staat ook jouw eigen locatie op de map aangeduid. Als je meer informatie over een bedrijf wilt klik je op een pin, dan zal er een ‘popupje’ komen met de naam van het bedrijf en het adres. Als je nog meer informatie wilt over dit bedrijf kan je op deze ‘popup’ klikken. Dan ga je naar de detail pagina voor dit bedrijf, wat staat hieronder beschreven staat. 

##### Detail pagina
Op deze pagina zie je de gegevens van een geselecteerd bedrijf. Deze kan vanuit de lijst geselecteerd zijn, maar ook van op de map. Hier zie je een afbeelding van het bedrijf en relevante bedrijfsgegevens zoals de naam, het adres en hoe ver het van jouw positie is. Hiernaast kan je ook een score van het bedrijf zien en ook het aantal reviews er voor dit bedrijf geschreven zijn. Het bedrijf wordt ook op een map weergeven. Op deze map kan je ook jouw eigen positie terugvinden.

##### Internetverbinding
Voor deze applicatie is het een must dat je een actieve internetverbinding hebt. Dit wordt dan ook gecontroleerd. Als er geen actieve internetverbinding is zal er een boodschap verschijnen dat dit meldt. Deze boodschap kan op elk moment (op elk scherm, wanneer internetverbinding weg valt) tevoorschijn komen. Wanneer er terug een actieve verbinding is zal deze boodschap verdwijnen.

 

### Gebruikte technologieën
Deze applicatie maakt gebuik van de [Yelp API](https://en.yelp.be/developers/) voor het maken van de zoekopdrachten. De applicatie is geschreven in Swift en ik heb gebruik gemaakt van Storyboards. 

Bij het maken van deze applicatie waren volgende zaken van belang: 
* [OAuthSwift](https://github.com/OAuthSwift/OAuthSwift): De yelp API maakt gebruik van OAuth voor de requests te authentiseren, deze library zorgt ervoor dat dit heel gemakkelijk gedaan kan worden. Hiermee verstuur ik dus de requests naar yelp.
* [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON): Hiermee parse ik de json die ik van yelp als response krijg naar Objecten. 
* [Kingfisher](https://github.com/onevcat/Kingfisher): Met deze library download en cache ik de afbeeldingen.
* [SwiftSpinner](https://github.com/icanzilb/SwiftSpinner): Deze gebruik ik voor de laad animaties
* [UIScrollView-InfiniteScroll](https://github.com/pronebird/UIScrollView-InfiniteScroll): Voor het laden van meer bedrijven wanneer men aan het laatste bedrijf komt.
* [ReachabilitySwift](https://github.com/ashleymills/Reachability.swift): Hiermee kan ik op elk moment kijken of er een actieve internetverbinding is.
* [CoreLocation](https://developer.apple.com/library/ios/documentation/CoreLocation/Reference/CoreLocation_Framework/index.html#//apple_ref/doc/uid/TP40007123): Voor het afhalen van de locatie van een gebruiker.
* [MapKit](https://developer.apple.com/library/ios/documentation/MapKit/Reference/MapKit_Framework_Reference/): Voor het weergeven van een map met bepaalde zaken erop (bedrijven en eige positie).
* UINavigationController, UITabBarController, UISplitViewController, UITableViewController,..
* Auto layout
* Segue
* Model-View-Controller en Delegation.
* The App Life Cycle
* Verschillende UI elementen waaronder: MapView, UIButton, UIPickerView,...
* ...

Ik denk dat ik de belangrijkste 'hoofd'zaken heb opgenoemd, het kan zijn dat ik er nog een paar vergeten ben.

### Applicatie gebruiken
Ik maak gebruik van CocoaPods als dependency manager. Normaal zitten de pods mee in deze github repository, maar voor de zekerheid run je best eerst de volgende commando's vanuit de terminal:  
```sh
$ cd AroundMe
$ pod install
```

Na het uitvoeren van de vorige commando's is het belangrijk dat je de 'AroundMe.xcworkspace' opent in plaats van  'AroundMe.xcodeproj', dit doe als je volgende vanuit de terminal: 
```sh
$ open AroundMe.xcworkspace
```
De workspace zou nu normaal gezien in xcode moeten openen, en je zou de applicatie moeten kunnen starten.

> Opmerking: Ik heb al gemerkt dat hij de pods soms niet vindt, dit kan opgelost worden door Product > Build For Testing uit te voeren. De oorzaak van dit probleem heb ik nog niet kunnen vinden.

> Opmerking 2: Ik heb zelf soms problemen gehad dat de applicatie niet van de eerste keer de locatie in de emulator wou vinden, gewoon opnieuw run klikken en het werkt wel. Heb op een echt toestel getest en daar werkte het zonder problemen. 


