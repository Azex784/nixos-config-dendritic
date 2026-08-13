{ self, inputs, ...}: {

  flake.modules.nixos.hardware = { config, lib, pkgs, modulesPath, ... }:{
    imports =
      [ (modulesPath + "/installer/scan/not-detected.nix")
      ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" = {
      device = "/dev/mapper/cryptnixos";
      fsType = "btrfs";
      };

    #boot.initrd.luks.devices."cryptnixos".device = "/dev/disk/by-uuid/7cf4b060-844a-44e1-be3f-52365b365b24";

    fileSystems."/nix" ={
        device = "/dev/mapper/cryptnixos";
        fsType = "btrfs";
        options = [ "subvol=nix" ];
    };

    boot.initrd.luks.devices."cryptnixos" = {
        device = "/dev/disk/by-uuid/7cf4b060-844a-44e1-be3f-52365b365b24";
        keyFile = "/cryptkey";
    };

    boot.initrd.secrets."/cryptkey" = builtins.path {
        path = "/secrets/cryptkey";
        name = "cryptkey";
    };

    fileSystems."/home" =
      { device = "/dev/mapper/cryptnixos";
        fsType = "btrfs";
        options = [ "subvol=home" ];
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
