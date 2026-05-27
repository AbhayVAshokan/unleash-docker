# Unleash Docker Compose Setup

This project provides a convenient Docker Compose setup for running an Unleash feature flagging instance with pre-seeded feature flags. It's designed for quick local development, testing, or demonstrations where you need a self-contained Unleash environment.

## Setup

Follow these steps to get your Unleash instance up and running:

1.  **Clone the repository** (if you haven't already):

    ```bash
    git clone https://github.com/your-repo/unleash-docker.git
    cd unleash-docker

    ```

2.  **Create your `features.json` file**:
    Copy the example feature flag configuration to `features.json`. This file will be used to seed your Unleash instance.

    ```bash
    cp features.json.example features.json
    ```

3.  **Start the Unleash instance**:
    Run Docker Compose to build the services and start the Unleash server, database, and seeding process.
    ```bash
    docker-compose up -d
    ```
    The `-d` flag runs the services in detached mode (in the background).

## Usage

### Unleash UI

Once the services are up, you can access the Unleash Admin UI in your web browser:

- **URL**: `http://localhost:4267`
- **Default Admin Credentials**:
  - **Username**: `admin`
  - **Password**: `unleash4all`

## Note to self

This project is built to make it easier to work with feature flags in the [customers-gitlab-com](https://gitlab.com/gitlab-org/customers-gitlab-com) project. Hence, the `feature.json` structure is inspired from [CustomersDot feature flags API](https://gitlab.com/gitlab-org/customers-gitlab-com/-/feature_flags.json?per_page=1000). 

You may copy and paste this content directly into the features.json file to quick start.
