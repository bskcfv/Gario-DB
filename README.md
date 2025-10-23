<p align="center">
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original-wordmark.svg" width="120" alt="MySQL Logo"/>
</p>
<h1 align="center">💸 GARIO-DB</h1>

<p align="center">
  <b>Base de datos para la gestión de ingresos, gastos y control financiero personal.</b><br/>
  <sub>Desarrollada en <b>MySQL</b> con triggers, procedimientos almacenados y relaciones completamente normalizadas.</sub>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white"/>
  <img src="https://img.shields.io/badge/Estado-Estable-brightgreen?style=for-the-badge&logo=github"/>
  <img src="https://img.shields.io/badge/Versión-1.0-blue?style=for-the-badge"/>
</p>

---

## 🧱 Estructura General

El proyecto **GARIO-DB** define la arquitectura de una base de datos relacional diseñada para un **sistema de control financiero personal**.
Permite registrar **usuarios, ingresos, gastos, métodos de pago y reportes automáticos** mediante procedimientos almacenados y triggers.

---

## 📂 Tablas Principales

| Tabla                  | Descripción                                                                     |
| ---------------------- | ------------------------------------------------------------------------------- |
| 👤 **users**           | Contiene la información de los usuarios registrados.                            |
| 💰 **monto**           | Administra el saldo actual de cada usuario.                                     |
| 📉 **gastos**          | Registra todos los gastos asociados a un usuario.                               |
| 📈 **ingresos**        | Registra todos los ingresos asociados a un usuario.                             |
| 🏷️ **gastos_tipos**   | Detalla los tipos de gasto, asociados a una clase (alimentación, viajes, etc.). |
| 📊 **ingresos_tipos**  | Detalla los tipos de ingreso, asociados a una clase (salario, renta, etc.).     |
| 📦 **metodos_pago**    | Lista de métodos de pago disponibles (efectivo, tarjeta, PSE, etc.).            |
| 📜 **historial_monto** | Guarda el historial de modificaciones del saldo de cada usuario.                |

> Todos los movimientos (ingresos y gastos) se asocian al usuario mediante la tabla **monto**, garantizando trazabilidad y consistencia de datos.

---

## ⚙️ Procedimientos Almacenados (Stored Procedures)

| Procedimiento                                       | Descripción                                                                                |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `RegisterIngreso(...)`                              | Registra un nuevo ingreso y actualiza automáticamente el saldo del usuario.                |
| `RegisterGasto(...)`                                | Registra un gasto y descuenta el valor del saldo, validando que no supere el monto actual. |
| `find_gastos_tipos()`                               | Devuelve los tipos de gasto organizados por clase.                                         |
| `find_ingresos_tipos()`                             | Devuelve los tipos de ingreso organizados por clase.                                       |
| `find_gastos_categorias_metodos()`                  | Lista categorías de gasto junto con métodos de pago.                                       |
| `find_ingresos_categorias_metodos()`                | Lista categorías de ingreso junto con métodos de pago.                                     |
| `movimientos_por_dia(p_idUser, p_SelectedWeek)`     | Muestra ingresos y gastos diarios de una semana seleccionada.                              |
| `movimientos_por_semana(p_idUser, p_SelectedMonth)` | Reporte semanal de ingresos y gastos para un mes específico.                               |
| `movimientos_por_mes(p_idUser)`                     | Muestra el total de ingresos y gastos por mes del año actual.                              |
| `movimientos_por_5anios(p_idUser)`                  | Resumen de ingresos y gastos de los últimos 5 años.                                        |
| `find_informe_gastos_clase()`                       | Genera un informe general de gastos agrupados por clase.                                   |
| `find_informe_ingresos_clase()`                     | Genera un informe general de ingresos agrupados por clase.                                 |

---

## 🔄 Triggers

| Trigger               | Descripción                                                                                 |
| --------------------- | ------------------------------------------------------------------------------------------- |
| `after_insert_user`   | Crea automáticamente un registro en **monto** cada vez que se inserta un nuevo usuario.     |
| `before_update_monto` | Inserta un registro en **historial_monto** antes de actualizar el saldo actual del usuario. |

> Estos triggers garantizan la **automatización y consistencia** de los datos financieros.

---

## 🧩 Relaciones Principales

