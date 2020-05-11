import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokeapp/app/modules/home/pages/pokemon/pokemon_page.dart';
import 'package:pokeapp/app/shared/widgets/loading/loading_widget.dart';
import 'package:pokeapp/themes/light.theme.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: lightTheme().primaryColor,
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top * 3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/pokeapi.png'),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Observer(builder: (_) {
                      return this.controller.loading
                          ? LoadingWidget(
                              message: 'Carregando pokémons...',
                            )
                          : Container();
                    }),
                    Observer(builder: (_) {
                      return Expanded(
                        child: (controller.pokemons.length > 0)
                            ? ListView.builder(
                                controller: controller.controller,
                                itemCount: controller.pokemons.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Center(
                                      child: Text(
                                        controller.pokemons[index].name
                                            .toUpperCase(),
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Modular.to
                                          .pushNamed('pokemon', arguments: new PokemonPageParamets(
                                            name: controller.pokemons[index].name
                                          ) 
                                      );
                                    },
                                  );
                                },
                              )
                            : !this.controller.loading
                                ? Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        'Ops!',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Falha de Conexão',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 20),
                                      ),
                                    ],
                                  )
                                : Container(),
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
