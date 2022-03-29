/// Specifications of images of stray cat / injury of stray cat for saving into the database.
class Images{
    /// The height of the image.
    int height;
    /// The width of the image.
    int width;
    /// The type of the image, to be chosen from one of the approved types.
    ImageType imageType;
    /// ???
    blob binaryContent;
    Images({required this.height, required this.width, required this.imageType, required this.binaryContent});

    /// Displays the specified image to be displayed to the user.
    displayImage(){}
    /// Saves the specified image to the database.
    saveImage(){}
}