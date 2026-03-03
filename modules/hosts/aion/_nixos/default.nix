{
  imports = [
    # Include the results of the hardware scan.
    ./disko.nix
    ./hardware.nix
  ];

  time.hardwareClockInLocalTime = true;

  # Windows dual-boot via limine chainloading.
  # After installing NixOS, boot a Windows installer USB and repair the
  # Windows bootloader so it lives on its own ESP on the Windows SSD:
  #   1. Boot Windows installer USB → "Repair your computer" → Command Prompt
  #   2. Run: bcdboot C:\Windows /f UEFI
  #      (if needed, use diskpart to create/assign an ESP on the Windows SSD first)
  #   3. Find the Windows ESP's partition GUID:
  #      lsblk -o NAME,SIZE,FSTYPE,PARTUUID,PARTLABEL
  #   4. Replace the PARTUUID placeholder below and rebuild.
  boot.loader.limine.extraEntries = ''
    /Windows
        protocol: efi
        path: guid(REPLACE-WITH-WINDOWS-ESP-PARTUUID):/EFI/Microsoft/Boot/bootmgfw.efi
  '';

  # Optional: mount the data SSD (not managed by disko)
  # Find the device with: ls -l /dev/disk/by-id/ | grep nvme
  # fileSystems."/mnt/data" = {
  #   device = "/dev/disk/by-id/REPLACE-WITH-DATA-SSD-DISK-ID-part1";
  #   fsType = "ext4"; # or "ntfs-3g", "btrfs", etc.
  #   options = [ "defaults" "nofail" ];
  # };

  system.stateVersion = "24.05";
}
