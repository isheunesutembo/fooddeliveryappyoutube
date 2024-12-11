

import 'package:flutter/material.dart';
import 'package:fooddeliveryappyoutube/features/auth/screen/log_in_screen.dart';
import 'package:routemaster/routemaster.dart';

import 'features/auth/main/screen/main_screen.dart';

final loggedInRoute=RouteMap(routes: {'/':(_)=>const MaterialPage(child: MainScreen())});
final loggedOutRoute=RouteMap(routes: {'/':(_)=>const MaterialPage(child: LogInScreen())});