ATL Park Finder
===============

Goal
----
Make finding the park you need easy, filter by amenities, search by location, find a park near you.

API
---
You can query parks on the `http://atlparks.herokuapp.com/parks.json` endpoint. You can pass various parameters in GET to filter your results. Here's the following filter parameters:
* pavilions - Integer
* playgrounds - Integer
* picnic_tables - Integer
* picnic_shelters - Integer
* restrooms - Integer
* parking_spaces - Integer
* ball_fields - Integer
* soccer_fields - Integer
* tennis_courts - Integer
* basketball_courts - Integer
* volleyball_courts - Integer
* pool - Boolean
* gym - Boolean
* recreation_center - Boolean
* covbb - Boolean
* dog_park - Boolean
* track - Boolean
* nat - Boolean
* golf - Boolean
* area - Decimal
* page - Integer (Pagination control)
* distance - Decimal (use parameter q to query for distance)

You can look up an individual park at `http://atlparks.herokuapp.com/park/{id}.json` where id is the id of the park you found in the parks query.

Group
-----
Lovingly created by Kate, Pat, Drew, Kevin, Rob, Kyle.


