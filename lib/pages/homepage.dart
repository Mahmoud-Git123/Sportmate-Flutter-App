import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/components/text_field.dart';
import 'package:flutter_application_1/pages/test_page.dart';

class templatePage extends StatelessWidget {
  templatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 241, 250, 255),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 2, 135, 217),
              Color.fromARGB(255 , 255, 255, 255),
            ],
            stops: [0.0, 0.7],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            transform: GradientRotation(0.5)
          )
        ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                //logo
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('lib/images/sportmateLogo.png',
                  height: 248
                  //alignment: Alignment.topRight,
                  ),
                ),
                
                const SizedBox(height: 40),
                //text
                const Text(
                  "Add New Availability",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    
                    color: Color.fromARGB(255, 0, 13, 70),
                    
                    fontSize: 20,
                    
                  ),
                ),
                
                const SizedBox(height: 80),

                //button
              GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => testPages()
                  ,)
                  
                  ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 2, 133, 217),
                        Color.fromARGB(255 , 2, 38, 63),
                      ],
                      stops: [0.0, 0.7],
                      //begin: Alignment.bottomLeft,
                      //end: Alignment.topRight,
                      transform: GradientRotation(0.5)
                    ),            
                    borderRadius: BorderRadius.circular(205),      
                  ),
                  padding: const EdgeInsets.all(25),
                  child: const Center(
                    child: Text(
                      "Log in ->", 
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        ),
                            
                    ),
                  )
                ),
              )
          
          
            ],
          ),
        ),
      ),
    );
  }
}