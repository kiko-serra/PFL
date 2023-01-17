%flight(origin, destination, company, code, hour, duration)
flight(porto, lisbon, tap, tp1949, 1615, 60).
flight(lisbon, madrid, tap, tp1018, 1805, 75).
flight(lisbon, paris, tap, tp440, 1810, 150).
flight(lisbon, london, tap, tp1366, 1955, 165).
flight(london, lisbon, tap, tp1361, 1630, 160).
flight(porto, madrid, iberia, ib3095, 1640, 80).
flight(madrid, porto, iberia, ib3094, 1545, 80).
flight(madrid, lisbon, iberia, ib3106, 1945, 80).
flight(madrid, paris, iberia, ib3444, 1640, 125).
flight(madrid, london, iberia, ib3166, 1550, 145).
flight(london, madrid, iberia, ib3163, 1030, 140).
flight(porto, frankfurt, lufthansa, lh1177, 1230, 165).

get_all_nodes(L):- setof(Airport, (A1,A2,X,Y,Z,W)^(flight(A1,A2, X,Y,Z,W), (A1=Airport ; A2=Airport)), L).

score(Company, Score):- setof(Destination, (Ori, Code, Hour, Dur)^flight(Ori, Destination, Company, Code, Hour, Dur), Destinations),
                        length(Destinations, Score).

most_diversified([Company], Company).
most_diversified([Company|T], Company):- most_diversified(T, BestNext),
                                        score(Company, BestScore),
                                        score(BestNext, BestNextScore),
                                        BestScore>=BestNextScore.

most_diversified([Competitor|T], Company):- score(Competitor, CompScore),
                                            score(Company, BestScore),
                                            BestScore>=CompScore,
                                            most_diversified(T, Company).

most_diversified(Company):- setof(Company, (Or, Dest, Code, Hour, Dur)^flight(Or, Dest, Company, Code, Hour, Dur), Companies),
                            most_diversified(Companies, Company).

