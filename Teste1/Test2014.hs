--ex 1a) b)
inserir :: Ord a => a -> [a] -> [a]
inserir n [] = [n]
inserir n (x:xs)
            | n <= x = n : x : xs
            | otherwise = x : inserir n xs 

--ex2
data Arv a = Vazia | No a (Arv a) (Arv a)
tamanho :: Arv a -> Int
tamanho Vazia = 1
tamanho (No x esq dir) = tamanho esq + tamanho dir
altura :: Arv a -> Int
altura Vazia = 0
altura (No x esq dir) = 1 + max (altura esq) (altura dir)