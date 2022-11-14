--1. Lista wszystkich tabel. || List of all tables.
SELECT 
	f_table_name 
FROM geometry_columns;

--2. Nazwa kolumny geometrii w tabeli "rzeki". || The name of the geometry column in the 'rivers' table.				
SELECT 
	f_table_name, 
	f_geometry_column 
FROM geometry_columns 
WHERE f_table_name = "rivers";

--3. Wymiar współrzędnych kolumny geometrii w tabeli "rzeki". || The geometry column coordinate dimension in the 'rivers' table.						 
SELECT 
	f_table_name, 
	coord_dimension 
FROM geometry_columns 
WHERE f_table_name = "rivers";

--4. Kod układu współrzędnych kolumny geometrii w tabeli "rzeki". || The geometry column coordinate system code in the 'rivers' table.
SELECT 
	f_table_name, 
	srid 
FROM geometry_columns 
WHERE f_table_name= 'rivers';

--5. Definicja użytego układu współrzędnych. || Definition of the used coordinate system.
SELECT * 
FROM spatial_ref_sys 
WHERE srid = 32214;

--6. Wymiar geometrii danych dla "Blue Lake". || Data geometry dimension for 'Blue Lake'.
SELECT 
	name, 
	Dimension(shore) 
FROM 'lakes';

--7. Typ geometryczny dla drogi nr 75. || Geometric type for road No. 75.
SELECT 
	GeometryType(road_axis) 
FROM 'roads' 
WHERE number = 75;

--8. Reprezentacja WKT "Goose Island". || WKT representation of 'Goose Island'.
SELECT 
	name, 
	AsText(shore) 
FROM 'island';

--9. Kod układu współrzędnych "Goose Island". || Coordinate system ode of 'Goose Island'.
SELECT 
	f_table_name, 
	srid 
FROM geometry_columns 
WHERE f_table_name = 'island';

--10. Czy geometria "Main Street" jest pusta? || Is 'Main Street' geometry empty?
SELECT 
	name, 
	IsEmpty(road_axis) 
FROM roads 
WHERE name = 'Main Street';

--11. Czy geometria "Blue Lake" jest prosta? || Is 'Blue Lake' geometry simple?
SELECT 
	name, 
	IsSimple(shore) 
FROM 'lakes';

--12. Granica "Goose Island". || 'Goose Island' boundary.
SELECT 
	name, 
	astext(Boundary(shore)) 
FROM 'island';

--13. Minimalny prostokąt ograniczający "Goose Island". || The minimum 'Goose Island' bounding rectangle. 
SELECT 
	name, 
	astext(Envelope(shore)) 
FROM 'island';

--14. Współrzędna X i Y "Cam Bridge". || X and Y coordinate of 'Cam Bridge'.
SELECT 
	name, 
	X(point),
	Y(point)
FROM 'bridge';

--15. Punkt początkowy zachodniego odcinka drogi nr 5. || Starting point of the west section of the road No. 5.
SELECT 
	name, 
	number, 
	AsText(StartPoint(road_axis)) 
FROM 'roads' 
WHERE number = 5;

--16. Punkt końcowy zachodniego odcinka drogi nr 5. || End point of the west section of the road No. 5.
SELECT 
	name, 
	number, 
	AsText(EndPoint(road_axis)) 
FROM 'roads' 
WHERE number = 5;

--17. Czy granica "Goose Island" jest zamknięta? || Is the boundary of 'Goose Island' closed?
SELECT 
	name, 
	isClosed(Boundary(shore)) 
FROM 'island';

--18. Czy granica "Goose Island" jest pierścieniem? || Is the boundary of 'Goose Island' a ring?
SELECT 
	name, 
	isRing(Boundary(shore)) 
FROM 'island';

--19. Długość drogi bez nazwy. || The length of the unnamed road.
SELECT 
	GLength(road_axis) 
FROM 'roads' 
WHERE name IS NULL 
AND number IS NULL;

--20. Liczba punktów zachodniego odcinka drogi nr 5. || Number of points of the western section of the road No. 5.
SELECT 
	name, 
	number, 
	NumPoints(roads.road_axis) 
FROM 'roads' 
WHERE number = 5;

--21. Centroid "Goose Island". || 'Goose Island' centroid.
SELECT 
	name, 
	AsText(Centroid(shore)) 
FROM 'island';

--22. Punkt na "Goose Island". || Point on 'Goose Island'.
SELECT 
	name, 
	AsText(PointOnSurface(shore)) 
FROM 'island';

--23. Powierzchnia "Goose Island". || 'Goose Island' area.
SELECT 
	name, 
	Area(shore) 
FROM 'island';

--24. Zewnętrzna granica "Blue Lake". || 'Blue Lake' exterior boundary.
SELECT 
	name, 
	asText(ExteriorRing(shore)) 
FROM 'lakes';

--25. Liczba wewnętrznych granic "Blue Lake". || Number of internal boundaries of 'Blue Lake'.
SELECT 
	name, 
	NumInteriorRing(shore) 
FROM 'lakes';

--26. Pierwsza wewnętrzna granica "Blue Lake". || The first internal boundary of the 'Blue Lake'.
SELECT 
	name, 
	asText(InteriorRingN(shore, 1)) 
