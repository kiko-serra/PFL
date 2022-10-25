import Data.Char
import Control.Monad.ST (ST)
--2.1 a)
myand :: [Bool] -> Bool
myand [] = True
myand (x:xs) = x == True && myand xs

--2.1 b)
myor :: [Bool] -> Bool
myor [] = False
myor (x:xs) = x == True || myor xs

--2.1 c)
myconcat :: [[a]] -> [a]
myconcat [] = []
myconcat (x:xs) = x ++ myconcat xs

--2.1 d)
myreplicate :: Int -> a -> [a]
myreplicate 0 _ = []
myreplicate n a = a : myreplicate (n-1) a

--2.1 e)
myindex :: [a] -> Int -> a
myindex xs 0 = head xs
myindex xs n = myindex (tail xs) (n-1)

--2.1 f)
myelem :: Eq a => a -> [a] -> Bool
myelem n [] = False
myelem n (x:xs)
            | x == n = True
            | otherwise = myelem n xs

--2.2
intersperse :: a -> [a] -> [a]
intersperse a [] = []
intersperse a (x:xs) = x : a : intersperse a xs

--2.3
mdc :: Integer -> Integer -> Integer
mdc a 0 = a
mdc a b = mdc b x
        where x = mod a b

--2.4 a)
insert :: Ord a => a -> [a] -> [a]
insert a [] = [a]
insert a (x:xs)
            | a < x = a : x : xs
            | otherwise = x : insert a xs

--2.4 b)
isort :: Ord a => [a] -> [a]
isort [] = []
isort [x] = [x]
isort (x:xs) = insert x (isort xs)

--2.5 a)
myminimum :: Ord a => [a] -> a
myminimum [a] = a
myminimum (x:y:xs)
                | x<=y = myminimum (x:xs)
                | otherwise = myminimum (y:xs)

--2.5 b)
mydelete :: Eq a => a -> [a] -> [a]
mydelete _ [] = []
mydelete n (x:xs)
                | x == n = xs
                | otherwise = x: mydelete n xs

--2.5 c)
myssort :: Ord a => [a] -> [a]
myssort [] = []
myssort xs = num : myssort (mydelete num xs)
                where num = myminimum xs

--2.6
somaQuadrada :: Int
somaQuadrada = sum [x*x | x<- [1..100]]

--2.7 a)
aprox :: Int -> Double
aprox n = 4 * sum [(-1)^x / fromIntegral (2*x+1) | x <- [0..n]]

--2.7 b)
aprox2 :: Int -> Double
aprox2 n =  sqrt(12 * sum [(-1)^x / fromIntegral (x+1)^2 | x <- [0..n]])

--2.8
dotprod :: [Float] -> [Float] -> Float
dotprod [] _ = 0
dotprod _ [] = 0
dotprod (x:xs) (y:ys) = x * y + dotprod xs ys

dotprod' :: [Float] -> [Float] -> Float
dotprod' xs ys
        | length xs /= length ys = error "Size needs to be the same"
        | otherwise = sum [x*y | (x,y) <- zip xs ys]

--2.9
divprod :: Integer -> [Integer]
divprod n = [x | x <- [1..n-1] , mod n x == 0]

--2.10
perfeitos :: Integer -> [Integer]
perfeitos n = [x | x <- [1..n], x == sum (divprod x)]

--2.11
pitagoricos :: Integer -> [(Integer , Integer , Integer )]
pitagoricos n = [(a,b,c) | a <- [1..n], b <- [1..n], c <- [1..n], a^2 + b^2 == c^2]

--2.12
primo :: Integer -> Bool
primo n = length (divprod n) == 1

--2.13
isMersenne :: Integer -> Bool
isMersenne n = primo n && not (null [i | i <- [0..n], (2^i-1) == n])

mersenne :: [Integer]
mersenne = [i | i <- [1..], isMersenne i]

--2.14
binom :: Integer -> Integer -> Integer
binom n k = n_fac `div` (k_fac* product[1..n-k])
        where n_fac = product [1..n]
              k_fac = product [1..k]

pascal :: Integer -> [[Integer]]
pascal n = [[binom x y | y <- [0..x]] | x <- [0..n]]

--2.15
cifrarLetra :: Int -> Char -> Char
cifrarLetra n l
        | isLetter l && isUpper l = chr (mod (ord l + n - ord 'A') 26 + ord 'A')
        | isLetter l && isLower l = chr (mod (ord l + n - ord 'a') 26 + ord 'a')
        | otherwise = l

cifrar :: Int -> String -> String
cifrar n xs = [cifrarLetra n l | l <- xs]

--2.16
