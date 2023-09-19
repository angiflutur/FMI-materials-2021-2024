#include <iostream>
using namespace std;
int main()
{
    int t;
    long x_p, y_p;
    long x_q, y_q;
    long x_r, y_r;

    cin >> t;

    for (int i = 0; i < t; i++)
    {
        cin >> x_p >> y_p;
        cin >> x_q >> y_q;
        cin >> x_r >> y_r;

        long delta;

        delta = x_q*y_r + x_p*y_q + x_r*y_p - x_q*y_p - x_r*y_q - x_p*y_r;
        if (delta < 0)
            cout << "RIGHT" << endl;
        else if (delta > 0)
            cout << "LEFT" << endl;
        else
            cout << "TOUCH" << endl;
    }
    return 0;
}