[2,3,1] ++ [4] ++ [4] = [2,3,1,4,4]
take 5 [0,10..] = [0,10,20,30,40]
tail ([1,2]:[]:[3,4]:[[5]]) = [[ ],[3,4], [5]]
[1,3,4,5,6,9] !! 3 = 5
[1 | x <- [1..3], y <- [1..x]] = [1,1,1,1,1,1]
[(x,y) | x <- [1..3], y <- [2..4], (x+y) == 5] = [(1,4), (2,3), [3,2]]
[1,2,4,8,16,32,64] = [x | y <- [1..7], x <- y*2]

f 0 = 0
f n = n*f (n-1)
f 5 = 0

[(False,0),(True,1)] = [(Bool, Int)]

troca :: a -> a
troca (x,y) = (y,x)

g :: (Num a, Ord a) => a -> a -> a
g x y | x <= y = g x (y-1)
| otherwise = x + y

ttriangulo :: Int -> Int -> Int -> String
ttriangulo x y z
    | x == y && x == z = "todos iguais"
    | (x == y && x /= z) || (x == z && x /= y ) = "dois iguais"
    | (y==x && y /= z) || (y==z && y /= x) = "dois iguais"
    | (z == x && z /= y) || (z==y && z /= x) = "dois iguais"
    | otherwise = "todos diferentes"


maiores:: Ord a => [a] -> [a]
maiore [x] = [];
maiores (x:xs) = (if x > (head xs) then [x] else []) ++ maiores xs;

somaparesLista :: [(Int, Int)] -> [Int]
somaparesLista xs = [uncurry (+) x | x <- xs]

somaparesRecursao :: [(Int, Int)] -> [Int]
somaparesRecursao xs = map (uncurry (+)) xs