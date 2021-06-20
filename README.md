## Known Issues

- Before using Conda, you may need to `source /etc/profile.d/conda.sh`

## Making Changes to the OS

### Part 1: Updating and Verifying the Source

- You will find two files in `~/Desktop/src`
- These are the base image ISO and a shell script used to add additional functionality
- First, open a terminal in this folder to verify data integrity of the ISO using `sha256sum <filename>.iso`
- For the Lubuntu image originally used for the OS, this should be `7f3c4465618e17104f0c76e5646c7caccb4161bc01a102ed04d34b1b4f1e4208 *lubuntu-20.04.2-desktop-amd64.iso`
- Make any changes to the shell script (make sure to try these locally first as root using `sudo su -` to switch users)

> Note: all shell commands should be run from the top-level shell (i.e. use `conda install -n <env> ...` rather than `conda activate <env>; conda install`)

> Warning: ensure that Cubic and UNetbootin remain in the installation script as these are required to update the image.

### Part 2: Create the Image

- Run Cubic (installed) and select the ISO from the source folder as the base image
- Provide any metadata you wish (optional)
- Once you reach the virtual environment `cd` into `/etc/skel` (skeleton for new users home folders)
- `mkdir -p Desktop/src`
- Navigate to `src` and use the copy dialogue located in the top-left of the window to copy the updated shell script and ISO
- Add execute permissions to the shell script (`chmod +x recipe.sh`) and run `./recipe.sh`

### Part 3: Burning the Image

- Run UNetbootin (installed) as root (`sudo unetbootin` from terminal)
- Use a custom ISO, using the one created by Cubic
- Select the `DEV OS` drive. The device path for this will differ between operating systems. Use `blkid` (terminal) or GParted (GUI) to be sure.
- Boot into the dev OS. If you are happy with the changes, repeat the above steps for the stable OS.
