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

% truthity('the facts').
% falsity('the fictions').

% answered(Question) :- (
%   truthity(Question) -> true;
%   falsity(Question) -> true;
%   format('~w?~n', [Question]), (
%     (Affirm = read(yes), Deny = read(no)),
%     (Affirm -> assert(truthity(Question))),
%     (Deny -> assert(falsity(Question)))
%   )
% ).


% nobule(lemon) :- answered('do it be a lemon'), truthity('do it be a lemon').

% elem('has fur').
% elem('has feathers').
% elem('says woof').
% elem('says meow').
% elem('says quack').
% elem('tastes good').

really(F) :- (
  truthity(F) -> true;
  falsity(F) -> false;
  (format('Yes or no: "My animal ~w."~n', [F]), read(yes) -> assert(truthity(F));
  assert(falsity(F)))
).

animal(dog)         :- really('has fur'), really('says woof').
animal(cat)         :- really('has fur'), really('says meow').
animal(duck)        :- really('has feathers'), really('says quack').
animal(skylark)     :- really('has feathers'), really('sings sweetly').
animal(honeybadger) :- really('has fur'), really('dont give a fuck').
animal(coelacanth)  :- really('has scales'), really('evolutionary throwback').

% known(F, V) :- (
%   facct(F, X) -> true;
%   format('Yes or no: "My animal ~w."~n', [F]),
%   (read(yes) -> assert(facct(F, yes)), assert(facct(F, no)))
% ).

% yousaid(Fact, Verity) :- (
%   (((truthity(Fact), Verity == yes); ((falsity(Fact), Verity == no))) -> true);
%   (format('Yes or no: do your animal ~w?~n', [Fact]),
%    read(yes) -> assert(truthity(Fact));
%    assert(falsity(Fact))
%   )
% ).

% known(Q, A) :- (format('Yes or no: "My animal ~w."~n', [Q]), read(A)) -> asserta(known(Q, A)).

is_true(Statement) :-
  (
    fact(Statement) -> true; %OR
    format('Yes or no: do your animal ~w?~n', [Statement]),
    Answer = read(yes),
    ( Answer -> assert(fact(Statement)) )
  ).

% known(Aspect) :- (
%   (truthity(Aspect) -> true; falsity(Aspect) -> true); (
%     format('~w?~n', [Aspect]), (
%       read(yes) -> assert(truthity(Aspect));
%       assert(falsity(Aspect))
%     )
%   )
% ).

begin() :- (
  retractall(truthity(X)), retractall(falsity(Y)),
  format("Right now, I know nothing about the animal you are thinking of.  Are you ready to be amazed?~n"),
  ((read(yes) -> query); format("Oh... Oh I see."))
).

% commence() :- (
%   retractall(truthity(X)), retractall(falsity(X)),
%   format("Time to guess it!  You on the trangle?~n"),
%   ((read(yes) -> query); format("Oh... Oh I see."))
% ).

query() :- (animal(Animal) -> format("I know!  It a ~w!~n", [Animal])).
