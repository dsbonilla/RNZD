Registro Nacional de Zonas Deforestadas (RNZD)

API para gestionar zonas deforestadas en Colombia usando FastAPI, SQLAlchemy y GeoAlchemy2.

Endpoints

    POST /zonas-deforestadas/: Crear una nueva zona deforestada.

    GET /departamentos/{id}: Obtener un departamento por ID.

    GET /departamentos/: Listar todos los departamentos.

    GET /zonas-deforestadas/: Consultar zonas deforestadas (filtros opcionales por departamento o tipo de proceso).

    GET /zonas-deforestadas/{id}: Consultar una zona deforestada por ID.

    PUT /zonas-deforestadas/{id}: Actualizar una zona deforestada.

    DELETE /zonas-deforestadas/{id}: Eliminar una zona deforestada.

Instalación

    Clona el repositorio:

git clone https://github.com/dsbonilla/rnzd.git
cd rnzd

Crea un entorno virtual e instala dependencias:

python -m venv env
source env/bin/activate  # En Windows: env\Scripts\activate
pip install -r requirements.txt

Configura la base de datos PostgreSQL y actualiza la URL en database.py.

Inicia el servidor:

    uvicorn main:app --reload

API disponible en http://localhost:8000.
Licencia

Licencia MIT.