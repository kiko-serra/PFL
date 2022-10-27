maxpos :: [Int] -> Int
maxpos [] = 0
maxpos (x:xs)
    | x > maxpos xs = x
    | otherwise = maxpos xs

dups :: [a] -> [a]
dups [] = []
dups xs = dupsAux new
    where new = aux xs

--Cria um par com var e posicao
aux :: [a] -> [(a, Int)]
aux xs = zip xs [0..tamanho]
    where tamanho = length xs -1

dupsAux :: [(a, Int)] -> [a]
dupsAux [] = []
dupsAux xs = (if even (snd (head xs)) then fst (head xs) : [fst (head xs)] else [fst (head xs)]) ++ dupsAux (tail xs)

transforma :: String -> String
transforma [] = []
transforma (x:xs)
    | x =='a' || x =='e' || x =='i' || x =='o' || x =='u' = x : 'p' : x : transforma xs
    | otherwise = x : transforma xs

type Matriz = [[Int]]
transposta :: Matriz -> Matriz
transposta [] = []
transposta xss = [head xs | xs <- xss] : transposta [tail xs | xs <- xss, tail xs /= []]

type Vector = [Int]
prodInterno :: Vector -> Vector -> Int
prodInterno [] ys = 0
prodInterno xs [] = 0
prodInterno xs ys =  sum [uncurry (*) (x,y) | (x,y) <- zip xs ys]

data Arv a = F | N a (Arv a) (Arv a)
    deriving(Show)
alturas :: Arv a -> Arv Int
alturas F = F
alturas (N a a1 a2) = N (altura (N a a1 a2)) (alturas a1) (alturas a2)

altura :: Arv a -> Int
altura F = 0
altura (N a a1 a2) = 1 + max (altura a1) (altura a2)

equilibrada :: Arv a -> Bool
equilibrada F = True
equilibrada (N a a1 a2) = (altura a1 - altura a2) < 1

f :: (a -> b -> c) -> b -> a -> c
f fun a b = fun b a