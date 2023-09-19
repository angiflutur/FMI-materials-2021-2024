#include <iostream>
using namespace std;

int main()
{
    int n, st = 0, dr = 0, eq = 0;
    int x1, y1;
    int x2, y2;
    int x3, y3;
    int delta;
    int x_start, y_start;

    cin >> n;
    cin >> x1 >> y1;
    cin >> x2 >> y2;

    x_start = x1;
    y_start = y1;

    for (int i = 2; i < n; i++)
    {
        cin >> x3 >> y3;

        delta = x2 * y3 + x1 * y2 + x3 * y1 - x2 * y1 - x3 * y2 - x1 * y3;
        if (delta < 0)
            dr++;
        else if (delta > 0)
            st++;
        else
            eq++;

        x1 = x2;
        y1 = y2;

        x2 = x3;
        y2 = y3;
    }
    delta = x2 * y_start + x1 * y2 + x_start * y1 - x2 * y1 - x_start * y2 - x1 * y_start;
    if (delta < 0)
        dr++;
    else if (delta > 0)
        st++;
    else
        eq++;
    cout << st << " " << dr << " " << eq;
    return 0;
}