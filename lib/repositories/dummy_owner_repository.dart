import '../models/listing_summary.dart';
import '../models/message_preview.dart';
import '../models/owner_dashboard_data.dart';
import '../models/owner_profile.dart';
import '../models/subscription_info.dart';
import 'owner_repository.dart';

class DummyOwnerRepository implements OwnerRepository {
  @override
  Future<OwnerDashboardData> getDashboard() async {
    // Simulates network time so the loading state is visible.
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // ---------------------------------------------------------------
    // TODO(firestore): REPLACE EVERYTHING BELOW with real reads, e.g.
    //   profile       <- users/{uid} (businessName, email) + rating
    //   subscription  <- subscriptions/{uid}
    //   messages      <- chats where ownerId == uid, latest 2-3, unread first
    //   listings      <- hostels where ownerId == uid
    // ---------------------------------------------------------------
    final now = DateTime.now();
    return OwnerDashboardData(
      profile: const OwnerProfile(
        hostelName: 'Al-Noor Hostel',
        email: 'owner@alnoor.com',
        rating: 4.6,
        unreadMessages: 5,
      ),
      subscription: SubscriptionInfo(
        planName: 'Hostel Owner Plan',
        daysLeft: 24,
        totalDays: 30,
        renewsOn: DateTime(2026, 11, 20),
        amount: 3000,
        isPaid: true,
      ),
      recentMessages: [
        MessagePreview(
          id: 'm1',
          senderName: 'Ahmed Raza',
          preview: 'Is a single room available from Oct 1?',
          sentAt: now.subtract(const Duration(minutes: 2)),
          isUnread: true,
        ),
        MessagePreview(
          id: 'm2',
          senderName: 'Bilal Khan',
          preview: 'What are the monthly electricity charges?',
          sentAt: now.subtract(const Duration(hours: 1)),
          isUnread: true,
        ),
      ],
      listings: const [
        ListingSummary(
          id: 'l1',
          title: 'Al-Noor Boys Hostel',
          monthlyRent: 18000,
          vacantCount: 4,
          status: ListingStatus.live,
        ),
        ListingSummary(
          id: 'l2',
          title: 'Al-Noor Girls Hostel',
          monthlyRent: 20000,
          vacantCount: 2,
          status: ListingStatus.live,
        ),
        ListingSummary(
          id: 'l3',
          title: 'Al-Noor Annex',
          monthlyRent: 15000,
          vacantCount: 6,
          status: ListingStatus.draft,
        ),
      ],
    );
  }
}
