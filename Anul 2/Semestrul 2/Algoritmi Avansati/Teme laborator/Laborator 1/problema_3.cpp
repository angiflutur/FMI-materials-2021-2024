#include <iostream>
#include <vector>

using namespace std;

vector<pair<long, long>> puncte;
vector<pair<long, long>> frontiera;

long det(pair<long, long> &p, pair<long, long> &q, pair<long, long> &r)
{
    long x1, x2, x3;
    long y1, y2, y3;

    x1 = p.first;
    y1 = p.second;

    x2 = q.first;
    y2 = q.second;

    x3 = r.first;
    y3 = r.second;

    return x2 * y3 + x1 * y2 + x3 * y1 - x2 * y1 - x3 * y2 - x1 * y3;
}

void citire(long n)
{
    long x, y;

    for (long i = 0; i < n; i++)
    {
        cin >> x >> y;
        puncte.push_back({x, y});
    }
}

void graham(long n)
{
    // adaugam primele 2 puncte in frontiera
    frontiera.push_back(puncte[0]);
    frontiera.push_back(puncte[1]);

    for (long i = 2; i < n; i++)
    {
        // cat timp frontiera are mai mult de 2 puncte
        //       si ultimele 3 nu determina viraj la stanga
        while (frontiera.size() >= 2 && det(frontiera[frontiera.size() - 2], frontiera[frontiera.size() - 1], puncte[i]) <= 0)
            frontiera.pop_back();
        frontiera.push_back(puncte[i]);
    }

    // legam frontiera cu primul punct de pe frontiera si verificam daca se afla la stanga dreptei formate din ultimele 2 puncte
    if (frontiera.size() >= 2 && (det(frontiera[frontiera.size() - 2], frontiera[frontiera.size() - 1], puncte[0]) <= 0))
    {
        frontiera.pop_back();
        
        // am sters ultimul punct de pe frontiera, verificam daca al doilea punct
        // este la stanga fata de dreapta formata din primul si ultimul punct
        // daca nu este la stanga, ultimul punct nu este bun
        if (frontiera.size() >= 2 && (det(puncte[n - 1], puncte[0], puncte[1]) <= 0))
            frontiera.pop_back();
    }
}

void afisare()
{
    cout << frontiera.size() << endl;

    for (unsigned long int i = 0; i < frontiera.size(); i++)
        cout << frontiera[i].first << " " << frontiera[i].second << endl;
}
int main()
{
    long n;

    cin >> n;

    citire(n);

    graham(n);

    afisare();

    return 0;
}