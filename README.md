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

You will be returned a list of JSON objects that look similar to this:
<pre>{"address":"Jackson Pkwy NW",
"area":"49.187",
"ball_fields":0,
"basketball_courts":0,
"classification":"conservation nature preserve",
"covbb":false,
"created_at":"2013-02-23T15:08:30Z",
"dog_park":false,
"gazebos":0,
"gis_ac":"51.691",
"golf":false,
"grills":0,
"gym":false,
"id":1,
"kml": kml data,
"latitude":"33.8208669227",
"longitude":"-84.476816518",
"name":"Chattahoochee Trail",
"nat":false,
"parking_spaces":0,
"pavilions":0,
"picnic_shelters":0,
"picnic_tables":0,
"playgrounds":0,
"pool":false,
"recreation_center":false,
"restrooms":0,
"soccer_fields":0,
"tennis_courts":0,
"track":false,
"updated_at":"2013-02-23T15:08:34Z",
"volleyball_courts":0,
"zip_code":30318}</pre>

You can look up an individual park at `http://atlparks.herokuapp.com/parks/{id}.json` where id is the id of the park you found in the parks query.

Group
-----
Lovingly created by Kate, Pat, Drew, Kevin, Rob, Kyle.


