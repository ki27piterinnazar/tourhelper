import '../../domain/entities/tour.dart';
import '../../domain/repositories/tour_repository.dart';

class AddTour {
  final TourRepository repository;

  AddTour(this.repository);

  Future<void> execute(Tour tour) {
    return repository.addTour(tour);
  }
}