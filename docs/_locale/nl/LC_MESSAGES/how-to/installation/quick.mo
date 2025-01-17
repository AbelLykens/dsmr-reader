��          �      <      �  L   �  H   �  Q   G  L   �  
   �     �  C   �  	   A  ^   K     �  #   �  k   �  �   N  �   �     �  "   �  c   �  �  8  Q   �  E   ?  b   �  P   �     9	     E	  B   Q	  
   �	  m   �	     
  '   
  l   G
  �   �
  �   �     X  &   i  Z   �                                                         	          
                                  *DSMR-reader may switch to Docker-only support at some point in the future.* :doc:`Finished? Go to setting up the application</tutorial/setting-up>`. :doc:`See here for setting up admin credentials<../admin/set-username-password>`. Contains just a list of commands needed for the installation of DSMR-reader. Continue:: DSMR-reader Does PostgreSQL not start/create the cluster due to locales? E.g.:: Execute:: If you need to restore a database backup with your existing data, this is the moment to do so. Installation: Quick Optional: Restore a database backup Restoring a database backup? :doc:`See here for instructions </how-to/database/postgresql-restore-backup>`. Still no luck? Try editing ``/etc/environment``, add ``LC_ALL="en_US.utf-8"`` and reboot. Then try ``pg_createcluster 12 main start`` again (or whatever version you are using). Strongly consider :doc:`using Docker containers instead <../../how-to/installation/using-docker>`, as it already contains a lot of the details (and steps) below. System packages Try: ``dpkg-reconfigure locales``. Use this to host both the datalogger and application on the same machine by installing it manually. Project-Id-Version: DSMR Reader
Report-Msgid-Bugs-To: Dennis Siemensma <github@dennissiemensma.nl>
Last-Translator: Dennis Siemensma <github@dennissiemensma.nl>
Language: nl
Language-Team: Dennis Siemensma <github@dennissiemensma.nl>
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.9.1
PO-Revision-Date: 
X-Generator: Poedit 2.3
 *Het kan zijn dat DSMR-reader op termijn wisselt naar Docker-only-ondersteuning.* :doc:`Klaar? Ga dan naar applicatie instellen</tutorial/setting-up>`. :doc:`Zie hier voor het instellen van loginggegevens voor admins<../admin/set-username-password>`. Bevat alleen een lijst met commando's nodig voor de installatie van DSMR-reader. Ga verder:: DSMR-reader Start PostgreSQL niet wegens een fout in 'locales'? Bijvoorbeeld:: Voer uit:: Indien je een back-up van de database wilt terugzetten met je oude gegevens, nu is het moment om dat te doen. Installatie: Snel Optioneel: Database back-up terugzetten Database back-up terugzetten? :doc:`Zie hier voor instructies </how-to/database/postgresql-restore-backup>`. Werkt het nog steeds niet? Open dan dit bestand ``/etc/environment``, voeg onderaan de regel ``LC_ALL="en_US.utf-8"`` toe en herstart het systeem. Probeer daarna ``pg_createcluster 12 main start`` (of welke versie je ook gebruikt). Overweeg zeker :doc:`om Docker-containers te gebruiken <../../how-to/installation/using-docker>` in plaats van onderstaande, gezien die al bijna alle aspecten en stappen in zich bevatten. Systeem packages Probeer: ``dpkg-reconfigure locales``. Gebruik dit om zowel de datalogger als de applicatie op hetzelfde apparaat te installeren. 