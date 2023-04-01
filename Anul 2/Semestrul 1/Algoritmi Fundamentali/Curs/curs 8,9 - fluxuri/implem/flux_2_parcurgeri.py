from collections import deque
def bf(s, n,la,lin, f,  cost, tata, viz):
       
    for i in range(n+1):
    	viz[i]=tata[i]=0
    
    c=deque()
    
    c.append(s)
    viz[s]=1
    while(len(c)>0):
        x=c.popleft()
        for y in la[x]:
                                                         
            if viz[y]==0 and f[x][y]<cost[x][y]:
                tata[y]=x
                if y==n:
                    return 1
                c.append(y)
                viz[y]=1
  
        for y in lin[x]:                                              
            if viz[y]==0 and f[y][x]>0:
                tata[y]=-x
                if y==n:
                    return 1
                c.append(y)
                viz[y]=1

    return 0      

  


fin =open("maxflow.in")
fout=open("maxflow.out","w")
  
c_max=0
   
n,m=[int(x) for x in fin.readline().split()]
tata=[0]*(n+1)
viz=[0]*(n+1)

f=[[0 for i in range(n+1)] for j in range(n+1)]
cost=[[0 for i in range(n+1)] for j in range(n+1)]

la=[[] for i in range(n+1)]
lin=[[] for i in range(n+1)]
for i in range(m):
    x,y,c=[int(x) for x in fin.readline().split()]
   
    la[x].append(y)
    lin[y].append(x)  
    cost[x][y]=c
    f[x][y]=0
    
    if c>c_max:
        c_max=c

 
fin.close()
fmax=0
s=1 #sursa
t=n #destinatia
 
while bf(s,n,la,lin,f,cost,tata,viz):      
    #calculam i(P) = capacitatea reziduala minima pe un arc de pe drumul de la s la t determinat cu bf   
    iP=c_max #i(P)
    t=n
    fout.write("lantul (afisat invers -tema de modificat): ")    
    while t!=s:
        fout.write(f"{t} ")
        if tata[t]>=0: #arc direct - capacitate c(e)-f(e)
            if cost[tata[t]][t]-f[tata[t]][t]<iP:
                iP= cost[tata[t]][t]-f[tata[t]][t]  
            t=tata[t]     
        
        else: #arc invers - capacitate f(e) 
            if  f[t][-tata[t]]<iP:
               iP= f[t][-tata[t]]
            t=-tata[t]
        
            
    
    fout.write(f"{s} ") 
    fout.write(f" capacitate {iP}\n")
    #revizuim fluxul de-a lungul lantului determinat 
    t=n;
    while t!=s:
        if tata[t]>=0 : #arc direct - creste fluxul cu iP
            f[tata[t]][t]+=iP 
            t=tata[t]
        
        else: #arc invers - scade fluxul cu iP
            f[t][-tata[t]]-=iP
            t=-tata[t]
           
                 
    fmax+=iP #creste valoarea fluxului cu iP
       
        
fout.write("-----------------------------------------\n")
fout.write(f"valoarea fluxului maxim = {fmax} \n")
fout.write("un flux maxim: \n")

for u in range(1,n+1):
    for v in la[u]:
        fout.write(f"arcul {u} {v} flux {f[u][v]}\n")
    
fout.close()
                                


