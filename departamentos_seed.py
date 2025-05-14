from sqlalchemy.orm import Session
from models import Departamento, TipoProceso  # Ensure TipoProceso is imported
from database import SessionLocal

# Lista oficial de los departamentos de Colombia
DEPARTAMENTOS = [
    "Amazonas", "Antioquia", "Arauca", "Atlántico", "Bolívar", "Boyacá", "Caldas",
    "Caquetá", "Casanare", "Cauca", "Cesar", "Chocó", "Córdoba", "Cundinamarca",
    "Guainía", "Guaviare", "Huila", "La Guajira", "Magdalena", "Meta", "Nariño",
    "Norte de Santander", "Putumayo", "Quindío", "Risaralda", "San Andrés y Providencia",
    "Santander", "Sucre", "Tolima", "Valle del Cauca", "Vaupés", "Vichada"
]

# Creación de la sesión de base de datos
db: Session = SessionLocal()

try:
    # Inserción única (si no existe) para los departamentos
    for nombre in DEPARTAMENTOS:
        existe = db.query(Departamento).filter_by(nombre=nombre).first()
        if not existe:
            nuevo = Departamento(nombre=nombre)
            db.add(nuevo)
            
    # Confirmación de los cambios
    db.commit()

finally:
    # Cerrar la sesión de la base de datos
    db.close()

print("Base de datos seeding completado.")
