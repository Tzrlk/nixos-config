{ config, pkgs, ... }: {
	boot = {

		supportedFilesystems = [ "ntfs" ];

		kernelModules = [
			"kvm-intel"
			"efivarfs"
		];
		extraModulePackages = [
		];

		initrd = {
            availableKernelModules = [
                "ehci_pci"
                "ahci"
                "xhci_pci"
                "firewire_ohci"
                "usb_storage"
                "usbhid"
                "sd_mod"
                "sr_mod"
            ];
            kernelModules = [
            ];
        };

		# Use UEFI boot loader
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };

	};
}
