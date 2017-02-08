return [[
	extern number time;
	vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 pixel_coords) {
	    float v = 0.0;
	    float PI = 3.1415926535897932384626433832795;

	    vec2 c = texture_coords * pixel_coords - pixel_coords/50;
	    v += sin((c.x+time));
	    v += sin((c.y+time)/2.0);
	    v += sin((c.x+c.y+time)/2.0);
	    c += pixel_coords/2.0 * vec2(sin(time/3.0), cos(time/2.0));
	    v += sin(sqrt(c.x*c.x+c.y*c.y+1.0)+time);
	    v = v/2.0;

	    vec3 col = vec3(sin(PI*v)-.8, sin(PI*v)-.7, sin(PI*v)-.6);

	    return vec4(col*.5 + .5, 1);
	    
	}
    ]]