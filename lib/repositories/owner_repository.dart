import '../models/owner_dashboard_data.dart';
import 'dummy_owner_repository.dart';

/// The owner screens only talk to this interface, never to Firestore directly.
abstract class OwnerRepository {
  Future<OwnerDashboardData> getDashboard();
}

/// The one repository the app uses.
///
/// TODO(firestore): when the real data is ready, write FirestoreOwnerRepository
/// (implements OwnerRepository) and change ONLY this line to use it.
final OwnerRepository ownerRepository = DummyOwnerRepository();
