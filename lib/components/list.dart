import 'package:active_kidney/pages/details.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  var items = [
    {
      'id': 1,
      'title': 'Atorvastatin',
      'description':
          'Atorvastatin is a medication that is used to treat high blood pressure.',
      'image':
          'https://www.news-medical.net/image.axd?picture=2019%2F9%2F%40shutterstock_1372376654.jpg',
      'date': '10/10/2020',
      'category': '1',
    },
    // {
    //   'id': 2,
    //   'title': 'Levothyroxine',
    //   'description':
    //       'Levothyroxine is a medication that is used to treat high cholesterol.',
    //   'image':
    //       'https://healthjade.net/wp-content/uploads/2019/04/Levothyroxine.jpg',
    //   'date': '10/10/2020',
    //   'category': '2',
    // },
    // {
    //   'id': 3,
    //   'title': 'Lisinopril',
    //   'description':
    //       'Lisinopril is a medication that is used to treat high blood pressure.',
    //   'image': 'https://img.icliniq.com/article/lisinopril-2075.jpg',
    //   'date': '10/10/2020',
    //   'category': '3',
    // },
    // {
    //   'id': 4,
    //   'title': 'Metformin',
    //   'description':
    //       'Metformin is a medication that is used to treat high blood pressure.',
    //   'image':
    //       'https://www.ilcn.org/wp-content/uploads/2021/12/Stock_metformin-1620x912-1.jpg',
    //   'date': '10/10/2020',
    //   'category': '4',
    // },
    // {
    //   'id': 5,
    //   'title': 'Metoprolol',
    //   'description':
    //       'Metoprolol is a medication that is used to treat high cholesterol.',
    //   'image':
    //       'https://5.imimg.com/data5/JI/IJ/SN/SELLER-23618296/metoprolol-100-mg-500x500.jpg',
    //   'date': '10/10/2020',
    //   'category': '5',
    // },
    // {
    //   'id': 6,
    //   'title': 'Amlodipine',
    //   'description':
    //       'Amlodipine is a medication that is used to treat high blood pressure.',
    //   'image':
    //       'https://gardeniapharmacy.com/wp-content/uploads/2021/09/00061209.jpg',
    //   'date': '10/10/2020',
    //   'category': '6',
    // },
    // {
    //   'id': 7,
    //   'title': 'Albuterol',
    //   'description':
    //       'Albuterol is a medication that is used to treat high cholesterol.',
    //   'image':
    //       'https://rtmagazine.com/wp-content/uploads/2020/02/pharma_generic_albuterolsulfate-1350-1280x640.jpg',
    //   'date': '10/10/2020',
    //   'category': '7',
    // },
    // {
    //   'id': 8,
    //   'title': 'Omeprazole',
    //   'description':
    //       'Omeprazole is a medication that is used to treat high blood pressure.',
    //   'image':
    //       'https://upload.wikimedia.org/wikipedia/commons/6/64/Omeprazole-3D-balls.png',
    //   'date': '10/10/2020',
    //   'category': '8',
    // },
    // {
    //   'id': 9,
    //   'title': 'Losartan',
    //   'description':
    //       'Losartan is a medication that is used to treat high cholesterol.',
    //   'image':
    //       'https://cdn.sanity.io/images/0vv8moc6/pharmacytimes/7aceb2b231b4f02149b038c03d92672869ab8809-944x724.png',
    //   'date': '10/10/2020',
    //   'category': '9',
    // },
    // {
    //   'id': 10,
    //   'title': 'Gabapentin',
    //   'description':
    //       'Gabapentin is a medication that is used to treat high blood pressure.',
    //   'image':
    //       'https://post.healthline.com/wp-content/uploads/2020/09/766x415_Gabapentin_Side_Effects-1-732x415.jpg',
    //   'date': '10/10/2020',
    //   'category': '10',
    // },
    // {
    //   'id': 11,
    //   'title': 'Hydrochlorothiazide',
    //   'description':
    //       'Hydrochlorothiazide is a medication that is used to treat high cholesterol.',
    //   'image':
    //       'https://thumbs.dreamstime.com/b/hydrochlorothiazide-hctz-hct-molecule-thiazide-diuretic-used-to-treat-edema-hypertension-skeletal-chemical-formula-paper-232504714.jpg',
    //   'date': '10/10/2020',
    //   'category': '11',
    // },
    // {
    //   'id': 12,
    //   'title': 'Hydrochlorothiazide',
    //   'description':
    //       'Hydrochlorothiazide is a medication that is used to treat high blood pressure.',
    //   'image':
    //       'https://images.mid-day.com/images/images/2022/apr/Pills-a_d.jpg',
    //   'date': '10/10/2020',
    //   'category': '12',
    // },
    // {
    //   'id': 13,
    //   'title': 'Hydrochlorothiazide',
    //   'description':
    //       'Hydrochlorothiazide is a medication that is used to treat high cholesterol.',
    //   'image':
    //       'https://s3.amazonaws.com/static.wd7.us/b/b0/Hydrochlorothiazide-from-xtal-3D-balls.png',
    //   'date': '10/10/2020',
    //   'category': '13',
    // },
    // {
    //   'id': 14,
    //   'title': 'Hydrochlorothiazide',
    //   'description':
    //       'Hydrochlorothiazide is a medication that is used to treat high blood pressure.',
    //   'image':
    //       'https://images.mid-day.com/images/images/2022/apr/Pills-a_d.jpg',
    //   'date': '10/10/2020',
    //   'category': '14',
    // },
    // {
    //   'id': 15,
    //   'title': 'Hydrochlorothiazide',
    //   'description':
    //       'Hydrochlorothiazide is a medication that is used to treat high blood pressure.',
    //   'image':
    //       'https://drugs.selfdecode.com/app/uploads/2020/01/Hydrochlorothiazide-Side-Effects-Possible-Alternatives.jpg',
    //   'date': '10/10/2020',
    //   'category': '15',
    // },
  ];
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 200.0,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Active Kidney',
                      style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Lorem Ipsum is simply dummy text of the \n printing and typesetting industry. \n Lorem Ipsum has been the industrys standard \n dummy text ever since the 1500s',
                      style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              background: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://blogs.cdc.gov/wp-content/uploads/sites/6/2020/03/PHM_Natl-Kidney-Mnth_header.jpg'),
              ),
            ),
          ),
        ];
      },
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(
              top: 5,
            ),
            child: ListTile(
              //Margin for each list item
              minVerticalPadding: 5,
              tileColor: const Color(0xFFF1F0F0),
              title: Text(items[index]['title'].toString()),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(items[index]['description'].toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.alarm, size: 18),
                      Text('10/10/2020'),
                    ],
                  ),
                ],
              ),
              leading: Image.network(
                items[index]['image'].toString(),
                fit: BoxFit.cover,
                width: 100,
              ),
              trailing: const Icon(Icons.more_vert),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      img: items[index]['image'].toString(),
                      title: items[index]['title'].toString(),
                      description: items[index]['description'].toString(),
                      date: items[index]['date'].toString(),
                    )
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
