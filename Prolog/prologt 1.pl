% марки
marka(fauna).
marka(flora).
marka(sport).
marka(kosmos).

vyvod(Geroi) :-
    Geroi = [_, _, _, _], % выбор персонажов
    member([volk, fauna], Geroi),
    member([nif, MarkaNif], Geroi), marka(MarkaNif), MarkaNif \= fauna,
    member([naf, MarkaNaf], Geroi), marka(MarkaNaf), MarkaNaf \= fauna,
    member([nuf, MarkaNuf], Geroi), marka(MarkaNuf), MarkaNuf \= fauna,
    sleva([volk, fauna], [naf, MarkaNaf], Geroi),
    sprava([nif, MarkaNif], [_, kosmos], Geroi), 
    naprotiv([nuf, MarkaNuf], [naf, MarkaNaf], Geroi),
    MarkaNuf \= sport,
    rasnye([fauna, MarkaNif, MarkaNaf, MarkaNuf]).

% проверка чо справа
sprava(Pervy, Vtoroy, [Vtoroy, Pervy | _]).
sprava(Pervy, Vtoroy, [_ | Ostatok]) :- sprava(Pervy, Vtoroy, Ostatok).

% проверка что слева
sleva(Pervy, Vtoroy, [Pervy, Vtoroy | _]).
sleva(Pervy, Vtoroy, [_ | Ostatok]) :- sleva(Pervy, Vtoroy, Ostatok).

% нвпртив друг друга
naprotiv(Pervy, Vtoroy, [Pervy, _, Vtoroy, _]).
naprotiv(Pervy, Vtoroy, [_, Pervy, _, Vtoroy]).

% каждый собирает разные марки
rasnye([]).
rasnye([Nachalo|Konez]) :- not(member(Nachalo, Konez)), rasnye(Konez).

% Вывод решения
main :-
    vyvod(Geroi),
    valid_input(Geroi),
    writef('Решение: %t\n', Geroi),
    halt.

% vyvod(Geroi).
