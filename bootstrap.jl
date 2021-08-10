#
# DO NOT MODIFY
#

# If started from bin, move back up to the module top directory @__DIR__
pwd() == joinpath(@__DIR__, "bin") && cd(@__DIR__)

using TestGenieWebServices
TestGenieWebServices.main()

const server_port = 9009
up(server_port, "localhost")
