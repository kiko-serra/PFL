{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
import Distribution.Simple.Utils (xargs)
--1.1
testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c = a < b + c && b < a + c && c < a + b

--1.2
areaTriangulo :: Float -> Float -> Float -> Float
areaTriangulo a b c = sqrt (s*(s-a) * (s-b) * (s-c))
                    where s = (a+b+c)/2

--1.3
metades :: [a] -> ([a], [a])
metades xs = (take b xs, drop b xs)
            where b = length xs `div` 2

--1.4 a)
--head, reverse
myLastReverse :: [a] -> a
myLastReverse xs = head (reverse xs)

--tail, length, take, drop
myLast :: [a] -> a
myLast xs = head (drop (length xs - 1) xs)

--length, max
myLastMax :: [a] -> a
myLastMax xs = xs !! max 0 (length xs -1)

--1.4 b)
--head, reverse, tail, length, take, drop
myInit :: [a] -> [a]
myInit xs = take (length xs -1) xs

myInitReverse :: [a] -> [a]
myInitReverse xs = drop 1 (reverse xs)

--1.5 a)
binom :: Int -> Int -> Int
binom n k = n_fac `div` (k_fac* product[1..n-k])
        where n_fac = product [1..n]
              k_fac = product [1..k]

--1.5 b)
binom' :: Int -> Int -> Int
binom' n k = if k < n-k then product [n-k+1..n] `div` k_fac
            else product [k+1..n] `div` product[1..n-k]
            where k_fac = product [1..k]

--1.6
raizes :: Float -> Float -> Float -> (Float, Float)
raizes a b c = ((-b + sqrt aux) / (2*a*c),(-b - sqrt aux) / (2*a*c))
            where aux = b^2 -4*a*c

--1.7
--[a,b,c] = [Char]
--(a,b,c) = (Char, Char, Char)
--[(False, '0'),(True, '1')] = [(Bool, Int)]
--([False, True], ['0', '1']) = ([Bool], [Int])
--[tail, init, reverse] = [([a]-> [a])]
--[id, not] = [(Bool-> Bool)]

--1.8

segundo :: [a] -> a
segundo xs = head (tail xs)

trocar :: (a,b) -> (b,a)
trocar (x, y) = (y, x)

par :: a -> b -> (a,b)
par x y = (x, y)

dobro :: Num a => a -> a
dobro x = 2 * x

metade :: Fractional a => a -> a
metade x = x/2

minuscula :: Char -> Bool
minuscula x = x >= 'a' && x <= 'z'

intervalo :: Ord a => a -> a -> a -> Bool
intervalo x a b = x >= a && x<=b

palindromo :: Eq a => [a] -> Bool
palindromo xs = reverse xs == xs

twice :: (a->a) -> a -> a
twice f x = f (f x)

--1.9
classifica :: Int -> String
classifica n
            | n <= 9 = "reprovado"
            | n <12 = "suficiente"
            | n < 15 = "bom"
            | n < 18 = "muito bom"
            | n < 20 = "muito bom com distincao"
            | otherwise = "erro"

--1.10
classificaIMC :: Float -> Float -> String
classificaIMC peso altura
                        | imc < 18.5 = "baixo"
                        | imc < 25 = "normal"
                        | imc < 30 = "excesso"
                        | imc >= 30 = "obesidade"
                        | otherwise = "erro"
                        where imc = peso / (altura^2)

--1.11
max3 :: Ord a => a -> a -> a -> a
max3 a b c = max (max a b) (max b c)

min3 :: Ord a => a -> a -> a -> a
min3 a b c = min (min a b) (min b c)

--1.12
xor :: Bool -> Bool -> Bool
xor a b
        | not a && b = True
        | a && not b = True
        | otherwise = False

--1.13
--conditional
safetail :: [a] -> [a]
safetail xs = if null xs then [] else tail xs

--with guards
safetailGuards :: [a] -> [a]
safetailGuards xs
                | null xs = []
                | otherwise = tail xs

--with patterns
safetailPattern :: [a] -> [a]
safetailPattern [] = []
safetailPattern xs = tail xs

--1.14
--with length
curta :: [a] -> Bool
curta xs
        | length xs < 3 = True
        | otherwise = False

