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