| Relación                           | Descripción                                       |
| ---------------------------------- | ------------------------------------------------- |
| `users → monto`                    | Cada usuario posee un único registro de monto.    |
| `monto → ingresos/gastos`          | Cada movimiento pertenece a un monto determinado. |
| `gastos_tipos → gastos_clases`     | Define las subcategorías de gastos.               |
| `ingresos_tipos → ingresos_clases` | Define las subcategorías de ingresos.             |
| `metodos_pago`                     | Relacionado tanto con ingresos como con gastos.   |

---

## 📊 Reportes y Analítica

Los procedimientos almacenados permiten generar reportes dinámicos de movimientos financieros:

* **Por día:** para una semana específica.
* **Por semana:** para un mes determinado.
* **Por mes:** para el año en curso.
* **Por año:** hasta los últimos cinco años.

> Además, los informes agrupan automáticamente los datos por clase (alimentación, renta, salario, etc.) y fecha, utilizando funciones de **JSON_TABLE()** para analizar arrays de fechas.

---

### 🧩 Ejemplo de Procedimiento: `SearchGastosMesActual(...)`

```sql
DELIMITER ;;
CREATE PROCEDURE `SearchGastosMesActual`(
IN p_iduser INT )
BEGIN

-- OBJETIVO: Buscar 'Cuanto Ha Gastado Durante el Mes Actual' el Usuario

-- DECLARAR VARIABLE: v_fkmonto --> Obtener el Id del Monto a traves del Id del Usuario
DECLARE v_fkmonto INT;

-- Query para obtener el Id_Monto
SELECT id_monto INTO v_fkmonto 
FROM monto 
WHERE fk_user = p_iduser;

-- Query para Obtener la Acumulacion de los gastos del Mes Actual

SELECT SUM(g.cantidad) AS Total_Gastos 
FROM gastos AS g
-- Crear una Tabla Virtual que abarque todas las fechas y sus respectivos gastos
-- Su objetivo es que Cada fecha contenida en formato JSON se convierta en un Registro de la tabla temporal Virtual
JOIN JSON_TABLE( 
-- g.fechas --> Es la Columna que posee datos tipo JSON
g.fechas, 
-- '$[*]' --> Recorrer todos los datos que esten contenidos en la Array
-- COLUMNS(nombre_de_la_columna tipo_de_dato PATH '$.key_seleccionada')
-- En este caso PATH '$' es así, debido a que solo posee fechas, no tiene keys como un ObjectJson, es un array simple. 
'$[*]' COLUMNS(fecha DATE PATH '$' )
-- Nombrar la tabla Virtual como fechas_json 
) AS fechas_json
-- Condicional que, elige los gastos del monto correspondiente, el monto del usuario
WHERE g.fk_monto = v_fkmonto 
-- Condicionar los gastos seleccionados en base a: Deben ser gastos del mes Actual Y no pueden ser gastos de fechas mayores al dia de hoy.
AND DATE_FORMAT(fechas_json.fecha, '%Y-%m') = DATE_FORMAT(CURDATE(), '%Y-%m')
AND fechas_json.fecha <= CURDATE()
-- Agrupar todos los gastos en base a sus Montos Correspondientes
GROUP BY g.fk_monto;

END ;;
DELIMITER ;
```

---

## 🧰 Restauración de la Base de Datos

Puedes restaurar toda la estructura y datos iniciales ejecutando el archivo incluido:

### 📍 Ruta del archivo

```
/DB/BackUp/gario_backup.sql
```

### 💻 Comando de restauración

Ejecuta en tu terminal (asegúrate de tener MySQL instalado y configurado):

```bash
mysql -u tu_usuario -p < DB/BackUp/gario_backup.sql
```

> 💡 Este script crea todas las **tablas, relaciones, triggers y procedimientos** necesarios para el correcto funcionamiento del sistema GARIO.

---

## 🧰 Requisitos Previos

* **MySQL 8.0+** instalado.
* Usuario con permisos de creación de base de datos y triggers.
* Editor SQL recomendado: **MySQL Workbench** o **DBeaver**.

---

## 👨‍💻 Autor

**Cristian Valderrama**
📧 [cristianvalderrama1014@gmail.com](mailto:cristianvalderrama1014@gmail.com)
🌐 [GitHub: bskcfv](https://github.com/bskcfv)
