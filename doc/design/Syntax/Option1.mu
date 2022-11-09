data Boolean {
    True,
    False,
}

fn if(cond: Boolean, trueValue: a, falseValue: a): a
    = match cond {
        True -> trueValue;
        False -> falseValue;
    };

data List a {
    Node(a, List a),
    Empty,
}

data Choice a b {
    First(a),
    Second(b),
}

fn elimChoice(af: a -> c, bf: b -> c, choice: Choice a b): c
    = match choice {
        First(a) -> af(a);
        Second(b) -> bf(b);
    };

trait Functor f {
    fn map(f: a -> b, x: f a): f b;
}

impl Functor List {
    fn map(f, list) = match list {
        Node(a, next) -> Node(f a, map f next);
        Empty -> Empty;
    };
}
