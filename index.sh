#!/bin/bash 
# loop through each var
# the ask weather too install ot not
# Y -> choose apps -> confirm
# N -> next()

while IFS= read -r line; do
	# New Module
	title=$(echo "$line" | awk 'BEGIN{FS=":"} {print $1}')
	# Module Style
	gum style \
	--foreground 212 --border-foreground 212 --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	"Installation of $title"
	# slecte itms
	content=$(echo "$line" | awk 'BEGIN{FS=":"} {print $2}')
	apps=$(gum choose --no-limit $content)
	# itms installation
	for app in $apps
	do
		echo "yes" | yay -S $app & gum spin --spinner dot --title "Downloading" -- sleep 5 
	done

done < "apps.txt"


# variables



# apps="tmux mailspring alacritty"
# confirm=0
# gum confirm && confirm=1; echo "Installation started" || echo "Installation stopped"
# echo $confirm


