# 1. Utworzenie bazy danych przestrzennych w programie Spatialite_Gui, dodanie tabel oraz umieszczenie w nich obiektów
[TworzenieBazyPrzestrzennej_CreatingSpatialDatabase]

Utworzona baza danych, zaimportowana i wyświetlona w programie QGIS:
![img.png](img/Utworzona_baza_danych.png)

# 2. Zapytania wykonane na bazie danych w programie QGIS [Zapytania_Queries]. Przykładowe wyniki zapytań, których rezultatem wykonania są selekcje geometryczne (czerwony kolor)

12\. Granica "Goose Island" \
![img.png](img/Result_query12.png) \
13\. Minimalny prostokąt ograniczający "Goose Island" \
![img.png](img/Result_query13.png) \
21\. Centroid "Goose Island" \
![img.png](img/Result_query21.png) \
24\. Zewnętrzna granica "Blue Lake" \
![img.png](img/Result_query24.png) \
28\. Drugi element geometryczny drogi nr 75 \
![img.png](img/Result_query28.png) \
31\. Centroid stawów \
![img.png](img/Result_query31.png) \
32\. Punkt na stawie \
![img.png](img/Result_query32.png) \
44\. Różnica "Ashton" minus "Green Forest" \
![img.png](img/Result_query44.png) \
45\. Suma "Blue Lake" i "Goose Island" \
![img.png](img/Result_query45.png) \
47\. Bufor 15m wokół "Cam Bridge" \
![img.png](img/Result_query47.png)

[TworzenieBazyPrzestrzennej_CreatingSpatialDatabase]:TworzenieBazyPrzestrzennej_CreatingSpatialDatabase.sql
[Zapytania_Queries]:Zapytania_Queries.sql