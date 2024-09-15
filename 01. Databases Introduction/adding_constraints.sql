ALTER TABLE products
ADD CONSTRAINT fk_category_id
FOREIGN KEY (category_id) REFERENCES categories(id);

/*
ALTER TABLE products
DROP CONSTRAINT fk_category_id

--> In case you want to remove the constraint

*/