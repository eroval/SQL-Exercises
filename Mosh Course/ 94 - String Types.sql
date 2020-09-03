/*
String Types: 

CHAR(x) - fixed-length
VARCHAR(x) - max: 65.535 characters (~64KB)
MEDIUMTEXT - max: 16MB 
LONGTEXT   - max: 4GB

-------------------------------------

TINYTEXT   - max: 255 bytes
TEXT       - max: 64KB (VARCHAR is usually better because it can be indexed)

- English letters use 1 byte
- European Middle-easten letters use 2 bytes
- Asian letters use 3 bytes

 Gotta be consistent. For example:
- VARCHAR(50) for short strings
- VARCHAR(255) for medium-length strings

*/
