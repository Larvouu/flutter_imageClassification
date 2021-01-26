import 'package:image_classification/model/species.dart';
import 'package:image_classification/utils/utilsMethods.dart';
import 'package:image_classification/utils/utilsValues.dart';

class Bassin {

  String nom;
  List<Species> especesDuBassin;

  Bassin(String nom) {
    this.nom              = nom;
    this.especesDuBassin  = fillPond(this.nom);
  }

  List<Species> fillPond(String nom) {
    List<Species> speciesInPond = [];
    switch(nom){
      case UtilsValues.NOM_BASSIN_MEDUSE :
        speciesInPond.add(UtilsMethods.getSpeciesFromName(UtilsValues.NOM_ESPECE_MEDUSE_A_POIS));
        speciesInPond.add(UtilsMethods.getSpeciesFromName(UtilsValues.NOM_ESPECE_MEDUSE_ATLANTIQUE));
        break;
      case UtilsValues.NOM_BASSIN_GUYANE :
        speciesInPond.add(UtilsMethods.getSpeciesFromName(UtilsValues.NOM_ESPECE_METYNNIS_TACHETE));
        speciesInPond.add(UtilsMethods.getSpeciesFromName(UtilsValues.NOM_ESPECE_OSCAR));
        speciesInPond.add(UtilsMethods.getSpeciesFromName(UtilsValues.NOM_ESPECE_PACU_NOIR));
        break;
      case UtilsValues.NOM_BASSIN_CASTAGNOLES :
        speciesInPond.add(UtilsMethods.getSpeciesFromName(UtilsValues.NOM_ESPECE_CASTAGNOLE));
        break;
    }
    return speciesInPond;
  }

}