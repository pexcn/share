# disable
echo 1 > /sys/bus/pci/devices/0000:01:00.0/remove
echo 1 > /sys/bus/pci/devices/0000:01:00.1/remove
echo '\\_SB.PCI0.PEG0.PEGP._OFF' > /proc/acpi/call

# enable
echo '\\_SB.PCI0.PEG0.PEGP._ON' > /proc/acpi/call
echo 1 > /sys/bus/pci/rescan
