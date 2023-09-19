#include <iostream>
#include <vector>
using namespace std;

int determinant(int x1, int y1, int x2, int y2, int x3, int y3)
{
    return x2 * y3 + x1 * y2 + x3 * y1 - x2 * y1 - x3 * y2 - x1 * y3;
}

int main()
{
    int n, m, index1, index2;
    cin >> n;
    vector<pair<int, int>> p;
    for (int i = 0; i < n; i++)
    {
        int x, y;
        cin >> x >> y;

        if (p.size() >= 2)
        {
            int r = determinant(p[p.size() - 2].first, p[p.size() - 2].second, p[p.size() - 1].first, p[p.size() - 1].second, x, y);
            if (r == 0)
            {
                p.pop_back();
            }
        }

        p.push_back({x, y});
    }

    n = p.size();

    int r = determinant(p[n - 2].first, p[n - 2].second, p[n - 1].first, p[n - 1].second, p[0].first, p[0].second);
    if (r == 0)
    {
        p.pop_back();
        n--;
    }

    r = determinant(p[n - 1].first, p[n - 1].second, p[0].first, p[0].second, p[1].first, p[1].second);
    if (r == 0)
    {
        p.erase(p.begin());
        n--;
    }

    cin >> m;

    vector<string> output;
    while (m--)
    {
        int right = 0, left = 0, touch = 0;
        int x, y;
        cin >> x >> y;

        for (int i = 0; i < n; i++)
        {
            int r = determinant(p[i].first, p[i].second, p[(i + 1) % n].first, p[(i + 1) % n].second, x, y);
            if (r == 0)
            {
                if (touch == 0)
                {
                    index1 = i;
                }
                else
                {
                    index2 = i;
                }
                touch++;
            }
            else if (r > 0)
            {
                left++;
            }
            else
            {
                right++;
            }

            if (touch == 2)
            {
                break;
            }

            if (right != 0 && left != 0)
            {
                break;
            }
        }

        if (left == n)
        {
            output.push_back("INSIDE");
        }
        else if ((touch == 1 && right == 0) || (touch == 2 && (index2 == index1 + 1 || (index2 == n - 1 && index1 == 0))))
        {
            output.push_back("BOUNDARY");
        }
        else
        {
            output.push_back("OUTSIDE");
        }
    }

    for (string s : output)
    {
        cout << s << endl;
    }

    return 0;
}