import 'package:flutter/material.dart';
import 'package:product_arena_x_tech_387/login_page.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';


List<Element> _elements = <Element>[
  Element(DateTime(2020, 6, 24, 18), 'Alen K.', Icons.boy),
  Element(DateTime(2020, 6, 24, 9), 'John F.', Icons.man),
  Element(DateTime(2020, 6, 25, 8), 'Elma S.', Icons.woman),
  Element(DateTime(2020, 6, 25, 16), 'Hazir F.', Icons.boy),
  Element(DateTime(2020, 6, 25, 20), 'Maida S.', Icons.girl),
  Element(DateTime(2020, 6, 26, 12), 'Nenad J.', Icons.man),
  Element(DateTime(2020, 6, 27, 12), 'Armin K.', Icons.man),
  Element(DateTime(2020, 6, 27, 13), 'Taida M.', Icons.woman),
  Element(DateTime(2020, 6, 27, 14), 'Nihad J', Icons.man),
  Element(DateTime(2020, 6, 27, 15), 'Arman H', Icons.man),
  Element(DateTime(2020, 6, 28, 12), 'Aldin A', Icons.boy),
  Element(DateTime(2020, 6, 29, 12), 'Tarik K', Icons.man),
  Element(DateTime(2020, 6, 29, 12), 'Senad P', Icons.man),
  Element(DateTime(2020, 6, 30, 12), 'Maja B', Icons.woman),
];

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Image.network('https://user-images.githubusercontent.com/76163793/205487416-8f77bc0a-d98f-4ac6-8274-70cb5546a52c.png'),
             SizedBox(width: 110,),
             TextButton.icon(onPressed: (){
               Navigator.of(context).pushReplacement(MaterialPageRoute(
                 builder: (context) => AlertDialog(
                   backgroundColor: Colors.white,
                   title: Text('Log Out'),
                   content: Text('Are you sure you want to log out from the console?'),
                   actions: [
                     TextButton(onPressed: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => LoginScreen()),
                       );
                     }, child: Text('Yes')),
                     TextButton(onPressed: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => MainPage()),
                       );
                     }, child: Text('No')),
                   ],
                 ),
               ));
             }, icon: Icon(Icons.exit_to_app), label: Text('')),
            ],
          ),
        ),
        body: StickyGroupedListView<Element, DateTime>(
          elements: _elements,
          order: StickyGroupedListOrder.ASC,
          groupBy: (Element element) => DateTime(
            element.date.year,
            element.date.month,
            element.date.day,
          ),
          groupComparator: (DateTime value1, DateTime value2) =>
              value2.compareTo(value1),
          itemComparator: (Element element1, Element element2) =>
              element1.date.compareTo(element2.date),
          floatingHeader: true,
          groupSeparatorBuilder: _getGroupSeparator,
          itemBuilder: _getItem,
        ),
      ),
    );
  }

  Widget _getGroupSeparator(Element element) {
    return SizedBox(
      height: 50,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            color: Colors.blue[300],
            border: Border.all(
              color: Colors.blue[300]!,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${element.date.day}. ${element.date.month}, ${element.date.year}',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getItem(BuildContext ctx, Element element) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: SizedBox(
        child: ListTile(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Icon(element.icon),
          title: Text(element.name),
          trailing: Text('${element.date.hour}:00'),
        ),
      ),
    );
  }
}

class Element {
  DateTime date;
  String name;
  IconData icon;

  Element(this.date, this.name, this.icon);
}