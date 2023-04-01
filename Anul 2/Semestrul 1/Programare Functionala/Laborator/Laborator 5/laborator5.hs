import Distribution.Simple.Program.HcPkg (list)
-- -- -- Laboratorul 5 PF -- -- --

-- ex.1

sumaPImp :: [Int] -> Int
sumaPImp l = foldr(+) 0 (map(\x -> if odd x then x^2 else 0) l)

    --sau:
    --      sumaPImp = sum.map(^2).filter odd
    --      sumaPImp = foldr (+) 0



-- ex. 2
checkTrue :: [Bool] -> Bool
checkTrue [] = True
checkTrue (l:ls) = foldr (&&) l ls
    -- sau:
    --      checkTrue= foldr (&&) True


-- ex. 3
allVerifies:: (Int->Bool) -> [Int] -> Bool
allVerifies f ls = foldr (&&) True (map f ls);
    -- sau:
    --      foldr(\i rez->f i && rez) True ls;

-- ex. 4
anyVerifies::(Int->Bool)->[Int]->Bool
anyVerifies p l = foldr (||) False (map(\x -> if p x then True else False) l);


-- ex. 5
mapFoldr::(a->b) -> [a] -> [b]
mapFoldr f l = foldr (\x result -> f x : result) [] l

filterFoldr:: (a->Bool) -> [a] -> [a]
filterFoldr f = foldr(\x result -> if f x then x:result else result) []


-- ex. 6

listToInt :: [Int] -> Int
listToInt = foldl (\rez i -> 10*rez + i) 0;
        -- [2,3,4,5] -> 2345


-- ex. 7
    -- a
rmChar :: Char -> String -> String
rmChar c = foldl (\rez i -> if c/=i then i:rez else rez) [];
        -- sau
        -- rmChar c = filter(/c) 
    -- b
rmCharsRec :: String -> String -> String
rmCharsRec [] str2 = str2;
rmCharsRec (c:str1) str2
    | c `elem` str2 = rmCharsRec str1 (rmChar c str2)
    | otherwise = rmCharsRec str1 str2

    -- c
rmCharsFold :: String -> String -> String
rmCharsFold l1 l2 = foldr (\i rez -> rmChar i rez) l2 l1
        -- sau foldr(rmChar) l2 l1