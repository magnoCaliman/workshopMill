//bem vindos ao SuperCollider
//command/control + enter -> avalia o código
//command/control + . -> interrompe o som

s.boot //liga o servidor. sem isso, nada funciona!

{LFSaw.ar(LFTri.kr(XLine.kr(1, 500, 10)).range(MouseX.kr(1, 100), MouseY.kr(1, 666)), mul:0.2)!2}.play

{}.play //tudo aqui dentro, vai tocar

//osciladores, funções geradoras de som
SinOsc.ar()
LFSaw.ar()
LFTri.ar()
LFPulse.ar()

//funções recebem argumentos dentro dos parênteses
//argumentos são números que controlam características
//dos osciladores, como frequência e amplitude
{SinOsc.ar(freq:300, mul:0.5)}.play //mul = amplitude, volume

//agora em dois canais
{SinOsc.ar(freq:300, mul:0.5)!2}.play

//argumentos podem ser substituídos por outras funções!
{LFSaw.ar(freq:MouseX.kr(100, 500), mul:0.2)!2}.play
{LFPulse.ar(freq:300, mul:LFTri.ar(freq:1, mul:0.2)!2)}.play

//o output de osciladores, no fundo, é apenas uma lista de números.
{LFTri.ar(freq:1, mul:0.2)}.plot(2)
{LFSaw.ar(freq:1, mul:1)}.plot(2)
{SinOsc.ar(freq:1, mul:0.5, add:0.5)}.plot(2)

//"ruído" de dados...
{LFNoise0.kr(freq:10)}.plot(1)

//que pode ser escalonado
{LFNoise0.kr(freq:10, mul:100, add:400)}.plot(1)

//e usado como argumento
{SinOsc.ar(freq:LFNoise0.kr(freq:10, mul:100, add:400), mul: 0.5)!2}.play;

////////////////

{WhiteNoise.ar(mul:Line.kr(start:1, end:0, dur:5))!2}.play

{LFPulse.ar(freq:Line.kr(start:100, end:0, dur:0.2), mul:0.2)!2}.play
{LFSaw.ar(freq:Line.kr(start:500, end:0, dur:0.2), mul:0.2)!2}.play
{WhiteNoise.ar(mul:Line.kr(start:1, end:0, dur:0.05))!2}.play

///////////////


rrand(0, 10)
[1,2,3,4,5].choose

{LFSaw.ar(freq:rrand(200, 800), mul:0.2)!2}.play

//englobar em parênteses, permite avaliar várias linhas ao mesmo tempo
(
{SinOsc.ar(freq:Line.kr(start:100, end:rrand(800, 1000), dur:10), mul:0.2)!2}.play;
{SinOsc.ar(freq:Line.kr(start:100, end:rrand(800, 1000), dur:10), mul:0.2)!2	}.play;
{SinOsc.ar(freq:Line.kr(start:100, end:rrand(800, 1000), dur:10), mul:0.2)!2}.play;
{SinOsc.ar(freq:Line.kr(start:100, end:rrand(800, 1000), dur:10), mul:0.2)!2}.play;
{SinOsc.ar(freq:Line.kr(start:100, end:rrand(800, 1000), dur:10), mul:0.2)!2}.play;
{SinOsc.ar(freq:Line.kr(start:100, end:rrand(800, 1000), dur:10), mul:0.2)!2}.play;
)

//////////

a = {SinOsc.ar(freq:rrand(300, 500), mul:0.2)}.play

b = {SinOsc.ar(freq:rrand(300, 500), mul:0.2)}.play

a.free
b.free

//

~oscilador01 = {WhiteNoise.ar(0.2)}.play

~oscilador02 = {LFSaw.ar(freq:SinOsc.ar(freq:2, mul:100, add:300), mul:0.2)}.play

~oscilador01.free
~oscilador02.free

s.record
s.stopRecording

