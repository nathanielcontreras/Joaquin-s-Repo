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
#declare TopOfSasuri = <HalfRoomWidth,SeatedEyeHeight*3.8,RoomLength-250>;
#declare ChainCameraAngleLeft = <100,SeatedEyeHeight*3.5,RoomLength-200>;
#declare PostionToLookAtDrain = <HalfRoomWidth-250,SeatedEyeHeight,575>;

#declare Origin = <0,0,0>;
#declare FullImage = <HalfRoomWidth,SeatedEyeHeight*3,RoomLength>;
#declare HeadOfSasuri = <HalfRoomWidth,SeatedEyeHeight*2,ThreeFourthRoomLength>;
#declare FaceOfSasuri = <HalfRoomWidth,SeatedEyeHeight*1.9,ThreeFourthRoomLength-50>;
#declare Puddle = <HalfRoomWidth-200,1,ThreeFourthRoomLength-200>; 
#declare OverHeadLight = <HalfRoomWidth-150,SeatedEyeHeight*3,ThreeFourthRoomLength-150>;
#declare Drain = <-129,-40,ThreeFourthRoomLength-200>;


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
            location AngleFromTopRight
          //  location AngleFromTopLeft 
          //  location TopFrontOfRoom
           // location CloseFrontOfRoom
          //  location TopAngleCloseFrontOfRoom
           // location BackTopLeftCorner
           // location BackTopRightCorner
          //  location RightSideOfSasuri
           // location LeftSideOfSasuri
         //   location SasuriFace
           // location SasuriFaceAngleOne
          //  location TopOfSasuri
           // location ChainCameraAngleLeft
          //  location PostionToLookAtDrain
             
          //  look_at FullImage
           // look_at Origin
            look_at HeadOfSasuri
           // look_at FaceOfSasuri
           //look_at Puddle
           //look_at OverHeadLight
          //  look_at Drain
}    

/*light_source{
            <HalfRoomWidth,SeatedEyeHeight,HalfRoomLength>
            rgb NoColorForLight
            shadowless
            }  
light_source{
            <HalfRoomWidth,SeatedEyeHeight*3.8,RoomLength>
            rgb NoColorForLight
            shadowless
            } 
light_source{
            <ThreeFourthRoomWidth,SeatedEyeHeight*2,ThreeFourthRoomLength>
            rgb NoColorForLight
            shadowless
            } 
light_source{
            <OneFourthRoomWidth,SeatedEyeHeight*2,ThreeFourthRoomLength>
            rgb NoColorForLight
            shadowless
            } */
light_source{
            <HalfRoomWidth,SeatedEyeHeight*3,ThreeFourthRoomLength-120> 
            rgb NoColorForLight*5
            shadowless
            spotlight
            point_at <HalfRoomWidth,0,ThreeFourthRoomLength-120>
            radius 15
            falloff 70
            }
             


object{     
        SasurisDen
        
        texture{BrickPigment}
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
                }
                }               
};
object { Chair 
            scale <2.5,2,2> 
            rotate <0,180,0>
            translate <525,0,800> 
            texture{
            pigment{
            image_map{jpeg "Concrete.jpg"} 
            scale 50 
            }
            }
}

#declare Torso = union{
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
}

#declare Torso2 = union {
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
}        




#declare RightArm = union{

            sphere{ 
            <0,0,0>30
            scale <.30,.25,1>
            rotate <90,+15,-90>
            translate <HalfRoomWidth-56,SeatedEyeHeight+68,ThreeFourthRoomLength-35>
        }
        
           
        
            sphere { 
            <0,0,0>10
            translate <HalfRoomWidth-28,SeatedEyeHeight+68,ThreeFourthRoomLength-33>
        }
        
            
        
             sphere { 
            <0,0,0>6
            translate <HalfRoomWidth-84,SeatedEyeHeight+65,ThreeFourthRoomLength-37>
        }
                   
            sphere{ 
            <0,0,0>30
            scale <.20,.25,1>
            rotate <-45,-25,-10>
            translate <HalfRoomWidth-84,SeatedEyeHeight+43,ThreeFourthRoomLength-60>
        }
}

