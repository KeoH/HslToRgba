/*
	Modulo para obtener colores en RGB usables en Bennu, pero dandole valores HSL (Hue, Saturation, Lightness)

	Autor: Francisco Manzano (KeoH)
	email: keoh77@gmail.com
	
	Version = 0.3
	
*/

import "mod_map";
import "mod_math";

function hsl(int hue, float saturation, float lightness)

private
	int contador;
	float h2;
	float ex;
	float ce;
	float em;
	
	int t;
	float t2;
	
	float r, g, b;
	byte r2, g2, b2;
end

begin

	if(hue<0) 
		return rgb(0,0,0); 
	end

	if(hue >= 360)
		contador = hue / 360.0;
		hue = hue - (contador*360);
	end
	if(saturation<0) saturation = saturation*-1; end
	
	if(saturation > 1.0)
		saturation=1.0;
	end
	if(lightness<0) lightness = lightness*-1; end
	
	if(lightness > 1.0)
		lightness=1.0;
	end

	h2 = hue / 60.0;
	t = h2 / 2;
	
	t2 = (h2 / 2.0) - t;
	
	ce = (1 - abs(2*lightness - 1))*saturation;	
	ex = ce * (1-(abs(t2- 1)));
	em = lightness - 0.5 * ce;

	if(h2>=0.0 and h2<1.0)
		r = ce + em;
		g = ex + em;
		b = 0.0 + em;
	end
	
	if(h2>=1.0 and h2<2.0)
		r = ex + em;
		g = ce + em;
		b = 0.0 + em;		
	end
	
	if(h2>=2.0 and h2<3.0)
		r = 0.0 + em;
		g = ce + em;
		b = ex + em;		
	end
	
	if(h2>=3.0 and h2<4.0)
		r = 0.0 + em;
		g = ex + em;
		b = ce + em;		
	end
	
	if(h2>=4.0 and h2<5.0)
		r = ex + em;
		g = 0.0 + em;
		b = ce + em;		
	end
	
	if(h2>=5.0 and h2<6.0)
		r = ce + em;
		g = 0.0 + em;
		b = ex + em;		
	end
	
	r2 = r * 255;
	g2 = g * 255;
	b2 = b * 255;
	
	return rgb(r2,g2,b2);
	
end

function hsla(int hue, float saturation, float lightness, byte transparent)


private
	int contador;
	int h2;
	float ex;
	float ce;
	float em;
	
	int t;
	float t2;
	
	float r, g, b;
	byte r2, g2, b2;
end

begin

	if(hue<0) 
		return rgb(0,0,0); 
	end

	if(hue >= 360)
		contador = hue / 360.0;
		hue = hue - (contador*360);
	end
	if(saturation<0) saturation = saturation*-1; end
	if(saturation > 1.0)
		saturation=1.0;
	end
	if(lightness<0) lightness = lightness*-1; end
	if(lightness > 1.0)
		lightness=1.0;
	end

	h2 = hue / 60.0;

	t = h2 / 2;
	
	t2 = (h2 / 2.0) - t;
	
	ce = (1 - abs(2*lightness - 1))*saturation;	
	ex = ce * (1-(abs(t2- 1)));
	em = lightness - 0.5 * ce;
	
	if(h2>=0.0 and h2<1.0)
		r = ce + em;
		g = ex + em;
		b = 0.0 + em;
	end
	
	if(h2>=1.0 and h2<2.0)
		r = ex + em;
		g = ce + em;
		b = 0.0 + em;		
	end
	
	if(h2>=2.0 and h2<3.0)
		r = 0.0 + em;
		g = ce + em;
		b = ex + em;		
	end
	
	if(h2>=3.0 and h2<4.0)
		r = 0.0 + em;
		g = ex + em;
		b = ce + em;		
	end
	
	if(h2>=4.0 and h2<5.0)
		r = ex + em;
		g = 0.0 + em;
		b = ce + em;		
	end
	
	if(h2>=5.0 and h2<6.0)
		r = ce + em;
		g = 0.0 + em;
		b = ex + em;		
	end
	
	r2 = r * 255;
	g2 = g * 255;
	b2 = b * 255;
	
	return rgba(r2,g2,b2,transparent);
end