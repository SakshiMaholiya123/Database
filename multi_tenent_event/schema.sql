create table tenants(
tenant_id VARCHAR(10) NOT NULL  Primary KEY,
tenant_name text not null,
tenant_status text not null default 'Inactive'
);

create table users(
user_id VARCHAR(10) NOT NULL Primary key,
user_name text not null,
user_email text not null unique,
user_phone_number bigint,
created_at Timestamptz default NOW(),
tenant_id text NOT NULL REFERENCES tenants(tenant_id),
user_address JSONB
);

create table Events(
event_id SERIAL PRIMARY KEY,
event_name text,
event_properties JSONB,
tenant_id  text not null REFERENCES tenants(tenant_id),
user_id text not null REFERENCES users(user_id),
event_time timestamptz default NOW()


);

Select * from events;
Select * from tenants;
Select * from users;


