import Distribution.Simple.Utils (xargs)
--1.1
testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c = (a < b + c) && (b < a + c) && (c < a + b)

--1.2
areaTriangulo :: Float -> Float -> Float -> Float
areaTriangulo a b c = sqrt s*(s-a) * (s-b) * (s-c)
                        where s = (a + b + c)/2

--1.3
metades :: [Int] -> ([Int], [Int])
metades x = (take b x , drop b x)
            where b = length x `div` 2

--1.3 with a different function
metades2 :: [Int] -> ([Int], [Int])
metades2 x = splitAt b x
            where b = length x `div` 2

--1.4 a
lastWithReverse :: [Int] -> Int
lastWithReverse x = head (reverse x)

--1.4 a
lastWithDrop :: [Int] -> Int
lastWithDrop x = head (drop (length x - 1) x)

--1.4 a with index notation
lastWithIndex :: [Int] -> Int
lastWithIndex x = x !! max 0 (length x - 1)

--1.4 b
initWithTake :: [Int] -> [Int]
initWithTake x = take (length x - 1) x

--1.4 b
initWithReverse :: [Int] -> [Int]
initWithReverse x = reverse (tail (reverse x))

--1.5 with let
binom :: Integer -> Integer -> Integer
binom n k = let b = product [1..n]
                a = n-k
            in b `div` b * product [1..a]
            
--1.5 with where
binom2 :: Integer -> Integer -> Integer
binom2 n k = b `div` b * product [1..a]
                where b = product [1..n]
                      a = n-k
--1.6
raizes :: Float -> Float -> Float -> (Float, Float)
raizes a b c = ((-b + e) / (2 * a) , (-b - e) / (2 * a))
                        where e = sqrt b*b - 4 * a * c

--1.7
--[′a′, ′b′, ′c′] :: [Char]
--(′a′, ′b′, ′c′) :: [(Char, Char, Char)]
--[(False,′0′), (True,′1′)] :: [(Bool, Char)]
--([False,True], [′0′,′1′]) :: ([Bool], [Char])
--[tail, init, reverse] :: [([a]->[a])]
--[id, not] :: [(Bool -> Bool)]

--1.8
segundo :: [a] -> a
segundo xs = head (tail xs)

trocar :: (b, a) -> (a, b)
trocar (x, y) = (y, x)

par :: a -> b -> (a, b)
par x y = (x, y)

dobro :: Num a => a -> a
dobro x = 2 * x

metade :: Fractional a => a -> a
metade x = x / 2

minuscula :: Char -> Bool
minuscula x = x >= 'a' && x <= 'z'

intervalo :: Ord a => a -> a -> a -> Bool
intervalo x a b = x >= a && x <= b

palindromo :: Eq a => [a] -> Bool
palindromo xs = reverse xs == xs

twice :: (t -> t) -> t -> t
twice f x=f (f x)

--1.9
classifica :: Int -> String
classifica a = 
    if a < 0 || a > 20
        then "erro"
    else if a <= 9 then "reprovado"
    else if a <= 12 then "suficiente"
    else if a <= 15 then "bom"
    else if a <= 18 then "muito bom"
    else if a <= 20 then "muito bom e com distinção"
    else "erro"

--1.9 with guards
classifica1 :: Int -> String
classifica1 a
  | a < 0 || a > 20 = "erro"
  | a <= 9 = "reprovado"
  | a <= 12 = "suficiente"
  | a <= 15 = "bom"
  | a <= 18 = "muito bom"
  | a <= 20 = "muito bom e com distinção"
  | otherwise = "erro"

--1.10
classificaIMC :: Float -> Float -> String
classificaIMC a b  
    | imc < 18.5 = "baixo peso"
    | imc < 25 = "peso normal"
    | imc < 30 = "excesso de peso"
    | otherwise = "obesidade"
    where imc = a / (b * b)

--1.11 a)

