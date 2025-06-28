# Socket

Servis **Socket** predstavlja Websockets client-a.
Sluzi za kreiranje konekcije prema Websockets serveru, slanje i primanje poruka.

Servis sadrzi sledece funkcije:
- **start** sluzi za kreiranje Websockets konekcije. Prilikom konektovanja potrebno je proslijediti URL servera i hedere,
- **stop** sluzi za prekidanje Websockets konekcije,
- **restart** sluzi za restartovanje Websockets konekcije,
- **onStart** sluzi za subscribe na adresu na kojoj zeli da prima poruke. Subscribe se vrsi nakon sto prodje konekcija,
- **receive** sluzi za primanje poruka od Websockets servera,
- **send** sluzi za slanje poruka Websockets serveru. Prilikom slanja poruke, poruka treba da sadrzi hedere i poruku,

