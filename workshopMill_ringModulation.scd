s.boot

//em uma linha
{SinOsc.ar(freq:MouseX.kr(200, 1000), mul:SinOsc.ar(MouseY.kr(1, 50)))!2}.play

//mais organizado, dentro de uma função
(
{
	var osc1, osc2, modAnel;
	var posX = MouseX.kr(minval:200, maxval:1000);
	var posY = MouseY.kr(minval:1, maxval:50);

	// osc1 = Pulse.ar(freq:posX);
	osc1 = SinOsc.ar(freq:posX);
	osc2 = SinOsc.ar(freq:posY);

	modAnel = osc1 * osc2;

	Pan2.ar(in:modAnel);
}.play
)