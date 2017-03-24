# Processor-Performance-Control
_This is a shell Script_

**Things required**
Permission to read/write to scaling_governor. It uses the following path "/sys/devices/system/cpu/cpu{#}/cpufreq/scaling_governor"

**Kernel options**
* Power Management and ACPI options->
- * CPU Frequency Scaling->
- - * Performance
- - * Powersave
 - Intel P state control
> Intel P state is recommended for processors from SandyBridge and up.
> Else use, ACPI Processor P-State Driver

**Accepted Parameters**
* status - requires no Permission
* powersave - requires root privileges
* performance - requires root privileges

**syntax** --> proc.sh [parameter]
