# Cambio Seguro

Prueba tecnica realizada con clean arquicture, utiliza bloc como gestor de estados y equatable para la comparación de objetos

Requisitos Técnicos:

1. Cotizador Cambio Seguro

- ✅ Se deberá usar los atributos purchase_price(precio compra) y
  sale_price(precio venta) para realizar los cálculos en el cotizador.
- ✅ Conversión de soles a dólares usar la siguiente fórmula:
  (Mónto en soles / sale_price = Monto en dólares).
- ✅ Conversión de dólares a soles usar la siguiente fórmula:
  (Mónto en dólares \* purchase_price = Monto en soles).
- ✅ Al hacer clic en el botón deberá cambiar la moneda y actualizar
  los cálculos del cotizador.

2. Implementar página con scroll infinito

- ✅ Asegurarse de que las imágenes se carguen y muestren
  correctamente.
- ✅ Implementar indicadores de carga cuando se estén cargando
  más artículos.
- ✅ Manejar posibles errores en la solicitud de red, como fallos en la
  conexión o respuestas inesperadas.
- ✅ Utilizar técnicas adecuadas para asegurar que la aplicación se
  ejecute de manera fluida, incluso con una gran cantidad de
  elementos en la lista.

Notas:

- El atributo type_change en la pagina 12 devuelve null asi que se agrego el valor por defecto false
