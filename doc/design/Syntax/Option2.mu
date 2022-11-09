data Boolean
    = True
    | False
    ;

if : Boolean -> a -> a -> a;
if cond trueVal falseVal = match cond {
    True -> trueVal;
    False -> falseVal;
}

data List a
    = Node a (List a)
    | Empty
    ;

data Choice a b
    = First a
    | Second b
    ;

elimChoice : (a -> c) -> (b -> c) -> Choice a b -> c;
elimChoice af bf choice = match choice {
    First a -> af a;
    Second b -> bf b;
}

trait Functor f {
    map : (a -> b) -> f a -> f b;
}

impl Functor List {
    map f list = match list {
        Node a next -> Node (f a) (map f next);
        Empty -> Empty;
    }
}
