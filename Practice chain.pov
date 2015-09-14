background {rgb <0,1,1> }
camera { location <5,5,-5>
look_at <0,0,0>
}
light_source { <4,3,-2>
rgb<1,0,1> 
}
#declare LinkRadius = .3;
#declare HalfTorus = difference {
torus { 3 //outerradius
        1 //innerradius
        translate<0,0,0>
                texture{
                    pigment{
                    rgb<1,1,0>
                    }
                  }
                }
              }