{
  config,
  lib,
  ...
}:

{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    amdgpu.initrd.enable = true;

    cpu.amd = {
      ryzen-smu.enable = true;

      updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
  };
}
