import 'package:image_classification/model/species.dart';

class SpeciesFiller {

  static Species getSpeciesFromName (String name) {
    Species species;
    switch (name) {
      case 'castagnole' :
        species = new Species("Castagnole", "Chromis chromis", "castagnole.jpeg", "?", "C'est un petit poisson aplati latéralement, à la silhouette ovale prolongée par une queue fourchue (d'où son appellation fréquente d'« hirondelle »). La livrée est noire, avec des écailles légèrement plus pâles sur les flancs, et les nageoires parfois bordées de bleu sombre (surtout chez les jeunes). La bouche est petite mais très protractile.", "Atlantique-est et Méditerranée", "10 - 12 cm", "env. 5 ans");
        break;
      case 'méduse à pois' :
        species = new Species("Méduse à pois", "Mastigias papua", "meduse_a_pois.jpeg", "?", "Les méduses à pois ont mérité leur nom grâce aux territoires qu'elles habitent. Elles vivent le plus souvent dans des baies, des ports et des lagunes, particulièrement dans le Pacifique Sud.", "Pacifique Sud et Océan indien", "2 - 6 cm", "1 - 2 ans");
        break;
      case "méduse de l'atlantique" :
        species = new Species("Méduse de l’Atlantique", "Chromis chromis", "meduse_atlantique.jpg", "?", "Cette espèce pose de réels problèmes sur les côtes américaines. Sa piqure peut être extrêmement douloureuse.", "Atlantique-est et Méditerranée.", "10 - 12 cm", "env. 5 ans");
        break;
      case 'metynnis tacheté' :
        species = new Species("Metynnis tacheté", "Metynnis lippincottianus", "metynnis_tachete.jpg", "?", "Ce poisson vit en groupe : c’est une espèce dite grégaire. Le mâle, très différent de la femelle, possède une nageoire anale bordée de rouge et pointue à l’avant. Il fait partie d’un groupe de plusieurs espèces : les piranhas. Cependant, cette espèce est herbivore", "Bassin amazonien", "10 - 20 cm", "10 - 20 ans");
        break;
      case 'oscar' :
        species = new Species("Oscar", "Astronotus ocellatus", "oscar.jpeg", "?", "L’Astronotus Ocellatus est connu sous le surnom d’Oscar. C’est un cichlidé originaire d’Amérique du sud, plus précisément de l’Amazone et de ses affluents. On le retrouve également au Paraguay. Il est considéré comme l’un des poissons tropicaux les plus intelligents, et les plus conscients de leur environnement extérieur. En aquarium, les Oscars sont capables de reconnaître leur propriétaire à l’autre bout de la pièce, et viendront d’ailleurs souvent lui réclamer de la nourriture.", "Eaux douces d'Amérique du sud", "env. 35 cm", "10 - 20 ans");
        break;
      case 'pacu noir' :
        species = new Species("Pacu noir", "Colossoma macropomum Cachama", "pacu_noir.jpg", "?", "Le Pacu Noir est un grand poisson aplati latéralement avec une arête dorsale arquée et de grands yeux. Il est noir grisâtre avec des taches et des zones plus claires vers le milieu du corps. Il peut atteindre plus d’un mètre de long pour 30kg. C’est ainsi le plus grand représentant de la famille des Characidae.", "Eaux douces d'Amérique du sud", "100 - 120 cm", "Jusqu'à 40 ans");
        break;

      default :
        species = new Species("Espece non reconnue", "Veuillez réesayer, ou contemplez ce magnifique pacu noir", "pacu_noir.jpg", " ", " ", " ", " ", " ", );
        break;
    }
    return species;
  }

}