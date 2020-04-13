%%%%%%%%%%%%%%%%%%%%
% CS3210 Spring 2020
% Programming assignment 3 - Expert System
% Nate Roberts and Robb Hill
%

woodwind(flute) .
woodwind(piccolo) .
woodwind(alto_flute) .
woodwind(oboe) .
woodwind(cor_anglais) .
woodwind(bass_oboe) .
woodwind(clarinet) .
woodwind(b_flat_clarinet) .
woodwind(e_flat_clarinet) .
woodwind(basset_horn) .
woodwind(bass_clarinet) .
woodwind(contrabass_clarinet) .
woodwind(bassoon) .
woodwind(contrabossoon) .
woodwind(saxaphone) .

brass(horn) .
brass(wagner_tuba) .
brass(trumpet) .
brass(cornet) .
brass(piccolo_trumpet) .
brass(bass_trumpet) .
brass(trombone) .
brass(alto_trombone) .
brass(tenor_trombone) .
brass(bass_trombone) .
brass(contrabass trombone) .
brass(tubas) .
brass(baritone) .
brass(bariton_horn) .
brass(euphonium) .

percussion(timpini) .
percussion(snare_drum) .
percussion(tenor_drum) .
percussion(bass_drum) .
percussion(cymbals) .
percussion(triangle) .
percussion(tam-tam) .
percussion(tamborine) .
percussion(wood_block) .
percussion(glockenspiel) .
percussion(xylophone) .
percussion(vibraphone) .
percussion(marimba) .
percussion(crotales) .
percussion(bells) .
percussion(tubular_bells) .
percussion(mark_tree) .
percussion(drum_kit) .

keyboard(piano) .
keyboard(pipe_organ) .
keyboard(harpsicord) .
keyboard(accordian) .
keyboard(celesta) .

strings(violin) .
strings(first_violin) .
strings(second_violin) .
strings(viola) .
strings(cello) .
strings(bass) .
strings(upright_bass) .
strings(double_bass) .
strings(harp) .
strings(guitar) .
strings(classical_guitar) .

other(theramin) .
other(ondes_martenot) .
other(electric_guitar) .
other(electric_bass) .
other(hammond_organ) .
other(lowrey_organ) .
other(ring_modulators) .
other(synthesizer) .
other(novachord) .

play(pluck) .
play(blow) .
play(strum) .
play(key) .
play(strike) .
play(bow) .
play(drag) .
play(hit) .
play(wave) .

part(key) .
part(string) .
part(bridge) .
part(mouth_peice) .
part(reed) .
part(hole) .

is_true(Question) :-
  (
    fact(Question) ->
	  true;
	  format('~w?~n', [Question]),
	  Answer = read(yes),
	  ( Answer -> assert(fact(Question)) );
	  Answer == false -> check_facts()
  ) .
  
% TODO: write "check facts" for contrary facts
% TODO: DRY

% TODO: Dynamic clauses for writing of facts

% TODO: retractall for session independence

% TODO: program start with Ready and exits with Bye
% TODO: program launches with begin in PL shell
%		- also resets with begin

% TODO: success and failure responses like nice or oh noes
  
  
  
  
  
  
  
  
  