//MEASUREMENTS
#declare RoomWidth = 932;
#declare RoomLength = 1016;
#declare RoomHeight = 435;
#declare HalfRoomWidth = RoomWidth/2;
#declare HalfRoomLength = RoomLength/2;
#declare SeatedEyeHeight = 112;

#declare SasurisDen = box{
            <-100,0,-100>
            <RoomWidth+100,RoomHeight,RoomLength+100>
            }
//CAMERA SETTINGS            
#declare TopBackOfRoom = <HalfRoomWidth,SeatedEyeHeight*3,-100>;
#declare AngleFromTopRight = <RoomWidth,SeatedEyeHeight*3,40>;
#declare AngleFromTopLeft = <0,SeatedEyeHeight*3,40>;

#declare Origin = <0,0,0>;
#declare FullImage = <HalfRoomWidth,SeatedEyeHeight,RoomLength>;

//COLORS 
#declare NoColorForLight = <1,1,1>;
#declare FadedBlueForLight = <.5,.5,1>;
#declare FadedBlue = pigment{
                     rgb<.5,.5,1>
};
#declare NoColor = pigment{
                   rgb<1,1,1>
};
#declare SolidRed = pigment{
                    rgb<1,0,0>
};

camera{                     
          //  location AngleFromTopRight
         //   location AngleFromTopLeft 
            location TopBackOfRoom
   
            look_at FullImage
          //  look_at Origin
}
    
light_source{
            <HalfRoomWidth,SeatedEyeHeight,HalfRoomLength>
            rgb NoColorForLight
            }
object{
        SasurisDen
        
        texture{NoColor 
}
}
              
box{  <0,0,0>
     <RoomWidth,RoomHeight,RoomLength>
     
     scale .07
     translate <420,0,725>
     texture{NoColor
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
            
#declare ChairLeg = 
        cylinder {
            <0,0,0>
            <0,ChairSeatHeight,0>
            1 }
#declare Chair = 
        union {
            object { ChairBack } 
            object { ChairSeat }
            #declare index = 0;
                texture {
                pigment {
                 rgb <1,1,1>
                 }}
               };
object { Chair 
            scale 2 
            rotate <0,180,0>
            translate <500,0,800> } 
                                   
box { <500,ChairSeatHeight,800>
      <505,ChairSeatHeight+60,805>
       translate <-50,-30,-50>
      texture{
        pigment{
         rgb<1,1,1> 
         }
       }
     }                               

box{  <0,500,800>
     <RoomWidth,RoomHeight,RoomLength>
     scale .07
     translate <360,-20,700>
     texture{
     pigment{
     rgb<1,1,1>
     }}}    
     
box{  <0,500,800>
     <RoomWidth,RoomHeight,RoomLength>
     scale .07
     translate <470,-20,700>
     texture{
     pigment{
     rgb<1,1,1>
     }}}  
     
box{  <0,500,950>
     <RoomWidth,RoomHeight,RoomLength>
     scale .07
     rotate <0,90,0>
     translate <385,-20,725>
     texture{
     pigment{
     rgb<1,1,1>
     }}} 
     
            
box{  <0,500,950>
     <RoomWidth,RoomHeight,RoomLength>
     scale .07
     rotate <0,90,0>
     translate <385,-20,880>
     texture{
     pigment{
     rgb<1,1,1>
     }}} 
     
            