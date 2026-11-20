import '../../domain/entities/tour.dart';
import '../../domain/repositories/tour_repository.dart';

class GetTours {
  final TourRepository repository;

  GetTours(this.repository);

  Future<List<Tour>> execute() {
    return repository.getTours();
  }
}