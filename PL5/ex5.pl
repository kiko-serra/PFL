cargo(tecnico, eleuterio).
cargo(tecnico, juvenaldo).
cargo(analista, leonilde).
cargo(analista, marciliano).
cargo(engenheiro, osvaldo).
cargo(engenheiro, porfirio).
cargo(engenheiro, reginaldo).
cargo(supervisor, sisnando).
cargo(supervisor_chefe, gertrudes).
cargo(secretaria_exec, felismina).
cargo(diretor, asdrubal).

chefiado_por(tecnico, engenheiro).
chefiado_por(engenheiro, supervisor).
chefiado_por(analista, supervisor).
chefiado_por(supervisor, supervisor_chefe).
chefiado_por(supervisor_chefe, diretor).
chefiado_por(secretaria_exec, diretor).


% chefiado_por(analista, X), cargo(X, sisnando): Sisnando chefia analista? Se sim, qual o seu cargo?
% chefiado_por(tecnico, X), chefiado_por(X, Y): Os cargos que chefeiam tecnico e que são chefiados por outros cargos
% cargo(J, P), chefiado_por(J, supervisor): Os cargos são chefiados por um supervisor  e as pessoas que tem esse cargo 
% chefiado_por(P, diretor), \+(cargo(P, felismina)): Os cargos chefiados pelo diretor e que não sejam ocupados pela felismina