curtaPatterns :: [a] -> Bool
curtaPatterns [] = True
curtaPatterns [_] = True
curtaPatterns [_,_] = True
curtaPatterns (_:_:_) = False

--1.15
mediana :: Ord a => a -> a -> a -> a
mediana a b c
        | (a <= b && a >= c) || (a <=c && a >= b) = a
        | (b <= c && b >= a) || (b <=a && b >= c) = b
        | otherwise = c

medianaSteroids :: (Num a, Ord a) => a -> a -> a -> a
medianaSteroids a b c = total - maxNum - minNum
                        where total = a + b + c
                              maxNum = max (max a b) c
                              minNum = min (min a b) c

--1.16
unidades :: [String]
unidades =
  [ "zero"
  , "um"
  , "dois"
  , "tres"
  , "quatro"
  , "cinco"
  , "seis"
  , "sete"
  , "oito"
  , "nove"
  ]

dez_a_dezanove :: [String]
dez_a_dezanove =
  [ "dez"
  , "onze"
  , "doze"
  , "treze"
  , "quatorze"
  , "quinze"
  , "dezasseis"
  , "dezassete"
  , "dezoito"
  , "dezanove"
  ]

dezenas :: [String]
dezenas =
  [ "vinte"
  , "trinta"
  , "quarenta"
  , "cinquenta"
  , "sessenta"
  , "setenta"
  , "oitenta"
  , "noventa"
  ]

{-
  A função 'converte2' é composição de duas:
  * 'divide2' obtêm os algarimos;
  * 'combina2' combina o texto de cada algarismo.
  Usamos as operações de concatenação (++) e
  indexação de listas (!!) (note que os índices começam em zero.)
-}
converte2 :: Int -> String
converte2 n | n<100 = combina2 (divide2 n)

divide2 :: Int -> (Int, Int)
divide2 n = (n`div`10, n`mod`10) -- (quociente,resto)

combina2 :: (Int, Int) -> String
combina2 (0, u) = unidades !! u
combina2 (1, u) = dez_a_dezanove !! u
combina2 (d, 0) = dezenas !! (d-2)
combina2 (d, u) = dezenas !! (d-2) ++ " e " ++ unidades !! u

{- Em seguida, resolvemos o problema análogo para números até 3
   algarismos. Necessitamos dos nomes em Português das centenas.
 -}
centenas :: [String]
centenas =
  [ "cento"
  , "duzentos"
  , "trezentos"
  , "quatrocentos"
  , "quinhentos"
  , "seiscentos"
  , "setecentos"
  , "oitocentos"
  , "novecentos"
  ]

{- A função de conversão, nos mesmos moldes da anterior.
   Note o tratamento especial do número 100.  -}
converte3 :: Int -> String
converte3 n | n<1000 = combina3 (divide3 n)

divide3 :: Int -> (Int, Int)
divide3 n = (n`div`100, n`mod`100)

combina3 :: (Int, Int) -> String
combina3 (0, n) = converte2 n
combina3 (1, 0) = "cem"
combina3 (c, 0) = centenas !! (c-1)
combina3 (c, n) = centenas !! (c-1) ++ " e " ++ converte2 n

{- Finalmente podemos resolver o problema para números
  até 6 algarismos, i.e. inferiores a 1 milhão.  -}
converte6 :: Int -> String
converte6 n | n<1000000 = combina6 (divide6 n)

divide6 n = (n `div` 1000, n `mod` 1000)

combina6 (0, n) = converte3 n
combina6 (1, 0) = "mil"
combina6 (1, n) = "mil" ++ ligar n ++ converte3 n
combina6 (m, 0) = converte3 m ++ " mil"
combina6 (m, n) = converte3 m ++ " mil" ++ ligar n ++ converte3 n

{- Uma função auxiliar para escolher a partícula de ligação entre
   milhares e o restante (r).
   Regra: colocamos "e" quando o resto é inferior a 100
   ou múltiplo de 100; caso contrario, basta um espaço.
 -}
ligar :: Int -> String
ligar r
  | r < 100 || r `mod` 100 == 0 = " e "
  | otherwise                   = " "

-- A solução do exercício proposto é converte6.
converte :: Int -> String
converte = converte6
------------------------------------------------------------------------