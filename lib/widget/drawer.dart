import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0,left: 18.0,bottom: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/me.jpg'),
              radius: 50,
            ),
            const SizedBox(height: 16.0,),
            Text('Foula Fofana',style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
              color: Colors.black,
            ),),
            const SizedBox(height: 3.0,),
             Text("fofanafoula70@gmail.com",style: GoogleFonts.roboto(
              color: Colors.grey,
              fontSize: 15.0,
             )
             ),
            const SizedBox(height: 20.0,),
             GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/profile');
              },
               child: Row(
                children: [
                  const Icon(Icons.person_rounded,color: Colors.red,),
                  const SizedBox(width: 10.0,),
                  Text('Modidifier le Profil',
                  style: GoogleFonts.roboto(
                    color: Colors.black,fontWeight: FontWeight.w300
                    ),
                    )
                ],
                           ),
             ),
           
            const SizedBox(height: 20.0,),

             GestureDetector(
               child: Row(
                children: [
                  const Icon(Icons.settings,color: Colors.blueAccent,),
                  const SizedBox(width: 10.0,),
                  Text('Paramètre ',
                  style: GoogleFonts.roboto(
                    color: Colors.black,fontWeight: FontWeight.w300
                    ),
                    )
                ],
                           ),
             ),
            const SizedBox(height: 20.0,),

             GestureDetector(
               child: Row(
                children: [
                  const Icon(Icons.favorite,color: Colors.purpleAccent,),
                  const SizedBox(width: 10.0,),
                  Text("Partager l'application",
                  style: GoogleFonts.roboto(
                    color: Colors.black,fontWeight: FontWeight.w300
                    ),
                    )
                ],
                           ),
             ),
            // const SizedBox(height: 20.0,),
            Expanded(child: Container()),
            GestureDetector(
               child: Row(
                children: [
                   Icon(Icons.logout,color: Colors.red[200],),
                  const SizedBox(width: 10.0,),
                  Text('Se deconnecter',
                  style: GoogleFonts.roboto(
                    color: Colors.black,fontWeight: FontWeight.w300
                    ),
                    )
                ],
                           ),
             ),

            
          ],
          ),
      ),
    );
  }
}