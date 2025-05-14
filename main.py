from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy.exc import SQLAlchemyError
from geoalchemy2.shape import from_shape
from shapely import wkt
from typing import List
import logging

# Importando los archivos necesarios de tu proyecto
from database import SessionLocal
from models import ZonaDeforestada, TipoProceso, Departamento
from schemas import ZonaDeforestadaCreate, ZonaDeforestadaResponse, DepartamentoResponse

app = FastAPI()

# Dependencia para obtener la sesión de la base de datos
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# POST /zonas-deforestadas/
@app.post("/zonas-deforestadas/", response_model=ZonaDeforestadaResponse)
def create_zona_deforestada(
    zona: ZonaDeforestadaCreate, db: Session = Depends(get_db)
):
    # Validar Tipo Proceso
    tipo = db.query(TipoProceso).filter(TipoProceso.nombre == zona.tipo_proceso).first()
    if not tipo:
        raise HTTPException(status_code=400, detail="Tipo de proceso no válido")

    # Validar Departamento
    depto = db.query(Departamento).filter(Departamento.nombre == zona.departamento).first()
    if not depto:
        raise HTTPException(status_code=400, detail="Departamento no válido")

    # Convertir WKT a Geometría con SRID 3116
    try:
        shape = wkt.loads(zona.geom)
        geometry = from_shape(shape, srid=3116)
    except Exception as e:
        raise HTTPException(status_code=400, detail=f"Error en geometría: {str(e)}")

    # Crear nueva ZonaDeforestada
    nueva_zona = ZonaDeforestada(
        nombre_zona=zona.nombre_zona,
        tipo_proceso_id=tipo.id,
        departamento_id=depto.id,
        geometry=geometry,
    )

    try:
        db.add(nueva_zona)
        db.commit()
        db.refresh(nueva_zona)
    except SQLAlchemyError:
        db.rollback()
        raise HTTPException(status_code=500, detail="Error al guardar la zona")

    return {
        "id": nueva_zona.id,
        "nombre_zona": nueva_zona.nombre_zona,
        "tipo_proceso": tipo.nombre,
        "departamento": depto.nombre,
        "geom": zona.geom,
    }

# GET /departamentos/{id}
@app.get("/departamentos/{id}", response_model=DepartamentoResponse)
def get_departamento(id: int, db: Session = Depends(get_db)):
    departamento = db.query(Departamento).filter(Departamento.id == id).first()
    if not departamento:
        raise HTTPException(status_code=404, detail="Departamento no encontrado")
    return departamento

# GET /departamentos/
@app.get("/departamentos/", response_model=List[DepartamentoResponse])
def list_departamentos(db: Session = Depends(get_db)):
    departamentos = db.query(Departamento).all()
    return departamentos

# GET /zonas-deforestadas/
@app.get("/zonas-deforestadas/", response_model=List[ZonaDeforestadaResponse])
def consultar_zonas(departamento: str = None, tipo_proceso: str = None, db: Session = Depends(get_db)):
    try:
        query = db.query(ZonaDeforestada).join(Departamento).join(TipoProceso)
        
        if departamento:
            query = query.filter(Departamento.nombre == departamento)
        
        if tipo_proceso:
            query = query.filter(TipoProceso.nombre == tipo_proceso)
        
        zonas = query.all()

        return [ZonaDeforestadaResponse(
            id=zona.id,
            nombre_zona=zona.nombre_zona,
            tipo_proceso=zona.tipo_proceso.nombre,
            departamento=zona.departamento.nombre,
            geom=str(zona.geometry)
        ) for zona in zonas]

    except Exception as e:
        logging.error(f"Error: {e}")
        raise HTTPException(status_code=500, detail="Internal Server Error")

# GET /zonas-deforestadas/{id}
@app.get("/zonas-deforestadas/{id}", response_model=ZonaDeforestadaResponse)
def consultar_zona_por_id(id: int, db: Session = Depends(get_db)):
    zona = db.query(ZonaDeforestada).filter(ZonaDeforestada.id == id).first()
    if not zona:
        raise HTTPException(status_code=404, detail="Zona deforestada no encontrada")

    return ZonaDeforestadaResponse(
        id=zona.id,
        nombre_zona=zona.nombre_zona,
        tipo_proceso=zona.tipo_proceso.nombre,
        departamento=zona.departamento.nombre,
        geom=str(zona.geometry)
    )

# PUT /zonas-deforestadas/{id}
@app.put("/zonas-deforestadas/{id}", response_model=ZonaDeforestadaResponse)
def actualizar_zona_deforestada(
    id: int,
    zona: ZonaDeforestadaCreate,
    db: Session = Depends(get_db)
):
    # Validate Tipo Proceso
    tipo = db.query(TipoProceso).filter(TipoProceso.nombre == zona.tipo_proceso).first()
    if not tipo:
        raise HTTPException(status_code=400, detail="Tipo de proceso no válido")

    # Validate Departamento
    depto = db.query(Departamento).filter(Departamento.nombre == zona.departamento).first()
    if not depto:
        raise HTTPException(status_code=400, detail="Departamento no válido")

    # Find existing zone
    zona_db = db.query(ZonaDeforestada).filter(ZonaDeforestada.id == id).first()
    if not zona_db:
        raise HTTPException(status_code=404, detail="Zona deforestada no encontrada")

    # Convert geometry
    try:
        shape = wkt.loads(zona.geom)
        geometry = from_shape(shape, srid=3116)
    except Exception as e:
        raise HTTPException(status_code=400, detail=f"Error en geometría: {str(e)}")

    # Update fields
    zona_db.nombre_zona = zona.nombre_zona
    zona_db.tipo_proceso_id = tipo.id
    zona_db.departamento_id = depto.id
    zona_db.geometry = geometry

    try:
        db.commit()
        db.refresh(zona_db)
    except SQLAlchemyError:
        db.rollback()
        raise HTTPException(status_code=500, detail="Error al actualizar la zona")

    return ZonaDeforestadaResponse(
        id=zona_db.id,
        nombre_zona=zona_db.nombre_zona,
        tipo_proceso=zona_db.tipo_proceso.nombre,
        departamento=zona_db.departamento.nombre,
        geom=str(zona_db.geometry)
    )


# DELETE /zonas-deforestadas/{id}
@app.delete("/zonas-deforestadas/{id}")
def eliminar_zona_deforestada(id: int, db: Session = Depends(get_db)):
    zona = db.query(ZonaDeforestada).filter(ZonaDeforestada.id == id).first()

    if not zona:
        raise HTTPException(status_code=404, detail="Zona deforestada no encontrada")

    try:
        db.delete(zona)
        db.commit()
    except SQLAlchemyError:
        db.rollback()
        raise HTTPException(status_code=500, detail="Error al eliminar la zona")

    return {"message": f"Zona con ID {id} eliminada exitosamente"}
