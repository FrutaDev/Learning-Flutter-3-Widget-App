import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/presentations/screens/buttons/buttons_screen.dart';
import 'package:widget_app/presentations/widgets/side_menu.dart';

import '../../../config/app_theme.dart';
import '../../../config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {

  static const String name = "home_screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Flutter + Material 3"),
        centerTitle: false,
      ),
      body: _HomeView(),
      drawer: SideMenu(scaffolKey: scaffoldKey,),
    );
  }
}

class _HomeView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (BuildContext context, int index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget{

  final MenuItems menuItem;

  const _CustomListTile ({
    required this.menuItem
  });


  @override
  Widget build(BuildContext context) {

    final ColorScheme color = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: color.primary,),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: color.primary,),
      title: Text(menuItem.item),
      subtitle: Text(menuItem.subItem),
      onTap: () {
        context.push(menuItem.link);
      }
      ,
    );
  }

}