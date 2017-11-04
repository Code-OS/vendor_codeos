for device in $(cat vendor/codeos/codeos.devices)
do
add_lunch_combo codeos_$device-userdebug
add_lunch_combo codeos_$device-user
add_lunch_combo codeos_$device-eng
done
