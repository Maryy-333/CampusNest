/// Every place the owner drawer (and dashboard shortcuts) can go.
enum OwnerDestination {
  dashboard('Dashboard'),
  myListings('My Listings'),
  messages('Messages'),
  subscription('Subscription & Payments'),
  profile('Profile & Settings'),
  help('Help & Support');

  const OwnerDestination(this.title);
  final String title;
}
