import 'package:flutter/cupertino.dart';
import 'package:flutter_bumble_clone/views/messages_view.dart';
import 'package:flutter_bumble_clone/views/profile_view.dart';
import 'package:flutter_bumble_clone/views/swipe_view.dart';

class MainScreenViewProvider with ChangeNotifier {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  ProfileView profileView = ProfileView();
  SwipeView swipeView = SwipeView();
  MessagesView messagesView = MessagesView();

  Widget get body {
    switch (_currentIndex) {
      case 0:
        return profileView;
      case 1:
        return swipeView;
      case 2:
        return messagesView;
      default:
        return Container();
    }
  }
}
