#version 410

uniform vec3 u_colour;			// colour as a 3D vector (r,g,b)
uniform vec2 u_screenSize;  	// screen dimensions in pixels
vec2 o_screen = u_screenSize;

layout(location = 0) out vec4 o_colour;	// output to colour buffer

void main() {
   vec2 p = gl_FragCoord.xy / (o_screen.x, o_screen.x);  // scale p into range (0,0) to (1,1)
   vec2 v = abs(p - vec2(0.5, 0.5));
	float d = max(v.x+v.y, v.y+v.x);  
   //float d = distance(p, vec2(0.5, 0.5));     // calculate distance to midpoint
  
   if (d < 0.2) {
      o_colour = vec4(u_colour, 1);
   }
   else {
      o_colour = vec4(0,0,0,1); // BLACK
   }
}