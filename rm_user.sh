#/bin/sh


localUsers=($(dscl . list /Users UniqueID | grep -v "_" | awk '$2 > 500 && $2 < 1000 {print $1}'))

for usr in ${localUsers[@]}; do
	if [[ $usr = "user_name" ]]; then
		echo "Found user $usr . Deleting now ..."
		sudo dscl . -delete /Users/$usr
		sudo rm -rf /Users/$usr
	fi
done
