using Genie.Configuration, Logging

const config = Settings(
    server_port = 9009,
    server_host = "127.0.0.1",

    # After checking the logging initializer
    path_log = "log",
    log_to_file = true,
    log_level = Logging.BelowMinLevel,
    server_handle_static_files = true,
)

ENV["JULIA_REVISE"] = "auto"
