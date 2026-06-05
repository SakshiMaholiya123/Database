import csv
import random 
import json
from datetime import datetime, timedelta
from faker import Faker

fake = Faker()
num_records = 200

tenant = r"tenant_data.csv"

with open(tenant, mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(["tenant_id", "tenant_name", "tenant_status"])
    
    for i in range(1, num_records + 1):
        writer.writerow([
            f"TNT-{i:04d}",                      
            f"{fake.company()} ", 
            random.choice(["Active", "Inactive", "Suspended"]) 
        ])
        
user = r"user_data.csv"

with open(user, mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(["user_id", "user_name", "user_email","user_phone_number","created_at","tenant_id","user_address"])
    
    for i in range(1, num_records + 1):
        
        user_id = f"USR-{i:05d}"
        user_name = fake.name()
        user_email = fake.unique.email()
        user_phone_number = random.randint(6000000000, 9999999999)
        random_days = random.randint(0, 30)
        random_hours = random.randint(0, 23)
        created_date = datetime.now() - timedelta(days=random_days, hours=random_hours)
        created_at = created_date.strftime("%Y-%m-%d %H:%M:%S")
        random_tenant_num = random.randint(1, 200)
        tenant_id = f"TNT-{random_tenant_num:04d}"
        address_dict = {
            "street": fake.street_address(),
            "city": fake.city(),
            "state": fake.state_abbr(),
            "zipcode": fake.zipcode()
        }
        user_address = json.dumps(address_dict) 
        writer.writerow([
            user_id, 
            user_name, 
            user_email, 
            user_phone_number, 
            created_at, 
            tenant_id, 
            user_address
        ])
        
events = r"event_data.csv"

event_types = ["user_login", "page_view", "item_search", "add_to_cart", "checkout_completed"]

with open(events, mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(["event_name", "event_properties", "tenant_id", "user_id", "event_time"])
    
    for i in range(num_records):
        event_name = random.choice(event_types)
        properties_dict = {}
        if event_name == "user_login":
            properties_dict = {"device": random.choice(["Desktop", "Mobile", "Tablet"]), "browser": fake.chrome(), "ip_address": fake.ipv4()}
        elif event_name == "page_view":
            properties_dict = {"page_url": f"/products/{fake.word()}", "referrer": fake.domain_name(), "duration_seconds": random.randint(5, 300)}
        elif event_name == "item_search":
            properties_dict = {"search_query": fake.word(), "results_count": random.randint(0, 50)}
        elif event_name == "add_to_cart" or event_name == "checkout_completed":
            properties_dict = {"item_id": f"PRD-{random.randint(100, 999)}", "price": round(random.uniform(10.0, 500.0), 2), "currency": "USD"}
            
        event_properties = json.dumps(properties_dict)

        random_tenant_num = random.randint(1, 200)
        tenant_id = f"TNT-{random_tenant_num:04d}"
        random_user_num = random.randint(1, 200)
        user_id = f"USR-{random_user_num:05d}"

        random_days = random.randint(0, 7)
        random_minutes = random.randint(0, 1440)
        event_date = datetime.now() - timedelta(days=random_days, minutes=random_minutes)
        event_time = event_date.strftime("%Y-%m-%d %H:%M:%S")

        writer.writerow([event_name, event_properties, tenant_id, user_id, event_time])

print("Files generated successfully")