#declare LeftArm = union{
        
        sphere{ 
            <0,0,0>30
            scale <.30,.25,1>
            rotate <90,-15,90>
            translate <HalfRoomWidth+56,SeatedEyeHeight+68,ThreeFourthRoomLength-35>
        }
        
         sphere { 
            <0,0,0>10
            translate <HalfRoomWidth+28,SeatedEyeHeight+68,ThreeFourthRoomLength-33>
        } 
        
        sphere { 
            <0,0,0>6
            translate <HalfRoomWidth+84,SeatedEyeHeight+65,ThreeFourthRoomLength-37>
        }
        
            sphere{ 
            <0,0,0>30
            scale <.20,.25,1>
            rotate <-45,25,+10>
            translate <HalfRoomWidth+84,SeatedEyeHeight+43,ThreeFourthRoomLength-60>
        }
}            
   










#declare body = union { 

    //Sasuris Head
            sphere {
            <0,0,0>25 
            translate <HalfRoomWidth,SeatedEyeHeight*1.95,ThreeFourthRoomLength+10>
     
        }
          
    object{ Torso  
             translate <-HalfRoomWidth,-SeatedEyeHeight,-ThreeFourthRoomLength+15>
             rotate <30,0,0> 
             translate <HalfRoomWidth,SeatedEyeHeight,ThreeFourthRoomLength-15>
             
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
         
object { LeftArm 
          translate <-HalfRoomWidth-28,-SeatedEyeHeight-68,-ThreeFourthRoomLength+33>
          rotate <0,0,-30>
          translate <HalfRoomWidth+28,SeatedEyeHeight+60,ThreeFourthRoomLength+15>  
            }
            
object { RightArm
          translate <-HalfRoomWidth+28,-SeatedEyeHeight-68,-ThreeFourthRoomLength+33>
          rotate <0,0,30>
          translate <HalfRoomWidth-28, SeatedEyeHeight+60, ThreeFourthRoomLength+15> 
            }
  
}; 
        
 
 #declare body2 = union { 

    //Sasuris Head
            sphere {
            <0,0,0>25 
            translate <HalfRoomWidth,SeatedEyeHeight*1.95,ThreeFourthRoomLength-35>
     
        }
          
 object{ Torso2 
             /*translate <-HalfRoomWidth,-SeatedEyeHeight,-ThreeFourthRoomLength+15>
             rotate <60,0,0> 
             translate <HalfRoomWidth,SeatedEyeHeight,ThreeFourthRoomLength-15>*/ 
            }          
   
    //Sasuris Legs     
     
            //Sasuris Thighs
      
            sphere{ 
            <0,0,0>30
            scale <.45,.45,1.25>
            rotate <0,10,0>
            translate <HalfRoomWidth-17,SeatedEyeHeight-25,ThreeFourthRoomLength-25>
        }
        
            sphere{ 
            <0,0,0>30
            scale <.45,.45,1.25>
            rotate <0,-10,0>
            translate <HalfRoomWidth+17,SeatedEyeHeight-25,ThreeFourthRoomLength-25>
       }
     
    //Sasuris knees
        
            sphere { 
            <0,0,0>5
            translate <HalfRoomWidth-23,SeatedEyeHeight-25,ThreeFourthRoomLength-65>
        }
        
            sphere { 
            <0,0,0>5
            translate <HalfRoomWidth+23,SeatedEyeHeight-25,ThreeFourthRoomLength-65>
        }
        
    // Sasuris Calves
        
            sphere{ 
            <0,0,0>30
            scale <.25,.25,1.25>
            rotate <90,0,0>
            translate <HalfRoomWidth-25,SeatedEyeHeight-60,ThreeFourthRoomLength-65>
        }
        
            sphere{ 
            <0,0,0>30
            scale <.25,.25,1.25>
            rotate <90,0,0>
            translate <HalfRoomWidth+25,SeatedEyeHeight-60,ThreeFourthRoomLength-65>
        }
        
            sphere{ 
            <0,0,0>30
            scale <.25,.30,.75>
            rotate <90,0,0>
            translate <HalfRoomWidth-25,SeatedEyeHeight-60,ThreeFourthRoomLength-63>
        }
        
            sphere{ 
            <0,0,0>30
            scale <.25,.30,.75>
            rotate <90,0,0>
            translate <HalfRoomWidth+25,SeatedEyeHeight-60,ThreeFourthRoomLength-63>
        } 
         
    //Sasuris Arms

           sphere{ 
            <0,0,0>30
            scale <.30,.25,1>
            rotate <90,+15,-10>
            translate <HalfRoomWidth-40,SeatedEyeHeight*1.35,ThreeFourthRoomLength-20>
        }
        
            sphere{ 
            <0,0,0>30
            scale <.30,.25,1>
            rotate <90,-15,10>
            translate <HalfRoomWidth+40,SeatedEyeHeight*1.35,ThreeFourthRoomLength-20>
        }
        
            sphere { 
            <0,0,0>10
            translate <HalfRoomWidth-28,SeatedEyeHeight+68,ThreeFourthRoomLength-18>
        }
        
            sphere { 
            <0,0,0>10
            translate <HalfRoomWidth+28,SeatedEyeHeight+68,ThreeFourthRoomLength-18>
        } 
         
    //Sasuris elbows and down 
         
            sphere { 
            <0,0,0>6
            translate <HalfRoomWidth-45,SeatedEyeHeight+10,ThreeFourthRoomLength-20>
        }
        
            sphere { 
            <0,0,0>6
            translate <HalfRoomWidth+45,SeatedEyeHeight+10,ThreeFourthRoomLength-20>
       }
        
            sphere{ 
            <0,0,0>30
            scale <.20,.25,1>
            rotate <-15,-25,-10>
            translate <HalfRoomWidth-35,SeatedEyeHeight-5,ThreeFourthRoomLength-45>
        }
        
            sphere{ 
            <0,0,0>30
            scale <.20,.25,1>
            rotate <-15,25,+10>
            translate <HalfRoomWidth+35,SeatedEyeHeight-5,ThreeFourthRoomLength-50>
        }
};
        
       


