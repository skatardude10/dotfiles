vol=$(amixer -D pulse sget Master | tail -n +7 | cut -f1 -d"]" | sed 's|.*\[\(.*\)|\1|' | tr -d "%" ); 
if [ $vol -gt "75" ]
then
	icon=$(echo "" )
elif [ $vol -gt "35" ] 
then
	icon=$(echo "" )
else
	icon=$(echo "")
fi
echo " $icon "
