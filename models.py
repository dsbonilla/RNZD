from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship, declarative_base
from geoalchemy2 import Geometry

# Creación de la base para los modelos ORM
Base = declarative_base()

# Definición del modelo para la tabla 'departamentos'
class Departamento(Base):
    __tablename__ = "departamentos"

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String, unique=True, nullable=False)

    # Relación con zonas deforestadas
    zonas = relationship("ZonaDeforestada", back_populates="departamento")


# Definición del modelo para la tabla 'tipos_proceso'
class TipoProceso(Base):
    __tablename__ = "tipos_proceso"

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String, unique=True, nullable=False)

    # Relación con zonas deforestadas
    zonas = relationship("ZonaDeforestada", back_populates="tipo_proceso")


# Definición del modelo para la tabla 'zonas_deforestadas'
class ZonaDeforestada(Base):
    __tablename__ = "zonas_deforestadas"

    id = Column(Integer, primary_key=True, index=True)
    nombre_zona = Column(String, nullable=False)

    tipo_proceso_id = Column(Integer, ForeignKey("tipos_proceso.id"), nullable=False)
    departamento_id = Column(Integer, ForeignKey("departamentos.id"), nullable=False)

    geometry = Column(Geometry(geometry_type="POLYGON", srid=3116), nullable=False)

    # Relaciones con otras tablas
    tipo_proceso = relationship("TipoProceso", back_populates="zonas")
    departamento = relationship("Departamento", back_populates="zonas")



