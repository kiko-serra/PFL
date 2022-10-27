1:(5:(4:(3:[]))) = [1,5,4,3]
tail [4,5,6,9] = [5,6,9]
head ([2,3] ++ [1,4] ++ [4,6]) = 2
drop 5 [0,3..30] = [15,18,21,24,27,30]
length ([1,2]:[]:[3,4]:[[5]]) = 6
[x*y | x <- [1..3], y <- [x..3]] = [1,2,3,4,6,9]
[ x | x <- [1..3], y <- [1..3], (x+y) == 4] = [1,2,3]
[0,-1,2,-3,4,-5,6,-7,8,-9,10] = [ y*(-1)^y | y <- [0..10]]
h [] = 0
h (x:xs) = 1 + h xs
h [0..7] = 9
    h [0,1,2,3,4,5,6,7] = 1 + h [1,2,3,4,5,6,7] -> 1 + h [2,3,4,5,6,7] -> 1 + h [4,5,6,7]
    -> 1 + h [5,6,7] -> 1 + h [6,7] -> 1 + h [7] -> 1 + h [] -> 1 + 0

([’1’,’2’,’3’],[1.0,2.0,3.0]) :: ([Char], [Double])

numEqual :: Int -> Int -> Int -> Int
numEqual x y z
    | x == y && x == z = 3
    | (x == y && x /= z) || (x == z && x /= y ) = 2
    | (y==x && y /= z) || (y==z && y /= x) = 2
    | (z == x && z /= y) || (z==y && z /= x) = 2
    | otherwise = 0

enquantoPar :: [Int] -> [Int]
enquantoPar [] = []
enquantoPar (x:xs) = (if even x then [x] else []) ++ enquantoPar xs

natZip :: [a] -> [(Int, a)]
natZip [] = []
natZip xs = zip [1..length xs] xs

quadradosRecursao :: [Int] -> [Int]
quadradosRecursao [] = []
quadradosRecursao (x:xs) = x^2 : quadradosRecursao xs

quadradosLista :: [Int] -> [Int]
quadradosLista xs = [x^2 | x <- xs]
