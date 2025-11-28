# Unleash Docker Compose Setup

This project provides a convenient Docker Compose setup for running an Unleash feature flagging instance with pre-seeded feature flags. It's designed for quick local development, testing, or demonstrations where you need a self-contained Unleash environment.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- [**Docker**](https://docs.docker.com/get-docker/)
- [**Docker Compose**](https://docs.docker.com/compose/install/) (usually included with Docker Desktop)

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

3.  **Edit `features.json`**:
    Open `features.json` in your preferred text editor and modify the `feature_flags` array to define your desired feature flags. The `seed.sh` script will use the `name`, `description`, and `active` fields from each entry.
4.  **Start the Unleash instance**:
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

### API Tokens

The `docker-compose.yml` file pre-configures API tokens for both frontend and backend access. These can be used by your client applications to interact with Unleash.

- **Frontend API Token**: `default:development.unleash-frontend-token`
- **Backend API Token**: `default:development.unleash-backend-token`

### Managing Feature Flags

To add, remove, or modify feature flags after the initial setup, simply:

1.  Edit your `features.json` file.
2.  Bring down the existing services:
    ```bash
    docker-compose down
    ```
3.  Start them up again to re-seed the database with your updated `features.json`:
    ```bash
    docker-compose up -d
    ```

## Note to self

This project is built to make it easier to work with feature flags in the [customers-gitlab-com](https://gitlab.com/gitlab-org/customers-gitlab-com) project. Hence, the `feature.json` structure is inspired from [CustomersDot feature flags API](https://gitlab.com/gitlab-org/customers-gitlab-com/-/feature_flags.json?per_page=1000). You may copy and paste this content directly into the features.json file to quick start.
