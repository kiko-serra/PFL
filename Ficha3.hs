import Data.Bitraversable (Bitraversable)
--3.1
--[f x | x <- xs, p x]
--map f (filter p xs)

--3.2
dec2int :: [Int] -> Int
dec2int (x:xs) = foldl (\ x y -> x*10 + y) 0 (x:xs)

--3.3
myzipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myzipWith f [] (y:ys) = []
myzipWith f (x:xs) [] = []
myzipWith f (x:xs) (y:ys) = f x y : myzipWith f xs ys

--3.4
insert :: Ord a => a -> [a] -> [a]
insert a [] = [a]
insert a (x:xs)
    | a < x = a : x : xs
    | otherwise = x : insert a xs

myisort :: Ord a => [a] -> [a]
myisort = foldr insert []

--3.5 a)
mymaximum :: Ord a => [a] -> a
mymaximum = maximum

myminimum :: Ord a => [a] -> a
myminimum = minimum

--3.5 b)
myfoldl1 :: (a -> a -> a) -> [a] -> a
myfoldl1 f (x:xs) = foldl f x xs

myfoldr1 :: (a -> a -> a) -> [a] -> a
myfoldr1 = foldr1

--3.6
troca :: (Int, Int) -> (Int, Int)
troca (a,b) = (b, mod a b)

mymdc :: Int -> Int-> Int
mymdc a b = fst (until (\(a,b) -> b==0) troca (a,b))

--3.7 a)
myconcatr :: [a] -> [a] -> [a]
myconcatr xs ys = foldr (:) ys xs

--3.7 b)
myconcatl :: [[a]] -> [a]
myconcatl = concat

--3.7 c)
myreverse :: [a] -> [a]
myreverse = foldr (\a b -> b ++ [a]) []

--3.7 d)
myreverse2 :: [a] -> [a]
myreverse2 = foldl (\a b -> b : a) []

--3.7 e)
myelem :: Eq a => a -> [a] -> Bool
myelem a = any (== a)

--3.8 a)
mypalavras :: String -> [String]
mypalavras [] = []
mypalavras x = takeWhile (/= ' ') x : mypalavras (dropWhile (== ' ') (dropWhile (/= ' ') x))
