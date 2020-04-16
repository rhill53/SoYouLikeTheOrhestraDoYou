% :- dynamic known/1.
:- dynamic fact/1.
:- dynamic truthity/1.
:- dynamic falsity/1.
% :- dynamic known/2.
% :- dynamic facct/2.

fact('beavers mate for life').
fact('14 > 3').
fact('for quality carpets visit kaplans carpet warehouse').

% known('animals are cute', yes).
% known('trees are people', no).

facct('prolog is stupid', yes).

really(F) :- (
  truthity(F) -> true;
  falsity(F) -> false;
  (format('Yes or no: "My animal ~w."~n', [F]), read(yes) -> assert(truthity(F))) -> true;
  assert(falsity(F)) -> false
).

animal(dog)         :- really('has fur'), really('says woof').
animal(cat)         :- really('has fur'), really('says meow').
animal(duck)        :- really('has feathers'), really('says quack').
animal(skylark)     :- really('has feathers'), really('sings sweetly').
animal(honeybadger) :- really('has fur'), really('dont give a fuck').
animal(coelacanth)  :- really('has scales'), really('evolutionary throwback').

is_true(Statement) :-
  (
    fact(Statement) -> true; %OR
    format('Yes or no: do your animal ~w?~n', [Statement]),
    Answer = read(yes),
    ( Answer -> assert(fact(Statement)) )
  ).

begin() :- (
  retractall(truthity(X)), retractall(falsity(Y)),
  format("Right now, I know nothing about the animal you are thinking of.  Are you ready to be amazed?~n"),
  ((read(yes) -> query); format("Oh... Oh I see."))
).

query() :- (animal(Animal) -> format("I know!  It a ~w!~n", [Animal])).
