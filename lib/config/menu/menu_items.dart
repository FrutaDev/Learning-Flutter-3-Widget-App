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
];