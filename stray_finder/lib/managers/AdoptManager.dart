import '../classes/AdoptOrg.dart';

class AdoptMngr{


<<<<<<< HEAD
  static List<AdoptOrg> _adoptionCentres = [
    AdoptOrg(id: 1, name: "Animal Lovers League", email: "general@animalloversleague.com", contact: "9670 8052", address: "The Animal Lodge, 59 Sungei Tengah Road, Block Q #01-29, Singapore 699014", openinghours: "By Appointment Only", fee: "Free", website: "https://www.animalloversleague.com/", pic1Path: 'images/all.jpeg', pic2Path: 'images/all2.jpeg', pic3Path: 'images/all3.jpeg'),
    AdoptOrg(id: 2, name: "Cat Welfare Society ", email: "info@catwelfare.org", contact: "NA", address: "NA", openinghours: "NA", fee: "40-80 SGD", website: "https://www.catwelfare.org/", pic1Path:'images/cws.jpeg', pic2Path:'images/cws2.jpeg', pic3Path:'images/cws3.jpeg'),
    AdoptOrg(id: 3, name: "Causes for Animals Singapore ", email: "adoption@causesforanimals.com", contact: "9793 7162 / 9697 3491", address: "NA", openinghours: "NA", fee: "100-150 SGD", website: "https://www.causesforanimals.com/", pic1Path: 'images/cas.jpeg', pic2Path: 'images/cas2.jpeg', pic3Path: 'images/cas3.jpeg'),
    AdoptOrg(id: 4, name: "Love Kuching Project", email: "assist@lovekuchingproject.org", contact: "NA", address: "NA", openinghours: "NA", fee: "65 SGD", website: "https://www.facebook.com/luvkuching/", pic1Path: 'images/lkp.jpeg', pic2Path: 'images/lkp2.jpeg', pic3Path: 'images/lkp3.jpeg'),
    AdoptOrg(id: 5, name: "Mutts & Mittens", email: "info@muttsnmittens.com", contact: "6583 7371 / 6583 7372", address: "Lucky Cat Inn, 175 Guillemard Road, Singapore 399721", openinghours: "NA", fee: "250 SGD", website: "https://www.muttsnmittens.com/", pic1Path: 'images/mandm.jpeg', pic2Path: 'images/mandm2.jpeg', pic3Path: 'images/mandm3.jpeg'),
    AdoptOrg(id: 6, name: "Project Save Our Street Kittens", email: "NA", contact: "NA", address: "NA", openinghours: "NA", fee: "Free", website: "https://www.facebook.com/pages/category/Community-Organization/Project-SOKS-Save-Our-Street-Kittens-Singapore-174014033246553/", pic1Path: 'images/psoks.jpeg', pic2Path: 'images/psoks2.jpeg', pic3Path: 'images/psoks3.jpeg'),
    AdoptOrg(id: 7, name: "Purely Adoptions", email: "hello@purelyadoptions.com", contact: "9001 8848", address: "NA", openinghours: "NA", fee: "100-250 SGD", website: "https://www.purelyadoptions.com/", pic1Path: 'images/pa.jpeg', pic2Path: 'images/pa2.jpeg', pic3Path: 'images/pa3.jpeg'),
    AdoptOrg(id: 8, name: "SPCA", email: "enquiries@spca.org.sg", contact: "6287 5355", address: "50 Sungei Tengah Road, Singapore 699012", openinghours: "By Appointment Only", fee: "25-200 SGD", website: "https://www.spca.org.sg/", pic1Path: 'images/spca.jpeg', pic2Path: 'images/spca2.jpeg', pic3Path: 'images/spca3.jpeg'),
    AdoptOrg(id: 9, name: "The Cat Museum / Kitten Sanctuary", email: "purr@kittensanctuarysg.org", contact: "NA", address: "737A North Bridge Road, Singapore 198705", openinghours: "By Appointment Only", fee: "80-150 SGD", website: "https://www.kittensanctuarysg.org/", pic1Path: 'images/ks.jpeg', pic2Path: 'images/ks2.jpeg', pic3Path: 'images/ks3.jpeg'),
  ];

