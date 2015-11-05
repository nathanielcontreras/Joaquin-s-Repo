 include "rad_def.inc"
 global_settings{
    radiosity{
        Rad_Settings ( Radiosity_Default, off, off )
         //Type, normal?, media?
         }}
//MEASUREMENTS
#declare RoomWidth = 932;
#declare RoomLength = 1016;
#declare RoomHeight = 435;
#declare HalfRoomWidth = RoomWidth/2;
#declare HalfRoomLength = RoomLength/2;
#declare ThreeFourthRoomWidth = RoomWidth*.75;
#declare ThreeFourthRoomLength = RoomLength*.75;
#declare OneFourthRoomWidth = RoomWidth*.25;
#declare OneFourthRoomLength = RoomLength*.25;
#declare SeatedEyeHeight = 112;

#declare SasurisDen = box{
            <-100,0,-100>
            <RoomWidth+100,RoomHeight,RoomLength+100>
            }
//CAMERA SETTINGS            
#declare TopFrontOfRoom = <HalfRoomWidth,SeatedEyeHeight*3,-100>;
#declare CloseFrontOfRoom = <HalfRoomWidth,SeatedEyeHeight*2,325>;
#declare TopAngleCloseFrontOfRoom = <HalfRoomWidth,SeatedEyeHeight*3.5,350>;
#declare AngleFromTopRight = <RoomWidth,SeatedEyeHeight*3,40>;
#declare AngleFromTopLeft = <0,SeatedEyeHeight*3,40>;
#declare BackTopLeftCorner = <0,SeatedEyeHeight*3.5,RoomLength>;
#declare BackTopRightCorner = <RoomWidth,SeatedEyeHeight*3.5,RoomLength>;
#declare RightSideOfSasuri = <100,SeatedEyeHeight*2.3,ThreeFourthRoomLength-250>;
#declare LeftSideOfSasuri = <RoomWidth,SeatedEyeHeight*2.3,ThreeFourthRoomLength-250>;
#declare SasuriFace = <HalfRoomWidth,SeatedEyeHeight*1.25,ThreeFourthRoomLength-120>;
#declare SasuriFaceAngleOne = <HalfRoomWidth-100,SeatedEyeHeight*1.75,ThreeFourthRoomLength-120>;
#declare TopOfSasuri = <HalfRoomWidth,SeatedEyeHeight*3.5,RoomLength-250>;

#declare Origin = <0,0,0>;
#declare FullImage = <HalfRoomWidth,SeatedEyeHeight*3,RoomLength>;
#declare HeadOfSasuri = <HalfRoomWidth,SeatedEyeHeight*2,ThreeFourthRoomLength>;
#declare FaceOfSasuri = <HalfRoomWidth,SeatedEyeHeight*1.9,ThreeFourthRoomLength-50>;

//COLORS
#declare NoColorForLight = <1,1,1>;
#declare FadedBlueForLight = <.5,.5,1>;
#declare NoColor = rgb<1,1,1>;
#declare SolidGrey = rgb<.5,.5,.5>;
#declare SolidBlack = rgb<0,0,0>;
#declare SolidBlue = rgb<.6,.6,.6>;
#declare SolidMaroon = rgb<.3,0,0>;
#declare SolidRed = rgb<1,0,0>;

#declare FadedBlue = pigment{
                     rgb<.5,.5,1>
};
#declare BrickPigment = pigment{
                brick
                color SolidBlack 
                color SolidGrey
                scale <10,10,10>
                } 

camera{                     
          //  location AngleFromTopRight
          //  location AngleFromTopLeft 
          //  location TopFrontOfRoom
           // location CloseFrontOfRoom
          //  location TopAngleCloseFrontOfRoom
            location BackTopLeftCorner
           // location BackTopRightCorner
           // location RightSideOfSasuri
           // location LeftSideOfSasuri
         //   location SasuriFace
           // location SasuriFaceAngleOne
           // location TopOfSasuri
             
          //  look_at FullImage
           // look_at Origin
            look_at HeadOfSasuri
           // look_at FaceOfSasuri
}
    
/*light_source{
            <HalfRoomWidth,SeatedEyeHeight,HalfRoomLength>
            rgb NoColorForLight
            shadowless
            }*/  
light_source{
            <HalfRoomWidth,SeatedEyeHeight*3.8,RoomLength>
            rgb NoColorForLight
            shadowless
            }
/*light_source{
            <ThreeFourthRoomWidth,SeatedEyeHeight*2,ThreeFourthRoomLength>
            rgb NoColorForLight
            shadowless
            } */
