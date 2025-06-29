// // class Home extends StatefulWidget {
//   import 'package:cloud_firestore/cloud_firestore.dart';

// @override
//   _HomeState createState() => _HomeState();


// class _HomeState extends State<Home> {
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('notes').snapshots();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (_) => addnote()));
//         },
//         child: Icon(
//           Icons.add,
//         ),
//       ),
//       appBar: AppBar(
//         title: Text('todo'),
//       ),
//       body: StreamBuilder(
//         stream: _usersStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text("something is wrong");
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           return Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (_, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) =>
//                             editnote(docid: snapshot.data!.docs[index]),
//                       ),
//                     );
//                   },
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 4,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           left: 3,
//                           right: 3,
//                         ),
//                         child: ListTile(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             side: BorderSide(
//                               color: Colors.black,
//                             ),
//                           ),
//                           title: Text(
//                             snapshot.data!.docChanges[index].doc['title'],
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                           subtitle: Text(
//                             snapshot.data!.docChanges[index].doc['content'],
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           contentPadding: EdgeInsets.symmetric(
//                             vertical: 12,
//                             horizontal: 16,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }