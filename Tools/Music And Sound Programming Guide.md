# Atari 2600 Music And Sound Programming Guide

v1.02 2-19-2003

by [Paul Slocum](http://www.qotile.net)

Please e-mail comments/corrections to: paul_slocum at mindspring dot com

Frequency values from Eckhard Strolberg's [frequency and waveform guide](http://buerger.metropolis.de/estolberg)

## Table Of Contents

1. Introduction
2. TIA Sound Overview
3. Sounds/Distortions
4. Drums
5. Effects
6. Musical Notes
7. Other Tips

## Introduction

It is difficult to do music on the Atari 2600 due to the limited pitch and two voices, but I've discovered some tricks to produce some pretty good music. This document covers most of what I know.

The intended audience is Atari 2600 programmers of any level and musicians who wish to write music for the 2600. You don't need to know programming to write music for the 2600 (although it helps). My website has a 2600 music kit you can download with a 2600 music driver and detailed instructions on how to write your own music data files for it along with some examples. If you're new to 2600 programming, you'll probably want to take a look at my music kit before jumping into this guide.

Although this guide should be useful with any 2600 music driver, it is written with my own music driver in mind. It's a pretty good driver and uses very little RAM, a reasonable amount of ROM (typically 600-2000 bytes including music data), and few processor cycles per frame at around 400-500 cycles. My driver uses single byte note codes that combine distortion type and pitch, and in this document these codes are enclosed in brackets []. Full codes are also preceded by a percent sign % since I usually code them in binary and the percent sign indicates a binary number in an assembler source file: [%10111100] Thanks to Thomas Jentzch for helping optimize my driver!

You should know that it's *much* easier to write your own music for the 2600 than it is to port a song to the 2600 and end up with something that sounds good. The pitch is so limited that often you will not be able to find notes that are reasonably in tune in the sound types you want, and this will lead to compromises. If you write your own music, you can write based on the notes you know that the Atari can play in-tune and what sounds best.

While the note tables later in this document will probably be enough for most people, you might want to get Eckhard's full 2600 frequency and waveform guide off his site listed above. His document lists the tuning of every note the Atari can produce except for a few that are just noise or too low to have any musical value.

If you get serious about 2600 music, the Synthcart is a good tool for composing on the 2600 as you can try out sounds and melodies in realtime. Information about the Synthcart can be found on my webpage.

## TIA Sound Overview

The TIA is the chip in the Atari 2600 that produces audio and video. The audio portion has two independent voices, each of which has a 4 bit volume control (16 values), 5 bit pitch (32 values), and a 4 bit control register which selects the type of sound you will hear. When writing software for the Atari, the standard labels for these registers are AUDV0 and AUDV1 for the volume registers, AUDF0 and AUDF1 for the pitch registers, and AUDC0 and AUDC1 for the control registers.  The 5 bit pitch is very limited and the frequency values are simply divided down from the system clock, so many of the pitch values are not in-tune with others.  Note that setting the pitch register to a lower value results in a higher pitch.

## Sounds/Distortions

The TIA has 16 settings for the sound control registers, but many are the same or very similar to others.  There are only 8 settings that I use regularly and I've given them descriptive names.  In my own music driver, I have a 3 bit code for each of these which I also list here. (my driver uses a code of 3 sound type bits followed by five pitch bits.)

```text
-------------------------------------------------------------------
      CODE
      FOR MY
 TIA  MUSIC
 CODE DRIVER NAME    DESCRIPTION
  1   110    Saw     sounds similar to a saw waveform
  3   111    Engine  many 2600 games use this for an engine sound
  4   000    Square  a high pitched square waveform
  6   001    Bass    fat bass sound
  7   010    Pitfall log sound in pitfall, low and buzzy
  8   011    Noise   white noise
 12   101    Lead    lower pitch square wave sound
 15   100    Buzz    atonal buzz, good for percussion
-------------------------------------------------------------------
```

The tonal sounds have different tunings, but the Bass and Pitfall have the same tuning, the Square and Lead have similar tuning, and Saw is a bit different from any of the others.

## Drums

Here are the basic drum sound type and pitch settings to get you started:

For a kick drum, use Buzz at pitch 30 [%10011110]
For a high hat, use Noise at pitch 0 [%01100000]
For a snare, use Noise around pitch 8 [%01101000] or Buzz around 6 [%10000110]

The snare pitch is flexible.  Adjust it to whatever sounds best for your song.

Beyond these basics, you'll want to experiment with different percussive sounds.  Buzz, Noise and sometimes Engine are great for percussion.

Generally you'll do the bass on one voice and the melody on the other, and in most cases I recommend putting the percussion on the bass voice.  If you just play the kick and snare for one step in the sequence then go back to bass, you usually won't notice that the bass is cutting out for a moment.

The high hat can be a bit more intrusive since you usually want to play it more often.  It often works to just play it on the up-beat (gives a techno feel).  However, my new music driver has an auto-high hat feature that plays it automatically (you don't have to put it in the music data) and it plays it for only 1/60th of a second so it is less intrusive on your sequence.  (For most songs, a step in the sequence is 3/60ths to 4/60ths of a second)

## Effects

Arpeggios:

Since there are only two voices on the Atari, it's difficult to play chords.  But you can use fast arpeggios to give the effect of playing chords on only one voice.  You just step through each note of the chord quickly which gives the essence of the chord.  Typically I do a note per step in my music driver.  I have tried running arpeggios at a note per frame (60 per second) but it sounds bad when it gets that fast.  You introduce 60Hz noise at that speed.

Echo:

An echo effect can sound really nice.  To get an echo, play notes and then repeat them again at a consistent delay and a bit quieter.  It's really nice for short simple in-game melodies (like when you finish a level).  Echo sounds best if you dedicate a voice to playing the echo, but obviously this limits you quite a bit.  An alternative is to only play short notes and figure out a timing scheme where the echos don't need to play at the same time as the foreground notes.  For example, only play notes on even beats and make the delay amount an odd number of beats.  Then you don't need to use both voices for the effect.

Phasing:

When you play the same note on both voices simultaneously you'll get interesting phasing effects.  Once you start playing a simultaneous note on both voices, the phasing will stay the same until you switch notes.  However, I've found that if you set the pitch on one voice to a random value for a few cycles and then set it back to the correct value, it will shift the phase.  This can create some neat effects.  Putting the auto high hat on the same channel will achieve this phase shifting effect.  You can also modify the driver to do this without the intrusion of the high-hat.  Just be aware that phasing can sometimes briefly cancel out the sound completely.

Portamento:

Portamento is the effect of sliding between notes when a voice is playing a melody.  You can do this in the music data and it sounds pretty good.  When you're playing a melody, right before you play the next note, do a quick ramp of 32nd notes up/down to the next note.

## Musical Notes

Generally to get a nice full sounding song, you're probably going to want to use the Bass sound combined with the Square and Lead or Saw to play the melodies.  I've developed three note sets that include in-tune notes for Bass, Square, Lead, and Saw and a few others.  Each set has advantanges and disadvantages.  Although each set contains notes that are close to being in-tune, you can still end up with songs that sound pretty bad if you aren't careful.  Playing a note from the set that is a bit sharp simlultaneously with another note that is a bit flat can sound bad.

### SETUP #1 (more Bass notes)

This setup uses a tuning that allows for the most bass notes.  It is mostly from the C scale tuned up about 50 cents.  I use this set most often and it's probably the easiest to start off using.

The Synthcart "Bass" and "Pitfall" sound settings are compatible with this setup.

```text
------------------------------
 6 001 Bass
 7 010 Pitfall
------------------------------
 #  Note NTSC PAL   Bass Code  Pitfall Code
--  ---- ---  ---  ----------- -----------
 0   b5  +45  +32  [%00100000] [%01000000]
 1   b4  +45  +32  [%00100001] [%01000001]
 2   e4  +43  +30  [%00100010] [%01000010]
 3   h3  +45  +32  [%00100011] [%01000011]
 4   g3  +58  +45  [%00100100] [%01000100]
 5   e3  +43  +30  [%00100101] [%01000101]
 7   b2  +42  +32  [%00100111] [%01000111]
 8   a2  +42  +28  [%00101000] [%01001000]
 9   g2  +59  +45  [%00101001] [%01001001]
11   e2  +43  +31  [%00101011] [%01001011]
14   c2  +56  +44  [%00101110] [%01001110]
15   b1  +46  +32  [%00101111] [%01001111]
17   a1  +39  +27  [%00110001] [%01010001]
19   g1  +59  +45  [%00110011] [%01010011]
23   e1  +44  +28  [%00110111] [%01010111]
26   d1  +41  +27  [%00111010] [%01011010]
29   c1  +58  +42  [%00111101] [%01011101]
31   h0  +44  +33  [%00111111] [%01011111]

------------------------------
 4 000 Square
------------------------------
 #  Note NTSC PAL  Driver Code
--  ---- ---  ---  -----------
10   f6  +39  +25  [%00001010]
12   d6  +49  +36  [%00001100]
21   f5  +39  +26  [%00010101]
22   e5  +62  +48  [%00010110]
25   d5  +49  +36  [%00011001]
28   c5  +60  +47  [%00011100]
30   b4  +45  +32  [%00011110]

------------------------------
12 101 Lead
------------------------------
 #  Note NTSC PAL  Driver Code
--  ---- ---  ---  -----------
10  a#4  +39  +23  [%10101010]
12   g4  +48  +34  [%10101100]
21  a#3  +37  +24  [%10110101]
22   a3  +60  +47  [%10110110]
25   g3  +47  +34  [%10111001]
28   f3  +59  +45  [%10111100]
30   e3  +43  +30  [%10111110]

------------------------------
 1 110 Saw
------------------------------
 #  Note NTSC PAL  Driver Code
--  ---- ---  ---  -----------
10  f#3  +50  +37  [%11001010]
12  d#3  +61  +48  [%11001100]
21  f#2  +51  +36  [%11010101]
25  d#2  +61  +48  [%11011001]
27   d2  +34  +20  [%11011011]
30   c2  +56  +44  [%11011110]
```

### SETUP #2 (more Square/Lead notes)

This setup gives you a huge set of Square and Lead notes from the C scale tuned slightly flat and it also gives you a few Saw notes to work with.  However, there are almost no bass notes so this setup is pretty hard to use if you want to use bass notes, but really great if you can do without bass.

Note that I've included the "Low Bass" sound which I don't normally include in my music driver, but it's easy to replace one of the other sounds with it if you need to use it.

The Synthcart "Square" and "Lead" sound settings are compatible with this setup.

```text
------------------------------
 6 001 Bass
 7 010 Pitfall
------------------------------
 #  Note NTSC PAL   Bass Code  Pitfall Code
--  ---- ---  ---  ----------- -----------
10  f#2   -6  -19  [%00101010] [%01001010]
22   f1  +16   +4  [%00110110] [%01010110]  (a little too sharp)
25  d#1   +4   -9  [%00111001] [%01011001]  (slightly sharp, use saw w/this)
30   c1    0  -11  [%00111110] [%01011110]

------------------------------
14 XXX Low Bass
------------------------------
 #  Note NTSC PAL  Driver Code
--  ---- ---  ---  -----------
10  b0   -11  -22  [%xxx01010]  (a bit flat)
12  g#0    0  -13  [%xxx01100]

------------------------------
 4 000 Square
------------------------------
 #  Note NTSC PAL  Driver Code
--  ---- ---  ---  -----------
 1   b8   -9  -23  [%00000001]
 2   e8  -11  -25  [%00000010]
 3   b7  -10  -23  [%00000011]
 4   g7   +4   -9  [%00000100]
 5   e7  -11  -25  [%00000101]
 7   b6   -9  -23  [%00000111]
 8   a6  -13  -27  [%00001000]
 9   g6   +4   -9  [%00001001]
11   e6  -11  -25  [%00001011]
14   c6   +2  -11  [%00001110]
15   b5  -10  -23  [%00001111]
17   a5  -14  -27  [%00010001]
19   g5   +4   -9  [%00010011]
23   e5  -12  -25  [%00010111]
26   d5  -16  -29  [%00011010]
29   c5   +2  -11  [%00011101]
31   b4   -9  -23  [%00011111]

------------------------------
12 101 Lead
------------------------------
 #  Note NTSC PAL  Driver Code
--  ---- ---  ---  -----------
 0   e8  -11  -25  [%10100000]
 1   e7  -11  -25  [%10100001]
 2   a6  -14  -27  [%10100010]
 3   e6  -11  -25  [%10100011]
 4   c6   +2  -11  [%10100100]
 5   a5  -14  -27  [%10100101]
 7   e5  -12  -25  [%10100111]
 8   d5  -16  -29  [%10101000]
 9   c5   +2  -11  [%10101001]
11   a4  -13  -27  [%10101011]
14   f4    0  -13  [%10101110]
15   e4  -11  -25  [%10101111]
17   d4  -16  -29  [%10110001]
19   c4   +3  -11  [%10110011]
23   a3  -14  -27  [%10110111]
26   g3  -17  -31  [%10111010]
29   f3   +1  -13  [%10111101]
31   e3  -11  -25  [%10111111]

------------------------------
 1 110 Saw
------------------------------
 #  Note NTSC PAL  Driver Code
--  ---- ---  ---  -----------
 0   c7   +2   -1  [%11000000]
 1   c6   +2   -1  [%11000001]
 2   f5    0   -1  [%11000010]
 3   c5   +2   -1  [%11000011]
 5   f4    0  -13  [%11000101]
 7   c4   +3  -11  [%11000111]
 8  a#3   -2  -15  [%11001000]
11   f3   +1  -13  [%11001011]
15   c3   +3  -11  [%11001111]
16   h2   -3  -16  [%11010000]
17  a#2    0  -14  [%11010001] (goes well w/bass d#1)
18   a2   +5   -8  [%11010010]
23   f2    0  -12  [%11010111]
26  d#2   -5  -18  [%11011010] (goes well w/bass d#1)
31   c2   +3  -11  [%11011111]
```

### SETUP #3 (more Saw notes)

This gives you the most notes in Saw tuned to C# slightly sharp.  I haven't tested this note set very thoroghly so it may need a little work.  And the fact that it's in C# may make it a bit more difficult to use if you don't remember a little music theory.  :o)

The Synthcart "Saw" setting corresponds is compatible with this setup.

```text
------------------------------
 1 110 Saw
------------------------------
 #  Note NTSC PAL  Driver Code
--  ---- ---  ---  -----------
 0   c7   +2   -1  [%11000000]
 1   c6   +2   -1  [%11000001]
 2   f5    0   -1  [%11000010]
 3   c5   +2   -1  [%11000011]
 4  g#4  +16   +3  [%11000100]
 5   f4    0  -13  [%11000101]
 7   c4   +3  -11  [%11000111]
 8  a#3   -2  -15  [%11001000]
 9  g#3  +15   +2  [%11001001]
11   f3   +1  -13  [%11001011]
14  c#3  +13   +1  [%11001110]
15   c3   +3  -11  [%11001111]
17  a#2    0  -14  [%11010001]
19  g#2  +16   +3  [%11010011]
23   f2    0  -12  [%11010111]
26  d#2   -5  -18  [%11011010]
29  c#2  +15    0  [%11011101]
31   c2   +3  -11  [%11011111]

------------------------------
 6 001 Bass
 7 010 Pitfall
------------------------------
 #  Note NTSC PAL   Bass Code  Pitfall Code
--  ---- ---  ---  ----------- -----------
10  f#2   -6  -19  [%00101010] [%01001010]
12  d#2   +4   -9  [%00101100] [%01001100]
21  f#1   -4  -20  [%00110101] [%01010101]
22   f1  +16   +4  [%00110110] [%01010110]
25  d#1   +4   -9  [%00111001] [%01011001]
28  c#1  +19   +5  [%00111100] [%01011100]
30   c1    0  -11  [%00111110] [%01011110]

------------------------------
 4 000 Square
------------------------------
 #  Note NTSC PAL  Driver Code
--  ---- ---  ---  -----------
14   c6   +2  -11  [%00001110]
16  a#5  -15  -28  [%00010000]
18  g#5   -7  -20  [%00010010]
20  f#5  +20   +7  [%00010100]
29   c5   +2  -11  [%00011101]

-----------------------------
12 101 Lead
------------------------------
 #  Note NTSC PAL  Driver Code
--  ---- ---  ---  -----------
 4   c6   +2  -11  [%10100100]
 9   c5   +2  -11  [%10101001]
13  f#4  +20   +6  [%10101101]
18  c#4   -9  -22  [%10110010]
14   f4    0  -13  [%10101110]
19   c4   +3  -11  [%10110011]
24  g#3  +15   +2  [%10111000]
27  f#3  +19   +6  [%10111011]
29   f3   +1  -13  [%10111101]
```

## Other Tips

- When writing songs for a game that are to be used during gameplay, add a long part at the end of the song that's just drums or effects.  This way the player won't get bored with the melody as fast.  You can do some pretty neat drum patterns that are fun to listen to.

- Keep a keyboard handy while composing.  I keep a Casio SK-1 next to my computer.  And of course the Synthcart helps too.

- Name your patterns meaningful names so you can keep track of what you're doing.  I use a naming convention like Bass1a, Bass1b, Bass2a, Bass2b... where Bass1a and Bass1b would be variations of a similar pattern.

- If you're using an Atari 2600 modified with an audio out, you might want to filter out the high treble.  The Atari generates a lot of high frequency bits that can be grating when using headphones.  Adding reverb and delay helps too.

- For electronic musicians wanting to use the 2600 for their tracks, try writing two complementary tracks and recording them separately, then pan each track in Stereo.
