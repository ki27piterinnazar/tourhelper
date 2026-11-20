import '../../domain/entities/tour.dart';
import '../../domain/repositories/tour_repository.dart';

class TourRepositoryImpl implements TourRepository {
  // Імітація бази даних у пам'яті
  final List<Tour> _tours = [];

  @override
  Future<List<Tour>> getTours() async {
    return _tours;
  }

  @override
  Future<Tour?> getTourById(String id) async {
    try {
      return _tours.firstWhere((tour) => tour.id == id);
    } catch (e) {
      return null; // Якщо тур не знайдено
    }
  }

  @override
  Future<void> addTour(Tour tour) async {
    _tours.add(tour);
  }
}