-- +micrate Up
CREATE TABLE contacts(
  id INTEGER PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  first TEXT NULL,
  last TEXT NULL,
  phone TEXT NULL
);

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
