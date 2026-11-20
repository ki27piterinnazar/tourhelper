import '../entities/tour.dart';

abstract class TourRepository {
  Future<List<Tour>> getTours();
  Future<Tour?> getTourById(String id);
  Future<void> addTour(Tour tour);
}