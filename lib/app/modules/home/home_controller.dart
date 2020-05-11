import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokeapp/app/modules/home/models/pokemon_model.dart';
import 'package:pokeapp/app/modules/home/services/pokemon_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  PokemonService _service;
  ScrollController controller = ScrollController();
  int offset = 0;

  @observable
  bool loading = true;

  @observable
  ObservableList<PokemonModel> pokemons = ObservableList<PokemonModel>();

  _HomeControllerBase(this._service) {
    _start();
    _listenerScrollListView();
  }

  _start() async {
    try {
      loading = true;

      await _service.getAll(0, 20).then(
            (data) => pokemons = data.toList().asObservable(),
          );
    } catch (e) {
      print(e);
    } finally {
      loading = false;
    }
  }

  _listenerScrollListView() {
    controller.addListener(() {
      if (controller.position.atEdge) {
        if (controller.position.pixels == 0) {
          // you are at top position
          print('top');
        } else {
          // you are at bottom position
          print('bottom');
          _loadMorePokemons();
        }
      }
    });
  }

  _loadMorePokemons() async {
    this.offset = this.offset + 20;
    try {
      loading = true;

      await _service.getAll(offset, offset + 20).then(
            (data) => {
              print(data),
              pokemons = data.toList().asObservable()
            },
          );
    } catch (e) {
      print(e);
    } finally {
      loading = false;
    }
  }
}
