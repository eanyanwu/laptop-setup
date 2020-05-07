# Partition the disk
sudo parted /dev/nvme0n1 -- mklabel gpt
sudo parted /dev/nvme0n1 -- mkpart primary 512MiB -8GiB
sudo parted /dev/nvme0n1 -- mkpart primary linux-swap -8GiB 100%
sudo parted /dev/nvme0n1 -- mkpart ESP fat32 1MiB 512MiB
sudo parted /dev/nvme0n1 -- set 3 boot on

# Format the disk
sudo mkfs.ext4 -L nixos /dev/nvme0n1p1
sudo mkswap -L swap /dev/nvme0n1p2
sudo mkfs.fat -F 32 -n boot /dev/nvme0n1p3

# Mout the partitions
sudo mount /dev/disk/by-label/nixos /mnt
sudo mkdir --parent /mnt/boot
sudo mount /dev/disk/by-label/boot /mnt/boot
sudo swapon /dev/nvme0n1p2

# Generate the base nix config which i will promptly overwrite
sudo nixos-generate-config --root /mnt

sudo curl https://raw.githubusercontent.com/eanyanwu/laptop-setup/master/nixos/configuration.nix --output /mnt/etc/nixos/configuration.nix
sudo curl https://raw.githubusercontent.com/eanyanwu/laptop-setup/master/nixos/environment.nix --output /mnt/etc/nixos/environment.nix
sudo curl https://raw.githubusercontent.com/eanyanwu/laptop-setup/master/nixos/fonts.nix --output /mnt/etc/nixos/fonts.nix
sudo curl https://raw.githubusercontent.com/eanyanwu/laptop-setup/master/nixos/networking.nix --output /mnt/etc/nixos/networking.nix
sudo curl https://raw.githubusercontent.com/eanyanwu/laptop-setup/master/nixos/system-packages.nix --output /mnt/etc/nixos/system-packages.nix
sudo curl https://raw.githubusercontent.com/eanyanwu/laptop-setup/master/nixos/systemd.nix --output /mnt/etc/nixos/systemd.nix
