/// The control class for StrayCat.
class StrayCatMngr{
    /// THe list of all StrayCats exisiting in the database.
    Array[StrayCat] strayCatList;
    StrayCatMngr({required this.strayCatList});

    /// Returns all last seen locations of the StrayCats in the database.
    getAllCatLocation(){}
    /// Returns details for all specified stray cats 
    getCatInfo(){}
    /// Returns the unique ID of thhe corresponding stray cat, which is injured.
    getInjuredCatID(){}
    /// Returns the location of a specific stray cat to be queried.
    getSpecificCatLocation(){}
    /// When a volunteer decides to handle a case of an injured stray cat from the Injury Noticeboard, the injury status of the stray cat is changed to False and stray cat info is removed ftom the Noticeboard.
    manageInjury(){}
}