FROM 'lakes';

--27. Liczba elementów geometrycznych drogi nr 75. || The number of geometric elements of the road No. 75.
SELECT 
	number, 
	NumGeometries(road_axis) 
FROM roads 
WHERE number = 75;

--28. Drugi element geometryczny drogi nr 75. || The second geometric element of the road No. 75.
SELECT 
	number, 
	AsText(GeometryN(road_axis, 2)) 
FROM 'roads' 
WHERE number = 75;

--29. Czy geometria drogi nr 75 jest zamknięta? || Is road No. 75 geometry closed?
SELECT 
	number, 
	IsClosed(road_axis)
FROM 'roads' 
WHERE number = 75;

--30. Długość drogi nr 75. || The length of the road No. 75.
SELECT 
	number, 
	Length(road_axis) 
FROM 'roads' 
WHERE number = 75;

--31. Centroid stawów. || Ponds centroid.
SELECT 
	AsText(Centroid(shore)) 
FROM 'ponds';

--32. Punkt na stawie. || Point on pond.
SELECT 
	AsText(PointOnSurface(shore)) 
FROM 'ponds';

--33. Powierzchnia stawów. || Ponds area.
SELECT 
	Area(shore) 
FROM 'ponds';

--34. Czy geometria "Goose Island" jest równa tej samej geometrii zapisanej w reprezentacji WKT? || Is 'Goose Island' geometry equal to the same geometry stored in the WKT representation?
SELECT 
	Equals(St_AsText(shore), shore) 
FROM 'island';

--35. Czy geometria drogi nr 75 jest rozłączna z geometrią "Ashton"? || Is the geometry of the road No. 75 disjoint from 'Ashton' geometry?
SELECT 
	Disjoint(road_axis, boundary) 
FROM roads, city 
WHERE roads.number = 75;

--36. Czy geometria "Cam Stream" styka się z geometrią "Blue Lake"? || Does 'Cam Stream' geometry touch 'Blue Lake' geometry?
SELECT 
	Touches(
	(SELECT shore FROM rivers), (SELECT shore FROM lakes)
	) 
FROM (SELECT * FROM rivers AS r 
INNER JOIN lakes 
WHERE r.name = 'Cam Stream');

--37. Czy geometria wschodniego budynku leży wewnątrz "Ashton"? || If the geometry of the eastern building is inside 'Ashton'?
SELECT 
	Within(shore, boundary) 
FROM (SELECT * FROM buildings AS b 
INNER JOIN city 
WHERE b.ROWID = 102);

--38. Czy geometria "Green Forest" nakłada się na geometrię "Ashton"? || Does 'Green Forest' geometry overlap with 'Ashton' geometry?
SELECT 
	Overlaps(shore, boundary) 
FROM forest, city 
WHERE forest.name= 'Green Forest' 
AND city.name = 'Ashton';

--39. Czy geometria zachodniego odcinka drogi nr 5 krzyżuje się z geometrią drogi nr 75? || Does the geometry of the western section of the road No. 5 intersect with the geometry of the road No. 75?
SELECT 
	Crosses(road_axis, road_axis) 
FROM roads 
WHERE ROWID = 101 
OR ROWID = 103;

--40. Czy geometria zachodniego odcinka drogi nr 5 przecina geometrię drogi nr 75? || Does the geometry of the west section of the road No. 5 cross that of the road No. 75?
SELECT 
	Intersects(road_axis, road_axis) 
FROM roads 
WHERE ROWID = 101 
OR ROWID = 103;

--41. Czy geometria "Green Forest" zawiera geometrię "Ashton"? || Does 'Green Forest' geometry contain 'Ashton' geometry?
SELECT 
	Contains(forest.shore, city.boundary) 
FROM forest,city;

--42. Odległość pomiędzy "Cam Bridge" a "Ashton". || Distance between 'Cam Bridge' and 'Ashton'.
SELECT 
	Distance(point, boundary) 
FROM (SELECT * FROM bridge 
INNER JOIN city);

--43. Przecięcie "Cam Stream" z "Blue Lake". || The intersection of 'Cam Stream' and 'Blue Lake'.
SELECT 
	AsText(Intersection(rivers.shore, lakes.shore)) 
FROM rivers,lakes;

--44. Różnica "Ashton" minus "Green Forest". || The difference 'Ashton' minus 'Green Forest'.
SELECT 
	AsText(Difference(boundary, shore)) 
FROM city, forest;

--45. Suma "Blue Lake" i "Goose Island". || The union of 'Blue Lake' and 'Goose Island'.
SELECT 
	AsText(Gunion(lakes.shore, island.shore)) 
FROM lakes, island;

--46. Symetryczna różnica "Blue Lake" i "Goose Island". || The symmetrical difference of 'Blue Lake' and 'Goose Island'.
SELECT 
	AsText(SymDifference(lakes.shore, island.shore)) 
FROM lakes, island;

--47. Bufor 15m wokół "Cam Bridge". || 15m buffer around 'Cam Bridge'.

SELECT 
	AsText(Buffer(point, 15)) 
FROM bridge;

--48. Otoczka wypukła "Blue Lake". || 'Blue Lake' convex hull.
SELECT 
	AsText(ConvexHull(shore)) 
FROM lakes;