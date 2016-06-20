num=$(xlsclients | wc -l)
chars=$(printf "%0.s." $(seq 0 $num) | head -c -2)
echo "$chars"