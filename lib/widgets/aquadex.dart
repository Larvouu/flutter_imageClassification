import 'package:flutter/material.dart';
import 'package:image_classification/model/bassin.dart';
import 'package:image_classification/utils/utilsMethods.dart';
import 'package:image_classification/utils/utilsValues.dart';
import 'package:image_classification/widgets/speciesDetail.dart';

class Aquadex extends StatefulWidget {

  var           completionPercentage  = 0.0;
  List<Bassin>  bassins               = [];

  @override
  _AquadexState createState() => _AquadexState();
}

class _AquadexState extends State<Aquadex> {

  @override
  void initState() {
    fillPonds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("NOM BASSIN 0 : ${widget.bassins[0].nom}");
    return Scaffold(
        backgroundColor: Color(0xFF0C1641),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Center(
                child: Column(
                    children: [
                      SizedBox(height: 30),
                      Text("Aquadex", style: new TextStyle(color: Colors.white, fontSize: 35.0)),
                      //Bassin 0
                      SizedBox(height: 40),
                      Text(widget.bassins[0].nom, style: new TextStyle(color: Colors.white, fontSize: 25.0)),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 200,
                        child: gridSpeciesInPond(0),
                      ),
                      Divider(),
                      //Bassin 1
                      SizedBox(height: 20),
                      Text(widget.bassins[1].nom, style: new TextStyle(color: Colors.white, fontSize: 25.0)),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 100,
                        child: gridSpeciesInPond(1),
                      ),
                      Divider(),
                      //Bassin 2
                      SizedBox(height: 20),
                      Text(widget.bassins[2].nom, style: new TextStyle(color: Colors.white, fontSize: 25.0)),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 200,
                        child: gridSpeciesInPond(2),
                      ),
                      Divider(),
                    ]
                )
            )
        )
    );
  }

  Widget gridSpeciesInPond(int numBassin) {

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.bassins[numBassin].especesDuBassin.length,
      itemBuilder: (context, i) {
        return Container(
            margin: EdgeInsets.only(right : 15),
            child: FlatButton(
              child: Image.asset('assets/images/${widget.bassins[numBassin].especesDuBassin[i].imagePath}', width: 150, height: 150, fit: BoxFit.contain,),
              onPressed: openFicheTechnique(numBassin, i),
            )

        );
      },
    );
  }

  void fillPonds() {
    setState(() {
      widget.bassins.add(Bassin(UtilsValues.NOM_BASSIN_MEDUSE));
      widget.bassins.add(Bassin(UtilsValues.NOM_BASSIN_GUYANE));
      widget.bassins.add(Bassin(UtilsValues.NOM_BASSIN_CASTAGNOLES));
    });
  }

  openFicheTechnique(int numBassin, int numSpecies){
    switch(numBassin) {
      case 0 : //Meduses
      if(numSpecies == 0) {
        /*Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext buildContext) {
              return new SpeciesDetail(UtilsMethods.getSpeciesFromName(UtilsValues.NOM_ESPECE_MEDUSE_A_POIS));
            }));*/
        print("ESPECE : ${UtilsValues.NOM_ESPECE_MEDUSE_A_POIS}");
      }
      else if (numSpecies == 1) {
        /*Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext buildContext) {
              return new SpeciesDetail(UtilsMethods.getSpeciesFromName(UtilsValues.NOM_ESPECE_MEDUSE_ATLANTIQUE));
            }));*/
        print("ESPECE : ${UtilsValues.NOM_ESPECE_MEDUSE_ATLANTIQUE}");
      }
        break;
      case 1 :
        if(numSpecies == 0) {
          /*Navigator.push(context,
              new MaterialPageRoute(builder: (BuildContext buildContext) {
                return new SpeciesDetail(UtilsMethods.getSpeciesFromName(UtilsValues.NOM_ESPECE_METYNNIS_TACHETE));
              }));*/
          print("ESPECE : ${UtilsValues.NOM_ESPECE_METYNNIS_TACHETE}");
        }
        else if (numSpecies == 1) {
          /*Navigator.push(context,
              new MaterialPageRoute(builder: (BuildContext buildContext) {
                return new SpeciesDetail(UtilsMethods.getSpeciesFromName(UtilsValues.NOM_ESPECE_OSCAR));
              }));*/
          print("ESPECE : ${UtilsValues.NOM_ESPECE_OSCAR}");
        }
        else if (numSpecies == 2) {
          /*Navigator.push(context,
              new MaterialPageRoute(builder: (BuildContext buildContext) {
                return new SpeciesDetail(UtilsMethods.getSpeciesFromName(UtilsValues.NOM_ESPECE_PACU_NOIR));
              }));*/
          print("ESPECE : ${UtilsValues.NOM_ESPECE_PACU_NOIR}");
        }
        break;
      case 2 :
        if(numSpecies == 0) {
          /*Navigator.push(context,
              new MaterialPageRoute(builder: (BuildContext buildContext) {
                return new SpeciesDetail(UtilsMethods.getSpeciesFromName(UtilsValues.NOM_ESPECE_CASTAGNOLE));
              }));*/
          print("ESPECE : ${UtilsValues.NOM_ESPECE_CASTAGNOLE}");
        }
        break;
    }
  }

}
