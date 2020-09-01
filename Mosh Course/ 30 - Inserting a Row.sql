USE sql_store;

INSERT INTO customers(
	last_name,
    first_name,
    birth_date,
    address,
    city,
    state
)
VALUES (
	"Smith",
    "John",
    "1990-01-01",
    "address",
    "city",
    "CA",
    DEFAULT
)
