import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
           SliverAppBar(
            backgroundColor: Color(0xFF707A8A),
            expandedHeight: 200.0,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'Active Kidney',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              
              centerTitle: true,
              background: const Image(
                image: NetworkImage(
                    'https://images.theconversation.com/files/264074/original/file-20190315-28475-1vh4qe0.jpg'),
              ),
            ),
          ),
        ];
      },
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 100,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(
              top: 5,
            ),
            child: ListTile(
              //Margin for each list item
              minVerticalPadding: 10,
              tileColor: const Color(0xFFF1F0F0),
              title: Text('Lorem Ipsum $index'),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting  $index'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.alarm, size: 18),
                      Text('  10:00 AM'),
                    ],
                  ),
                ],
              ),
              leading: Image.network(
                'https://cdn.mos.cms.futurecdn.net/i9gCoZGQHoCSTXRxoYAPQ6.jpg',
                width: 100,
                fit: BoxFit.cover,
                repeat: ImageRepeat.noRepeat,
                alignment: Alignment.center,
              ),
              trailing: const Icon(Icons.more_vert),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
