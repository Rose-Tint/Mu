#include <memory>

enum Boolean {
    True,
    False
};

template<typename A>
A if_(Boolean& cond, A& trueVal, A& falseVal) {
    switch (cond) {
        case True:
            return trueVal;
        case False:
            return falseVal;
    }
}

template<typename A>
struct List {
public:
    enum : bool { NODE, EMPTY } tag;
private:
    union {
        struct {
            A value;
            std::unique_ptr<List<A>> next;
        } node;
        struct { } empty;
    };
public:
    static List<A> Node(A value, std::unique_ptr<List<A>> next) {
        return List<A> { NODE, { value, next } };
    }

    static List<A> Empty() {
        return List<A> { EMPTY, { } };
    }
};

template<typename A, typename B>
struct Choice {
public:
    enum : bool { FIRST, SECOND } tag;
private:
    union {
        struct { A value; } first;
        struct { B value; } second;
    };
public:
    static Choice<A, B> First(A value) {
        return Choice<A, B> { FIRST, value };
    }

    static Choice<A, B> Second(B value) {
        return Choice<A, B> { SECOND, value };
    }

    template<typename A_, typename B_, typename C>
    friend C elimChoice(
        C(*af)(A),
        C(*bf)(B),
        Choice<A, B>& choice
    );
};

template<typename A, typename B, typename C>
C elimChoice(
    C(*af)(A),
    C(*bf)(B),
    Choice<A, B>& choice
) {
    switch (choice.tag) {
        case Choice<A, B>::FIRST:
            return af(choice.first);
        case Choice<A, B>::SECOND:
            return bf(choice.second);
    }
}

// CANNOT DO TRAITS EFFICIENTLY
