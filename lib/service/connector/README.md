# ConnectorService

Servis **ConnectorService** predstavlja Websockets client-a.
Sluzi za kreiranje konekcije prema Websockets serveru, slanje i primanje poruka.

Servis sadrzi sledece funkcije:
- **connectToSocket** sluzi za kreiranje Websockets konekcije. Prilikom konektovanja potrebno je proslijediti URL servera i hedere,
- **onConnectCallback** sluzi za subscribe na adresu na kojoj zeli da prima poruke. Subscribe se vrsi nakon sto prodje konekcija,
- **receive** sluzi za primanje poruka od Websockets servera,
- **send** sluzi za slanje poruka Websockets serveru. Prilikom slanja poruke, poruka treba da sadrzi hedere i poruku,
- **restart** sluzi za restartovanje Websockets konekcije,
- **disconnectFromSocket** sluzi za prekidanje Websockets konekcije,