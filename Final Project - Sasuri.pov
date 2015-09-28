#declare RoomWidth = 932;
#declare RoomLength = 1016;
#declare RoomHeight = 435;
#declare HalfRoomWidth = RoomWidth/2;
#declare HalfRoomLength = RoomLength/2;
#declare SeatedEyeHeight = 112;

#declare CATlab = box{
            <0,0,0>
            <RoomWidth,RoomHeight,RoomLength>
            }
/*
#declare Windows = box{
            <,,>
            <,,>
            }*/
            
#declare DoorWidth = 91;
#declare DoorHeight = 236;
#declare DoorDepth = 16;
#declare DoorDistanceFromRightWall = 188;
#declare DoorwayCutout = box{
        <0,0,-DoorDepth/2>
        <DoorWidth,DoorHeight,DoorDepth/2>
        translate <RoomWidth-DoorDistanceFromRightWall,0,RoomLength> };

#declare MyLocation = <HalfRoomWidth,SeatedEyeHeight,40>;

camera{ 
       //location<600,SeatedEyeHeight*3,800>        
      location <HalfRoomWidth*2,SeatedEyeHeight*3,40>
    //location MyLocation
   //look_at <500,41,800>
    look_at <HalfRoomWidth,SeatedEyeHeight,RoomLength>
  //  look_at <0,0,0>
    }
    
light_source{
            <HalfRoomWidth,SeatedEyeHeight,HalfRoomLength>
            rgb<1,1,1>
            }
object{
        CATlab
        texture{
            pigment{
                rgb<1,1,1>
                }
               }
              }
              
box{  <0,0,0>
     <RoomWidth,RoomHeight,RoomLength>
     scale .07
     translate <420,0,725>
     texture{
     pigment{
     rgb<1,0,0>
     }}}

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
                 rgb <1,0,0>
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
         rgb<1,0,0> 
         }
       }
     }                               

box{  <0,500,800>
     <RoomWidth,RoomHeight,RoomLength>
     scale .07
     translate <360,-20,725>
     texture{
     pigment{
     rgb<1,0,0>
     }}}    
     
box{  <0,500,800>
     <RoomWidth,RoomHeight,RoomLength>
     scale .07
     translate <470,-20,725>
     texture{
     pigment{
     rgb<1,0,0>
     }}}  
     
box{  <0,500,950>
     <RoomWidth,RoomHeight,RoomLength>
     scale .07
     rotate <0,90,0>
     translate <385,-20,725>
     texture{
     pigment{
     rgb<1,0,0>
     }}} 
     
sphere { <-5.00, 0.75, -2.0>, 0.75 
            translate < 400,0,800 >
            texture{ 
            pigment{
                rgb <1,0,0> 
                }
              }
            }
            
box{  <0,500,950>
     <RoomWidth,RoomHeight,RoomLength>
     scale .07
     rotate <0,90,0>
     translate <385,-20,880>
     texture{
     pigment{
     rgb<1,0,0>
     }}}        