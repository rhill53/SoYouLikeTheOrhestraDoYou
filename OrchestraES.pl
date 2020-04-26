%%%%%%%%%%%%%%%%%%%%
% CS3210 Spring 2020
% Programming assignment 3 - Expert System
% Nate Roberts and Robb Hill
%

instrument(flute)					:- fact('is a woodwind'),	fact('has keys'),			fact('is played to the side').
instrument(piccolo)					:- fact('is a woodwind'),	fact('has no keys') .
instrument(oboe)					:- fact('is a woodwind'),	fact('has keys'),			fact('has a conical bore'),		fact('has a double reed') .
instrument(clarinet)				:- fact('is a woodwind'),	fact('has keys'),			fact('has a conical bore'),		fact('has a single reed') .
instrument(bassoo)					:- fact('is a woodwind'),	fact('has keys'),			fact('has no conical shap') .
instrument(saxaphone)				:- fact('is a woodwind'),	fact('is made of brass') .
% woodwind(contrabossoon) .
% woodwind(b_flat_clarinet) .
% woodwind(e_flat_clarinet) .
% woodwind(basset_horn) .
% woodwind(bass_clarinet) .
% woodwind(contrabass_clarinet) .
% woodwind(cor_anglais) .
% woodwind(bass_oboe) .
% woodwind(alto_flute) .

instrument(horn)					:- fact('is brass'),	fact('is wide at end'),	fact('has valves'),	fact('is tubes bent in circles') .
instrument(trumpet)					:- fact('is brass'),	fact('is wide at end'), fact('has valves'),	fact('is tubes bent in ovals')
instrument(trombone) 				:- fact('is brass'),	fact('is wide at end'),	fact('has slide') .
instrument(tuba)					:- fact('is brass'),	fact('is wide at end'),	fact('has valves'), fact('end points up') .
instrument(baritone) 				:- fact('is brass'),	fact('is wide at end'),	fact('has valves'), fact('end points up'), fact('is smaller than a tuba').
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

percussion(timpini) .
percussion(snare_drum) .
percussion(tenor_drum) .
percussion(bass_drum) .
percussion(cymbals) .
percussion(triangle) .
percussion(tam_tam) .
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
keyboard(accordion) .
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
