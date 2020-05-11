import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokeapp/themes/light.theme.dart';
import 'pokemon_controller.dart';

class PokemonPageParamets {
  String name;

  PokemonPageParamets({this.name});
}

class PokemonPage extends StatefulWidget {
  final PokemonPageParamets paramets;

  const PokemonPage({Key key, @required this.paramets}) : super(key: key);

  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends ModularState<PokemonPage, PokemonController> {
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) {
    controller.getDataPokemon(widget.paramets.name);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightTheme().primaryColor.withOpacity(0.9),
        title: Text('Pokémon: ' + this.widget.paramets.name.toUpperCase()),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: lightTheme().primaryColor,
              child: Observer(builder: (_) {
                return Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top * 1),
                  padding: EdgeInsets.all(10),
                  child: (controller.pokemon != null)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Nome: ${controller.pokemon.name.toUpperCase()}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Peso: ${controller.pokemon.weight}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Altura: ${controller.pokemon.height}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Ordem: ${controller.pokemon.order}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Experiência: ${controller.pokemon.baseExperience}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        )
                      : Container(),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
