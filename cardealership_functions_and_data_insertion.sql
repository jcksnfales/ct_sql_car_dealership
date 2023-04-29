-- Create stored functions

-- function for adding new salespersons
CREATE OR REPLACE FUNCTION new_salesperson(_salesperson_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO salesperson(salesperson_id, first_name, last_name)
	VALUES (_salesperson_id, _first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql;

-- function for adding new customers
CREATE OR REPLACE FUNCTION new_customer(_customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
RETURNS VOID
AS $MAIN$
BEGIN 
	INSERT INTO customer(customer_id, first_name, last_name)
	VALUES (_customer_id, _first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql;

-- function for adding new cars
CREATE OR REPLACE FUNCTION new_car(_car_id INTEGER, _customer_id INTEGER)
RETURNS VOID
AS $MAIN$
BEGIN 
	INSERT INTO car(car_id, customer_id)
	VALUES (_car_id, _customer_id);
END;
$MAIN$
LANGUAGE plpgsql;

-- function for creating new invoices
CREATE OR REPLACE FUNCTION new_invoice(_invoice_id INTEGER, _salesperson_id INTEGER, _car_id INTEGER)
RETURNS VOID
AS $MAIN$
BEGIN 
	INSERT INTO invoice(invoice_id, salesperson_id, car_id)
	VALUES (_invoice_id, _salesperson_id, _car_id);
END;
$MAIN$
LANGUAGE plpgsql;

-- function for creating new service tickets
CREATE OR REPLACE FUNCTION new_service_ticket(_ticket_id INTEGER, _car_id INTEGER, _mechanics VARCHAR, _service_summary VARCHAR)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO service_ticket(ticket_id, car_id, mechanics, service_summary)
	VALUES (_ticket_id, _car_id, _mechanics, _service_summary);
END;
$MAIN$
LANGUAGE plpgsql;


-- Insert data

-- salespeople
SELECT new_salesperson(1, 'John', 'Doe');
SELECT new_salesperson(2, 'Donovan', 'Joan');

-- customers, their cars, and their invoices
SELECT new_customer(1, 'Angelica', 'Warhol');
SELECT new_car(1, 1);
SELECT new_invoice(1, 1, 1);
SELECT new_car(2, 1);
SELECT new_invoice(2, 1, 2);

SELECT new_customer(2, 'Jeremy', 'Stromboli');
SELECT new_car(3, 2);
SELECT new_invoice(3, 2, 3);

SELECT new_customer(3, 'Kelly', 'Mercado');
SELECT new_car(4, 3);
SELECT new_invoice(4, 2, 4);

-- service tickets
SELECT new_service_ticket(1, 1, 'John Joan', 'Blinker fluid changed, windshield wiper blades replaced');