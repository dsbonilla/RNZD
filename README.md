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

1. Instalación

        git clone https://github.com/dsbonilla/rnzd.git

        cd rnzd

2. Crea un entorno virtual e instala dependencias:

        python -m venv env

        source env/bin/activate  # En Windows: env\Scripts\activate

        pip install -r requirements.txt

3. Configura la base de datos PostgreSQL (rnzd_db.sql) y actualiza la URL en database.py.

       SQLALCHEMY_DATABASE_URL = "postgresql://postgres:1234@localhost/rnzd_db"

4. Inicia el servidor:

        uvicorn main:app --reload

5. API disponible en http://localhost:8000.

Licencia MIT.
