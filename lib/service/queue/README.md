# QueueService

Servis **QueueService** sluzi za upis poruka u queue repository, slanje/primanje Websockets poruka.

Servis sadrzi slece funkcije:
- **send** funkcija kojoj moduli salju poruke. Primljene poruke se upisuju u OutQueueRepository i salju ConnectorService-u,
- **receive** funkcija kojoj ConnectorService salje primljene poruke. Poruke se upisuju u InQueueRepository i prosledjuju ApplicationObserver servisu,
- **checkForUnSendMessages** sluzi za provjeru da li postoje neposlate poruke u OutQueueRepository-u. Ako ih ima salje ih ConnectorService-u,