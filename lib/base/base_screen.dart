import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_bloc.dart';

abstract class BaseState<BLOC extends Bloc<EVENT, BaseBlocState>, EVENT extends Equatable> extends State<StatefulWidget>{

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isUseAppBar = false;
  BLOC bloc;

  @required
  Widget rightIcon;

  @required
  Widget drawBody();

  @required
  String getTitleLabel() => "";

  @required
  void initBlocState(BuildContext context, BaseBlocState state);

  @override
  Widget build(BuildContext context) {
    if (isUseAppBar) {
      return Scaffold(
          key: scaffoldKey,
          appBar: _generateAppBar(),
          body: _generateBody()
      );
    } else {
      if (generateBottomBar() != null) {
        return Scaffold(
          body: _generateBody(),
          bottomNavigationBar: generateBottomBar(),
        );
      } else {
        return Scaffold(
          body: _generateBody(),
        );
      }
    }
  }

  @required
  Widget generateBottomBar() {
    return null;
  }

  Widget _generateAppBar() {
    if (rightIcon == null) {
      return AppBar(
        title: Text(
          getTitleLabel(),
          style: TextStyle(
              color: Colors.blueAccent
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
      );
    } else {
      return AppBar(
        title: Text(
          getTitleLabel(),
          style: TextStyle(
              color: Colors.black
          ),
        ),
        centerTitle: true,
        actions: [
          rightIcon
        ],
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      );
    }
  }

  Widget _generateBody() {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: BlocProvider(
        create: (context) => bloc,
        child: BlocListener<BLOC, BaseBlocState>(
          listener: (context, state) {
            initBlocState(context, state);
          },
          child: SafeArea(
            child: drawBody(),
          ),
        ),
      ),
    );
  }

  Future<bool> onBackPressed() async {
    return true;
  }
}