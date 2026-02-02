import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String nationalId;
  final DateTime? birthDate;
  final String unitNumber;
  final int ownedApartments;
  final int issues;
  final int serviceRequests;
  final String? imageUrl;
  final String floorDate; // e.g., "Fourth Floor"
  final String area;      // e.g., "120"
  final String location;  // e.g., "Riyadh"

  const Profile({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.nationalId,
    this.birthDate,
    required this.unitNumber,
    required this.ownedApartments,
    required this.issues,
    required this.serviceRequests,
    this.imageUrl,
    this.floorDate = '',
    this.area = '',
    this.location = '',
  });

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        email,
        nationalId,
        birthDate,
        unitNumber,
        ownedApartments,
        issues,
        serviceRequests,
        imageUrl,
        floorDate,
        area,
        location,
      ];
}
