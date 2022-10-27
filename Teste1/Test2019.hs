[[1,2]]++[[]]++[[3,4],[5]] = [[1,2],[],[3,4],[5]]
([1,2]:[]:[3,4]:[[5]]) !! 3 = [5]
length ([]:[]:[]) = 2
drop 4 [0,4..32] = [16,20,24,28,32]
[(x+y,x*y)| x<-[1..4], y<-[x+1..4]] = [(3,2), (4,3),(5,4),(5,6),(6,8),(7,12)]
[[y | y<-ys, y `mod` 2 == 0 ] | ys <- [[3,5,2,8],[4,6,7,1,3],[9,5,11]]] = [2,8,4,6]
[(0,6),(1,5),(2,4),(3,3),(4,2),(5,1),(6,0)] = [(x,6-x) | x <- [0..6]]
h [] = 1
h [x] = x
h (x:y:xs) = x*y + h (y:xs)
h [1,3,1,5,0,4] = 1*3 + h [3,1,5,0,4] = 3*1 + h [1,5,0,4] = 1*5 + h [5,0,4] = 5*0 + h [0,4] = 0*4 + h [4] = 4
4 + 5 + 3 + 3
[(’1’,"a"),(’2’,"b")] -> [(Char, String)]
f x xs = sum xs < x = f :: (Ord a, Num a) => a -> [a] -> Bool
ig :: Eq a => [a] -> Bool
ig [] = True
ig [x] = True
ig (x1:x2:xs) = x1 == x2 && ig (x2:xs)
fix :: Eq a -> (a->a) -> a -> Bool
fix f x = f x == x

pitagoricos :: Int -> Int -> Int -> Bool
pitagoricos a b c
    | (a^2 + b^2 == c^2) || (a^2 + c^2 == b^2) || (b^2 + c^2 == a^2) = True
    | otherwise = False

hipotenusa :: Float -> Float -> Float
hipotenusa a b = sqrt (a^2 + b^2)

diferentesRecur :: Eq a => [a] -> [a]
diferentesRecur [] = []
diferentesRecur [x] = [x]
diferentesRecur (x:xs) = (if x /= head xs then [x] else []) ++ diferentesRecur xs

diferentesLista :: Eq a => [a] -> [a]
diferentesLista xs = [x | (x,y) <- zip xs (tail xs), x /= y  ]

zip3 ::[a] -> [a] -> [a] -> [(a,a,a)]
zip3  