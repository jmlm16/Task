CREATE OR REPLACE PROCEDURE nuevo_material(
      
      
      m_stock               IN material.stock%TYPE,
      m_proveedor           IN material.proveedor%TYPE,
      m_tipo                in material.tipo%type
      )
IS BEGIN
  
  
  INSERT INTO material VALUES(sec_material.nextval,m_stock,m_proveedor,m_tipo);
  
  
  commit work;
end;