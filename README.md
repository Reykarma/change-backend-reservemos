# Comandos Básicos para Rails

## Instalar las Dependencias
```bash
bundle install
rails server

# Consumir la API

## Descripción
La API proporciona información del clima para una ciudad específica o ciudades similares a tu busqueda.

## Endpoint
- **URL:** http://127.0.0.1:3000/api/destination_weather
- **Método:** GET
- **Parámetro:** city (Nombre de la ciudad)

## Ejemplo de Uso
1. Realiza una solicitud GET a la URL especificada, proporcionando el nombre de la ciudad como parámetro.
   - Ejemplo utilizando cURL:
   ```bash
   curl http://127.0.0.1:3000/api/destination_weather?city=NombreDeLaCiudad

## Respuesta de ejemplo

{
  "data": [
    {
      "state": "Estado",
      "city_name": "Nombre de la Ciudad",
      "weather": [
        {
          "date":"2023-11-25T12:00:00.000-06:00",
          "description":"clear sky",
          "max_temperature":302.83,
          "min_temperature":287.47
        }
      ]
    },
  ]
}
