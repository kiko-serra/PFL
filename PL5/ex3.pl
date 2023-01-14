piloto(lamb).
piloto(besenyei).
piloto(chambliss).
piloto(maclean).
piloto(mangold).
piloto(jones).
piloto(bonhomme).

equipa(lamb, breitling).
equipa(besenyei, red_bull).
equipa(chambliss, red_bull).
equipa(maclean, mediterranean_racing_team).
equipa(mangold, cobra).
equipa(jones,matador).
equipa(bonhomme, matador).

aviao(lamb,mx2).
aviao(besenyei, edge540).
aviao(chambliss, edge540).
aviao(maclean, edge540).
aviao(mangold, edge540).
aviao(jones, edge540).
aviao(bonhomme, edge540).

circuito(istanbul).
circuito(budapest).
circuito(porto).

vencedor(porto, jones).
vencedor(budapeste, mangold).
vencedor(istanbul, mangold).

gates(istanbul, 9).
gates(budapeste, 6).
gates(porto, 5).

equipaVence(X, Y):- vencedor(Y, N), equipa(N, X).