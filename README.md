1 - Recriar o código com apenas UMA Thread \
2 - Recriar o código com 10 Threads \
3 - Recriar o código com 10 Threads mas usando classe.



Parte (1/2):

Escolher outra linguagem e replciar a atividade de thread com classe.

Parte 2/2:
Desenvolver uma pequisa relacionado a thread usando memory sharer, com o tipo deadlock/lock, pode ser usado o código já desenvolvido, a pesquisa deve conter como funciona usando um fluxograma e explicar como funciona o código.

Bonus: Entender o pq o ruby não me deixou forçar o race_condition, pode usar a documentação.

# O que é um Mutex?

Um Mutex (Mutual Exclusion) é um objeto que garante que apenas uma thread possa
acessar uma seção crítica de código de cada vez. Isso evita condições de corrida,
garantindo a integridade dos dados quando múltiplas threads tentam modificar
recursos compartilhados. Usar mutexes é essencial para proteger dados em
aplicações multithreaded e manter a consistência do programa.
