#include <iostream>

using namespace std;

class A {
protected:
    int x;
public:
    virtual void f () {
        cout << "A::f()" << endl;
    }
    virtual ~A () {
        cout << "~A" << endl;
    }
};

class B : public A {
protected:
    int x; 
public:
    void f () {
        cout << "B::f()" << endl;
    }
    ~B () {
        cout << "~B" << endl;
    }
};

class C: public B {
public: 
    void f () {
        cout << "C::f()" << endl;
    }
    ~C () {
        cout << "~C" << endl;
    }
};

class D: public B {
};


int main(){
    C c;
    A a = c;
    a.f(); // se apeleaza A::f()
    
    A&ra = c;
    ra.f(); // se apeleaza C::f()
    
    B *pa = new C();
    pa->f(); // se apeleaze C::f()

    D d;
    A &rav = d;
    rav.f(); // se apeleaza B::f() deoarece D nu suprascrie f()

    delete pa; // se apeleaza ~C deoarece si destructorul este virtual
               // daca destructorul nu era virtual, atunci se apela ~A
    return 0;
}