include "rad_def.inc"
background { rgb<0,1,1> }
camera { location <-50,50,-50>
look_at <0,0,0> }
light_source { <-50,50,-50>
                rgb<1,1,1>
                 } 
global_settings{
    radiosity{
        Rad_Settings ( Radiosity_Default, off, off )
         //Type, normal?, media? 
         }}
#declare SolidRed = texture{
                    pigment{
                    rgb<1,0,0>
                    }
                   }
#declare SolidGreen = texture{
                      pigment{
                      rgb<0,1,0>
                      }
                     }
#declare SolidYellow = texture{
                       pigment{
                       rgb<1,1,0>
                       }
                      }
#declare SolidBlue = texture{
                     pigment{
                     rgb<0,0,1>
                     }
                    }
#declare SolidBrown = texture {
                        pigment {
                        rgb <.59607843,.46274509,.36470588>
                        }
                        }
#declare SolidGold = texture{
                     pigment{
                     rgb<.6,.65,.3>
                     }
                    }
#declare White = texture{
                    pigment{
                    rgb<1,1,1>
                    }}
                       
sphere{  <0,0,0> 2
        texture{White
        }
        translate <-45,45,-45>
        normal{
        bumps
        scale .8
        }
        finish {
           // ambient 0
           // specular .5
            diffuse .7
            } 
       } 
       
box{
            <-100,100,-100>
            <0,0,0>
           texture{
           pigment{
                brick
                color <0,0,0> 
                color <0,0,1>
                scale 1
                } 
          
           }
           } 
                                 
