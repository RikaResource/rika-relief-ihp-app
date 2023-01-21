# Shipnix recommended settings
# IMPORTANT: These settings are here for ship-nix to function properly on your server
# Modify with care

{ config, pkgs, modulesPath, lib, ... }:
{
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes ca-derivations
    '';
    settings = {
      trusted-users = [ "root" "ship" "nix-ssh" ];
    };
  };

  programs.git.enable = true;
  programs.git.config = {
    advice.detachedHead = false;
  };

  services.openssh = {
    enable = true;
    # ship-nix uses SSH keys to gain access to the server
    # Manage permitted public keys in the `authorized_keys` file
    passwordAuthentication = false;
    #  permitRootLogin = "no";
  };


  users.users.ship = {
    isNormalUser = true;
    extraGroups = [ "wheel" "nginx" ];
    # If you don't want public keys to live in the repo, you can remove the line below
    # ~/.ssh will be used instead and will not be checked into version control. 
    # Note that this requires you to manage SSH keys manually via SSH,
    # and your will need to manage authorized keys for root and ship user separately
    openssh.authorizedKeys.keyFiles = [ ./authorized_keys ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4uQYc9GZJkrbTyepD5rsQB8qEHSgmz+k+rJYSpRu7CXCrjJIMlhzEYnphgC9PG8qWlKFD3OBy0AxfUY3yLmuR4YWOl55UZuTQ0S4DkmHHQgLolkcMsvTmHhT0u7pISugIwQW2OMm/q9yCfLA77xcM0ExjJLlzcD2qdaovvjlRoNGNxBpnmO6E9tY5ux7wbGqt5OOtbxmyl9mapukiEU4p2hNU6nM4HxUp1pB2d5nra985PUX0RCW5NQDD5c42Lt3if12cfyCVRrONcfCjx9kcW1SUSe5zhvB3W005CFRhI0v0jaRyYK8ho0lufRUP3Q+hQT9z6llW1uqYi+TNA92iVR8N7uD+fU+UB64pjC/QK1xiyObp/o9YUYsdLMmBvUNhQC7XMZKW2/zq0OlF/HSZyM5/ZRUATmqX7/t1HQ0AFp9SPeQ4ZeS7kXeKDwKWOr4bLsyKw8z5keIYJcPAeoEwgtjet9kwBGFVrSWXr+NgBt9cIPInfWF4cA7ul15ga4s= ship@tite-ship
"
    ];
  };

  # Can be removed if you want authorized keys to only live on server, not in repository
  # Se note above for users.users.ship.openssh.authorizedKeys.keyFiles
  users.users.root.openssh.authorizedKeys.keyFiles = [ ./authorized_keys ];
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4uQYc9GZJkrbTyepD5rsQB8qEHSgmz+k+rJYSpRu7CXCrjJIMlhzEYnphgC9PG8qWlKFD3OBy0AxfUY3yLmuR4YWOl55UZuTQ0S4DkmHHQgLolkcMsvTmHhT0u7pISugIwQW2OMm/q9yCfLA77xcM0ExjJLlzcD2qdaovvjlRoNGNxBpnmO6E9tY5ux7wbGqt5OOtbxmyl9mapukiEU4p2hNU6nM4HxUp1pB2d5nra985PUX0RCW5NQDD5c42Lt3if12cfyCVRrONcfCjx9kcW1SUSe5zhvB3W005CFRhI0v0jaRyYK8ho0lufRUP3Q+hQT9z6llW1uqYi+TNA92iVR8N7uD+fU+UB64pjC/QK1xiyObp/o9YUYsdLMmBvUNhQC7XMZKW2/zq0OlF/HSZyM5/ZRUATmqX7/t1HQ0AFp9SPeQ4ZeS7kXeKDwKWOr4bLsyKw8z5keIYJcPAeoEwgtjet9kwBGFVrSWXr+NgBt9cIPInfWF4cA7ul15ga4s= ship@tite-ship
"
  ];

  security.sudo.extraRules = [
    {
      users = [ "ship" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" "SETENV" ];
        }
      ];
    }
  ];
}
