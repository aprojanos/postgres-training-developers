# PostgreSQL Training

## Requirements
* Install Docker

## Running containers

* Edit `.env` to customize PostgreSQL, Prometheus, Grafana and pgAdmin parameters.

* Run `docker compose up -d`

## Containers and published ports
* **postgresql** `:5432` - PostgreSQL Database Server
* **pgadmin** `:5050` - pgAdmin - Open Source administration and development platform for PostgreSQL
* **prometheus** `:9090` - Prometheus - Open-source systems monitoring and alerting toolkit.
* **postgresql-exporter** `:9187` - Prometheus exporter for PostgreSQL server metrics.
* **grafana** `:3000` - Grafana - Query, visualize, alert on, and explore your metrics, logs, and traces wherever they are stored.

## pgAdmin

Log in at 

http://localhost:5050/ 

Email address / username: *PGADMIN_DEFAULT_EMAIL* environment variable (default:  admin@example.com)

Password: *PGADMIN_DEFAULT_PASSWORD* environment variable (default: secret)

Quick Links -> Add new server
* Name: Training

Switch to Connection tab
* Host name / address: *postgresql*
* Username: *DB_USERNAME* environment variable (default: postgres)
* Password: *DB_PASSWORD* environment variable (default: secret)

Click on Save button.

## Prepare Grafana Dashboard

Log in at 

http://localhost:3000/ 

email or username: *admin*

password: *GRAFANA_PASSWORD* environment variable (default: secret)

Connections -> Data sources: Add data source button
* Data Source Type: select *Prometheus*
Configure Prometheus:
* Name: prometheus-postgres
* Prometheus server url: http://prometheus:9090
* Click on Save & test

If the data source has been added we can build a dashboard:
* Dashborad -> New button -> Import -> Upload dashboard JSON file -> use `grafana-dashboard-to-import.json` from this repository

### You'll be able to monitor  
* CRUD operations on database
* Locks & Dead Locks
* Connections
* CPU Usage
* Load Average
* Memory Usage
* Shared Buffers
* Current Fetched Data
* Database Cache
* Parallel Workers
* Transactions
* Sessions
* ...

## Trainig Examples

Trainig examples are available in the folder:

*postgres/examples/*
