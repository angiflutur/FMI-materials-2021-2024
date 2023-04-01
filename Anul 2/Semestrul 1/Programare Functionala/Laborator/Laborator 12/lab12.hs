import Data.Monoid


elem1 :: (Foldable t, Eq a) => a -> t a -> Bool
elem1 a = foldr (\a' acc -> a' == a || acc) False

null1 :: (Foldable t) => t a -> Bool
null1 = foldr (\ _ _ -> False) True

length1 :: (Foldable t) => t a -> Int
length1 = foldr (\_ l -> l + 1) 0

toList1 :: (Foldable t) => t a -> [a]
toList1 = foldr (:) []

fold1 :: (Foldable t, Monoid m) => t m -> m
fold1 = foldMap id

data Constant a b = Constant b

instance Foldable (Constant a) where
    foldMap f (Constant b) = f b

-- foldMap Sum (Constant 1) == Sum {getSum = 1}
-- foldMap show (Constant 1) == "1"

data Two a b = Two a b

instance Foldable (Two a) where
    foldMap f (Two a b) = f b

-- foldMap show (Two 'a' 2) == "2"
-- foldMap Sum (Two 'a' 2) == Sum {getSum = 2}

data Three a b c = Three a b c

instance Foldable (Three a b) where
    foldMap :: Monoid m => (a2 -> m) -> Three a1 b a2 -> m
    foldMap f (Three a b c) = f c

-- foldMap Sum (Three 'a' True 2) == Sum {getSum = 2}
-- foldMap show (Three 'a' 2 True) == "True"

data Three' a b = Three' a b b

instance Foldable (Three' a) where
    foldMap :: Monoid m => (a2 -> m) -> Three' a1 a2 -> m
    foldMap f (Three' a b1 b2) = f b1 `mappend` f b2

-- foldMap show (Three' 'a' False True) == "FalseTrue"
-- foldMap Sum (Three' 'a' 5 2) == Sum {getSum = 7}

data Four' a b = Four' a b b b

instance Foldable (Four' a) where
    foldMap :: Monoid m => (a2 -> m) -> Four' a1 a2 -> m
    foldMap f (Four' a b1 b2 b3) = f b1 `mappend` f b2 `mappend` f b3

-- foldMap show (Four' 'a' False True False) == "FalseTrueFalse"
-- foldMap Sum (Four' 'a' 5 2 1) == Sum {getSum = 8}

data GoatLord a = NoGoat | OneGoat a | MoreGoats (GoatLord a) (GoatLord a) (GoatLord a)

instance Foldable GoatLord where
    foldMap :: Monoid m => (a -> m) -> GoatLord a -> m
    foldMap f NoGoat = mempty
    foldMap f (OneGoat a) = f a
    foldMap f (MoreGoats g1 g2 g3) = foldMap f g1 `mappend` foldMap f g2 `mappend` foldMap f g3

-- foldMap Sum (MoreGoats NoGoat (OneGoat 2) (MoreGoats (OneGoat 3) NoGoat NoGoat )) == Sum {getSum = 5}
-- foldMap show (MoreGoats NoGoat (OneGoat 2) (MoreGoats (OneGoat 3) NoGoat NoGoat )) == "23"