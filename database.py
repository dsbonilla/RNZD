# Definición de la conexión y sesión con la base de datos

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# URL de conexión — asegúrate que coincide con tu base de datos real
SQLALCHEMY_DATABASE_URL = "postgresql://postgres:1234@localhost/rnzd_db"

# Creación del motor de la base de datos
engine = create_engine(SQLALCHEMY_DATABASE_URL)

# Creación de la clase de sesión
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
