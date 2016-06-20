vol=$(pactl list sinks | grep '^[[:space:]]Volume:' | \
    head -n $(( $SINK + 3 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
var="$(echo -e "100\n90\n80\n70\n60\n50\n40\n30\n20\n10\n0" | rofi -dmenu -hide-scrollbar -separator-style "none" -mesg "Current: $vol %" -p "Set vol: ")"
