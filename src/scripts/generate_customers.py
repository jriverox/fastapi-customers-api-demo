import json
import random
from datetime import datetime, timedelta
import string

# South American first names
first_names = [
    'Juan', 'Carlos', 'Luis', 'Miguel', 'Jose', 'Pedro', 'Diego', 'Santiago', 'Andres', 'Felipe',
    'Maria', 'Ana', 'Sofia', 'Valentina', 'Camila', 'Isabella', 'Gabriela', 'Laura', 'Daniela', 'Carolina',
    'Alejandro', 'Ricardo', 'Fernando', 'Roberto', 'Pablo', 'Eduardo', 'Javier', 'Rafael', 'Antonio', 'Manuel',
    'Patricia', 'Claudia', 'Monica', 'Veronica', 'Natalia', 'Andrea', 'Paula', 'Cristina', 'Elena', 'Silvia'
]

# South American last names
last_names = [
    'Garcia', 'Rodriguez', 'Gonzalez', 'Fernandez', 'Lopez', 'Martinez', 'Sanchez', 'Perez', 'Gomez', 'Martin',
    'Jimenez', 'Ruiz', 'Hernandez', 'Diaz', 'Moreno', 'Alvarez', 'Romero', 'Alonso', 'Gutierrez', 'Navarro',
    'Torres', 'Dominguez', 'Vazquez', 'Ramos', 'Gil', 'Ramirez', 'Serrano', 'Blanco', 'Suarez', 'Molina',
    'Morales', 'Ortega', 'Delgado', 'Castro', 'Ortiz', 'Rubio', 'Marin', 'Sanz', 'Iglesias', 'Medina'
]

# South American cities and their countries
cities_countries = {
    'Buenos Aires': 'Argentina',
    'Cordoba': 'Argentina',
    'Rosario': 'Argentina',
    'Santiago': 'Chile',
    'Valparaiso': 'Chile',
    'Concepcion': 'Chile',
    'Bogota': 'Colombia',
    'Medellin': 'Colombia',
    'Cali': 'Colombia',
    'Lima': 'Peru',
    'Arequipa': 'Peru',
    'Trujillo': 'Peru',
    'Caracas': 'Venezuela',
    'Maracaibo': 'Venezuela',
    'Valencia': 'Venezuela',
    'Quito': 'Ecuador',
    'Guayaquil': 'Ecuador',
    'Cuenca': 'Ecuador',
    'Montevideo': 'Uruguay',
    'Salto': 'Uruguay',
    'Paysandu': 'Uruguay',
    'Asuncion': 'Paraguay',
    'Ciudad del Este': 'Paraguay',
    'Encarnacion': 'Paraguay',
    'La Paz': 'Bolivia',
    'Santa Cruz': 'Bolivia',
    'Cochabamba': 'Bolivia',
    'Brasilia': 'Brazil',
    'Sao Paulo': 'Brazil',
    'Rio de Janeiro': 'Brazil'
}

def generate_random_email(first_name, last_name):
    domains = ['gmail.com', 'yahoo.com', 'outlook.com']
    return f"{first_name.lower()}.{last_name.lower()}@{random.choice(domains)}"

def generate_random_phone():
    return ''.join(random.choices(string.digits, k=10))

def generate_random_date():
    start_date = datetime(1950, 1, 1)
    end_date = datetime(2000, 12, 31)
    random_date = start_date + timedelta(days=random.randint(0, (end_date - start_date).days))
    return random_date.strftime("%Y-%m-%d")

def generate_random_address():
    street_numbers = [str(random.randint(1, 9999))]
    street_names = ['Calle', 'Avenida', 'Carrera', 'Diagonal', 'Transversal', 'Circular', 'Pasaje', 'Camino', 'Vereda']
    street_types = ['Principal', 'Secundaria', 'Norte', 'Sur', 'Este', 'Oeste', 'Central', 'Local', 'Regional']
    
    city = random.choice(list(cities_countries.keys()))
    country = cities_countries[city]
    
    return {
        'address': f"{random.choice(street_numbers)} {random.choice(street_names)} {random.choice(street_types)}",
        'city': city,
        'state': city,  # Using city as state for simplicity
        'zip_code': ''.join(random.choices(string.digits, k=5)),
        'country': country
    }

def generate_customers(count):
    customers = []
    for i in range(2, count + 2):  # Start from 2 since we already have one customer
        first_name = random.choice(first_names)
        last_name = random.choice(last_names)
        address_info = generate_random_address()
        
        customer = {
            "id": str(i),
            "first_name": first_name,  # Changed from fir_name to first_name
            "last_name": last_name,
            "brithday": generate_random_date(),
            "document_id": ''.join(random.choices(string.ascii_uppercase + string.digits, k=17)),
            "phone_number": generate_random_phone(),
            "email": generate_random_email(first_name, last_name),
            "address": address_info['address'],
            "city": address_info['city'],
            "state": address_info['state'],
            "zip_code": address_info['zip_code'],
            "country": address_info['country']
        }
        customers.append(customer)
    return customers

# Read existing customers
with open('src/repositories/customers_db.json', 'r') as f:
    existing_customers = json.load(f)

# Update existing customers
for customer in existing_customers:
    if 'fir_name' in customer:
        customer['first_name'] = customer.pop('fir_name')
    if 'last_name' in customer:
        customer['last_name'] = random.choice(last_names)
    if 'first_name' in customer:
        customer['first_name'] = random.choice(first_names)
    if 'country' in customer:
        city = random.choice(list(cities_countries.keys()))
        customer['city'] = city
        customer['country'] = cities_countries[city]
        customer['state'] = city
    if 'email' in customer:
        customer['email'] = generate_random_email(customer['first_name'], customer['last_name'])

# Generate new customers
new_customers = generate_customers(99)

# Combine existing and new customers
all_customers = existing_customers + new_customers

# Write back to file
with open('src/repositories/customers_db.json', 'w') as f:
    json.dump(all_customers, f, indent=2)

print("Successfully updated customers with South American data and fixed field names") 