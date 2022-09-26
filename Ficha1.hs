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