import 'dart:io';
import 'package:tourhelperproj/domain/entities/tour.dart';
import 'package:tourhelperproj/infrastructure/repositories/tour_repository_impl.dart';
import 'package:tourhelperproj/application/usecases/add_tour.dart';
import 'package:tourhelperproj/application/usecases/get_tours.dart';

void main() async {
  // 1. Ініціалізація шарів (Dependency Injection)
  final repository = TourRepositoryImpl();
  final addTourUseCase = AddTour(repository);
  final getToursUseCase = GetTours(repository);

  print('=== Система управління турами (Clean Architecture) ===');

  // 2. Консольне меню
  while (true) {
    print('\nОберіть дію:');
    print('1. Додати тур');
    print('2. Показати всі тури');
    print('3. Вийти');
    stdout.write('Ваш вибір: ');

    final choice = stdin.readLineSync();

    if (choice == '1') {
      stdout.write('Введіть ID туру: ');
      final id = stdin.readLineSync() ?? '';
      
      stdout.write('Введіть назву туру: ');
      final name = stdin.readLineSync() ?? '';
      
      stdout.write('Введіть місце призначення: ');
      final destination = stdin.readLineSync() ?? '';
      
      stdout.write('Введіть ціну (\$): ');
      final priceStr = stdin.readLineSync() ?? '0';
      final price = double.tryParse(priceStr) ?? 0.0;
      
      stdout.write('Введіть тривалість (днів): ');
      final daysStr = stdin.readLineSync() ?? '0';
      final days = int.tryParse(daysStr) ?? 0;

      final newTour = Tour(
        id: id,
        name: name,
        destination: destination,
        price: price,
        durationDays: days,
      );

      await addTourUseCase.execute(newTour);
      print('✅ Тур успішно додано!');
      
    } else if (choice == '2') {
      final tours = await getToursUseCase.execute();
      if (tours.isEmpty) {
        print('📭 Список турів порожній.');
      } else {
        print('\n--- Список турів ---');
        for (var tour in tours) {
          print('[ID: ${tour.id}] ${tour.name} -> ${tour.destination} | ${tour.price}\$ | ${tour.durationDays} днів');
        }
        print('--------------------');
      }
    } else if (choice == '3') {
      print('👋 До побачення!');
      break;
    } else {
      print('❌ Невідома команда.');
    }
  }
}