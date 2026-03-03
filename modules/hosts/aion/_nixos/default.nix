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
        path: guid(5cede495-b0bb-45bc-b761-000a9c9e964e):/EFI/Microsoft/Boot/bootmgfw.efi
  '';

  # Optional: mount the data SSD (not managed by disko)
  # Find the device with: ls -l /dev/disk/by-id/ | grep nvme
  fileSystems."/mnt/vault" = {
    device = "/dev/disk/by-id/ata-Samsung_SSD_860_EVO_2TB_S597NJ0NB07777B-part1";
    fsType = "ext4";
    options = [ "defaults" "nofail" ];
  };

  system.stateVersion = "24.05";
}
