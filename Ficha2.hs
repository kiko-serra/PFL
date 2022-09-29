import Data.Time (CalendarDiffDays(cdDays))
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