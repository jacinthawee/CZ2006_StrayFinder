/// If the reported stray cat is injured, details of the injury has to be recorded for further persual by volunteers.
class Injury{
    /// The written description of the injury of the stray cat.
    String description;
    /// The image of the injury of the stray cat, localised to the injury area.
    Array[Images] photo
    Injury({required this.description, required this.photo});

}