{ ... }:

{
  security = {
    protectKernelImage = true;
    sudo = {
      enable = true;
      execWheelOnly = true;
    };
  };

  boot.kernel.sysctl = {
    "kernel.unprivileged_bpf_disabled" = 1;
    "kernel.kptr_restrict" = 2;
  };
}
