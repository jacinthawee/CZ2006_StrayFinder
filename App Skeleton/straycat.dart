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
  /// The contact number of the passerby if he/she chooses to send the stray cat to the vet (if the cat is injured).
  String contact;
//   String condition;
  StrayCat({required this.id, required this.name, required this.breed, required this.lastSeenLocation, required this.pictureCat, required this.injury, required this.statusInjured, required this.contact, /*required this.condition*/});

  /// Returns the name of the stray cat.
  getName(){}
  /// Returns the breed of the stray cat.
  getBreed(){}
  /// Returns the last updated location of the stray cat based on GPS location of passerby which reported the stray cat.
  getLocation(){}
  /// Returns the saved picture of the stray cat.
  getPictureCat(){}
  /// Returns the picture of the injury of the tray cat if the passerby reports it to be injured.
  getPictureInjury(){}
  /// Returns the injury status of the stray cat, either True or False.
  getStatus(){}
  /// Assign a name to the stray cat if there are no records of it in the app database.
  setName(){}
  /// Assign the breed of the stray cat as predicted using the breed predictor API.
  setBreed(){}
  ///Assign the injury status of the stray cat, either True or  False.
  setStatus(){}

}