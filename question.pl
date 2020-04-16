:- dynamic fact/1.
:- dynamic truthity/1.
:- dynamic falsity/1.

fact(F) :- (
  truthity(F) -> true;
  falsity(F) -> false;
  (format('Yes or no: "My animal ~w."~n', [F]), read(yes) -> assert(truthity(F))) -> true;
  assert(falsity(F)) -> false
).

animal(dog)         :- fact('has fur'),      fact('says woof').
animal(cat)         :- fact('has fur'),      fact('says meow').
animal(duck)        :- fact('has feathers'), fact('says quack').
animal(skylark)     :- fact('has feathers'), fact('sings sweetly').
animal(honeybadger) :- fact('has fur'),      fact('dont give a fuck').
animal(coelacanth)  :- fact('has scales'),   fact('dont evolve').
animal(albatross)   :- fact('has feathers'), fact('symbol of failure').
animal(iguana)      :- fact('has scales'),   fact('climbs trees').
animal(macaque)     :- fact('has fur'),      fact('climbs trees').
animal(salmon)      :- fact('has scales'),   fact('is delicious').
animal(cow)         :- fact('has fur'),      fact('is delicious').
animal(chicken)     :- fact('has feathers'), fact('is delicious').

is_true(Statement) :-
  (
    fact(Statement) -> true; %OR
    format('Yes or no: do your animal ~w?~n', [Statement]),
    Answer = read(yes),
    ( Answer -> assert(fact(Statement)) )
  ).

begin() :- (
  retractall(truthity(X)), retractall(falsity(Y)),
  format("Right now, I know nothing about the animal about which you are thinking about.  Are you ready to be amazed?~n"),
  ((read(yes) -> query); format("Oh... Oh I see."))
).

query() :- (animal(Animal) -> format("I know!  It a ~w!~n", [Animal])).
