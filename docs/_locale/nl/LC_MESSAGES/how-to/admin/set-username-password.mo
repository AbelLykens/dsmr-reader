��          �            h  ,   i  z   �  !        3  	   G     Q     m     �  9   �  X   �  6   "  �   Y  =   �  �   6  �  �  6   �  �   �  $   G     l  
     #   �     �  
   �  C   �  s     @   �  �   �  @   u	  �   �	     
                                                   	                        Admin: Setting or changing username/password Configure ``DSMRREADER_ADMIN_USER`` and ``DSMRREADER_ADMIN_PASSWORD`` of the :doc:`Env Settings</reference/env-settings>`. Creating or updating credentials: Docker installation Execute:: Find (or add) these lines:: Manual installation Now execute:: Now have DSMR-reader create/reset the admin user for you. Set superuser credentials by opening the ``.env`` file with your favourite text editor:: Set the admin username and password you'd like. E.g.:: The ``DSMRREADER_ADMIN_USER`` and ``DSMRREADER_ADMIN_PASSWORD``, :doc:`as defined in Env Settings</reference/env-settings>`, will be used for the credentials. The user should be created (or its password should be reset). There is no default user or password. You will need to set it yourself with the steps below, depending on whether you've installed manually or using Docker. Project-Id-Version: DSMR Reader
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
 Admin: Gebruikersnaam en wachtwoord instellen/resetten Configureer ``DSMRREADER_ADMIN_USER`` en ``DSMRREADER_ADMIN_PASSWORD`` van de :doc:`Environment-instellingen</reference/env-settings>`. Inloggegevens aanmaken of bijwerken: Docker-installatie Voer uit:: Zoek deze regels (of voeg ze toe):: Handmatige installatie Voer uit:: Laat DSMR-reader nu de admingebruiker voor je aanmaken of resetten. Stel inloggegevens in voor de admingebruiker, door het ``.env`` te openen met een teksteditor naar eigen voorkeur:: Stel de gewenste gebruikersnaam en wachtwoord in. Bijvoorbeeld:: De ``DSMRREADER_ADMIN_USER`` en ``DSMRREADER_ADMIN_PASSWORD``, :doc:`zoals gespecificeerd in Env-instellingen</reference/env-settings>`, worden gebruikt als inloggegevens. De gebruiker is nu aangemaakt (of het wachtwoord is bijgewerkt). Er zijn geen standaard inloggegevens. Je zult deze zelf moeten instellen met de stappen hieronder, afhankelijk van of je een handmatige installatie gedaan hebt of via Docker. 