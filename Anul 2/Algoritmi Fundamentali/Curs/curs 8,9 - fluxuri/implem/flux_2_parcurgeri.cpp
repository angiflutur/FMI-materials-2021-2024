#include <queue>
#include<fstream>
#include <cstring>
#define NMX 10002
using namespace std;

int bf(int s,int n,vector<int> *la,vector<int> *lin, long **f, long **cost,int *tata,int*viz){
    int i,x;
    
    for(i=0;i<=n;i++)
    	viz[i]=tata[i]=0;
    queue<int> c;
    
    c.push(s);
    viz[s]=1;
    while(c.size()>0){
        x=c.front();
        c.pop();
        for(i=0;i<la[x].size();i++){  
            int y=la[x][i];                                              
            if(viz[y]==0 && f[x][y]<cost[x][y]){
                tata[y]=x;
                if(y==n)
                    return 1;
                c.push(y);
                viz[y]=1;
            } 
        }  
        for(i=0;i<lin[x].size();i++){  
            int y=lin[x][i];                                              
            if(viz[y]==0 && f[y][x]>0){
                tata[y]=-x;
                if(y==n)
                    return 1;
                c.push(y);
                viz[y]=1;
            } 
        }
    } 
    return 0;       
}
  
int main(){
	int n,m;
	vector<int> *la;
	vector<int> *lin; 
	

    ifstream fin("maxflow.in");
    ofstream fout("maxflow3.out");
	  
    int i,x,y,j;
    long c,c_max=0;
       
    fin>>n>>m;
    la=new vector<int>[n+1];
    lin=new vector<int>[n+1];
    
    
    long **f,**cost;
    f=new long*[n+1];
	for(i=0;i<=n;i++)
		f[i]=new long[n+1];
	cost=new long*[n+1];	
	for(i=0;i<=n;i++)
		cost[i]=new long[n+1];
	for(i=0;i<=n;i++)
		for(j=0;j<=n;j++)
			f[i][j]=cost[i][j]=0;
    for(i=1;i<=m;i++){
        fin>>x>>y>>c;
       
        la[x].push_back(y);
        lin[y].push_back(x); //liste adiacenta intrare
        cost[x][y]=c;
        f[x][y]=0;
        
        if (c>c_max)
        	c_max=c;
    }
     
    fin.close();
    long fmax=0;
    int s=1;//sursa
    int t=n;//destinatia
    int *tata=new int[n+1];
    int *viz=new int[n+1]; 
    while(bf(s,n,la,lin,f,cost,tata,viz)){      
		//calculam i(P) = capacitatea reziduala minima pe un arc de pe drumul de la s la t determinat cu bf   
        long iP=c_max; //i(P)
        t=n;     
        fout<<"lantul (afisat invers -tema de modificat): ";    
        while(t!=s)  {
        	fout<<t<<" ";
            if(tata[t]>=0){ //arc direct - capacitate c(e)-f(e)
                if(cost[tata[t]][t]-f[tata[t]][t]<iP)
                    iP= cost[tata[t]][t]-f[tata[t]][t];  
                t=tata[t];     
            }   
           else{ //arc invers - capacitate f(e) 
                if( f[t][-tata[t]]<iP)
                   iP= f[t][-tata[t]];
                t=-tata[t];
            }
                
        }  
        fout<<s<<" "; 
        fout<<" capacitate "<<iP<<endl;
          //revizuim fluxul de-a lungul lantului determinat 
        t=n;
        while(t!=s)  {
            if(tata[t]>=0 ){ //arc direct - creste fluxul cu iP
                f[tata[t]][t]+=iP;  
                t=tata[t];
            }   
            else{//arc invers - scade fluxul cu iP
                f[t][-tata[t]]-=iP;
                t=-tata[t];
            }   
        }              
        fmax+=iP; //creste valoarea fluxului cu iP
           
    }        
    fout<<"-----------------------------------------"<<endl;
    fout<<"valoarea fluxului maxim = "<<fmax<<endl;
    fout<<"un flux maxim: "<<endl;
    
    for(int u=1;u<=n;u++)
    	for(j=0;j<la[u].size();j++){
    		int v=la[u][j];
    		fout<<"arcul "<<u<<" "<<v<<" flux "<<f[u][v]<<endl;
		}
    fout.close();
                                    
    return 0;   
}
