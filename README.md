[![Build and Publish Docker Image](https://github.com/jayrez/onthespot-docker/actions/workflows/docker-publish.yml/badge.svg?event=push)](https://github.com/jayrez/onthespot-docker/actions/workflows/docker-publish.yml)

# OnTheSpot Docker (Automated Build)

A containerized implementation of OnTheSpot by
**justin025**.\
This version utilizes GitHub Actions to automatically build and host the
latest version for easy deployment.

------------------------------------------------------------------------

## 🚀 The Upgrade

This repository now features:

-   **CI/CD Pipeline** --- Automatic builds via GitHub Actions\
-   **Hosted Image** --- No local building required; pull directly from
    `ghcr.io`\
-   **Fork-Linked** --- Clones from a dedicated fork to ensure stability
    and allow for custom improvements

------------------------------------------------------------------------

## 🛠 Quick Start (No Build Required)

Just create a `compose.yml` file and paste the following:

``` yaml
services:
  onthespot:
    image: ghcr.io/jayrez/onthespot-docker:latest
    container_name: onthespot
    ports:
      - "8083:5000" # Maps Host 8083 to Container 5000, change 8083 to whatever port you want
    environment:
      - HOME=/config
      - OTS_CONFIG_PATH=/config
    volumes:
      - /path/to/your/music:/downloads
      - ./config:/config
    restart: unless-stopped
```

Run it:

``` bash
docker compose up -d
```

Access the UI at:

    http://your-ip:8083

------------------------------------------------------------------------

## 📂 Volumes & Persistence

  -----------------------------------------------------------------------
  Host Path               Container Path                Purpose
  ----------------------- ----------------------------- -----------------
  `./config`              `/config`                     Stores login
                                                        tokens,
                                                        databases, and
                                                        app settings

  `/path/to/your/music`   `/downloads`                  Directory where
                                                        your media is
                                                        saved
  -----------------------------------------------------------------------

------------------------------------------------------------------------
## ⚠️ Required App Configuration

Once the container is running, you must update the internal path to match the Docker volume:

1. Open the Web UI at `http://<your-ip>:8084`.
2. Navigate to the **Settings** tab.
3. Change the **Audio Download Path** to exactly: `/downloads`
4. Save settings at the top of the page.
------------------------------------------------------------------------

## 🔄 Maintenance & Updates

### Updating to the Latest Build

Because the image is hosted on the GitHub Container Registry, updating
is a single command:

``` bash
docker compose pull && docker compose up -d
```

------------------------------------------------------------------------

## 👨‍💻 For Developers (The Pipeline)

If you want to modify the Docker configuration:

1.  Edit the **Dockerfile** or `.github/workflows`
2.  Push to `main`
3.  GitHub Actions will automatically rebuild the image and update the
    package at:

```{=html}
<!-- -->
```
    ghcr.io/jayrez/onthespot-docker

------------------------------------------------------------------------

## 🤝 Credits & Disclosure

-   **Original App:** justin025/onthespot\
-   **Infrastructure:** Developed with a focus on portability and
    persistence\
-   **Process:** Built using a "Fork-first" strategy and AI-assisted
    CI/CD troubleshooting to ensure a robust, community-ready
    implementation

## Disclaimer

OnTheSpot is intended to be used in compliance with DMCA, Section 1201, for educational, private and fair use.
OnTheSpot contributors are not responsible for any misuse of the program or source code.

------------------------------------------------------------------------
For further information, please see the following [**disclaimer**]