/*light_source{
            <OneFourthRoomWidth,SeatedEyeHeight*2,ThreeFourthRoomLength>
            rgb NoColorForLight
            
            shadowless
            } */
object{
        SasurisDen
        
        texture{BrickPigment 
}
}

#declare ChairWidth = 54;
#declare ChairHeight = 81.5;
#declare ChairDepth = 54;
#declare ChairSeatHeight = 41;              

#declare ChairBack = 
    
    box{ <0,ChairSeatHeight,0>
         <ChairWidth,ChairHeight,5>
         }
#declare ChairSeat = 

    box{ <0,ChairSeatHeight,0>
            <ChairWidth,ChairSeatHeight+5,ChairDepth>
}          

#declare Chair = 
        union {
            object { ChairBack } 
            object { ChairSeat }
            #declare index = 0;
               scale <4,0,0>
               translate<-80,0,0> 
                texture {
                pigment {
                 rgb <1,1,1>
                 }}
               };
object { Chair 
            scale <2.5,2,2> 
            rotate <0,180,0>
            translate <525,0,800> 
            texture{
            pigment{
            image_map{jpeg "Concrete.jpg" 
            }scale 50 
            }
           }
          }

#declare body = union { 

//Sasuris Head
        sphere {
        <0,0,0>25 
        translate <HalfRoomWidth,SeatedEyeHeight*1.95,ThreeFourthRoomLength-50>
     
        }
          
//Sasuris Torso
        sphere{ 
        <0,0,0>30
        scale <0,2,0>
        rotate <-15,0,0>
        translate <HalfRoomWidth,SeatedEyeHeight*1.3,ThreeFourthRoomLength-15>
        }
        
        sphere { 
        <0,0,0>10
        translate <HalfRoomWidth-10,SeatedEyeHeight-20,ThreeFourthRoomLength-10>
        }

        sphere { 
        <0,0,0>10
        translate <HalfRoomWidth+10,SeatedEyeHeight-20,ThreeFourthRoomLength-10>
        }
        
        torus {
        20  // outer radius
        10  // inner radius
        scale <1.15,2,1>
        rotate <-110,0,0>
        translate <HalfRoomWidth,SeatedEyeHeight*1.55,ThreeFourthRoomLength-25>
        }
        
        torus {
        25  // outer radius
        10  // inner radius
        scale <1,3,0.9>
        rotate <-20,0,0>
        translate <HalfRoomWidth,SeatedEyeHeight*1.45,ThreeFourthRoomLength-20>
        }
                    
//Sasuris Legs     
     
        //Sasuris Thighs
      
            sphere{ 
        <0,0,0>30
        scale <.45,.45,1.25>
        rotate <0,10,0>
        translate <HalfRoomWidth-17,SeatedEyeHeight-25,ThreeFourthRoomLength-40>
        }
        
            sphere{ 
        <0,0,0>30
        scale <.45,.45,1.25>
        rotate <0,-10,0>
        translate <HalfRoomWidth+17,SeatedEyeHeight-25,ThreeFourthRoomLength-40>
       }
     
        //Sasuris knees
        
         sphere { 
        <0,0,0>5
        translate <HalfRoomWidth-23,SeatedEyeHeight-25,ThreeFourthRoomLength-80>
        }
        
         sphere { 
        <0,0,0>5
        translate <HalfRoomWidth+23,SeatedEyeHeight-25,ThreeFourthRoomLength-80>
        }
        
        // Sasuris Calves
        
           sphere{ 
        <0,0,0>30
        scale <.25,.25,1.25>
        rotate <90,0,0>
        translate <HalfRoomWidth-25,SeatedEyeHeight-60,ThreeFourthRoomLength-80>
        }
        
            sphere{ 
        <0,0,0>30
        scale <.25,.25,1.25>
        rotate <90,0,0>
        translate <HalfRoomWidth+25,SeatedEyeHeight-60,ThreeFourthRoomLength-80>
        }
        
            sphere{ 
        <0,0,0>30
        scale <.25,.30,.75>
        rotate <90,0,0>
        translate <HalfRoomWidth-25,SeatedEyeHeight-60,ThreeFourthRoomLength-78>
        }
        
            sphere{ 
        <0,0,0>30
        scale <.25,.30,.75>
        rotate <90,0,0>
        translate <HalfRoomWidth+25,SeatedEyeHeight-60,ThreeFourthRoomLength-78>
        } 
         
