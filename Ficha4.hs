data Arv a = Vazia | No a (Arv a) (Arv a)
--4.1
sumArv :: Num a => Arv a -> a
sumArv Vazia = 0
sumArv (No a a1 a2) = a + sumArv a1 + sumArv a2

--4.2
listar :: Arv a -> [a]
listar Vazia = []
listar (No n left right) = listar left ++ [n] ++ listar right

--4.3
nivel :: Int -> Arv a -> [a]
nivel 