#declare chain = union {
       #declare Index=0;
       #while (Index<3)
       torus{ 2 
       1
       scale 1
       rotate <90,0,0>
       translate <HalfRoomWidth-200,SeatedEyeHeight+50 + Index * 75,ThreeFourthRoomLength-150> }
       #declare Index = Index+.05;       
       #end
       texture{
       pigment{
       image_map{jpeg "ChromeForChain.jpg"}
             }
             }
}     

object{ chain
        translate <75,195,15>

}

object{ chain
        translate <75,195,60>

}

object{ chain
        translate <325,195,15>

}

object{ chain
        translate <325,195,60>

}
        


      


//Original body        
    object {
             body
            translate <0,20,-20>
            texture{
            pigment{
            image_map{jpeg "WoodenPuppet2.jpg" 
            }scale 500 
           }
          }
         }
//Body #1            
    object {
             body2
            translate <-200,20,-40>
            texture{
            uv_mapping
            pigment{
            image_map{jpeg "WoodenPuppet.jpg" 
            } 
           }
          }
         }
            
//Body #2            
    object {
             body2
            translate <200,20,-40>
            texture{
            uv_mapping 
            pigment{
            image_map{jpeg "WoodenPuppet.jpg" 
            }
            scale 1 
           }
          }
         }  

            
#declare WaterTexture =
            pigment{
            image_map{jpeg "WaterPuddle.jpg"}
            scale .5
            turbulence <.2,.2,.4>
}; 

#declare ClearPigment = 
            pigment{
            rgbt <.3,.3,.65,.7>
}; 
                        
                                              

sphere{ <0,0,0> 1
                         scale <75,0,75>
                         translate<HalfRoomWidth-200,1,ThreeFourthRoomLength-200>
                         interior{ 
                         ior 1.33 }
                         texture{
                            finish{ 
                            specular .2
                            roughness .05 
                            reflection{ 15 }
                         }
                         normal{ 
                         bumps .9 
                         scale <25,50,10> }
                         /*pigment{
                           gradient y
                           pigment_map{
                           [0 WaterTexture ]
                           [.5 ClearPigment ]  
                           }
                           ClearPigment 
                           scale 50 } */
                          }
}
                          
