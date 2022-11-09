pub enum Boolean {
    True,
    False,
}

pub fn if_<A>(cond: Boolean, trueVal: A, falseVal: A) -> A {
    match cond {
        True => return trueVal;
        False => return falseVal;
    }
}

pub enum List<A> {
    Node(A, List A),
    Empty,
}

pub enum Choice<A, B> {
    First(A),
    Second(B),
}

pub fn elimChoice<A, B, C>(
    af: FnOnce(A) -> C,
    bf: FnOnce(B) -> C,
    choice: Choice<A, B>
) -> C {
    match choice {
        First(a) => return af a;
        Second(b) => return bf b;
    };
}

// TODO: traits!!!
