import 'package:flutter/material.dart';

class MenuItems {
  final String item;
  final String subItem;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.item,
    required this.subItem,
    required this.link,
    required this.icon
  });
}

const appMenuItems = <MenuItems> [
  MenuItems(
      item: 'Botones',
      subItem: 'Varios botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined
      ),
  MenuItems(
      item: 'Tarjetas',
      subItem: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card
      ),
  MenuItems(
      item: 'ProgressIndicators',
      subItem: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded
  ),
  MenuItems(
      item: 'SnackBars and Dialogs',
      subItem: 'Screen indicators',
      link: '/snack-bar',
      icon: Icons.info_outline
  ),
  MenuItems(
      item: 'Animated Container',
      subItem: 'Stateful widget animated',
      link: '/animated',
      icon: Icons.check_box_outline_blank_rounded
  ),
  MenuItems(
      item: 'UI Controls + Tiles',
      subItem: "A flutter's control series",
      link: '/ui-controls',
      icon: Icons.car_rental_outlined
  ),
  MenuItems(
      item: 'App Tutorial',
      subItem: "Small App Tutorial",
      link: '/app-tutorial',
      icon: Icons.accessibility_rounded
  ),
  MenuItems(
      item: 'Infinite Scroll y Pull',
      subItem: "Listas infinitas y pull to refresh",
      link: '/infinite-scroll',
      icon: Icons.list_alt_outlined
  ),
];