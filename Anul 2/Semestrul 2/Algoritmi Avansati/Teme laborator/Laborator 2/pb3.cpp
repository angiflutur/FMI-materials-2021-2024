#include <iostream>
#include <vector>

using namespace std;

vector<pair<long, long>> puncte;

void citire(int n)
{
    long x, y;

    for (int i = 0; i < n; i++)
    {
        cin >> x >> y;
        puncte.push_back({x, y});
    }
}

bool rezolvare(int n, int axa)
{
    int pozitia = 0;
    long minimul, ultimul_punct, punctul_curent;
    bool crestere = true; // presupunem ca e in crestere

    if (axa == 0)
    {
        minimul = puncte[0].first;
        for (int i = 1; i < n; i++)
            if (puncte[i].first < minimul) // cautam punctul cu cel mai mic x
            {
                minimul = puncte[i].first;
                pozitia = i;
            }
        ultimul_punct = puncte[pozitia].first;

        for (int j = 1; j < n; j++)
        {
            punctul_curent = puncte[(j + pozitia) % n].first;

            // daca punctul curent este mai mare decat punctul precedent, atunci avem o descrestere
            if (punctul_curent < ultimul_punct) 
                crestere = false;

            // daca punctul curent este mai mic decat punctul precedent, dar totusi avem o descrestere
            // la un moment dat, returnam false
            if (punctul_curent > ultimul_punct && !crestere)
                return false;

            ultimul_punct = punctul_curent;
        }
        return true;
    }
    else if (axa == 1)
    {
        minimul = puncte[0].second;
        for (int i = 0; i < n; i++)
            if (puncte[i].second < minimul) // cautam punctul cu cel mai mic y
            {
                minimul = puncte[i].second;
                pozitia = i;
            }

        ultimul_punct = puncte[pozitia].second;

        for (int j = 0; j < n; j++)
        {
            punctul_curent = puncte[(j + pozitia) % n].second;
            if (punctul_curent < ultimul_punct)
                crestere = false;
            if (punctul_curent > ultimul_punct && !crestere)
                return false;
            ultimul_punct = punctul_curent;
        }
        return true;
    }
    return true;
}
int main()
{
    int n;

    cin >> n;

    citire(n);

    if (rezolvare(n, 0) == true)
        cout << "YES" << endl;
    else
        cout << "NO" << endl;

    if (rezolvare(n, 1) == true)
        cout << "YES";
    else
        cout << "NO";
    return 0;
}