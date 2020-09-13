import 'package:diet_planner/domain/entities/diet.dart';
import 'package:diet_planner/presentation/account/account_page.dart';
import 'package:diet_planner/presentation/diets/diets_page.dart';
import 'package:diet_planner/presentation/meal_plan/meal_plan_page.dart';
import 'package:flutter/material.dart';
import 'package:diet_planner/core/xdatetime.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var database;

  Diet _currentDiet;
  PageController _pageController;
  int _page = 0;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Switching beetwen days mechanic
      appBar: getAppbarForPage(_page),
      body: PageView(
        children: <Widget>[
          MealPlanPage(_currentDiet),
          DietsPage(this),
          AccountPage(),
        ],
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _page = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: navigationTapped,
        items: [
          BottomNavigationBarItem(
            title: Text('Meal plan'),
            icon: Icon(Icons.restaurant),
          ),
          BottomNavigationBarItem(
            title: Text('Diets'),
            icon: Icon(Icons.content_paste),
          ),
          BottomNavigationBarItem(
            title: Text('Account'),
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget getAppbarForPage(int page) {
    switch (page) {
      case 0:
        return getMealPlanAppBar();
      case 1:
        return AppBar();
      case 2:
        return AppBar(
          actions: [
            IconButton(
              padding: EdgeInsets.only(right: 10),
              onPressed: () {},
              icon: Icon(Icons.settings),
            )
          ],
        );
    }
  }

  Widget getMealPlanAppBar() => AppBar(
        centerTitle: true,
        title: Row(mainAxisSize: MainAxisSize.min, children: [
          IconButton(
            iconSize: 32,
            onPressed: () {
              setState(() {
                _selectedDate = _selectedDate.subtract(Duration(days: 1));
              });
            },
            icon: Icon(
              Icons.arrow_left,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                _selectedDate.printAdverbOfTimeOrDate(),
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                _selectedDate.printWeekday(),
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          IconButton(
            iconSize: 32,
            onPressed: () {
              setState(() {
                _selectedDate = _selectedDate.add(Duration(days: 1));
              });
            },
            icon: Icon(
              Icons.arrow_right,
            ),
          ),
        ]),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            iconSize: 28,
            onPressed: () {},
          )
        ],
      );

  void navigationTapped(int page, [Diet diet]) {
    _currentDiet = diet;
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
