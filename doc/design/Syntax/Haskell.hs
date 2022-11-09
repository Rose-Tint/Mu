{-# LANGUAGE NoImplicitPrelude #-}

module Haskell (
    module Haskell,
) where

data Boolean
    = True
    | False

if' :: Boolean -> a -> a -> a
if' True trueValue _ = trueValue
if' False _ falseValue = falseValue

data List a
    = Node a (List a)
    | Empty

data Choice a b
    = First a
    | Second b

elimChoice :: (a -> c) -> (b -> c) -> Choice a b -> c
elimChoice af _bf (First a) = af a
elimChoice _af bf (Second b) = bf b

class Functor f where
    map :: (a -> b) -> f a -> f b

instance Functor List where
    map f (Node a next) = Node (f a) (map f next)
    map _ Empty = Empty
