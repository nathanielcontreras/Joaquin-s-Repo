background { rgb <1,1,1> }

camera {
	location <30,100,-35>
	look_at <0,0,0>
}

/*media {
	scattering { 2, rgb 0.01 }
	intervals 2
	samples 50
	method 3
}      */

light_source {
	<0, 15, 0>
	color rgb 1
	media_interaction off
}

light_source {
	<1,115,90>
	color rgb <1,1,.25> * 20
	spotlight
	point_at <0,0,-5>
	radius 10
	falloff 6
	media_attenuation on
}

#declare Window = prism {
	linear_sweep
	linear_spline
	-20, 20
	6
	<0, 15>
	<2.5, 10>
	<2.5, 0>
	<-2.5, 0>
	<-2.5, 10>
	<0, 15>
}

#declare Step = prism {
	linear_sweep
	linear_spline
	0, 1
	7
	#declare Index = 0;
	#while (Index <= 360)
		<cos(radians(Index)),
		sin (radians(Index))>
		#declare Index = Index + 360/6;
	#end
	rotate y*360/12
}

object {
	Step
	scale <20,1,20>
	pigment { rgb .42 }
}
object {
	Step
	scale <16,1,16>
	translate <0,1,0>
	pigment { rgb .42 }
}
object {
	Step
	scale <7,1,7>
	translate <0,2,0>
	pigment { rgb .7 }
}

#declare Room = prism {
	linear_sweep
	linear_spline
	0, 1
	9
	#declare Index = 0;
	#while (Index <= 360)
		<cos(radians(Index)),
		sin (radians(Index))>
		#declare Index = Index + 360/8;
	#end
	rotate y*360/16
}

difference {
	object {
		Room
		scale < 62, 122, 62 >
		translate < 0, -1, 0 >
		pigment { rgb .42 }
	}
	object {
		Room 
		scale < 60, 120, 60 >
		pigment { rgb .42 }
	}
	object {
		Window
		rotate x * -90
		translate <0,70,60>
	}
	hollow
}





