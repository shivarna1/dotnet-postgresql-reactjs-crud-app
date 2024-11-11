CREATE TABLE IF NOT EXISTS public.users
(
    id serial primary key,
    email VARCHAR(40) not null,
    first_name VARCHAR(40) not null,
    last_name VARCHAR(40) not null
);

INSERT INTO public.users (email, first_name, last_name)
VALUES 
    ('john.doe@example.com', 'John', 'Doe'),
    ('jane.smith@example.com', 'Jane', 'Smith'),
    ('alex.jones@example.com', 'Alex', 'Jones'),
    ('emily.watson@example.com', 'Emily', 'Watson'),
    ('michael.brown@example.com', 'Michael', 'Brown');

