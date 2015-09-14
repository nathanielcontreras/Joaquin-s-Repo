background { rgb<0,1,1> }
camera { location <5,5,-5>
look_at <0,0,0> }
light_source { <6,6,-8>
                rgb<1,1,1> }
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
                       
sphere{<0,0,0>2
        texture{SolidBrown
        } 
       }
                                 
