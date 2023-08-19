default: write_env

write_env:
    python3 toml-to-env.py config.toml > .env