sphere{ <0,0,0> 1
                         scale <50,0,50>
                         translate<HalfRoomWidth-300,1,ThreeFourthRoomLength-200>
                         interior{ 
                         ior 1.33}
                         texture{
                            finish{ 
                            specular .2
                            roughness .05
                            reflection{ 15 } 
                         }
                         normal{ 
                         bumps .9 
                         scale <25,50,10> }
                     /*  pigment{
                         gradient y
                         pigment_map{
                         [0 WaterTexture ]
                         [.5 ClearPigment ] }
                         ClearPigment 
                         scale 50 } */
                         }
}





box{ <2000,1,2000>1
    translate <-100,0,-100>
    texture{
    pigment{
    image_map{jpeg "ConcreteFloor.jpg" }
    rotate <90,0,0>
    scale 700
    }
    }
}  
  
box{ <2000,1,2000>1
    translate <-100,430,-100>
    texture{
    pigment{
    image_map{jpeg "CeilingTexture.jpg" }
    rotate <90,0,0>
    scale 200
    }
    }
}
  
difference {
    box{ <300,20,75>1
            translate <HalfRoomWidth-150,SeatedEyeHeight*3,ThreeFourthRoomLength-150>
            texture{ 
            uv_mapping
            pigment{
            image_map{jpeg "RustMetalTexture.jpg" } 
            scale 5
            }
            }
          }
    box{ <290,25,75>
            <5,5,5>
            translate <HalfRoomWidth-150,SeatedEyeHeight*2.9,ThreeFourthRoomLength-150> 
            texture{
            pigment{ 
            image_map{jpeg "RustMetalTexture.jpg" }
             }
             }
           } 
}

cylinder{ <275,25,75>, <5,5,5>10                                              
            rotate <0,12,-3>
            translate <HalfRoomWidth-150,SeatedEyeHeight*3.02,ThreeFourthRoomLength-140>
            texture{
            
            pigment{
            rgb<1,1,1> 
             }
             finish{
            ambient 1 }
            }
}

cylinder{ <275,25,75>, <5,5,5>10                                              
            rotate <0,12,-3>
            translate <HalfRoomWidth-150,SeatedEyeHeight*3.02,ThreeFourthRoomLength-100>
            texture{
            pigment{
            rgb<1,1,1>
            }
            }
}     

        
                      
    //Drain        
        box{ <30,40,50>
           <25,100,160>                                                                     
          translate<-129,-40,ThreeFourthRoomLength-200>
          texture{
          pigment{
          rgb <0,0,0>
         }}}
       
       
    //Iron bars
        box{ <30,40,50>
           <25,100,60>
           translate <-128,-40,ThreeFourthRoomLength-201>
           texture{
           pigment{
           image_map{ jpeg "IronTexture.jpg" } scale 15
         }}} 
     
        box{ <30,40,50>
             <25,100,60>
             translate <-128,-40,ThreeFourthRoomLength-176>
          texture{
          pigment{
          image_map{ jpeg "IronTexture.jpg" }scale 15
          }}}
     
        box{ <30,40,50>
          <25,100,60>
          translate <-128,-40,ThreeFourthRoomLength-151>
          texture{
         pigment{
         image_map{ jpeg "IronTexture.jpg" } scale 15
         }}}  
         
        box{ <30,40,50>
             <25,100,60>
             translate <-128,-40,ThreeFourthRoomLength-126>
             texture{
             pigment{
            image_map{ jpeg "IronTexture.jpg" } scale 15
            }}}
     
        box{ <30,40,50>
             <25,100,60>
            translate <-128,-40,ThreeFourthRoomLength-101>
           texture{
           pigment{
          image_map{ jpeg "IronTexture.jpg" } scale 15
             }}}
             
         box{ <30,40,50>
              <125,10,160>
              translate <-125,-38,ThreeFourthRoomLength-201>
              texture{ 
              uv_mapping
              pigment{
              image_map{ jpeg "ConcreteFloor.jpg" }
              scale 1.65
             // turbulence 4
              
              }}}                            




             
