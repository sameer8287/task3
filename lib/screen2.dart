import 'package:flutter/material.dart';
import 'screen1.dart';

class Screen2 extends StatefulWidget {
  final List<Userdata> lst ;
  const Screen2({Key? key,required this.lst}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  List<Userdata> list2 = [];
  final seachcontroller = TextEditingController();
  String search = "";

  @override
  void initState() {
    // TODO: implement initState
    list2 = widget.lst;
    
    super.initState();
  }



  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column  (
          children: [
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: seachcontroller,
              decoration: InputDecoration(
                hintText: 'Search by Name',
                prefixIcon: Icon(Icons.search),
                label: Text('Search')
              ),
              onChanged: (String ? value)
              {
                setState(() {
                  search = value.toString();
                });
              },
            ),
            SizedBox(height: 30,),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.lst.length,
                  itemBuilder: (context,index){
                    late String position = index.toString();
                    if(seachcontroller.text.isEmpty){
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Icon(Icons.account_circle),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              //
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Name    - '),
                                  SizedBox(height: 10,),
                                  Text('Email   - '),
                                  SizedBox(height: 10,),
                                  Text('Source  -')
                                ],
                              ),
                              SizedBox(width: 30,)
                              ,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.lst[index].name.toString()),
                                  SizedBox(height: 10,),
                                  Text(widget.lst[index].Email.toString()),
                                  SizedBox(height: 10,),
                                  Text(widget.lst[index].source.toString())
                                ],
                              )


                            ],
                          ),
                        ),
                      );
                    }
                    // position.toLowerCase().contains(seachcontroller.text.toLowerCase())
                    else if(seachcontroller.text.toLowerCase().contains(list2[int.parse(position)].name))
                      {
                        return Card(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  child: Icon(Icons.account_circle),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                //
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name    - '),
                                    SizedBox(height: 10,),
                                    Text('Email   - '),
                                    SizedBox(height: 10,),
                                    Text('Source  -')
                                  ],
                                ),
                                SizedBox(width: 30,)
                                ,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.lst[int.parse(position)].name.toString()),
                                    SizedBox(height: 10,),
                                    Text(widget.lst[int.parse(position)].Email.toString()),
                                    SizedBox(height: 10,),
                                    Text(widget.lst[int.parse(position)].source.toString())
                                  ],
                                )


                              ],
                            ),
                          ),
                        );
                      }

                  }),
            ),
            FloatingActionButton(

              onPressed: () {
                // Add your onPressed code here
                Navigator.pop(context);
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.blue,

            )


          ],

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
