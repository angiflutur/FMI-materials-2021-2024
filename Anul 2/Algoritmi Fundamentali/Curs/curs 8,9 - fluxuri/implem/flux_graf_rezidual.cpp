#include <queue>
#include<fstream>
#include <cstring>
//Ipoteza: nu exista simultan ambele arce ij si ji
using namespace std;

int bf(int s, int n, vector<int> *la, long **f, long **cost, long **rezid, int *tata, int *viz){
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
            if(viz[y]==0 && rezid[x][y]>0){
                tata[y]=x;
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
    ifstream fin("maxflow.in");
    ofstream fout("maxflow2.out");
	int n,m,i,j;
	vector<int> *la;
	vector<int> *larezid; 
	
    
    long **f,**cost,**rezid;
    
 
    int x,y;
    long c,c_max;
    //l -liste de adiacenta pentru graful rezidual   
    //linit - liste de adiacenta pentru graful initial
    fin>>n>>m;
    la=new vector<int>[n+1];
    larezid=new vector<int>[n+1];
    
    f=new long*[n+1];
    cost=new long*[n+1];
    rezid=new long*[n+1];
	for(i=0;i<=n;i++){
		f[i]=new long[n+1];
		cost[i]=new long[n+1];
		rezid[i]=new long[n+1];
	}
	
	for(i=0;i<=n;i++)
		for(j=0;j<=n;j++)
			f[i][j]=cost[i][j]=rezid[i][j]=0;
			
    
    for(i=1;i<=m;i++){
        fin>>x>>y>>c;
        la[x].push_back(y);
        larezid[x].push_back(y);
        larezid[y].push_back(x); //arc invers in graful rezidual
        
		rezid[x][y]=c; 
		rezid[y][x]=0;//pe y,x capacitatea este 0
		
		if (c>c_max)
        	c_max=c;
    }
     
    fin.close();
    int *tata=new int[n+1];
    int *viz=new int[n+1];
			
    long fmax=0;
    int s=1;//sursa
    int t=n;//destinatia
     
    while(bf(s,n,larezid,f,cost,rezid,tata,viz)){      
		//calculam i(P) = capacitatea reziduala minima pe un arc de pe drumul de la s la t determinat cu bf   
        long iP=c_max; //i(P)
        t=n;     
        fout<<"drumul: ";    
        while(t!=s)  {
        	fout<<t<<" ";
            if(iP>rezid[tata[t]][t])
                iP= rezid[tata[t]][t];  
            t=tata[t];     
        } 
        fout<<s<<" "; 
        fout<<" capacitate "<<iP<<endl;
          //revizuim fluxul de-a lungul lantului determinat 
        t=n;
        while(t!=s)  {
            rezid[tata[t]][t]-=iP;  
            rezid[t][tata[t]]+=iP;    
            t=tata[t]; 
        }         
        fmax+=iP; //creste valoarea fluxului cu iP
           
    }        
    fout<<"-----------------------------------------"<<endl;
    fout<<"valoarea fluxului maxim = "<<fmax<<endl;
    fout<<"un flux maxim: "<<endl;
    
    for(int u=1;u<=n;u++)
    	for(j=0;j<la[u].size();j++){
    		int v=la[u][j];
       			fout<<"arcul "<<u<<" "<<v<<" flux "<<rezid[v][u]<<endl;
		}
    fout.close();
                                    
    return 0;   
}
