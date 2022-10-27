import Distribution.Simple.Utils (xargs)
--3.1
--map f (filter p xs)

--3.2
dec2int :: [Int] -> Int
dec2int xs = foldl (\x y -> x*10 + y) 0 xs

--3.3
zipWithrecur :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWithrecur _ _ [] = []
zipWithrecur _ [] _ = []
zipWithrecur f (x:xs) (y:ys) = f x y : zipWithrecur f xs ys

--3.4
insert :: Ord a => a -> [a] -> [a]
insert a [] = [a]
insert a (x:xs)
            | a < x = a : x : xs
            | otherwise = x : insert a xs

isortr :: Ord a => [a] -> [a]
isortr xs = foldr insert [] xs

--3.6
mdc :: Int -> Int -> Int
mdc a b = fst (until (\(a,b) -> b ==0) (\(a,b) -> (b, mod a b)) (a,b))

--3.7 a)
(+++) :: [a] -> [a] -> [a]
(+++) xs ys = foldr (:) ys xs

--3.7 b)
myconcat :: [[a]] -> [a]
myconcat = foldr (+++) []

--3.7 c)
myreverser :: [a] -> [a]
myreverser = foldr (\y ys -> ys ++ [y]) []

--3.7 d)
myreversel :: [a] -> [a]
myreversel = foldl (\ys y -> y : ys) []

--3.7 e)
myelem :: Eq a => a -> [a] -> Bool
myelem n = any (==n)

--3.8 a)
palavras :: String -> [String]
palavras [] = []
palavras (' ':xs) = palavras xs
palavras xs = [y | y <- word] : palavras rest
     where word = takeWhile (' ' /= ) xs
           rest = dropWhile (' ' /= ) xs

--3.8 b)
despalavras :: [String] -> String
despalavras = foldl1 (\x y -> x ++ " " ++ y)
