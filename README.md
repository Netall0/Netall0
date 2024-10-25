# Hi there 🧃


![bd565dcc0a556add0b0a0ed6b26d686e](https://github.com/Netall0/Netall0/assets/113532176/3b1d4b44-6a21-4538-a6ec-2ba2a7c53f63)



<!--START_SECTION:waka-->
![Code Time](http://img.shields.io/badge/Code%20Time-340%20hrs%2042%20mins-blue)

📊 **This Week I Spent My Time On** 

```text
🕑︎ Time Zone: Asia/Novosibirsk

🔥 Editors: 
VS Code                  8 hrs 9 mins        █████████████████████████   100.00 % 

💻 Operating System: 
Windows                  8 hrs 9 mins        █████████████████████████   100.00 % 
```


 Last Updated on 19/10/2024 18:38:59 UTC
<!--END_SECTION:waka-->

#include<bits/stdc++.h> 

#define int long long 

using namespace std; 

int bin_search(int a, int b){ 
    int l = -1, r = a + 1; 
    while(r - l > 1){ 
        int m = (l + r) / 2; 
        if(m * b <= a){ 
            l = m; 
        } 
        else{ 
            r = m; 
        } 
    } 
    return l; 
} 

int bin_prod (int a, int b) { 
 int res = 1; 
 while (b) { 
  if (b & 1) 
   res += a; 
  a += a; 
  b >>= 1; 
 } 
 return res - 1; 
} 

int mx(int a, int b){ 
    return a + b - max(a, b); 
} 

int f(int a, int b){ 
    return max(a, b) - min(a, b); 
} 


signed main(){ 

  int a, b, c, d, n; 
    cin >> a >> b >> c >> d >> n; 

    int aa = 0, bb = 0, cc = 0, dd = 0; 

    int B1 = bin_prod(d, 4); 
    int B2 = B1 + bin_prod(3, f(c, d)); 
    int B3 = B2 + bin_prod(2, f(b, c)); 
    int B4 = B3 + f(a, b); 


    int z4 = bin_search(n, 4); 
    int z3 = bin_search(f(n, B1), 3); 
    int z2 = bin_search(f(n, B2), 2); 
    int z1 = bin_search(f(n, B3), 1); 


    aa += mx(z4, d); 
    bb += mx(z4, d); 
    cc += mx(z4, d); 
    dd += mx(z4, d); 

    if(n <= B1){ 
        aa += (n - bin_prod(4, z4) >= 1); 
        bb += (n - bin_prod(4, z4) >= 2); 
        cc += (n - bin_prod(4, z4) >= 3); 
    } 

    if(B1 < n){ 
        aa += mx(z3, f(c, d)); 
        bb += mx(z3, f(c, d)); 
        cc += mx(z3, f(c, d)); 
    } 

    if(B1 < n && n <= B2){ 
        aa += (n - B1 - bin_prod(3, z3) >= 1); 
        bb += (n - B1 - bin_prod(3, z3) >= 2); 
    } 


    if(B2 < n){ 
        aa += mx(z2, f(b, c)); 
        bb += mx(z2, f(b, c)); 
    } 

    if(B2 < n && n <= B3){ 
        aa += (n - B2 - bin_prod(2, z2) >= 1); 
    } 


    if(B3 < n){ 
        aa += mx(z1, f(a, b)); 
    } 

    cout << aa + mx(cc, f(a, aa)) << endl; 
    cout << bb + mx(dd, f(b, bb)) << endl; 
    cout << cc + mx(aa, f(c, cc)) << endl; 
    cout << dd + mx(bb, f(d, dd)) << endl; 



}


