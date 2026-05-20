# 🏠 Neodomus – Plataforma de gestión de servicios domóticos

Neodomus es una plataforma web integral para la gestión de servicios de domótica, diseñada para conectar a **clientes**, **técnicos especializados** y **administradores** en un solo ecosistema. Permite la compra de productos, la contratación de servicios de instalación, mantenimiento y asesoría, así como el seguimiento en tiempo real de citas, entregas y comunicaciones.

## 🚀 Características principales

### Para clientes
- Registro y autenticación segura (JWT + bcrypt).
- Recuperación de contraseña mediante código OTP con bloqueo por IP.
- Catálogo de productos con filtros por categoría, búsqueda y descuentos dinámicos.
- Carrito de compras y sistema de pagos con **abonos** (pagos parciales).
- Dos modalidades de compra:
  - **Compra con cita**: después del pago, el cliente agenda una cita para instalación o mantenimiento.
  - **Solo entrega**: el producto se envía sin cita, asignando automáticamente un técnico de entrega.
- Agendamiento de citas con selección múltiple de técnicos (según tipo de servicio).
- Cancelación de citas con **regla de 48 horas de anticipación**.
- Calificación de técnicos.
- **Chat integrado** con el técnico asignado (con detalles de dirección y productos).
- Notificaciones en la interfaz (campana).
- Gestión de reclamos.

### Para técnicos
- Visualización de **todas sus tareas en un mapa** (Leaflet) con citas y entregas.
- Actualización del estado de cada tarea.
- Subida de evidencias (fotos, documentos).
- Configuración de disponibilidad horaria.
- Chat con clientes (con contexto del pedido/dirección).
- Recepción de **notificaciones automáticas** cuando se les asigna una cita o una entrega.

### Para administradores
- Panel de control unificado.
- Registro y gestión de técnicos (activar/desactivar).
- Asignación manual de técnicos a pedidos de entrega (o automática opcional).
- Gestión de descuentos por producto o categoría.
- Envío de comunicados masivos.
- Reportes y auditoría básica.

## 🛠️ Tecnologías utilizadas

| Capa          | Tecnologías                                                                 |
|---------------|-----------------------------------------------------------------------------|
| **Frontend**  | React 18, TypeScript, Vite, React Router DOM, Axios, Leaflet (mapas)        |
| **Backend**   | Python 3.10+, FastAPI, SQLAlchemy, PyMySQL, bcrypt, PyJWT, python-multipart |
| **Base de datos** | MySQL 8.0 (script completo con triggers, vistas, procedimientos)        |
| **Correos**   | SMTP (Gmail u otro) para envío de códigos OTP y notificaciones a técnicos   |
| **Autenticación** | JWT (access token), bcrypt para hashing de contraseñas                  |

