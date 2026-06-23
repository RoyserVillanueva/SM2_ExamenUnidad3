// test/main_test.dart
// Examen Unidad III - Pruebas Unitarias

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pruebas de Validación de Email', () {
    test('Email válido debe pasar la validación', () {
      // RegEx para validar email
      final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
      
      expect(emailRegex.hasMatch('usuario@ejemplo.com'), true);
      expect(emailRegex.hasMatch('test@dominio.org'), true);
      expect(emailRegex.hasMatch('admin@empresa.pe'), true);
    });

    test('Email inválido debe fallar la validación', () {
      final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
      
      expect(emailRegex.hasMatch('usuario@'), false);
      expect(emailRegex.hasMatch('usuario@ejemplo'), false);
      expect(emailRegex.hasMatch('usuario ejemplocom'), false);
      expect(emailRegex.hasMatch('@ejemplo.com'), false);
    });
  });

  group('Pruebas de Validación de Contraseña', () {
    test('Contraseña fuerte debe pasar la validación', () {
      final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
      
      expect(passwordRegex.hasMatch('Abc123456'), true);
      expect(passwordRegex.hasMatch('Password123'), true);
      expect(passwordRegex.hasMatch('Segura2024'), true);
    });

    test('Contraseña débil debe fallar la validación', () {
      final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
      
      // Sin mayúscula
      expect(passwordRegex.hasMatch('abc123456'), false);
      // Sin número
      expect(passwordRegex.hasMatch('Abcdefghi'), false);
      // Menos de 8 caracteres
      expect(passwordRegex.hasMatch('Abc12'), false);
      // Sin minúscula
      expect(passwordRegex.hasMatch('ABC123456'), false);
    });
  });

  group('Pruebas de Validación de DNI', () {
    test('DNI válido debe pasar la validación', () {
      final dniRegex = RegExp(r'^\d{8}$');
      
      expect(dniRegex.hasMatch('12345678'), true);
      expect(dniRegex.hasMatch('87654321'), true);
      expect(dniRegex.hasMatch('00000001'), true);
    });

    test('DNI inválido debe fallar la validación', () {
      final dniRegex = RegExp(r'^\d{8}$');
      
      // Menos de 8 dígitos
      expect(dniRegex.hasMatch('1234567'), false);
      // Más de 8 dígitos
      expect(dniRegex.hasMatch('123456789'), false);
      // Contiene letras
      expect(dniRegex.hasMatch('1234567A'), false);
      // Contiene espacios
      expect(dniRegex.hasMatch('1234 5678'), false);
    });
  });

  group('Pruebas de Validación de Teléfono', () {
    test('Teléfono válido debe pasar la validación', () {
      final phoneRegex = RegExp(r'^\d{9}$');
      
      expect(phoneRegex.hasMatch('987654321'), true);
      expect(phoneRegex.hasMatch('912345678'), true);
      expect(phoneRegex.hasMatch('999888777'), true);
    });

    test('Teléfono inválido debe fallar la validación', () {
      final phoneRegex = RegExp(r'^\d{9}$');
      
      // Menos de 9 dígitos
      expect(phoneRegex.hasMatch('98765432'), false);
      // Más de 9 dígitos
      expect(phoneRegex.hasMatch('9876543210'), false);
      // Contiene letras
      expect(phoneRegex.hasMatch('98765432A'), false);
      // Contiene guiones
      expect(phoneRegex.hasMatch('987-654-321'), false);
    });
  });
}