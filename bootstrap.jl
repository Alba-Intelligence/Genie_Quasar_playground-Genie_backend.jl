#
# DO NOT MODIFY
#

# If started from bin, move back up to the module top directory @__DIR__
pwd() == joinpath(@__DIR__, "bin") && cd(@__DIR__)

using Indexity_TestGenieWebServices
# This is executed only ONCE
Indexity_TestGenieWebServices.main()

global server_port = 9009

Genie.down()
Genie.up(server_port, "localhost", async = true)
