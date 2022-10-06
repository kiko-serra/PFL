import Data.Char
import Data.List
--2.1 a)
myand :: [Bool] -> Bool
myand [] = True
myand (x : xs) = x && myand xs

--2.1 b)
myor :: [Bool] -> Bool
myor [] = False
myor (x : xs) = x || myor xs

--2.1 c)
myconcat :: [[a]] -> [a]
myconcat [] = []
myconcat (x : xs) = x ++ myconcat xs

--2.1 d)
myreplicate :: Int -> a -> [a]
myreplicate 0 x = []
myreplicate n x = x : myreplicate (n - 1) x

--2.1 e)
myselectn :: [a] -> Int -> a
myselectn x 0 = head x
myselectn x n = myselectn (tail x) (n - 1)

--2.1 f)
myelem :: Eq a => a -> [a] -> Bool
myelem n [] = False
myelem n (x : xs)
  | n == x = True
  | otherwise = myelem n xs

--2.2
myintersperse :: a -> [a] -> [a]
myintersperse n [] = []
myintersperse n [x] = [x]
myintersperse n (x : xs) = x : n : myintersperse n xs

--2.3
mdc :: Int -> Int -> Int 
mdc a b
    | b == 0 = a
    | otherwise = mdc b (a `mod` b)

--2.4 a)
myInsert :: Ord a => a -> [a] -> [a]
myInsert a [] = [a]
myInsert a (x:xs)
    | a < x = a : x : xs
    | otherwise = x : myInsert a xs

--2.4 b)
isort :: Ord a => [a] -> [a]
isort [] = []
isort [x] = [x]
isort (x:xs) = myInsert x (isort xs)

--2.5 a)
myminimum :: Ord a => [a] -> a
minumum [] = []
myminimum [a] = a
myminimum (x : y : xs)
  | x < y = myminimum (x : xs)
  | otherwise = myminimum (y : xs)

--2.5 b)
mydelete :: Eq a => a -> [a] -> [a]
mydelete a [] = []
mydelete a (x:xs)
  | x == a = xs
  | otherwise = x : mydelete a xs

--2.5 c)
myssort :: Ord a => [a] -> [a]
myssort [] = []
myssort [x] = [x]
myssort xs = minimum xs : myssort (mydelete (minimum xs) xs)

--2.6
somaQuadrados :: Integer
somaQuadrados = sum [x*x | x <-[1..100]]

--2.7 a)
aprox :: Int -> Double
aprox n = 4 * sum [(-1)^k / fromIntegral (2*k +1) | k <- [0..n]]

--2.7 b)
aprox' :: Int -> Double
aprox' n = sqrt(sum (take n [(-1)^k / fromIntegral((k+1)^2) | k <-[0..]]) * 12)

--2.8
dotprod :: [Float] -> [Float] -> Float
dotprod [] [] = 0
dotprod (x:xs) (y:ys) = x * y + dotprod xs ys

--2.9
divprop :: Integer -> [Integer]
divprop n = [i | i <-[1..(n-1)], mod n i == 0]

--2.10
perfeitos :: Integer -> [Integer]
perfeitos n =[i | i <-[1..n] , i == sum (divprop i)]

--2.11
pitagoricos :: Integer -> [(Integer , Integer , Integer )]
pitagoricos n = [(x,y,z) | x <- [1..n],y <-[1..n] , z <-[1..n],x^2 + y^2 == z^2]

--2.12
primo :: Integer -> Bool
primo n = length (divprop n) == 1

--2.13
isMerssene :: Integer -> Bool
isMerssene n = primo n && not (null [i | i <-[0..n],(2^i - 1) == n])

mersennes :: [Integer]
mersennes = [i | i <- [1..], isMerssene i]

--2.14
binom :: Integer -> Integer -> Integer
binom n k =  fact n `div` ( fact k * fact (n -k))
    where fact n = product [1..n]

pascal :: Integer -> [[Integer]]
pascal n = [[binom i j | j <- [0..i]] | i <- [0..n]]

--2.15
cifraLetra :: Int -> Char -> Char 
cifraLetra k x  
    | isLetter x && isUpper x = chr (mod (ord x + k - ord 'A' ) 26 + ord 'A' )
    | isLetter x && isLower x = chr (mod (ord x + k - ord 'a' ) 26 + ord 'a' )
    | otherwise  = x

cifrar :: Int -> String -> String
cifrar k xs = [cifraLetra k x | x <- xs]

--2.16
compConcat :: [[a]] -> [a]
compConcat xss =  [ x | xs <- xss,x <- xs]

compReplicate :: Int -> a -> [a]
compReplicate n x = [x | _ <-[1..n]]

comBangBang :: Int -> [a] -> a
comBangBang n xs = head [x | (x,y) <- zip xs [0..n],y==n]

--2.17
forte :: String -> Bool
forte xs = (length xs >= 8) && hasUpper && hasLower && hasNumber
  where 
    hasUpper = not (null [x | x <- xs, isUpper x])
    hasLower = not (null [x | x <- xs, isLower x])
    hasNumber = not (null [x | x <- xs, isNumber x])

--2.18 a)
mindiv :: Int -> Int
mindiv n  
    | null z  = n
    | otherwise  = head z 
    where z = [ i | i <- [2..floor (sqrt (fromIntegral n))],mod n i == 0]

--2.18 b)
primo2:: Int -> Bool
primo2 n = n >1 &&  (mindiv n  == n)

--2.19
recNub :: Eq a => [a] -> [a] 
recNub []  = []
recNub (x:xs) = x:recNub [y | y<-xs ,y /=x]

--2.20
transpose :: [[a]] -> [[a]]
transpose xss  = [ [xs !! i | xs <- xss] | i<- [0..(z-1)]  ]
    where z = length (head xss)

--2.21
algarismos :: Int -> [Int]
algarismos n 
    | n < 10  =  [n]
    | otherwise =  algarismos (div n 10) ++ [mod n 10]

--2.22
toBits :: Int -> [Int]
toBits 0 = [0]
toBits 1 = [1]
toBits n = toBits(div n 2) ++ [mod n 2] 

--2.23
fromBits :: [Int] -> Int
fromBits xs = sum [x*y | (x,y)<- zip xs (iterate (`div` 2) (2^(length xs - 1)))]

--2.24 a)
merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
  | x < y = x : merge xs (y:ys)
  | otherwise = y: merge (x:xs) ys

--2.24 b)



--permutacoes
permutacoes :: [Int] -> [[Int]]
permutacoes [] = [[]]
permutacoes xs = [x:l | x<- xs, l<- permutacoes(xs\\[x])]