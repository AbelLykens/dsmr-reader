��    �      t  �   �      �  �   �  "   k  9   �  `   �  	   )  2   3  l   f     �  m   �     X  B   `      �  �   �  p   M     �     �  W   �  �   C  �   @     �  %   �  �   �  |   �            
   !  !   ,  {   N  R   �  _        }  �   �  d   �  @   �  �   <  y   �  J   P     �     �  	   �      �  F        I     ^     s  ,   �  -   �  &   �  '     7   4  1   l  5   �  !   �  *   �  %   !     G     b     �     �     �     �     �     �  f   �  �   Z  K   �  O   6  �   �  [     W   o  �   �     J  �   h  �   �     �  7   �  	         $   S   3   �   �   @   !  Y   Y!     �!  '   �!  `   �!  E   J"  4   �"  +   �"  -   �"  '   #    G#     J$  ]   Q$     �$  I   �$     %    &  9   )'  1   c'  1   �'  
   �'     �'  P   �'  �   +(  �   �(  p   H)  X   �)  Z   *  [   m*  T   �*  �   +  �   ,  (   �,  ,   �,  H   �,  /   D-  3   t-     �-  4   �-     �-     .  �   .  �   �.  �   (/  5   �/  �   0  X   �0  *   �0  �   &1  e   �1  (   '2  +   P2  -   |2     �2     �2     �2  :   �2      3  �  =3  �   �4  &   �5  =   �5  p   6     v6  G   }6  �   �6     H7  j   Y7     �7  9   �7  #   8  �   *8  r   �8  '   /9     W9  X   q9    �9  �   �:     r;  '   �;  �   �;  �   E<     �<     �<  
   �<  '   �<  �    =  Y   �=  k   >     w>    �>  q   �?  K    @  �   l@  }   A  X   �A  $   �A      B  
   <B     GB  K   aB  %   �B     �B     �B  *   C  .   1C  #   `C  1   �C  8   �C  +   �C  5   D  $   QD  9   vD      �D     �D  -   �D     E     /E     @E     VE     fE     �E  q   �E  �   
