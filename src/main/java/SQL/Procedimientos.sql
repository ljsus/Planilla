DELIMITER //

CREATE PROCEDURE ObtenerInformacionEmpleado(
    IN co_usua VARCHAR(10)
)
BEGIN
    SELECT
        (SELECT de_area FROM areas WHERE co_area = u.co_area) AS de_area,
        u.co_empl,
        (SELECT CONCAT(ap_pate, ' ', ap_mate, ' ,', nombre) FROM empleado WHERE co_empl = u.co_empl) AS de_empl,
        u.co_usua AS nro_dni,
        (SELECT de_segu FROM seguro WHERE co_segu = e.co_segu) AS de_segu,
        e.fe_ingreso,
        e.cta_bco AS nro_cta,
        (SELECT de_carg FROM cargo_empleado WHERE co_carg = u.co_carg) AS de_carg,
        (SELECT de_grupo FROM grupo_trabajo WHERE co_grup = e.co_grup) AS de_laboral,
        u.co_usua
    FROM
        usuario u,
        empleado e
    WHERE
        u.co_usua = e.nu_docu_iden
        AND u.co_usua = co_usua;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE InsertEmpleado(
    IN co_grup VARCHAR(2),
    IN ap_pate VARCHAR(50),
    IN ap_mate VARCHAR(50),
    IN nombre VARCHAR(50),
    IN fe_naci DATE,
    IN fe_ingreso DATE,
    IN in_estd CHAR(1),
    IN ti_docu_iden VARCHAR(2),
    IN nu_docu_iden VARCHAR(20),
    IN direccion VARCHAR(100),
    IN telefono VARCHAR(20),
    IN in_gene CHAR(1),
    IN cta_bco VARCHAR(20),
    IN co_segu VARCHAR(2)
)
BEGIN
    INSERT INTO empleado (co_grup, ap_pate, ap_mate, nombre, fe_naci, fe_ingreso, in_estd, ti_docu_iden, nu_docu_iden, direccion, telefono, in_gene, cta_bco, co_segu)
    VALUES (co_grup, ap_pate, ap_mate, nombre, fe_naci, fe_ingreso, in_estd, ti_docu_iden, nu_docu_iden, direccion, telefono, in_gene, cta_bco, co_segu);
END //

DELIMITER ;
