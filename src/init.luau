--!strict

--[=[
    @class Replicator

    Table-based replication library for shared data.

    Create data schemas through streams, register replicas that embody said data,
    raw values converted into sources with getters/setters/listeners.
    
    Both client and server hold their own replicas, synced through identifier keys (strings or Players).
    Server holds data authority and replicates changes as snapshots through DeltaCompress,
    client merely acknowledges the snapshots and updates local data.
]=]

local Stream = require(script.Stream)
local Replica = require(script.Replica)
local Types = require(script.Shared.Types)
local Utils = require(script.Shared.Utils)

local Replicator = {}

export type Stream = Stream.Stream
export type Replica<data> = Replica.Replica<data>

function Replicator.stream<data>(streamKey: Types.StreamKey, initData: data): Stream.Stream<data>
    Utils.AssertRepeatedStream(streamKey)

    return Stream.stream(streamKey, initData)
end

return Replicator