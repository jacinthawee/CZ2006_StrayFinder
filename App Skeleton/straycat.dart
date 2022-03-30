/// Defines a StrayCat object containing information about the StrayCat and methods related to it.
class StrayCat{
  /// The unique ID of the stray cat to identify and query it.
  String id;
  /// The given name of the stray cat.
  String name;
  /// The breed of the stray cat, as predicted by the nreed predictor API.
  String breed;
  /// The history of all locations the stray cat was last seen at, as captured by GPS information enabled on passerby's phone.
  Array[Location] lastSeenLocation;
  /// The collection of all images taken of the stray cat and uploaded by passersby via the Report feature.
  Array[Images] pictureCat;
  /// The injury details of the stray cat, if any.
  Injury injury;
  /// The injurt status of the stray cat, either True or False.
  bool statusInjured;
  /// The latitude coordinate of the last seen position of the stray cat.
  double lastSeenLatitude;
  /// The longitude coordinate of the last seen position of the stray cat.
  double lastSeenLongitude;
  /// The contact number of the passerby if he/she chooses to send the stray cat to the vet (if the cat is injured).
  String contact;
  StrayCat({required this.id, required this.name, required this.breed, required this.lastSeenLocation, required this.pictureCat, required this.injury, required this.statusInjured, required this.lastSeenLatitude, required this.lastSeenLongitude, required this.contact});
}
