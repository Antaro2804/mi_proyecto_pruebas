import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_proyecto_pruebas/main.dart'; // Asegúrate que 'mi_proyecto' sea el nombre de tu app

void main() {
  testWidgets('Prueba de Integración UI: Renderizado y navegación', (WidgetTester tester) async {
    // 1. Cargar la aplicación en el entorno de prueba
    await tester.pumpWidget(const MyApp());

    // 2. Verificar que el título principal de la app aparece en pantalla
    // Cambia 'Flutter Demo Home Page' por el título que tenga tu app en el main.dart
    expect(find.textContaining('Flutter'), findsOneWidget);

    // 3. Simular la interacción con un botón de acción (FloatingActionButton)
    final Finder fab = find.byType(FloatingActionButton);
    if (tester.any(fab)) {
      await tester.tap(fab);
      await tester.pump(); // Re-renderiza tras el clic
      print("Interacción con botón ejecutada correctamente");
    }

    // 4. Verificar que no existan errores visuales de desbordamiento
    expect(find.byType(ErrorWidget), findsNothing);
  });
}