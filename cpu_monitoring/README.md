top -bn1 | awk -F',' '/Cpu/ {  
     for(i=1;i<=NF;i++){  
         if($i ~ /id/){  
            split($i,a," ");   
              usage=100-a[1];   
            printf "CPU Usage : %.0f%%\n", usage  
        }  
    }  
}'  
  
  
  
Step 1: top -bn1  
top -bn1  
b → batch mode (non-interactive, script-friendly)  
n1 → run only once  
  
👉 Output includes:  
  
%Cpu(s):  4.5 us,  0.0 sy,  0.0 ni, 95.5 id, ...  
  
  
Step 2: awk -F','  
awk -F','  
  
Changes delimiter to comma (,)  
  
So instead of splitting by spaces, awk splits like this:  
  
Field	Value  
$1	%Cpu(s): 4.5 us  
$2	0.0 sy  
$3	0.0 ni  
$4	95.5 id  
$5	0.0 wa  
...	...
  
  
Step 3: /Cpu/  
/Cpu/  
  
Only process the line that contains "Cpu"  
  
  
Step 4: Loop through fields  
  
for(i=1;i<=NF;i++)  
NF → number of fields (after splitting by comma)  
Loop goes through each field one by one  
  
  
Step 5: Find idle field  
if($i ~ /id/)  
$i → current field  
~ /id/ → check if it contains "id"  
  
Example match:  
  
" 95.5 id"  
  
  
Step 6: Split the field  
split($i,a," ")  
  
Splits " 95.5 id" by space  
  
Result:  
  
a[1]	a[2]  
95.5	id  
  
  
Step 7: Calculate CPU usage  
usage = 100 - a[1]  
  
👉 Formula:  
  
CPU Usage = 100 - idle  
  
Example:  
  
100 - 95.5 = 4.5%  
  
  
Step 8: Print result  
printf "CPU Usage : %.0f%%\n", usage  
%.0f → round to integer  
%% → print %  
\n → new line  
  
👉 Output:  
  
CPU Usage : 5%  
  

Full Flow (Easy)
top output → split by comma → find "id" → extract number → 100 - idle → print %