F  O   �F  g   �F  �   bG  _   H  h   ~H  �   �H     |I  �   �I  �   ;J     9K  @   VK     �K     �K  Y   �K  �   L  Q   �L  k   M  
   tM  &   M  ]   �M  \   N  ,   aN  0   �N  8   �N  (   �N    !O     )P  T   1P  	   �P  Q   �P  #  �P  L  R  <   SS  1   �S  1   �S  
   �S     �S  Q   T  �   _T  �   U  �   �U  N   'V  z   vV  �   �V  U   �W    �W  �   �X  #   �Y  -   �Y  E   �Y  G   ;Z  J   �Z     �Z  D   �Z     &[     ?[  �   L[  �   \  �   �\  O   �]  z   �]  d   P^  /   �^  �   �^  t   y_  (   �_  +   `  -   C`     q`     �`     �`  9   �`  )   �`                           K   n   =   l   0           y       u   #   i   J      $   W               b                 o       `       @       I   Z   ;   <   U      q           %   |   k   	   ,   8   D   �   3              O       1   L      4   s       :   T   
          w   +       c   P   �   t   �         F      7   X   -   6   N   m   {          (              ]   G   M       }   .      '       C              r   z      �   B   H          d      &   ^       v          �      �   a   ?   V       �       "   )       /               �       >   2                       *   �   Q   _   p         �   �   \   �   h      E            ~               5      S   !   j   x          A       g   R   9   [       f       Y   e        *Please note that "9.5" in the example below is just the version number of the database, and it may differ from your installation. The same steps however apply.* :doc:`Env Settings<env_settings>`. :doc:`More information can be found here <installation>`. After editing the file, all processes need to be restarted. To do this, you can either execute:: All done! Always start by checking the log files for errors. Any processes listed, should have the status ``RUNNING``. Stale or crashed processes can be restarted with:: Application management Assuming you are using the default database, PostgreSQL, you may want to try a one-time vacuum by executing:: Backend By default DSMR-reader reads and preserves all telegram data read. Change it to your new location:: Changing the database data location may cause data corruption. Only execute the step below if you understand exactly what you are doing! Check whether the database is running again, you should see multiple processes: ``sudo ps faux | grep postgres`` Common error resolution Compressed (default) Configure ``DSMR_USER`` and ``DSMR_PASSWORD`` of the :doc:`Env Settings<env_settings>`. Configure a data retention policy :doc:`in the configuration<../configuration>`. This will eventually delete up to 99 percent of the telegrams, always preserving a few historically. Also, day and hour totals are **never** deleted by retention policies. Confirm that the database has stopped, you should see no more ``postgresql`` processes running: ``sudo ps faux | grep postgres`` Contents Copy its output to your Github issue. DSMR-reader has DEBUG-logging, which makes the system log very verbosely about what it's trying to do. This applies **specifically** to the ``dsmr_backend`` process. DSMR-reader technically consists of these processes (some may or may not be used by you) and they are watched by Supervisor: Data Database Datalogger Debug info dump for Github issues Do **not** restore your database if you've either **started the application** and/or ran ``manage.py migrate`` in some way. Does the database not start? Check its logs in ``/var/log/postgresql/`` for hints. Doing so WILL cause trouble with duplicate data/ID's and break your installation at some point. Each has its own log file(s): Each release `has it's database migrations locked <https://github.com/dsmrreader/dsmr-reader/tree/v4/dsmrreader/provisioning/downgrade/>`_. You should execute the script of the version you wish to downgrade to. And the switch the code to the release. Edit database configuration ``sudo vi /etc/postgresql/9.5/main/postgresql.conf`` and find the line:: Ensure the new location exists: ``sudo mkdir /data/postgresql/`` Errors are likely to be logged at all times, no matter the DEBUG-logging level used. Debugging is only helpful to watch DSMR-reader's detailed behaviour. Every once in a while there may be updates. You can also easily check for updates by using the application's Status page. Everything should work as usual now, storing the data on the new location. Execute the commands below: Execute the following command:: Execute:: FAQ (Frequently Asked Questions) First, **please make sure you have a recent backup of your database**! For a hard restart:: For a soft restart:: For example ``v4.0``:: How can I configure a data retention policy? How can I increase the datalogger sleep time? How do I change the database location? How do I enable MySQL timezone support? How do I fix ``DETAIL: Key (id)=(123) already exists``? How do I fix stats after smart meter replacement? How do I fix: ``Error: Already running on PID 1234``? How do I only use the datalogger? How do I recalculate prices retroactively? How do I reclaim database disk space? How do I restore a backup? How do I set admin credentials? How to downgrade? How to restart? How to uninstall? How to upgrade? I still need help! I'm missing gas readings? I've adjusted my energy prices but there are no changes! How can I regenerate them with my new prices? If anything happens to fail or malfunction, please follow the steps below first to provide some background information when reporting an issue. If for some reason you need to downgrade the application, you will need to: If it does not resolve your issue, ask for support on Github (see end of page). If the processes do run, but you cannot find an error, (e.g.: things seem to hang or tend to be slow), there might be another issue at hand. If there was any disk space to reclaim, the effect should be visible on the filesystem now. If you can't find the answer in the documentation, do not hesitate in looking for help. If you do encounter errors while restoring the backup in an **empty** database, create an issue at Github and **do not continue**. If you're seeing this error:: In the example below we will move the data from ``/var/lib/postgresql/`` to ``/data/postgresql/`` (which could be an external mount). Increase the datalogger sleep time :doc:`in the configuration<../configuration>` to 5 seconds or higher. This will save a lot of disk storage, especially when using a Raspberry Pi SD card, usually having a size of 16 GB max. It should now be:: Just delete the PID file and restart the webinterface:: Log files Logging levels Make sure the OS has direct access the new location and **create a back-up first**! Make sure the ``postgres`` user has access to the new location (and any parent folders in it's path): ``sudo chown -R postgres:postgres /data/`` Make sure you are ``dsmr`` user by executing ``sudo su - dsmr``. Move the database data folder: ``sudo mv /var/lib/postgresql/9.5/ /data/postgresql/9.5/`` Now execute:: Now remove the ``###`` from this line:: On recent versions it should be as simple as executing the following command as root/sudo user:: Only follow these step if you want to restore a backup in PostgreSQL. Open the ``.env`` file and look for the code below:: Optionally, you can remove these packages:: Or go back to the **sudo user** and execute:: Or to restart them all simultaneously:: Please make sure that your meter supports reading gas consumption and that you've waited for a few hours for any graphs to render. The gas meter positions are only be updated once per hour (for DSMR v4). The Status page will give you insight in this as well. Prices Restoring a backup will replace any existing data stored in the database and is irreversible! Result Save the file and start the database: ``sudo systemctl start postgresql`` Since the SD-card is quite vulnerable to wearing and corruption, you can run the database on a different disk or USB-stick. To do this, you will have to stop the application and database, change the database configuration, move the data and restart all processes again. Sometimes, when relocating or due to replacement of your meter, the meter positions read by DSMR-reader will cause invalid data (e.g.: big gaps or inverted consumption). Any consecutive days should not be affected by this issue, so you will only have to adjust the data for one day. Start DSMR-reader again: ``sudo supervisorctl start all`` Stop DSMR-reader: ``sudo supervisorctl stop all`` Stop database: ``sudo systemctl stop postgresql`` Supervisor Support The "**dsmr_debuginfo**" command is available since DSMR-reader v4.4 and higher. The DEBUG-logging is disabled by default, to reduce writes on the filesystem. You can enable the logging by following these steps: The day after, you should be able to manually adjust any invalid Day or Hour Statistics :doc:`in the admin interface<configuration>` for the invalid day. The logfiles may be stale due to rotation. To see all logs for a process, try tailing a wildcard pattern, e.g.:: The user should either be created or the existing user should have its password updated. Therefor two measures can be taken: Increasing datalogger sleep and data retention policy. This assumes you've **not yet** reinstalled DSMR-reader and created an **empty** database:: This depends on the situation, but you can always try the following yourself first:: This is caused by the high data throughput of DSMR version 5, which produces a new telegram every second. Both DSMR-reader and most of its users do not need this high frequency of telegrams to store, calculate and plot consumption data. This will only make a difference if you've enabled data cleanup retroactively, resulting in more than a 25 percent data deletion of your entire database. To be clear, we'll repeat it once again: To delete your data (the database) as well:: To remove DSMR-reader from your system, execute the following commands:: To restore a compressed backup (``.gz``), run:: To restore an uncompressed backup (``.sql``), run:: Troubleshooting Unapplying the database migrations may take a while. Uncompressed (legacy) Webinterface When using a Raspberry Pi (or similar) combined with a DSMR version 5 smart meter (the default nowadays), you may experience issues after a while. You can supply additional debug info by executing the "**dsmr_debuginfo**" command and copying its output into your issue on Github. You can update your application to the latest version by executing ``deploy.sh``, located in the root of the project. Make sure to execute it while logged in as the ``dsmr`` user:: You can view the status of all processes by running:: You might want or need to restart DSMR-reader manually at some time. E.g.: Due to altered settings that need to be reapplied to the processes. You should **not** see any errors regarding duplicate data or existing ID's or whatever. You should now be on the targeted release. `Check these docs <https://dev.mysql.com/doc/refman/5.7/en/mysql-tzinfo-to-sql.html>`_ for more information about how to enable timezone support on MySQL. `View existing Github issues or create a new one <https://github.com/dsmrreader/dsmr-reader/issues>`_ ``/var/log/supervisor/dsmr_backend.log`` ``/var/log/supervisor/dsmr_datalogger.log`` ``/var/log/supervisor/dsmr_webinterface.log`` ``dsmr_backend`` ``dsmr_datalogger`` ``dsmr_webinterface`` switch the application code version to a previous release. unapply database migrations. Project-Id-Version: DSMR Reader
Report-Msgid-Bugs-To: Dennis Siemensma <github@dennissiemensma.nl>
Last-Translator: Dennis Siemensma <github@dennissiemensma.nl>
Language: nl
Language-Team: Dennis Siemensma <github@dennissiemensma.nl>
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
X-Generator: Poedit 2.0.6
PO-Revision-Date: 
 *N.B.: "9.5" in onderstaand voorbeeld is slechts het versienummer van de database en kan afwijken van je eigen situatie. Je kunt echter gewoon dezelfde stappen uitvoeren.* :doc:`Env-instellingen<env_settings>`. :doc:`Meer informatie kun je hier terugvinden<installation>`. Na het bewerken van het bestand zul je alle processen moeten herstarten. Om dit te doen, voer het volgende uit:: Klaar! Je startpunt is altijd het bekijken van de logfiles voor foutmeldingen. Elk proces dat getoond wordt zou de status ``RUNNING`` moeten hebben. Hangende of gecrashde processen kunnen herstart worden met:: Applicatiebeheer Er vanuitgaande dat je de standaarddatabase gebruikt, PostgreSQL, kun je het volgende eenmalig uitvoeren:: Backend Standaard bewaart DSMR-reader alle ingelezen telegrammen. Wijzig het naar de nieuwe locatie:: Het wijzigen van de dataopslag breng het gevaar van datacorruptie met zich mee. Voer onderstaande stappen alleen uit als je begrijpt wat je doet! Controleer of de database weer draait, je zou nu meerdere processen moeten zien:  ``sudo ps faux | grep postgres`` Oplossingen voor veelvoorkomende fouten Gecomprimeerd (standaard) Stel ``DSMR_USER`` en ``DSMR_PASSWORD`` in via de :doc:`Env-instellingen<env_settings>`.  Stel een gegevensretentiebeleid in :doc:`binnen de configuratie<../configuration>`. Dit schoont uiteindelijk tot 99 procent van de telegrammen op, waarbij een aantal altijd achterblijven i.v.m. historie. Daarnaast worden uur- en dagtotalen **nooit** opgeschoond door het retentiebeleid. Controleer dat de database gestopt is, je zou geen processen meer moeten zien van ``postgresql`` met:  ``sudo ps faux | grep postgres`` Inhoudsopgave Kopieer de output naar je Github-issue. DSMR-reader heeft DEBUG-logging, waarmee het systeem heel letterlijk logt wat het aan het doen is. Dit geldt **specifiek** voor het ``dsmr_backend`` proces. DSMR-reader bestaat technisch uit deze processen (sommigen zullen wel of niet in je eigen situatie gebruikt worden) en ze worden beheerd door Supervisor: Data Database Datalogger Debug-informatiedump voor Github-issues Zet **niet** je database terug wanneer je ofwel **de applicatie (weer) gestart hebt** ofwel wanneer je al ``manage.py migrate`` hebt uitgevoerd. Wil de database niet starten? Bekijk dan de logs in  ``/var/log/postgresql/`` voor hints. Doorgaan zorgt er gegarandeerd voor dat er problemen komen met dubbele gegevens/ID's op een bepaald moment. Elk heeft eigen logbestand(en): Elke release `heeft z'n eigen databasemigraties vastgelegd <https://github.com/dsmrreader/dsmr-reader/tree/v4/dsmrreader/provisioning/downgrade>`_. Je zult het script moeten uitvoer voor de release waar je naar toe wilt. En vervolgens de codebase wisselen naar dezelfde release. Open de databaseconfiguratie met ``sudo vi /etc/postgresql/9.5/main/postgresql.conf`` en vind de volgende regel:: Zorg ervoor dat de nieuwe locatie bestaat: ``sudo mkdir /data/postgresql/`` Fouten worden doorgaans altijd gelogd, ongeacht het logging niveau van DEBUG-level of niet. Debugging is alleen nuttig om het gedrag van DSMR-reader in meer detail te observeren. Met enige regelmaat zijn er updates beschikbaar. Je kunt dit ook eenvoudig controleren op de Status-pagina van de applicatie. Alles zou weer moeten werken zoals voorheen, met de data voortaan op een andere locatie. Voer de onderstaande commando's uit: Voer het volgende commando uit:: Voer uit:: FAQ (veelgestelde vragen) Allereerst, **zorg ervoor dat je een recente backup hebt van je database**! Voor een harde/geforceerde herstart:: Voor een zachte herstart:: Bijvoorbeeld ``v4.0``:: Hoe stel ik een gegevensretentiebeleid in? Hoe verhoog ik de slaaptijd van de datalogger? Hoe verplaats ik de databaseopslag? Hoe zet ik tijdzone-ondersteuning aan voor MySQL? Hoe los ik ``DETAIL: Key (id)=(123) already exists`` op? Hoe herstel ik gegevens na een meterwissel? Hoe los ik ``Error: Already running on PID 1234`` op? Hoe gebruik ik alleen de datalogger? Hoe kan ik prijzen met terugwerkende kracht herberekenen? Hoe krijg ik schijfruimte terug? Hoe zet ik een back-up terug? Hoe stel ik de inloggegevens van de admin in? Hoe downgrade ik? Hoe herstart ik? Hoe deïnstalleer ik? Hoe upgrade ik? Ik heb nog steeds hulp nodig! Ik mis gasverbruik? Ik heb zojuist mijn energieprijzen aangepast, maar ik zie geen verschil! Hoe kan ik de nieuwe prijzen doorvoeren? Wanneer er iets lijkt mis te gaan, volg de onderstaande stappen eerst, voordat je een issue aanmaakt. Hiermee kun je wat meer achtergrondinformatie aanleveren. Wanneer je om wat voor reden dan ook de applicatie moet downgraden, dan zul je: Wanneer dat het probleem niet oplost, vraag dan om ondersteuning via Guthub (zie onderaan deze pagina). Wanneer de processen lijken te draaien, maar je kunt geen fout vinden (bijvoorbeeld als telegrammen hangen of de verwerking traag lijkt), dan is er waarschijnlijk iets anders aan de hand. Mocht er schijfruimte vrij te maken zijn, dan zou je dat nu moeten zien op het bestandssysteem. Wanneer je de oplossing niet kan vinden in de documentatie, aarzel dan vooral niet om om hulp te vragen. Mocht je bij het terugzetten van de back-up in een **lege** database toch fouten tegenkomen, maak dan een issue aan op Github en **ga niet verder**. Als je deze fout ziet:: In onderstaand voorbeeld verplaatsen we de dataopslag van  ``/var/lib/postgresql/`` naar ``/data/postgresql/`` (wat bijvoorbeeld op een externe disk zou kunnen zijn). Verhoog de slaaptijd van de datalogger :doc:`binnen de configuratie<../configuration>` naar minimaal 5 seconden. Dit bespaart een hoop schijfruimte, met name wanneer je een standaard Raspberry Pi SD-kaart gebruikt, die meestal maximaal 16 GB groot zijn. Het zou nu dit moeten zijn:: Verwijder het genoemde PID-bestand en herstart de webinterface:: Logbestanden Logging levels Zorg ervoor dat het OS toegang heeft tot de nieuwe locatie en **maak eerst een back-up**! Zorg ervoor dat de ``postgres`` gebruiker toegang heeft tot de nieuwe locatie (en eventuele bovenliggende mappen in het pad): ``sudo chown -R postgres:postgres /data/`` Zorg ervoor dat je ``dsmr`` gebruiker bent door ``sudo su - dsmr`` uit te voeren. Verplaats nu de gehele data-map van de database: ``sudo mv /var/lib/postgresql/9.5/ /data/postgresql/9.5/`` Voer uit:: Verwijder nu de ``###`` uit de regel:: Op recente versies kun je simpelweg het volgende commando als root/sudo-gebruiker uitvoeren:: Voer deze stappen alleen uit wanneer je een database back-up in PostgreSQL wilt terugzetten. Open ``.env`` en zoek de onderstaande code:: Eventueel kun je deze packages ook verwijderen:: Of ga terug naar de **sudo gebruiker** en voer dit uit:: Of herstart ze allemaal tegelijkertijd:: Wees er allereerst zeker van dat je slimme meter uberhaupt gasverbruik registreert, en dat je een paar uur hebt gewacht. De gasmeterstanden worden sowieso slechts een keer per uur bijgewerkt (voor DSMR v4). De Status-pagina geeft je hier overigens ook inzicht in. Prijzen Het terugzetten van een back-up overschrijft alle bestaande data en is onomkeerbaar! Resultaat Sla het bestand op en start de database weer: ``sudo systemctl start postgresql`` Gezien de SD-kaart gevoelig is voor slijtage en corruptie, kun je ervoor kiezen om de database op een andere disk of USB-stick te draaien. Om dit te realiseren zul je de applicatie en database moeten stoppen, de databaseconfiguratie aanpassen, dataopslag verplaatsen en alles weer opstarten. Het komt soms voor dat, door verhuizing of technische vervanging van je meter, deze meterstanden in DSMR-reader voor afwijkingen en onjuiste gegevens zorgen (bijv.: grote gaten of negatief verbruik). Dit komt alleen voor bij de dag zelf en niet bij de dagen erna. Daarom zul je de gegevens van de foutieve dag zelf moeten aanpassen. Start DSMR-reader weer met: ``sudo supervisorctl start all`` Stop DSMR-reader: ``sudo supervisorctl stop all`` Stop database: ``sudo systemctl stop postgresql`` Supervisor Ondersteuning Het "**dsmr_debuginfo**"-commando is beschikbaar sinds DSMR-reader v4.4 en hoger. De DEBUG-logging is standaard uitgeschakeld, om het aantal schrijfacties op het bestandssysteem te beperken. Je kunt het inschakelen door deze stappen te volgen: De dag erna kun je dit zelf weer rechtzetten via de Dag- of Uurtotalen, :doc:`in de admin-configuratie<configuration>`, voor de betreffende dag. De logbestanden kunnen blijven hangen wegens rotatie. Probeer te tailen op een wildcard-patroon om alles logs van een proces te zien. Bijvoorbeeld:: De gebruiker moet nu ofwel aangemaakt zijn ofwel het wachtwoord is bijgewerkt. HIervoor kunnen twee maatregelen genomen worden: Verhogen van de datalogger-sleep en het instellen van een retentiebeleid. Dit gaat er van uit dat je DSMR-reader **nog niet** helemaal geinstalleerd/draaiend hebt en daarbij alleen een **lege** database hebt aangemaakt:: Het hangt af van de situatie, maar je kunt het volgende sowieso zelf eerst proberen:: Dit wordt veroorzaak door de hoge gegevensdoorvoer van DSMR versie 5, wat elke seconde voor een nieuw telegram zorgt. Zowel DSMR-reader als het meerendeel van de gebruikers hebben deze hoge frequentie echter niet nodig voor de opslag, analyze en tonen van verbruiksgegevens. Dit gaat alleen een verschil maken wanneer je dataopschoning met terugwerkende kracht hebt ingeschakeld, waardoor meer dan 25 procent van de gegevens in je database zijn verwijderd. On glashelder te zijn, herhalen we: Om ook je data (de database) te verwijderen:: Om DSMR-reader van je systeem te verwijderen, voer het volgende uit:: Om een gecomprimeerde back-up (``.gz``) terug te zetten, voer dit uit:: Om een ongecomprimeerde back-up (``.sql``) terug te zetten, voer dit uit:: Hulp bij problemen Het terugdraaien van databasemigraties kan wat tijd in beslag nemen. Ongecomprimeerd (legacy) Webinterface Wanneer je een Raspberry Pi (of soortgelijk appartaat) gebruikt, samen met een DSMR versie 5 slimme meter (wordt vandaag de dag standaard geleverd), dan kun je na verloop van tijd problemen ervaren. Je kunt extra debug-informatie aanleveren door het "**dsmr_debuginfo**"-commando uit te voeren en vervolgens de output daarvan te kopieren naar je issue op Github. Je kun je applicatie bijwerken door het script ``deploy.sh`` uit te voeren, die in zich in de hoofdmap van het project bevindt. Zorg er wel voor dat je ingelogd bent als ``dsmr`` gebruiker op de terminal:: Je kunt de status van alle processen bekijken door het volgende uit te voeren:: Kan het voorkomen dat je DSMR-reader wilt of moet herstarten. Bijvoorbeeld vanwege instellingen die een herstart vereisen. Je zou **geen** fouten moeten zien m.b.t dubbele gegevens en/of bestaande ID's of iets soortgelijks. Je zou nu op de gewenste release moeten zitten. `Zie deze documentatie <https://dev.mysql.com/doc/refman/5.7/en/mysql-tzinfo-to-sql.html>`_ over hoe je tijdzone-ondersteuning inschakelt op MySQL. `Bekijk bestaande issues op Github of maak een nieuwe aan <https://github.com/dennissiemensma/dsmr-reader/issues>`_. ``/var/log/supervisor/dsmr_backend.log`` ``/var/log/supervisor/dsmr_datalogger.log`` ``/var/log/supervisor/dsmr_webinterface.log`` ``dsmr_backend`` ``dsmr_datalogger`` ``dsmr_webinterface`` de applicatiecode moeten wisselen naar een vorige versie. de databasemigraties moeten terugdraaien. 