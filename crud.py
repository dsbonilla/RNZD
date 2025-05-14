from sqlalchemy.orm import Session
from models import ZonaDeforestada, Departamento, TipoProceso

def get_zonas_deforestadas(db: Session, departamento: str = None, tipo_proceso: str = None):
    query = db.query(ZonaDeforestada).join(Departamento).join(TipoProceso)
    
    # Aplicar filtros si se pasan parámetros
    if departamento:
        query = query.filter(Departamento.nombre == departamento)
    
    if tipo_proceso:
        query = query.filter(TipoProceso.nombre == tipo_proceso)
    
    # Obtener los resultados
    return query.all()
