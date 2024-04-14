#include <iostream>
#include <deque>
#include <vector>

using namespace std;

bool CompareStates(const deque<int>& c1, const deque<int>& c2){
    for(int i = 0; i < c1.size(); i++){
        if(c1[i] != c2[i]){
            return true;
        }
    }
    return false;
}

int main()
{
    int n;
    cout << "Introdu numarul de biti: ";
    cin >> n;
    deque<int> c(n), s(n);
    cout << "Biti:\n";
    for (int i = 0; i < n; i++) {
        cout << "bit no" << i + 1 << " = ";
        cin >> c[i];
    }

    cout << "Initial state:\n";
    for (int i = 0; i < n; i++) {
        cout << "bit no" << i << "-";
        cin >> s[i];
    }
    int xorNum;
    cout << "Numarul de coeficienti pentru xor: ";
    cin >> xorNum;
    vector<int> xorCoef;
    for(int i = 0; i < xorNum; i++){
        cout << "Coef no" << i+1 << ": ";
        int x;
        cin >>  x;
        xorCoef.push_back(x);
    }
    while(CompareStates(c, s)){
        int x = c[0];
        for(int i = 0 ; i < xorCoef.size(); i++){
            x = x ^ c[xorCoef[i]];
        }
        cout << x << " ";
        c.pop_front();
        c.push_back(x);
    }
    cout << "\nFinal result: ";
    for(int i = 0; i < s.size(); i++){
        cout << s[i] << " ";
    }

    return 0;
}
