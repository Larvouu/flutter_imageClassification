import 'package:flutter/material.dart';
import 'package:image_classification/model/species.dart';

class SpeciesDetail extends StatefulWidget {

  Species species;

  SpeciesDetail(Species species) {
    this.species = species;
  }

  @override
  _SpeciesDetailState createState() => new _SpeciesDetailState();
}

class _SpeciesDetailState extends State<SpeciesDetail> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF0C1641),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(widget.species.commonName, style: new TextStyle(color: Colors.white, fontSize: 35.0)),
              SizedBox(height: 20),
              Text(widget.species.scientificName, style: new TextStyle(color: Colors.white, fontSize: 20.0, fontStyle: FontStyle.italic)),
              SizedBox(height: 20),
              Image.asset('assets/images/${widget.species.imagePath}'),
              Divider(),
              Image.asset('assets/images/niveau_de_danger_d_extinction.png'),
              Divider(),
              Text(widget.species.description, style: new TextStyle(color: Colors.white, fontSize: 20.0)),
              Divider(),
              Row(
                children: [
                  Icon(Icons.public),
                  SizedBox(width: 20),
                  Text(widget.species.habitatLocation, style: new TextStyle(color: Colors.white, fontSize: 20.0)),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Icon(Icons.open_in_full),
                  SizedBox(width: 20),
                  Text(widget.species.averageSize, style: new TextStyle(color: Colors.white, fontSize: 20.0)),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Icon(Icons.favorite_outline_rounded),
                  SizedBox(width: 20),
                  Text(widget.species.lifeExpectancy, style: new TextStyle(color: Colors.white, fontSize: 20.0)),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }

}