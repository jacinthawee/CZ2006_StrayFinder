/// Contains the information required for an adoption organisation
class AdoptOrg{
  /// The id of the adoption organisation
  int id;
  /// The name of the adoption organisation
  String name;
  /// The email address of the adoption organisation 
  String email;
  /// The contact number of the adoption organisation
  String contact;
  /// The physical address of the adoption organisation
  String address;
  /// The opening hours of the adoption organisation
  String openinghours;
  /// The adoption fee of the adoption organisation
  String fee;
  /// The website of the adoption organisation
  String website;
  /// A picture of the adoption organisation
  String pic1Path;
  /// A picture of the adoption organisation
  String pic2Path;
  /// A picture of the adoption organisation
  String pic3Path;
  /// Constructor for AdoptOrg
  AdoptOrg({required this.id, required this.name, required this.email, required this.contact, required this.fee, required this.address,required this.openinghours, required this.website, required this.pic1Path, required this.pic2Path, required this.pic3Path});
}