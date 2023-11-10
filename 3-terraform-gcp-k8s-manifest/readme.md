# Dogs vrs Cats - Voting app

## Arquitectura

![Architecture diagram](architecture.excalidraw.png)

* front-end web app en Python que te permite votar entre dos opciones
* [Redis](https://hub.docker.com/_/redis/) que recolecta nuevos votos
* .NET worker que consume votos y los almacena en…
* [Postgres](https://hub.docker.com/_/postgres/) que persiste los datos
* Node.js Aplicación web que muestra los resultados de las votaciones en tiempo real.
  
## Notas

La aplicación de votación sólo acepta un voto por navegador del cliente. No registra votos adicionales si ya se ha enviado un voto de un cliente.
