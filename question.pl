wadge(A, B) :- (
  A > B -> write('Halloe it Troo'); write('No et donat'), false
).
zibgo(A) :- (
  fact(A) -> true;
  write('Im dognet.'), false
).

fact('beavers mate for life').
fact('14 > 3').
fact('for quality carpets visit kaplans carpet warehouse').

:- dynamic known/1.
:- dynamic fact/1.

known(Question) :- (
  fact(Question) -> true;
  format('~w?~n', [Question]), Answer = read(yes), (
    Answer -> assert(fact(Question));
    assert(not(fact(Question)))
  )
).

truthity('the facts').
falsity('the fictions').

answered(Question) :- (
  truthity(Question) -> true;
  falsity(Question) -> true;
  format('~w?~n', [Question]), Answer = read(yes), (Answer -> assert(truthity(Question)))
).

nobule(lemon) :- answered('do it be a lemon'), truthity('do it be a lemon').
% is_true(Question) :-
%   (
%     fact(Question) ->
%       true;
%       format('~w?~n', [Question]),
%       Answer = read(yes),
%       ( Answer -> assert(fact(Question)) )
%   ).
%
% animal(dog) :- is_true('has fur'), is_true('says woof').
% animal(cat) :- is_true('has fur'), is_true('says meow').
% animal(duck) :- is_true('has feathers'), is_true('says quack').