  static List<AdoptOrg> getAdoptionCentres(){
    return _adoptionCentres;
  }
}
=======
  static List<AdoptOrg> _adoptionCentres = [AdoptOrg(id: 1, name: "Animal Lovers League", email: "general@animalloversleague.com", contact: "9670 8052", address: "The Animal Lodge, 59 Sungei Tengah Road, Block Q #01-29, Singapore 699014", openinghours: "By Appointment Only", fee: "Free", website: "https://www.animalloversleague.com/", pic: 'images/all.jpeg',
      pic2: 'images/all2.jpeg', pic3: 'images/all3.jpeg'),
    AdoptOrg(id: 2, name: "Cat Welfare Society ", email: "info@catwelfare.org", contact: "NA", address: "NA", openinghours: "NA", fee: "40-80 SGD", website: "https://www.catwelfare.org/", pic:'images/cws.jpeg', pic2:'images/cws2.jpeg', pic3:'images/cws3.jpeg'),
    AdoptOrg(id: 3, name: "Causes for Animals Singapore ", email: "adoption@causesforanimals.com", contact: "9793 7162 / 9697 3491", address: "NA", openinghours: "NA", fee: "100-150 SGD", website: "https://www.causesforanimals.com/", pic: 'images/cas.jpeg', pic2: 'images/cas2.jpeg', pic3: 'images/cas3.jpeg'),
    AdoptOrg(id: 4, name: "Love Kuching Project", email: "assist@lovekuchingproject.org", contact: "NA", address: "NA", openinghours: "NA", fee: "65 SGD", website: "https://www.facebook.com/luvkuching/", pic: 'images/lkp.jpeg', pic2: 'images/lkp2.jpeg', pic3: 'images/lkp3.jpeg'),
    AdoptOrg(id: 5, name: "Mutts & Mittens", email: "info@muttsnmittens.com", contact: "6583 7371 / 6583 7372", address: "Lucky Cat Inn, 175 Guillemard Road, Singapore 399721", openinghours: "NA", fee: "250 SGD", website: "https://www.muttsnmittens.com/", pic: 'images/mandm.jpeg', pic2: 'images/mandm2.jpeg', pic3: 'images/mandm3.jpeg')
    ,AdoptOrg(id: 6, name: "Project Save Our Street Kittens", email: "NA", contact: "NA", address: "NA", openinghours: "NA", fee: "Free", website: "https://www.facebook.com/pages/category/Community-Organization/Project-SOKS-Save-Our-Street-Kittens-Singapore-174014033246553/", pic: 'images/psoks.jpeg', pic2: 'images/psoks2.jpeg', pic3: 'images/psoks3.jpeg'),
    AdoptOrg(id: 7, name: "Purely Adoptions", email: "hello@purelyadoptions.com", contact: "9001 8848", address: "NA", openinghours: "NA", fee: "100-250 SGD", website: "https://www.purelyadoptions.com/", pic: 'images/pa.jpeg', pic2: 'images/pa2.jpeg', pic3: 'images/pa3.jpeg'),
    AdoptOrg(id: 8, name: "SPCA", email: "enquiries@spca.org.sg", contact: "6287 5355", address: "50 Sungei Tengah Road, Singapore 699012", openinghours: "By Appointment Only", fee: "25-200 SGD", website: "https://www.spca.org.sg/", pic: 'images/spca.jpeg', pic2: 'images/spca2.jpeg', pic3: 'images/spca3.jpeg'),
    AdoptOrg(id: 9, name: "The Cat Museum / Kitten Sanctuary", email: "purr@kittensanctuarysg.org", contact: "NA", address: "737A North Bridge Road, Singapore 198705", openinghours: "By Appointment Only", fee: "80-150 SGD", website: "https://www.kittensanctuarysg.org/", pic: 'images/ks.jpeg', pic2: 'images/ks2.jpeg', pic3: 'images/ks3.jpeg'),
  ];
  static List<AdoptOrg> getAdoptionCentres(){
    return _adoptionCentres;
  }
}
>>>>>>> 9207b0167cd83bd2a1d4d9f3e611fb50998dfcb3