//Sasuris Arms

           sphere{ 
        <0,0,0>30
        scale <.30,.25,1>
        rotate <90,+15,-10>
        translate <HalfRoomWidth-40,SeatedEyeHeight*1.35,ThreeFourthRoomLength-35>
        }
        
            sphere{ 
        <0,0,0>30
        scale <.30,.25,1>
        rotate <90,-15,10>
        translate <HalfRoomWidth+40,SeatedEyeHeight*1.35,ThreeFourthRoomLength-35>
        }
        
         sphere { 
        <0,0,0>10
        translate <HalfRoomWidth-28,SeatedEyeHeight+68,ThreeFourthRoomLength-33>
        }
        
         sphere { 
        <0,0,0>10
        translate <HalfRoomWidth+28,SeatedEyeHeight+68,ThreeFourthRoomLength-33>
        } 
         
        //Sasuris elbows and down 
         
        sphere { 
        <0,0,0>6
        translate <HalfRoomWidth-45,SeatedEyeHeight+10,ThreeFourthRoomLength-35>
        }
        
         sphere { 
        <0,0,0>6
        translate <HalfRoomWidth+45,SeatedEyeHeight+10,ThreeFourthRoomLength-35>
       }
        
         sphere{ 
        <0,0,0>30
        scale <.20,.25,1>
        rotate <-15,-25,-10>
        translate <HalfRoomWidth-35,SeatedEyeHeight-5,ThreeFourthRoomLength-60>
        }
        
            sphere{ 
        <0,0,0>30
        scale <.20,.25,1>
        rotate <-15,25,+10>
        translate <HalfRoomWidth+35,SeatedEyeHeight-5,ThreeFourthRoomLength-65>
        }
        
        
        };
        
#declare body2 = union { 

//Sasuris Head
        sphere {
        <0,0,0>25 
        translate <HalfRoomWidth,SeatedEyeHeight*1.95,ThreeFourthRoomLength-50>
     
        }
          
//Sasuris Torso
        sphere{ 
        <0,0,0>30
        scale <0,2,0>
        rotate <-15,0,0>
        translate <HalfRoomWidth,SeatedEyeHeight*1.3,ThreeFourthRoomLength-15>
        }
        
        sphere { 
        <0,0,0>10
        translate <HalfRoomWidth-10,SeatedEyeHeight-20,ThreeFourthRoomLength-10>
        }

        sphere { 
        <0,0,0>10
        translate <HalfRoomWidth+10,SeatedEyeHeight-20,ThreeFourthRoomLength-10>
        }
        
        torus {
        20  // outer radius
        10  // inner radius
        scale <1.15,2,1>
        rotate <-110,0,0>
        translate <HalfRoomWidth,SeatedEyeHeight*1.55,ThreeFourthRoomLength-25>
        }
        
        torus {
        25  // outer radius
        10  // inner radius
        scale <1,3,0.9>
        rotate <-20,0,0>
        translate <HalfRoomWidth,SeatedEyeHeight*1.45,ThreeFourthRoomLength-20>
        }
                    
//Sasuris Legs     
     
        //Sasuris Thighs
      
            sphere{ 
        <0,0,0>30
        scale <.45,.45,1.25>
        rotate <0,10,0>
        translate <HalfRoomWidth-17,SeatedEyeHeight-25,ThreeFourthRoomLength-40>
        }
        
            sphere{ 
        <0,0,0>30
        scale <.45,.45,1.25>
        rotate <0,-10,0>
        translate <HalfRoomWidth+17,SeatedEyeHeight-25,ThreeFourthRoomLength-40>
       }
     
        //Sasuris knees
        
         sphere { 
        <0,0,0>5
        translate <HalfRoomWidth-23,SeatedEyeHeight-25,ThreeFourthRoomLength-80>
        }
        
         sphere { 
        <0,0,0>5
        translate <HalfRoomWidth+23,SeatedEyeHeight-25,ThreeFourthRoomLength-80>
        }
        
        // Sasuris Calves
        
           sphere{ 
        <0,0,0>30
        scale <.25,.25,1.25>
        rotate <90,0,0>
        translate <HalfRoomWidth-25,SeatedEyeHeight-60,ThreeFourthRoomLength-80>
        }
        
            sphere{ 
        <0,0,0>30
        scale <.25,.25,1.25>
        rotate <90,0,0>
        translate <HalfRoomWidth+25,SeatedEyeHeight-60,ThreeFourthRoomLength-80>
        }
        
            sphere{ 
        <0,0,0>30
        scale <.25,.30,.75>
        rotate <90,0,0>
        translate <HalfRoomWidth-25,SeatedEyeHeight-60,ThreeFourthRoomLength-78>
        }
        
            sphere{ 
        <0,0,0>30
        scale <.25,.30,.75>
        rotate <90,0,0>
        translate <HalfRoomWidth+25,SeatedEyeHeight-60,ThreeFourthRoomLength-78>
        } 
         
