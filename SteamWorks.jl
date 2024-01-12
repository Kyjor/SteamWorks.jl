using CEnum

const STEAM_API_DLL = "steam_api64.dll"  
# Replace with the actual name of the DLL file

const SteamErrMsg = NTuple{1024, Cchar}


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
function SteamInternal_SteamAPI_Init(pOutErrMsg)
    ccall((:SteamInternal_SteamAPI_Init, joinpath(@__DIR__, STEAM_API_DLL)), UInt8, (Ptr{Cchar}, Ref{SteamErrMsg}), C_NULL, pOutErrMsg)
end

function SteamAPI_IsSteamRunning()
    ccall((:SteamAPI_IsSteamRunning, joinpath(@__DIR__, STEAM_API_DLL)), Cint, ())
end

function SteamAPI_ISteamFriends_GetPersonaName(self)
    ccall((:SteamAPI_ISteamFriends_GetPersonaName, STEAM_API_DLL), Ref{NTuple{1024, Cchar}}, (Ptr{Cint},), self)
end

function SteamAPI_ISteamClient_CreateSteamPipe(self)
    ccall((:SteamAPI_ISteamClient_CreateSteamPipe, joinpath(@__DIR__, STEAM_API_DLL)), Cint, (Ptr{Cint},), self)    
end

function SteamAPI_SteamFriends()
    ccall((:SteamAPI_SteamFriends_v017, joinpath(@__DIR__, STEAM_API_DLL)), Ptr{Cint}, ())
end

function SteamClient()
    ccall((:SteamClient, STEAM_API_DLL), Ptr{Cint}, ())
end

function SteamAPI_SteamInput()
    ccall((:SteamAPI_SteamInput_v006, STEAM_API_DLL), Ptr{Cint}, ())
end

function SteamAPI_InitEx(pOutErrMsg)
    ccall((:SteamAPI_InitEx, STEAM_API_DLL), ESteamAPIInitResult, (Ptr{SteamErrMsg},), pOutErrMsg)
end

function CheckIfSteamIsRunning()
    if SteamAPI_IsSteamRunning() == 0
        println("Steam is not running")
    else
        println("Steam is running")
    end 
end

function InitSteamAPI()
    errMsg = Ref{SteamErrMsg}()
    initSteamAPI = SteamInternal_SteamAPI_Init(errMsg)
    string_result = getStringFromNTuple(errMsg[])

    if initSteamAPI == k_ESteamAPIInitResult_OK
        @info ("Steam API initialized")
    else
        @error string_result
    end
end

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

function SteamAPI_RestartAppIfNecessary(appId::UInt32 = UInt32(480))
    ccall((:SteamAPI_RestartAppIfNecessary, STEAM_API_DLL), Bool, (UInt32,), appId)
end

function CreateSteamClient()
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
end
