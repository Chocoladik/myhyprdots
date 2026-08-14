{ ... }:

{
  security = {
    protectKernelDefaults = true;
    sudo = {
      enable = true;
      execWheelOnly = true; # Restricts binary execution to wheel group members only
    };
  };

  # Disallow unprivileged user namespace cloning if needed, or enforce strict PAM limits
  boot.kernel.sysctl = {
    "kernel.unprivileged_bpf_disabled" = 1;
    "kernel.kptr_restrict" = 2;
  };
}
