
background{ rgb<1,1,1> }
camera{
    location <0,7,-10>
    look_at <0,0,0>
    }
    
light_source{
            <0,0,-5>
            rgb<1,1,1>
}
light_source{
            <0,20,-10>
            rgb <1,1,1>
}

#declare Leaf1 = 

mesh{
        triangle{
                <0,0,0>
                <2,4,0>
                <2,3,-1>
                }
                
        triangle{
                <0,0,0>
                <2,4,0>
                <2,3,1>
                }
                
        triangle{
                <6,3,0>
                <2,4,0>
                <2,3,1>
                }
                
        triangle{
                <6,3,0>
                <2,4,0>
                <2,3,-1>
                }
                
        texture{
            pigment{
                image_map{ jpeg "LeafTexture.jpg"
                }
              }
            }
            }
             
union{ 
    #declare index = 0;
    #while (index < 360)
        object{
            Leaf1
            rotate <0,index,0>
       }
       #declare index = index +50;
       #end 
       texture{
            pigment{
                rgb<.3,.6,.35>
                }
              }
            }
            
#declare Leaf2 = 

mesh{ 
        triangle{
                <0,0,0>
                <1,2,0,>
                <1,2,-1,>
                }
        triangle{
                <0,0,0>
                <1,2,0>
                <1,2,1>
                }
        triangle{
                <3,2,0,>
                <1,2,0>
                <1,2,-1>
                }
        triangle{
                <3,2,0>
                <1,2,0>
                <1,2,1>
                }
        
        texture{
            pigment{
                image_map{ jpeg "LeafTexture2.jpg"
                }
               }
              }
              
             translate<0,2,0>
             
             }
              
              
              
union{
    #declare index = 0;
    #while ( index < 360)
        object{ 
            Leaf2
            rotate <0,index,0>
            }
        #declare index = index+50;
        #end
        }
        

               
            

       