from pydantic import BaseModel
from typing import Optional

class DepartamentoSchema(BaseModel):
    nombre: str

class TipoProcesoSchema(BaseModel):
    nombre: str

class ZonaDeforestadaCreate(BaseModel):
    nombre_zona: str
    tipo_proceso: str
    departamento: str
    geom: str  # WKT format

class ZonaDeforestadaResponse(BaseModel):
    id: int
    nombre_zona: str
    tipo_proceso: str
    departamento: str
    geom: str

    class Config:
        orm_mode = True  # Permite leer objetos ORM como diccionarios

class DepartamentoResponse(BaseModel):
    id: int
    nombre: str

    class Config:
        orm_mode = True
