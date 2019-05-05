s.boot

~fita = Buffer.loadDialog
~fita
~fita.play
~fita.plot
~fita.numChannels
~fita.bufnum
~fita.numFrames

(
{
	var taxaRepeticao = MouseY.kr(1, 30);
	var posLeitura = MouseX.kr(0, ~fita.numFrames);

	var sinal = PlayBuf.ar(
		numChannels:~fita.numChannels,
		bufnum:~fita.bufnum,
		trigger: Impulse.ar(freq:taxaRepeticao),
		startPos: posLeitura
	);

	Pan2.ar(sinal * 0.8)
}.play
)