module SteamWorks
using CEnum
include("LibSteam.jl")
using .LibSteam
export LibSteam

const SteamErrMsg = NTuple{1024, Cchar}
export UserId
const UserId::Ref{UInt64} = Ref{UInt64}(0)
    
@cenum ESteamAPIInitResult::UInt32 begin
    k_ESteamAPIInitResult_OK = 0
    k_ESteamAPIInitResult_FailedGeneric = 1 # Some other failure
    k_ESteamAPIInitResult_NoSteamClient = 2 # We cannot connect to Steam, steam probably isn't running
    k_ESteamAPIInitResult_VersionMismatch = 3 # The Steam client version is out of date
end

"""
SteamInternal_SteamAPI_Init(pOutErrMsg::Ptr{SteamErrMsg})

Initialize the Steamworks SDK.
On success, `k_ESteamAPIInitResult_OK` is returned. Otherwise, if `pOutErrMsg` is non-NULL,
it will receive a non-localized message that explains the reason for the failure.

```
"""

function getStringFromNTuple(msg)
    characters = []
    done = false
    for x in msg
        if x > 0 && !done
            println(x)
            push!(characters, Char(x))
        else
            done = true
            continue
        end
    end
    return join(characters)
end

# const InputActionSetHandle_t = UInt64
# const STEAM_INPUT_HANDLE_ALL_CONTROLLERS = UInt64.m
# function SteamAPI_ISteamInput_ActivateActionSet(self, inputHandle, actionSetHandle)
#     ccall((:SteamAPI_ISteamInput_ActivateActionSet, libsteamapi), Cint, (Ptr{Cint}, Cint, Cint), self, inputHandle, actionSetHandle)
# end
function CheckIfSteamIsRunning()
    if SteamAPI_IsSteamRunning() == 0
        println("Steam is not running")
    else
        println("Steam is running")
    end 
end

function InitSteamAPI()
    errMsg = Ref{SteamErrMsg}()
    initSteamAPI = LibSteam.SteamAPI_InitEx(errMsg)

    if initSteamAPI == k_ESteamAPIInitResult_OK
        @debug ("Steam API initialized")
    else
        @error ("Steam API initialization failed: $(getStringFromNTuple(errMsg[]))")
        return
    end

    # Get the pointer
    steamUserPtr = LibSteam.SteamAPI_SteamUser()

    # Check if the pointer is not null before dereferencing
    if steamUserPtr != C_NULL
        # Dereference the pointer to get the Int32 value
        UserId[] = LibSteam.SteamAPI_ISteamUser_GetSteamID(steamUserPtr)
        @info "SteamID: $(UserId[])"
    else
        @error("SteamAPI_SteamUser returned a null pointer.")
    end

    string_result = getStringFromNTuple(errMsg[])
    println("SteamAPI_InitEx output: $(initSteamAPI)")
    println("SteamAPI_InitEx error message: $(string_result)")
    
    if initSteamAPI == k_ESteamAPIInitResult_OK
        @info ("Steam API initialized")
    else
        @error string_result
    end
end

function InitSteamTools()
    if SteamAPI_RestartAppIfNecessary()
        println("Restarting app")
        return
    else
        println("App is not restarting")
    end
    
    steamClient = SteamClient()
    if steamClient == C_NULL
        @error "Steam client is null"
    else
        @info "Steam client created"
        println(unsafe_load(steamClient))
    end
    
    steamPipe = SteamAPI_ISteamClient_CreateSteamPipe(steamClient)
    if steamPipe == 0
        @error "Steam pipe is null"
    else
        @info "Steam pipe created"
        println(steamPipe)
    end
    
    steamFriends = SteamAPI_SteamFriends()
    if steamFriends == C_NULL
        @error "Steam friends is null"
    else
        @info "Steam friends created"
        println(unsafe_load(steamFriends))
    end
    
    personaName = SteamAPI_ISteamFriends_GetPersonaName(steamFriends)
    text = getStringFromNTuple(personaName)
    if personaName == C_NULL
        @error "Persona name is null"
    else
        @info "Persona name created"
        println(text)
    end
    
    steamInput = SteamAPI_SteamInput()
    if steamInput == C_NULL
        @error "Steam input is null"
    else
        @info "Steam input created"
        println(unsafe_load(steamInput))
    end

    return (client = steamClient, pipe = steamPipe, friends = steamFriends, input = steamInput, name = text)
end
export InitSteamAPI, InitSteamTools, CheckIfSteamIsRunning

end