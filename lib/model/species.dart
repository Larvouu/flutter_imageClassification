class Species {

  String commonName;                                                            // Nom commun
  String scientificName;                                                        // Nom scientifique
  String imagePath;                                                                 // Image de l'espèce. Pour le moment un Image.File dans speciesDetail, à terme à changer pour une image provenant d'un serveur ?
  String endangeredRate;                                                        // Niveau de danger d'extinction
  String description;                                                           // Description de l'espèce
  String habitatLocation;                                                       // Lieu de vie
  String averageSize;                                                           // Taille moyenne
  String lifeExpectancy;                                                        // Espérance de vie

  //Species();
  Species(
      String commonName,      String scientificName,  String imagePath,
      String endangeredRate,  String description,     String habitatLocation,
      String averageSize,     String lifeExpectancy
      ) {
    this.commonName       = commonName;
    this.scientificName   = scientificName;
    this.imagePath        = imagePath;
    this.endangeredRate   = endangeredRate;
    this.description      = description;
    this.habitatLocation  = habitatLocation;
    this.averageSize      = averageSize;
    this.lifeExpectancy   = lifeExpectancy;
  }

}

enum TypeEndangeredRate {
  EX,                                                                           // Eteinte au niveau mondial
  EW,                                                                           // Eteinte à l'état sauvage
  CR,                                                                           // En danger critique
  EN,                                                                           // En danger
  VU,                                                                           // Vulnérable
  NT,                                                                           // Quasi menacée
  LC                                                                            // Préoccupation mineure
}