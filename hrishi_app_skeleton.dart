
/// Page on mobile application that displays adoption centres
class AdoptPage{
  build(){}
}

///Creates instance of adoption centre when database is queried.
class Adopt{

  ///Variable accessing one particular adoption centre
  final AdoptOrg adoptionCenter = new AdoptOrg();

  /// method to redirect user to volunteer organization webpage
  goWebsite(){}

  build();
}


///Represents class that controls methods related to the AdoptOrg class
class AdoptMngr{

  ///A method that calls details of adoption centres
  List adoptionCenters;
}

///class displaying all relevant information pertaining to adoption centres
class AdoptOrg{

  ///UEN/ID of adoption centre (based on Ministry of Manpower)
  String id;

  ///name of adoption centre
  String name;

  ///email address of adoption centre
  String email;

  ///Contact details of adoption centre
  String contact;

  ///Physical location address of adoption centre
  String address;

  ///Opening Hours of adoption centre
  String openinghours;

  ///Administrative fees required during process of adopting a pet
  String fee;

  ///Link to online address of adoption centre
  String website;

  ///Server Filepath to 1st picture uploaded
  String pic;

  ///Server Filepath to 2nd picture uploaded
  String pic2;

  ///Server Filepath to 3rd picture uploaded
  String pic3;
}
