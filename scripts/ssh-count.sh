count=$(pgrep ssh | wc -l)
chars=$(printf "%0.s." $(seq 0 $count) | head -c -1)
echo "   $chars  "