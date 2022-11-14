--creating lakes table, adding a spatial column and insert values into table
CREATE TABLE lakes (
fid INTEGER NOT NULL PRIMARY KEY, 
name CHARACTER VARYING(64)
);

SELECT 
	AddGeometryColumn('lakes', 'shore', 32214, 'POLYGON', 'XY');

INSERT INTO lakes VALUES(
	101, 'Blue Lake', PolyFromText('POLYGON((500652 18, 500666 23, 500673 9, 500648 6, 500652 18),
	(500659 18, 500667 18, 500667 13, 500659 13, 500659 18))', 32214)
);

--creating island table, adding a spatial column and insert values into table
CREATE TABLE island (
fid INTEGER NOT NULL PRIMARY KEY, 
name CHARACTER VARYING(64)
);

SELECT 
	AddGeometryColumn('island', 'shore', 32214, 'POLYGON', 'XY');

INSERT INTO island VALUES(
	101, 'Goose Isand', PolyFromText('POLYGON((500659 18, 500667 18, 500667 13, 500659 13, 500659 18))', 32214)
);

--creating state_forest table, adding a spatial column and insert values into table
CREATE TABLE state_forest (
fid INTEGER NOT NULL PRIMARY KEY, 
name CHARACTER VARYING(64)
);

SELECT 
	AddGeometryColumn('state_forest', 'shore', 32214, 'POLYGON', 'XY');

INSERT INTO state_forest VALUES(
	101, 'State Forest', PolyFromText('POLYGON((500628 26, 500644 31, 500656 34, 500670 38, 500670 38, 500684 42, 500684 30, 500684 0, 500676 0, 500628 0, 500628 26))', 32214)
);

--creating forest table, adding a spatial column and insert values into table
CREATE TABLE forest (
fid INTEGER NOT NULL PRIMARY KEY, 
name CHARACTER VARYING(64)
);

SELECT 
	AddGeometryColumn('forest', 'shore', 32214, 'MULTIPOLYGON', 'XY');

INSERT INTO forest VALUES(
	101, 'Green Forest', MPolyFromText('MULTIPOLYGON(((500628 26, 500644 31, 500656 34, 500670 38, 500670 38, 500684 42, 500684 30, 500684 0, 500676 0, 500628 0, 500628 26),
	(500652 18, 500666 23, 500673 9, 500648 6, 500652 18)), ((500659 18, 500667 18, 500667 13, 500659 13, 500659 18)))', 32214)
);

--creating rivers table, adding a spatial column and insert values into table
CREATE TABLE rivers (
fid INTEGER NOT NULL PRIMARY KEY, 
name CHARACTER VARYING(64)
);

SELECT 
	AddGeometryColumn('rivers', 'shore', 32214, 'LINESTRING', 'XY');

INSERT INTO rivers (fid, name, shore) VALUES (
	101, 'Cam Stream', LineFromText('LINESTRING((500638 48, 500644 41, 500641 36, 500644 31, 500652 18))', 32214)
	),
	(
	102, NULL, LineFromText('LINESTRING((500673 9, 500678 4, 500676 0))', 32214)
	);

--creating buildings table, adding a spatial column and insert values into table
CREATE TABLE buildings (
fid INTEGER NOT NULL PRIMARY KEY
);

SELECT 
	AddGeometryColumn('buildings', 'shore', 32214, 'POLYGON', 'XY');
SELECT 
	AddGeometryColumn('buildings', 'point', 32214, 'POINT', 'XY');
	
INSERT INTO buildings (fid, shore, point) VALUES (
	101, PolyFromText('POLYGON((5006250 31, 500654 31, 500654 29, 500650 29, 500650 31))', 32214),
	PointFromText('POINT(500652 30)',32214)
	),
	(
	102, PolyFromText('POLYGON((500662 34, 500666 34, 500666 32, 500662 32, 500662 34))', 32214),
	PointFromText('POINT(500664 33)', 32214)
	);

--creating city table, adding a spatial column and insert values into table
CREATE TABLE city (
fid INTEGER NOT NULL PRIMARY KEY, 
name CHARACTER VARYING(64)
);

SELECT 
	AddGeometryColumn('city', 'boundary', 32214, 'POLYGON', 'XY');
	
INSERT INTO city VALUES(
	101, 'Ashton', PolyFromText('POLYGON((500662 48, 500672 48, 500684 48, 500684 42, 500684 30, 500656 30, 500656 34))', 32214)
);

--creating area table, adding a spatial column and insert values into table
CREATE TABLE area (
fid INTEGER NOT NULL PRIMARY KEY);

SELECT 
	AddGeometryColumn('area', 'boundary', 32214, 'POLYGON', 'XY');

INSERT INTO area VALUES(
	101, PolyFromText('POLYGON((500600 48, 500684 48, 500684 0, 500600 0, 500600 48))', 32214)
);

--creating ponds table, adding a spatial column and insert values into table
CREATE TABLE ponds (
fid INTEGER NOT NULL PRIMARY KEY
);

SELECT 
	AddGeometryColumn('ponds', 'shore', 32214, 'MULTIPOLYGON', 'XY');
					  
INSERT INTO ponds VALUES(
	101, MPolyFromText('MULTIPOLYGON(((500624 44, 500622 42, 500624 40, 500624 44)),
	((500626 44, 500628 42, 500626 40, 500626 44)))', 32214)
);

--creating bridge table, adding a spatial column and insert values into table
CREATE TABLE bridge (
fid INTEGER NOT NULL PRIMARY KEY, 
name CHARACTER VARYING(64)
);
						 
SELECT 
	AddGeometryColumn('bridge', 'point', 32214, 'POINT', 'XY');

INSERT INTO bridge VALUES(
	101, 'Cam Bridge', PointFromText('POINT(500644 31)', 32214)
);

--creating roads table, adding a spatial column and insert values into table
CREATE TABLE roads (
fid INTEGER NOT NULL PRIMARY KEY, 
name CHARACTER VARYING(64), 
number INTEGER);
						 
SELECT 
	AddGeometryColumn('roads', 'road_axis', 32214, 'MULTILINESTRING', 'XY');

INSERT INTO roads (fid, name, number, road_axis) VALUES (
	101, NULL, 5, MLineFromText('MULTILINESTRING((500600 18, 500610 21, 500616 23, 500628 26, 500644 31),(500672 48, 500670 38))', 32214)
	),
	(
	102, 'Main Street', 5, MLineFromText('MULTILINESTRING((500644 31, 500656 34, 500670 38, 500684 42))', 32214)
	),
	(
	103, NULL, 75, MLineFromText('MULTILINESTRING((500610 48, 500610 21, 500610 0),(500616 48, 500616 23, 500616 0))', 32214)
	),
	(
	104, NULL, NULL, MLineFromText('MULTILINESTRING((500628 0, 500628 26))', 32214)
	);
