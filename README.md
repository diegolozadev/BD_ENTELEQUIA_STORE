![image](https://github.com/user-attachments/assets/eaa6b40e-fda3-40db-9f04-0d3ffaae09b5)

¡Bienvenido a **Entelequia Store**! Este repositorio contiene el respaldo completo de la base de datos para nuestra tienda en línea de moda. Si estás interesado en la gestión de productos, clientes, pedidos y mucho más, ¡has llegado al lugar correcto!

## 📁 Contenido del Repositorio

El repositorio se organiza en las siguientes secciones:

- **[`/SQL`](SQL/)**: Contiene el archivo SQL que define la estructura de la base de datos y proporciona datos de ejemplo para comenzar.

  - **`Respaldo_BD_entelequia_store.sql`**: Script SQL con la definición de tablas y datos de ejemplo.

## 🛠️ Cómo Usar el Archivo SQL

### 1. Descargar el Archivo

Obtén el archivo SQL desde el [directorio SQL del repositorio](https://github.com/diegolozadev/BD_ENTELEQUIA_STORE/tree/main/SQL).

### 2. Importar a PostgreSQL

Sigue estos pasos para importar el archivo a tu base de datos PostgreSQL:

1. **Guarda** el archivo SQL en tu sistema local.
2. **Abre** tu terminal o línea de comandos.
3. **Ejecuta** el siguiente comando para importar el archivo:
   ```bash
   psql -U <usuario> -d <nombre_base_datos> -f Respaldo_BD_entelequia_store.sql
Asegúrate de reemplazar <usuario> con tu nombre de usuario de PostgreSQL y <nombre_base_datos> con el nombre de tu base de datos.

### 3. Verificar la Importación

Utiliza herramientas de administración de PostgreSQL o consultas SQL para verificar que las tablas y los datos se hayan importado correctamente.

### 📊**Estructura de la Base de Datos**
La base de datos incluye las siguientes tablas:

![image](https://github.com/user-attachments/assets/49b97ff8-4d9a-4a5d-8091-5775fc102116)

### **Aquí tienes un pequeño resumen de las tablas:**
![image](https://github.com/user-attachments/assets/f6213e83-0173-4c18-8eff-326682e3bdb4)

### 🤝 Contribuciones
¡Queremos tu ayuda! Si deseas contribuir al proyecto:

1. **Fork** el repositorio.
2. **Crea** una rama para tus cambios (git checkout -b feature/nueva-funcionalidad).
3. **Realiza** tus cambios y commit (git commit -am 'Añadida nueva funcionalidad').
4. **Push** a tu rama (git push origin feature/nueva-funcionalidad).
5. **Envía** una Pull Request.

### 📜 Licencia
Este proyecto está bajo la Licencia MIT. ¡Siéntete libre de usarlo y adaptarlo según tus necesidades!

### 📫 Contacto
Para consultas o más información, contacta a Diego Lozano.

Gracias por visitar el repositorio de Entelequia Store. ¡Esperamos que este respaldo de la base de datos te sea de gran utilidad en tu proyecto!

