CREATE EXTENSION "uuid-ossp";

CREATE TABLE employee (
  id uuid NOT NULL,
  fName character varying(32) NOT NULL,
  lName character varying(32) NOT NULL,
  username character varying(32) NOT NULL DEFAULT(''),
  CONSTRAINT employee_pkey PRIMARY KEY (id),
  active boolean DEFAULT('true'),
  role AS ENUM ('general manager', 'shift manager', 'cashier'),
  manager character varying(32) DEFAULT NULL,
  password character varying(32),
  createdon timestamp without time zone NOT NULL DEFAULT now() 
  
) WITH (
  OIDS=FALSE
);

CREATE INDEX ix_employee_pkey
  ON employee
  USING btree
  (lower(employee_pkey::text) COLLATE pg_catalog."default");

INSERT INTO product VALUES (
       uuid_generate_v4()
     , 'Mister'
     , 'Test'
	 , 1234
	 , 'true'
	 , 'cashier'
	 , 'Bob Smith'
	 , 'password1234'
     , current_timestamp
);
