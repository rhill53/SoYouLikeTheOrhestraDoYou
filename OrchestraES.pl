%%%%%%%%%%%%%%%%%%%%
% CS3210 Spring 2020
% Programming assignment 3 - Expert System
% Nate Roberts and Robb Hill
%

instrument(oboe)					:- fact('is a woodwind'),	fact('has keys'),			fact('has a conical bore'),		fact('has a double reed').
instrument(clarinet)				:- fact('is a woodwind'),	fact('has keys'),			fact('has a conical bore'),		fact('has a single reed').
instrument(bassoo)					:- fact('is a woodwind'),	fact('has keys'),			fact('has no conical shape').
instrument(flute)					:- fact('is a woodwind'),	fact('has keys'),			fact('is played to the side').
instrument(saxaphone)				:- fact('is a woodwind'),	fact('is made of brass').
instrument(piccolo)					:- fact('is a woodwind'),	fact('has no keys').
% woodwind(contrabossoon) .
% woodwind(b_flat_clarinet) .
% woodwind(e_flat_clarinet) .
% woodwind(basset_horn) .
% woodwind(bass_clarinet) .
% woodwind(contrabass_clarinet) .
% woodwind(cor_anglais) .
% woodwind(bass_oboe) .
% woodwind(alto_flute) .

instrument(horn)					:- fact('is brass'),	fact('is wide at end'),	fact('has valves'),	fact('is tubes bent in circles').
instrument(trumpet)					:- fact('is brass'),	fact('is wide at end'), fact('has valves'),	fact('is tubes bent in ovals').
instrument(trombone) 				:- fact('is brass'),	fact('is wide at end'),	fact('has slide').
instrument(baritone) 				:- fact('is brass'),	fact('is wide at end'),	fact('has valves'), fact('end points up'), fact('is smaller than a tuba').
instrument(tuba)					:- fact('is brass'),	fact('is wide at end'),	fact('has valves'), fact('end points up').
% brass(wagner_tuba) .
% brass(cornet) .
% brass(piccolo_trumpet) .
% brass(bass_trumpet) .
% brass(alto_trombone) .
% brass(tenor_trombone) .
% brass(bass_trombone) .
% brass(contrabass_trombone) .
% brass(bariton_horn) .
% brass(euphonium) .

instrument(timpini) 			:- fact('is percussion'),	fact('has a strecched head'),		fact('has a metal body').
instrument(snare_drum) 			:- fact('is percussion'),	fact('has a strecched head'),		fact('has springs attached to head').
instrument(tamborine) 			:- fact('is percussion'),	fact('has a stretched head'),		fact('has paired metal discs all around edge').
instrument(bass_drum) 			:- fact('is percussion'),	fact('has a strecched head'), 		fact('struck with felt covered stick').
instrument(cymbals) 			:- fact('is percussion'),	fact('is metal'),					fact('are crashed together').
instrument(triangle) 			:- fact('is percussion'),	fact('is metal'),					fact('has three sides').
instrument(cow_bell)			:- fact('is percussion'),	fact('is metal'),					fact('has animal in name'),							fact('Christopher Walken needs more'),
instrument(xylophone) 			:- fact('is percussion'),	fact('is metal'),					fact('has multiple sized bars').
instrument(bells) 	 			:- fact('is percussion'),	fact('is metal'),					fact('has multiple sized tubes').
instrument(wood_block) 			:- fact('is percussion'),	fact('is made entirely from wood').
instrument(drum_kit) 			:- fact('is percussion'),	fact('is a set or kit'),			fact('has multiple percussion instruments'),.
% percussion(tenor_drum) .
% percussion(tam_tam) .
% percussion(glockenspiel) .
% percussion(vibraphone) .
% percussion(marimba) .
% percussion(crotales) .
% percussion(tubular_bells) .
% percussion(mark_tree) .

instrument(piano) 			:- fact('is a keyboard'),		fact('has strings'),	fact('mallets strike strings to play').
instrument(harpsicord) 		:- fact('is a keyboard'),		fact('hss strings'),	fact('plucks strings to play').
instrument(pipe_organ) 		:- fact('is a keyboard'),		fact('has pipes').
instrument(accordion) 		:- fact('is a keyboard'),		fact('has bellows'),	fact('is pulled and pressed to play').
% keyboard(celesta) .

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

other(theremin) .
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
part(mouth_piece) .
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
begin() :- (
  retractall(fact(X)),
  format("Right now, I know nothing about the instrument about which you are thinking about.  Are you ready to be DAZZLED by my insight?~n"),
  ((read(yes) -> query); format("Oh... Oh I see."))
).
query() :- (instrument(I) -> format("You're thinking of a ~w!~n", [I])).

% TODO: success and failure responses like nice or oh noes
