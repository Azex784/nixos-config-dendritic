{ self, inputs, ...}: {

  flake.modules.nixos.SarastiHardware = { config, lib, pkgs, modulesPath, ... }:{
    imports =
      [ (modulesPath + "/installer/scan/not-detected.nix")
      ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];

    boot.initrd.luks.devices."cryptnixos" = {
        device = "/dev/disk/by-uuid/7cf4b060-844a-44e1-be3f-52365b365b24";
        keyFile = "/cryptkey";
    };

    boot.initrd.luks.devices."crypthome" = {
        device = "/dev/disk/by-uuid/c3b9b9b1-af06-47e3-b109-1c3cb1aa8f61";
        keyFile = "/cryptkey_";
    };

    boot.initrd.secrets."/cryptkey" = builtins.path {
        path = "/secrets/cryptkey";
        name = "cryptkey";
    };

    boot.initrd.secrets."/cryptkey_" = builtins.path {
        path = "/secrets/cryptkey_";
        name = "cryptkey_";
    };


    fileSystems."/home/azex/Documents" = {
        device = "/dev/mapper/crypthome";
        fsType = "btrfs";
        options = [ "subvol=Documents,compress=zstd" ];
    };

    fileSystems."/home/azex/IT" = {
        device = "/dev/mapper/crypthome";
        fsType = "btrfs";
        options = [ "subvol=IT,compress=zstd" ];
    };

    fileSystems."/home/azex/College" = {
        device = "/dev/mapper/crypthome";
        fsType = "btrfs";
        options = [ "subvol=College,compress=zstd" ];
    };

    fileSystems."/home/azex/Pictures" = {
        device = "/dev/mapper/crypthome";
        fsType = "btrfs";
        options = [ "subvol=Pictures" ];
    };

    fileSystems."/home/azex/Videos" = {
        device = "/dev/mapper/crypthome";
        fsType = "btrfs";
        options = [ "subvol=Videos" ];
    };

    fileSystems."/home/azex/Music" = {
        device = "/dev/mapper/crypthome";
        fsType = "btrfs";
        options = [ "subvol=Music" ];
    };


    fileSystems."/" = {
      device = "/dev/mapper/cryptnixos";
      fsType = "btrfs";
      };

    fileSystems."/nix" ={
        device = "/dev/mapper/cryptnixos";
        fsType = "btrfs";
        options = [ "subvol=nix" ];
    };

    fileSystems."/home" =
      { device = "/dev/mapper/cryptnixos";
        fsType = "btrfs";
        options = [ "subvol=home" ];
      };

    fileSystems."/opt" =
      { device = "/dev/mapper/cryptnixos";
        fsType = "btrfs";
        options = [ "subvol=opt" ];
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/2A0B-599F";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };

    swapDevices = [ {
      device = "/var/lib/swapfile";
      size = 8*1024; # 8 GiB
    } ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };

}
