
# Cartella
All'interno di src ci saranno quattro cartelle:
1. emails. Contenente tutti i file .eml delle email del test
2. main. Contenente il codice dell'applicazione
3. test. Contenente il codice di testing (Attualmente vuoto)
4. users. Contine il file "usersbatch.csv" da dove l'app carica i dati degli utenti.

## SpearPhishingBackEnd
Il backend è sviluppato in Spring Boot e Hibernate e utilizza Maven per la gestione delle dipendenze.

Il progetto è composto da due parti logiche:
1. Builder
2. Server
### Il Builder
Il Builder, package `PasqualeMonniello.SpearPhishingBackend.Builders` contiene codice per caricare gli utenti e le mail sul DB. 

`JSONBuilder.java` contiene codice per costruire un JSON contenente i dati di una email.

`ParseFiles.java` prende gli utenti da `userbatch.csv` in `src/users` e le email da `src/emails/final` e modifica ogni email con i dati dell'utente e le carica poi sul database.

**IMPORTANTE** Il Database è stato aggiornato in corso d'opera per cui il parsing automatico attualmente non inserisce l'età e il sesso.
### Il server
Il server è sviluppato in Spring e Hibernate con logica MVC (Model-View-Controller).

I package sono divisi così:

 - `PasqualeMonniello.SpearPhishingBackend.model`
	 - Contiene le entità mappate sul DB - 
 - `PasqualeMonniello.SpearPhishingBackend.repository`
	 - Contiene i repository JPA che permettono a Spring e Hibernate di gestire la connessione col DB, oltre che gestire in maniera autonoma le operazioni CRUD
- `PasqualeMonniello.SpearPhishingBackend.controller`
	- Mappano le API e le richieste

## Il Database
Nella cartella `DB_RAW_PRIVATE` vi sono i file per creare e caricare il coneuto del DB. Questi file iniziano con `spearphishing_`.

E il file `SpearPhishDB&Query` contenente le query usate nella tesi

Il Database ha cinque tabelle e tre viste.

### Tabelle
 - users. 
	 - Contiene i dati sugli utenti
 - emails. 
	 - Contiene il contenuto delle email generate per gli utenti, incluso il corpo HTML delle email
 - evals. 
	 - Contiene la lista di valutazioni degli utenti
 - bigfive. 
	 - Contiente i dati del test di personalità degli utenti
 - email_attr. 
	 - Contiene i modelli di email che poi generano emails

### Viste

- emails_filtered
	- Collega le email e email_attr 
- valid_users
	- Unisce le tabelle users e bigfive filtrando tutti quelli che hanno fatto il test
- results
	- Tabella dei risultati finali anonimi. Tutte le query fatte per la tesi sono fatte su questa vista

