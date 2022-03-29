import 'package:flutter/cupertino.dart';

/// A class that represents all the user interface methods pertaining to the reporting of stray cats by users
class ReportUI{

  /// A method that is enabled when a picture is submitted to the system through a button and this directs the user to a page where photos of similar cats are shown and the user can try to identify if the cat found is one of the existing cats
  static goToIsThisTheCatPage(BuildContext context){}

  /// A method that allows the user to go back to the home page by clicking on the home icon
  static goUserTabs(BuildContext context){}

  /// A method that is called when the user indicates that the cat that they found is injured, hence they are directed to a page to describe the injuries further
  static goDescribeInjury(BuildContext context){}

  /// A method that is called when the user indicates that the cat they found is uninjured, hence the user is directed to the a thank you for reporting page
  static goThankYouForReporting(BuildContext context){}

  /// A method that is called when the user clicks confirm the injuries stated and the method will direct the user to a page that ask the user if they want to bring the injured cat to the vet themselves or not
  static goBringToVet(BuildContext context){}

  /// A method that directs the user to name the cat found if the cat found is not matched by existing cats in the database by the user
  static goNameCatFound(BuildContext context){}

  /// A method that is activated when the user confirms the name of the cat and the user is directed to a page where they can indicate if the cat they found is injured or not
  static goAskIfInjured(BuildContext context){}

  /// A method that is activated when the user confirms that they are bringing the injured stray cat to the vet themselves, so they are directed to a screen where they can leave their contact details so that a volunteer can follow up on the case
  static goLeaveContactDetails(BuildContext context){}



}