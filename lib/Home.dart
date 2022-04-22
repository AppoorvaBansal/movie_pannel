import'package:flutter/material.dart';
import 'package:movie_pannel/Model/dbMovie.dart';

class Myhome extends StatelessWidget {
  //const Myhome({Key? key,required this.title}) : super(key: key);

  //final String title;

  final  List<dbMovie> movieDetails=dbMovie.getMovieDetails();

  final List movieList=[
    "Avatar","I am Legend","Intersteller","Lucy","300","Harry Potter","The Avengers","The Kungfu Panda","Mirror","Vikings","The Kings Avtar","Vincenzo",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie List"),
        backgroundColor: Colors.green,

      ),
      backgroundColor: Colors.green.shade100,
      body: ListView.builder(
        itemCount: movieDetails.length,
          itemBuilder:(BuildContext context,int index){
        return Card(
            color: Colors.white,
          child:ListTile(
            leading: CircleAvatar(

              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  //color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(image: NetworkImage(movieDetails[index].Images[0]),fit: BoxFit.cover)

                ),
                child: Text(""),
              ),

            ),
            title: Text(movieDetails[index].Title,style: TextStyle(
              fontWeight:FontWeight.w200,
              fontSize: 18,
              color: Colors.black
            ),),
            subtitle: Text(movieDetails[index].Actors),
            trailing: Text("...",style: TextStyle(
              fontWeight: FontWeight.bold,

            ),),

            onTap: ()=>{
              //debugPrint("Movie NAme is : ${movieList[index]}")
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetails(movieObject:movieDetails[index])))
            },
          )
        );

    }
    ),

    );
  }
}

class MovieDetails extends StatelessWidget {
  final dbMovie movieObject;
  const MovieDetails({Key? key, required this.movieObject}) : super(key: key);

  //const MovieDetails({Key? key, this.movieName}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details"),
        backgroundColor: Colors.green,

      ),
      backgroundColor: Colors.green.shade100,
      body:ListView(
        children: [
              MovieThumbnail(movieObject: movieObject),
              MoviePoster(movieObject:movieObject)


        ],


      )

      // body: Container(
      //
      //   child: Center(
      //     child:Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children:[
      //         Text("${movieObject.Title}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
      //         Text("${movieObject.Actors}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200,color: Colors.grey),),
      //         Text("${movieObject.Plot}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200,color: Colors.grey),),
      //         Text("${movieObject.Awards}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200,color: Colors.grey),)
      //
      //       ]
      //   ),
      //
      //
      // ),
      //
      // )
    );
  }
}

class MovieThumbnail extends StatelessWidget {

  final dbMovie movieObject;

  const MovieThumbnail({Key? key,required this.movieObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(

                  image: DecorationImage(
                      image: NetworkImage(movieObject.Images[1])
                      ,fit: BoxFit.cover)

              ),


            ),
            Icon(Icons.play_circle_outline,size: 100,color: Colors.white,),




          ],

        ),
        Text(movieObject.Title,style: TextStyle(
            fontSize: 50,
            color: Colors.white

        ),),
        Container(
          height: 80,
          decoration: BoxDecoration(
            gradient: LinearGradient(end:Alignment.bottomCenter,begin: Alignment.topCenter,colors:[
              Color(0x00000000),Color(0XFFFFFFFF)])


          ),


        )





      ],



    );
  }
}

class MoviePoster extends StatelessWidget {
  final dbMovie movieObject;
  const MoviePoster({Key? key,required this.movieObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.all(8.0),
      child: Row(
      children: [
        Card(
          elevation: 200,
          child:ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: MediaQuery.of(context).size.width/4,
              height: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(movieObject.Images[2]),fit: BoxFit.cover
                )
              ),


            ),

          )


        ),
        Card(
            elevation: 200,
            child:ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width*0.67,
                height: 170,
                decoration: BoxDecoration(
                  gradient: LinearGradient(end:Alignment.bottomCenter,begin: Alignment.topCenter,colors:[
                    Color(0x00000000),Color(0XFFFFFFFF)]),
                    // image: DecorationImage(
                    //     image: NetworkImage(movieObject.Images[3]),fit: BoxFit.cover
                    // )

                ),


              ),

            )


        )

      ],


      ),


    );
  }
}



