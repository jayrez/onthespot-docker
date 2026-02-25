# OnTheSpot Docker Web UI

A streamlined Docker implementation for
[OnTheSpot](https://github.com/justin025/onthespot), featuring a Web UI
and persistent storage.

## Credits & Motivation

I am a big fan of the original [OnTheSpot project by
justin025](https://github.com/jayrez/onthespot) and simply wanted to
containerize it to make it more portable and easier to manage.

**Full Disclosure:** While I have experience with Docker, I utilized AI
assistance to troubleshoot specific pathing and persistence hurdles to
ensure this implementation is as robust as possible for the community.

## Features

-   **Persistent Sessions:** Your logins, cache, and settings stay saved
    in the local `./config` folder.
-   **Web UI:** Accessible via browser on port `8083`.
-   **Simplified Deployment:** No need to manage Python environments on
    your host machine.

## Quick Start

### 1) Clone the repository

``` bash
git clone https://github.com/jayrez/onthespot-docker.git
cd onthespot-docker
```

### 2) Launch the container

``` bash
docker compose up -d
```

### 3) Access the interface

Open your browser to: - http://localhost:8083\
(or your server's IP)

------------------------------------------------------------------------

## Configuration & Volumes

You can customize where your data is stored by editing the `compose.yml`
file. You do not need to modify the Dockerfile to change your download
location.

  ------------------------------------------------------------------------
  Host Path (Your Machine)             Container Path         Purpose
  ------------------------------------ ---------------------- ------------
  `./config`                           `/config`              Stores login
                                                              tokens,
                                                              database,
                                                              and settings

  `../downloads`                       `/downloads`           The
                                                              directory
                                                              for
                                                              downloaded
                                                              media
  ------------------------------------------------------------------------

------------------------------------------------------------------------

## Mapping to a Different Folder

If you want to save music to a specific location (like a NAS or external
drive), simply change the left side of the volume mapping in
`compose.yml`:

``` yaml
volumes:
  - /path/to/your/big/drive:/downloads
```

------------------------------------------------------------------------

## Maintenance

### Updating the App

To pull the latest features from the upstream OnTheSpot repository and
rebuild your image:

``` bash
docker compose build --no-cache
docker compose up -d
```

### Resetting

To wipe the container and local images to start fresh:

``` bash
docker compose down --rmi all --volumes
```

------------------------------------------------------------------------

## Next Step

Since you mentioned being a fan of the project, you might eventually
want to **fork** the original repo instead of just cloning it inside
your Dockerfile. This would allow you to contribute code back to
`justin025` if you ever fix a bug!

Want to level this up further? The natural evolution is automated builds
so your image stays fresh without manual rebuilds.