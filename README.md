# README
You can keep a record of your cat's care and check it on the calendar.

## Development Environment Setup
Copy `.env.sample` to `.env` and replace 'xxx' with the values appropriate your own environment.

After that, start Docker containers and set up Rails.

```sh
# Build the Docker image and enter neko_app container.
% docker compose up -d build
% docker exec -it nko_app bash

# Then, run setup task.
% bin/setup
```
