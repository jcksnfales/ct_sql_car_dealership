-- Create tables
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id)
);

CREATE TABLE service_ticket(
	ticket_id SERIAL PRIMARY KEY,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	mechanics VARCHAR(300),
	service_summary VARCHAR(900)
);
