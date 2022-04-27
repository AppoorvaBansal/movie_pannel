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
        title: Text("Movie Details",),
        backgroundColor: Colors.grey.shade700,

      ),
      backgroundColor: Colors.white,
      body:ListView(
        children: [
              MovieThumbnail(movieObject: movieObject),
              MoviePoster(movieObject:movieObject),
          BRtag(),
          MovieActorDetails(movieObject: movieObject,),
          BRtag(),
          MovieImageSlider(posters: movieObject.Images,)


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
              height: 170,
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
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(movieObject.Images[2]),fit: BoxFit.cover
                )
              ),


            ),

          )


        ),
        SizedBox(width: 16,),
        Expanded(
            child: MovieDetailsHeader(movieObject: movieObject)

        ),


      ],


      ),


    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final dbMovie movieObject;

  const MovieDetailsHeader({Key? key,required this.movieObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${movieObject.Year} . ${movieObject.Genre}".toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.deepPurple

        ),),

        Text(movieObject.Title,style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 30

        ),),
        Text.rich(TextSpan(style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w300,
        ),
          children: [
            TextSpan(
              text: movieObject.Plot

            ),
            TextSpan(
                text: "More.....",
              style: TextStyle(color: Colors.blueAccent)
            )


          ]
        )

        )
        
      ],
      
      
    );
  }
}

class MovieActorDetails extends StatelessWidget {
  final dbMovie movieObject;
  const MovieActorDetails({Key? key,required this.movieObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child:Column(
        children: [
          Moviefield(property: "Cast",value:movieObject.Actors),
          Moviefield(property: "Director",value:movieObject.Director),
          Moviefield(property: "Awards",value:movieObject.Awards),
          Moviefield(property: "Imdb Rating",value:movieObject.imdbRating),

        ],



      )



    );
  }
}

class Moviefield extends StatelessWidget {
  final String property;
  final String value;
  const Moviefield({Key? key,required this.property,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$property : ",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w300),)
    ,
        Text(value,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w300),)

      ],

    );
  }
}

class BRtag extends StatelessWidget {
  const BRtag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 14.0),
      child: Container(
        height: 1.0,
        color: Colors.grey,

      ),
    );
  }
}
class MovieImageSlider extends StatelessWidget {

  final List<String> posters;
  const MovieImageSlider({Key? key,required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
          child: Text("Movie Posters",style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.black

          ),
          ),
        ),

        Container(
height: 150,
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)=>ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width/4,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(posters[index]),fit: BoxFit.cover

                    )
                  ),



                ),



              ),
              separatorBuilder: (context,index)=>SizedBox(width: 8.5,),
              itemCount: posters.length),


        )


      ],



    );
  }
}