//Sasuris Arms

           sphere{ 
        <0,0,0>30
        scale <.30,.25,1>
        rotate <90,+15,-90>
        translate <HalfRoomWidth-56,SeatedEyeHeight+68,ThreeFourthRoomLength-35>
        }
        
            sphere{ 
        <0,0,0>30
        scale <.30,.25,1>
        rotate <90,-15,90>
        translate <HalfRoomWidth+56,SeatedEyeHeight+68,ThreeFourthRoomLength-35>
        }
        
         sphere { 
        <0,0,0>10
        translate <HalfRoomWidth-28,SeatedEyeHeight+68,ThreeFourthRoomLength-33>
        }
        
         sphere { 
        <0,0,0>10
        translate <HalfRoomWidth+28,SeatedEyeHeight+68,ThreeFourthRoomLength-33>
        } 
         
//Sasuris elbows and down 
         
        sphere { 
        <0,0,0>6
        translate <HalfRoomWidth-84,SeatedEyeHeight+65,ThreeFourthRoomLength-37>
        }
        
         sphere { 
        <0,0,0>6
        translate <HalfRoomWidth+84,SeatedEyeHeight+65,ThreeFourthRoomLength-37>
        }
        
         sphere{ 
        <0,0,0>30
        scale <.20,.25,1>
        rotate <-45,-25,-10>
        translate <HalfRoomWidth-84,SeatedEyeHeight+43,ThreeFourthRoomLength-60>
        }
        
            sphere{ 
        <0,0,0>30
        scale <.20,.25,1>
        rotate <-45,25,+10>
        translate <HalfRoomWidth+84,SeatedEyeHeight+43,ThreeFourthRoomLength-60>
        }
        
        
        }; 
        
        


#declare chain = union {
       #declare Index=0;
       #while (Index<3)
       torus{ 2 
       1
       scale 1
       rotate <90,0,0>
       translate <HalfRoomWidth-200,SeatedEyeHeight+50 + Index * 75,ThreeFourthRoomLength-50>
       }
       #declare Index = Index+.05;       
       #end
       } 
       
object{ chain
        rotate <0,0,45>
         }

object{ chain
        translate <HalfRoomWidth,SeatedEyeHeight,ThreeFourthRoomLength>
        }
      


//Original body        
object {
             body2
            translate <0,20,-40>
            texture{
            pigment{
            image_map{jpeg "WoodenPuppet2.jpg" 
            }scale 500 
           }
          }
         }
//Body #1            
object {
             body
            translate <-200,20,-40>
            texture{
            pigment{
            image_map{jpeg "WoodenPuppet.jpg" 
            } 
           }
          }
         }
            
//Body #2            
object {
             body
            translate <200,20,-40>
            texture{
            pigment{
            image_map{jpeg "WoodenPuppet.jpg" 
            } 
           }
          }
         }  
            
sphere{ <0,0,0> 1
            scale <50,0,50>
            translate<HalfRoomWidth-200,1,ThreeFourthRoomLength-200>
            texture{
            pigment{
            image_map{jpeg "WaterPuddle.jpg"
            }scale 20
            turbulence <.2,.2,.4>
}}}

box{ <2000,1,2000>1
    translate <0,0,-100>
    texture{
    pigment{
    image_map{jpeg "ConcreteFloor.jpg" }
    rotate <90,0,0>
    scale 700
   }
  }  }                      
        
//box{ <50,50,50>                               
             
/*torus {
        20  // outer radius
        10  // inner radius
        scale <1.15,2.5,1>
        rotate <-110,0,0>
        translate <HalfRoomWidth,SeatedEyeHeight*1.75,ThreeFourthRoomLength-25>
        texture{
        pigment{
        rgb<0,1,1>
        }}}
        
torus {
        25  // outer radius
        10  // inner radius
        scale <1,3,0.9>
        rotate <-15,0,0>
        translate <HalfRoomWidth,SeatedEyeHeight*1.65,ThreeFourthRoomLength-20>
        texture{
        pigment{
        rgb<0,1,1>
        }}}*/        
          


              
/*box{ 
        <-21,-30,-30> //near lower left corner
        <30,-.2,20> //far upperright corner
        //translate<0,80,0>
        translate <HalfRoomWidth-5,SeatedEyeHeight*1.7,ThreeFourthRoomLength-10>
        scale .9
        texture{
        pigment{
        rgb<0,1,1>
        }}}*/
        
           