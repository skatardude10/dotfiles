count=$(pgrep vpn | wc -l)
if [ $count = "0" ]; then
	count=$(echo "")
else
	count=$(echo "")
fi
echo "   $count   "