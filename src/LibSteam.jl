module LibSteam

using CEnum
libsteam_api = nothing
if Sys.iswindows()
    libsteam_api = joinpath(pwd(), "steam_api64.dll")
elseif Sys.isapple()
    libsteam_api = joinpath(pwd(), "libsteam_api.dylib")
else
    libsteam_api = joinpath(pwd(), "libsteam_api.so")
end

const uint64_steamid = Cint

const uint64_gameid = Cint

function SteamAPI_ISteamClient_ReleaseUser(self, hSteamPipe, hUser)
    ccall((:SteamAPI_ISteamClient_ReleaseUser, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, hSteamPipe, hUser)
end

function SteamAPI_ISteamClient_SetLocalIPBinding(self, arg2)
    ccall((:SteamAPI_ISteamClient_SetLocalIPBinding, libsteam_api), Cint, (Ptr{Cint}, Cint), self, arg2)
end

function SteamAPI_ISteamClient_GetISteamGenericInterface(self, hSteamUser, hSteamPipe, pchVersion)
    ccall((:SteamAPI_ISteamClient_GetISteamGenericInterface, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint, Cint, Ptr{Cchar}), self, hSteamUser, hSteamPipe, pchVersion)
end

function SteamAPI_ISteamClient_SetWarningMessageHook(self, pFunction)
    ccall((:SteamAPI_ISteamClient_SetWarningMessageHook, libsteam_api), Cint, (Ptr{Cint}, Cint), self, pFunction)
end

# no prototype is found for this function at steam_api_flat.h:62:20, please use with caution
function SteamAPI_SteamUser()
    ccall((:SteamAPI_SteamUser_v023, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamUser_InitiateGameConnection_DEPRECATED(self, pAuthBlob, cbMaxAuthBlob, steamIDGameServer, unIPServer, usPortServer, bSecure)
    ccall((:SteamAPI_ISteamUser_InitiateGameConnection_DEPRECATED, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cvoid}, Cint, uint64_steamid, Cint, Cint, Cint), self, pAuthBlob, cbMaxAuthBlob, steamIDGameServer, unIPServer, usPortServer, bSecure)
end

function SteamAPI_ISteamUser_TerminateGameConnection_DEPRECATED(self, unIPServer, usPortServer)
    ccall((:SteamAPI_ISteamUser_TerminateGameConnection_DEPRECATED, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, unIPServer, usPortServer)
end

function SteamAPI_ISteamUser_TrackAppUsageEvent(self, gameID, eAppUsageEvent, pchExtraInfo)
    ccall((:SteamAPI_ISteamUser_TrackAppUsageEvent, libsteam_api), Cint, (Ptr{Cint}, uint64_gameid, Cint, Ptr{Cchar}), self, gameID, eAppUsageEvent, pchExtraInfo)
end

function SteamAPI_ISteamUser_StartVoiceRecording(self)
    ccall((:SteamAPI_ISteamUser_StartVoiceRecording, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamUser_StopVoiceRecording(self)
    ccall((:SteamAPI_ISteamUser_StopVoiceRecording, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamUser_EndAuthSession(self, steamID)
    ccall((:SteamAPI_ISteamUser_EndAuthSession, libsteam_api), Cint, (Ptr{Cint}, uint64_steamid), self, steamID)
end

function SteamAPI_ISteamUser_CancelAuthTicket(self, hAuthTicket)
    ccall((:SteamAPI_ISteamUser_CancelAuthTicket, libsteam_api), Cint, (Ptr{Cint}, Cint), self, hAuthTicket)
end

function SteamAPI_ISteamUser_AdvertiseGame(self, steamIDGameServer, unIPServer, usPortServer)
    ccall((:SteamAPI_ISteamUser_AdvertiseGame, libsteam_api), Cint, (Ptr{Cint}, uint64_steamid, Cint, Cint), self, steamIDGameServer, unIPServer, usPortServer)
end

function SteamAPI_ISteamUser_GetGameBadgeLevel(self, nSeries, bFoil)
    ccall((:SteamAPI_ISteamUser_GetGameBadgeLevel, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, nSeries, bFoil)
end

function SteamAPI_ISteamUser_GetPlayerSteamLevel(self)
    ccall((:SteamAPI_ISteamUser_GetPlayerSteamLevel, libsteam_api), Cint, (Ptr{Cint},), self)
end

# no prototype is found for this function at steam_api_flat.h:102:23, please use with caution
function SteamAPI_SteamFriends()
    ccall((:SteamAPI_SteamFriends, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamFriends_GetPersonaName(self)
    ccall((:SteamAPI_ISteamFriends_GetPersonaName, libsteam_api), Ptr{Cint}, (Ptr{Cint},), self)
end

function SteamAPI_ISteamFriends_GetFriendCount(self, iFriendFlags)
    ccall((:SteamAPI_ISteamFriends_GetFriendCount, libsteam_api), Cint, (Ptr{Cint}, Cint), self, iFriendFlags)
end

function SteamAPI_ISteamFriends_GetFriendPersonaName(self, steamIDFriend)
    ccall((:SteamAPI_ISteamFriends_GetFriendPersonaName, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, steamIDFriend)
end

function SteamAPI_ISteamFriends_GetFriendPersonaNameHistory(self, steamIDFriend, iPersonaName)
    ccall((:SteamAPI_ISteamFriends_GetFriendPersonaNameHistory, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint, Cint), self, steamIDFriend, iPersonaName)
end

function SteamAPI_ISteamFriends_GetFriendSteamLevel(self, steamIDFriend)
    ccall((:SteamAPI_ISteamFriends_GetFriendSteamLevel, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDFriend)
end

function SteamAPI_ISteamFriends_GetPlayerNickname(self, steamIDPlayer)
    ccall((:SteamAPI_ISteamFriends_GetPlayerNickname, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, steamIDPlayer)
end

function SteamAPI_ISteamFriends_GetFriendsGroupCount(self)
    ccall((:SteamAPI_ISteamFriends_GetFriendsGroupCount, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamFriends_GetFriendsGroupName(self, friendsGroupID)
    ccall((:SteamAPI_ISteamFriends_GetFriendsGroupName, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, friendsGroupID)
end

function SteamAPI_ISteamFriends_GetFriendsGroupMembersCount(self, friendsGroupID)
    ccall((:SteamAPI_ISteamFriends_GetFriendsGroupMembersCount, libsteam_api), Cint, (Ptr{Cint}, Cint), self, friendsGroupID)
end

function SteamAPI_ISteamFriends_GetFriendsGroupMembersList(self, friendsGroupID, pOutSteamIDMembers, nMembersCount)
    ccall((:SteamAPI_ISteamFriends_GetFriendsGroupMembersList, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Cint}, Cint), self, friendsGroupID, pOutSteamIDMembers, nMembersCount)
end

function SteamAPI_ISteamFriends_GetClanCount(self)
    ccall((:SteamAPI_ISteamFriends_GetClanCount, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamFriends_GetClanName(self, steamIDClan)
    ccall((:SteamAPI_ISteamFriends_GetClanName, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, steamIDClan)
end

function SteamAPI_ISteamFriends_GetClanTag(self, steamIDClan)
    ccall((:SteamAPI_ISteamFriends_GetClanTag, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, steamIDClan)
end

function SteamAPI_ISteamFriends_GetFriendCountFromSource(self, steamIDSource)
    ccall((:SteamAPI_ISteamFriends_GetFriendCountFromSource, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDSource)
end

function SteamAPI_ISteamFriends_SetInGameVoiceSpeaking(self, steamIDUser, bSpeaking)
    ccall((:SteamAPI_ISteamFriends_SetInGameVoiceSpeaking, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, steamIDUser, bSpeaking)
end

function SteamAPI_ISteamFriends_ActivateGameOverlay(self, pchDialog)
    ccall((:SteamAPI_ISteamFriends_ActivateGameOverlay, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}), self, pchDialog)
end

function SteamAPI_ISteamFriends_ActivateGameOverlayToUser(self, pchDialog, steamID)
    ccall((:SteamAPI_ISteamFriends_ActivateGameOverlayToUser, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}, Cint), self, pchDialog, steamID)
end

function SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage(self, pchURL, eMode)
    ccall((:SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}, Cint), self, pchURL, eMode)
end

function SteamAPI_ISteamFriends_ActivateGameOverlayToStore(self, nAppID, eFlag)
    ccall((:SteamAPI_ISteamFriends_ActivateGameOverlayToStore, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, nAppID, eFlag)
end

function SteamAPI_ISteamFriends_SetPlayedWith(self, steamIDUserPlayedWith)
    ccall((:SteamAPI_ISteamFriends_SetPlayedWith, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDUserPlayedWith)
end

function SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog(self, steamIDLobby)
    ccall((:SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDLobby)
end

function SteamAPI_ISteamFriends_GetSmallFriendAvatar(self, steamIDFriend)
    ccall((:SteamAPI_ISteamFriends_GetSmallFriendAvatar, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDFriend)
end

function SteamAPI_ISteamFriends_GetMediumFriendAvatar(self, steamIDFriend)
    ccall((:SteamAPI_ISteamFriends_GetMediumFriendAvatar, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDFriend)
end

function SteamAPI_ISteamFriends_GetLargeFriendAvatar(self, steamIDFriend)
    ccall((:SteamAPI_ISteamFriends_GetLargeFriendAvatar, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDFriend)
end

function SteamAPI_ISteamFriends_GetClanOfficerCount(self, steamIDClan)
    ccall((:SteamAPI_ISteamFriends_GetClanOfficerCount, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDClan)
end

function SteamAPI_ISteamFriends_ClearRichPresence(self)
    ccall((:SteamAPI_ISteamFriends_ClearRichPresence, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamFriends_GetFriendRichPresence(self, steamIDFriend, pchKey)
    ccall((:SteamAPI_ISteamFriends_GetFriendRichPresence, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint, Ptr{Cchar}), self, steamIDFriend, pchKey)
end

function SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount(self, steamIDFriend)
    ccall((:SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDFriend)
end

function SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex(self, steamIDFriend, iKey)
    ccall((:SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint, Cint), self, steamIDFriend, iKey)
end

function SteamAPI_ISteamFriends_RequestFriendRichPresence(self, steamIDFriend)
    ccall((:SteamAPI_ISteamFriends_RequestFriendRichPresence, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDFriend)
end

function SteamAPI_ISteamFriends_GetCoplayFriendCount(self)
    ccall((:SteamAPI_ISteamFriends_GetCoplayFriendCount, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamFriends_GetFriendCoplayTime(self, steamIDFriend)
    ccall((:SteamAPI_ISteamFriends_GetFriendCoplayTime, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDFriend)
end

function SteamAPI_ISteamFriends_GetClanChatMemberCount(self, steamIDClan)
    ccall((:SteamAPI_ISteamFriends_GetClanChatMemberCount, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDClan)
end

function SteamAPI_ISteamFriends_GetClanChatMessage(self, steamIDClanChat, iMessage, prgchText, cchTextMax, peChatEntryType, psteamidChatter)
    ccall((:SteamAPI_ISteamFriends_GetClanChatMessage, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), self, steamIDClanChat, iMessage, prgchText, cchTextMax, peChatEntryType, psteamidChatter)
end

function SteamAPI_ISteamFriends_GetFriendMessage(self, steamIDFriend, iMessageID, pvData, cubData, peChatEntryType)
    ccall((:SteamAPI_ISteamFriends_GetFriendMessage, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Ptr{Cvoid}, Cint, Ptr{Cint}), self, steamIDFriend, iMessageID, pvData, cubData, peChatEntryType)
end

function SteamAPI_ISteamFriends_GetNumChatsWithUnreadPriorityMessages(self)
    ccall((:SteamAPI_ISteamFriends_GetNumChatsWithUnreadPriorityMessages, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog(self, steamIDLobby)
    ccall((:SteamAPI_ISteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDLobby)
end

function SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialogConnectString(self, pchConnectString)
    ccall((:SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialogConnectString, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}), self, pchConnectString)
end

function SteamAPI_ISteamFriends_GetProfileItemPropertyString(self, steamID, itemType, prop)
    ccall((:SteamAPI_ISteamFriends_GetProfileItemPropertyString, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint, Cint, Cint), self, steamID, itemType, prop)
end

# no prototype is found for this function at steam_api_flat.h:189:21, please use with caution
function SteamAPI_SteamUtils()
    ccall((:SteamAPI_SteamUtils, libsteam_api), Ptr{Cint}, ())
end

# no prototype is found for this function at steam_api_flat.h:194:21, please use with caution
function SteamAPI_SteamGameServerUtils()
    ccall((:SteamAPI_SteamGameServerUtils, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamUtils_GetIPCountry(self)
    ccall((:SteamAPI_ISteamUtils_GetIPCountry, libsteam_api), Ptr{Cint}, (Ptr{Cint},), self)
end

function SteamAPI_ISteamUtils_SetOverlayNotificationPosition(self, eNotificationPosition)
    ccall((:SteamAPI_ISteamUtils_SetOverlayNotificationPosition, libsteam_api), Cint, (Ptr{Cint}, Cint), self, eNotificationPosition)
end

function SteamAPI_ISteamUtils_SetWarningMessageHook(self, pFunction)
    ccall((:SteamAPI_ISteamUtils_SetWarningMessageHook, libsteam_api), Cint, (Ptr{Cint}, Cint), self, pFunction)
end

function SteamAPI_ISteamUtils_GetSteamUILanguage(self)
    ccall((:SteamAPI_ISteamUtils_GetSteamUILanguage, libsteam_api), Ptr{Cint}, (Ptr{Cint},), self)
end

function SteamAPI_ISteamUtils_SetOverlayNotificationInset(self, nHorizontalInset, nVerticalInset)
    ccall((:SteamAPI_ISteamUtils_SetOverlayNotificationInset, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, nHorizontalInset, nVerticalInset)
end

function SteamAPI_ISteamUtils_StartVRDashboard(self)
    ccall((:SteamAPI_ISteamUtils_StartVRDashboard, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamUtils_SetVRHeadsetStreamingEnabled(self, bEnabled)
    ccall((:SteamAPI_ISteamUtils_SetVRHeadsetStreamingEnabled, libsteam_api), Cint, (Ptr{Cint}, Cint), self, bEnabled)
end

function SteamAPI_ISteamUtils_FilterText(self, eContext, sourceSteamID, pchInputMessage, pchOutFilteredText, nByteSizeOutFilteredText)
    ccall((:SteamAPI_ISteamUtils_FilterText, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Ptr{Cchar}, Ptr{Cchar}, Cint), self, eContext, sourceSteamID, pchInputMessage, pchOutFilteredText, nByteSizeOutFilteredText)
end

function SteamAPI_ISteamUtils_SetGameLauncherMode(self, bLauncherMode)
    ccall((:SteamAPI_ISteamUtils_SetGameLauncherMode, libsteam_api), Cint, (Ptr{Cint}, Cint), self, bLauncherMode)
end

# no prototype is found for this function at steam_api_flat.h:238:27, please use with caution
function SteamAPI_SteamMatchmaking()
    ccall((:SteamAPI_SteamMatchmaking, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamMatchmaking_GetFavoriteGameCount(self)
    ccall((:SteamAPI_ISteamMatchmaking_GetFavoriteGameCount, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamMatchmaking_AddFavoriteGame(self, nAppID, nIP, nConnPort, nQueryPort, unFlags, rTime32LastPlayedOnServer)
    ccall((:SteamAPI_ISteamMatchmaking_AddFavoriteGame, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cint, Cint, Cint, Cint), self, nAppID, nIP, nConnPort, nQueryPort, unFlags, rTime32LastPlayedOnServer)
end

function SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter(self, pchKeyToMatch, pchValueToMatch, eComparisonType)
    ccall((:SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}, Ptr{Cchar}, Cint), self, pchKeyToMatch, pchValueToMatch, eComparisonType)
end

function SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter(self, pchKeyToMatch, nValueToMatch, eComparisonType)
    ccall((:SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}, Cint, Cint), self, pchKeyToMatch, nValueToMatch, eComparisonType)
end

function SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter(self, pchKeyToMatch, nValueToBeCloseTo)
    ccall((:SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}, Cint), self, pchKeyToMatch, nValueToBeCloseTo)
end

function SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable(self, nSlotsAvailable)
    ccall((:SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable, libsteam_api), Cint, (Ptr{Cint}, Cint), self, nSlotsAvailable)
end

function SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter(self, eLobbyDistanceFilter)
    ccall((:SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter, libsteam_api), Cint, (Ptr{Cint}, Cint), self, eLobbyDistanceFilter)
end

function SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter(self, cMaxResults)
    ccall((:SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter, libsteam_api), Cint, (Ptr{Cint}, Cint), self, cMaxResults)
end

function SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter(self, steamIDLobby)
    ccall((:SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDLobby)
end

function SteamAPI_ISteamMatchmaking_LeaveLobby(self, steamIDLobby)
    ccall((:SteamAPI_ISteamMatchmaking_LeaveLobby, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDLobby)
end

function SteamAPI_ISteamMatchmaking_GetNumLobbyMembers(self, steamIDLobby)
    ccall((:SteamAPI_ISteamMatchmaking_GetNumLobbyMembers, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDLobby)
end

function SteamAPI_ISteamMatchmaking_GetLobbyData(self, steamIDLobby, pchKey)
    ccall((:SteamAPI_ISteamMatchmaking_GetLobbyData, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint, Ptr{Cchar}), self, steamIDLobby, pchKey)
end

function SteamAPI_ISteamMatchmaking_GetLobbyDataCount(self, steamIDLobby)
    ccall((:SteamAPI_ISteamMatchmaking_GetLobbyDataCount, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDLobby)
end

function SteamAPI_ISteamMatchmaking_GetLobbyMemberData(self, steamIDLobby, steamIDUser, pchKey)
    ccall((:SteamAPI_ISteamMatchmaking_GetLobbyMemberData, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint, Cint, Ptr{Cchar}), self, steamIDLobby, steamIDUser, pchKey)
end

function SteamAPI_ISteamMatchmaking_SetLobbyMemberData(self, steamIDLobby, pchKey, pchValue)
    ccall((:SteamAPI_ISteamMatchmaking_SetLobbyMemberData, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Cchar}, Ptr{Cchar}), self, steamIDLobby, pchKey, pchValue)
end

function SteamAPI_ISteamMatchmaking_GetLobbyChatEntry(self, steamIDLobby, iChatID, pSteamIDUser, pvData, cubData, peChatEntryType)
    ccall((:SteamAPI_ISteamMatchmaking_GetLobbyChatEntry, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}), self, steamIDLobby, iChatID, pSteamIDUser, pvData, cubData, peChatEntryType)
end

function SteamAPI_ISteamMatchmaking_SetLobbyGameServer(self, steamIDLobby, unGameServerIP, unGameServerPort, steamIDGameServer)
    ccall((:SteamAPI_ISteamMatchmaking_SetLobbyGameServer, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cint, Cint), self, steamIDLobby, unGameServerIP, unGameServerPort, steamIDGameServer)
end

function SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit(self, steamIDLobby)
    ccall((:SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDLobby)
end

function SteamAPI_ISteamMatchmakingServerListResponse_ServerResponded(self, hRequest, iServer)
    ccall((:SteamAPI_ISteamMatchmakingServerListResponse_ServerResponded, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, hRequest, iServer)
end

function SteamAPI_ISteamMatchmakingServerListResponse_ServerFailedToRespond(self, hRequest, iServer)
    ccall((:SteamAPI_ISteamMatchmakingServerListResponse_ServerFailedToRespond, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, hRequest, iServer)
end

function SteamAPI_ISteamMatchmakingServerListResponse_RefreshComplete(self, hRequest, response)
    ccall((:SteamAPI_ISteamMatchmakingServerListResponse_RefreshComplete, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, hRequest, response)
end

function SteamAPI_ISteamMatchmakingPingResponse_ServerResponded(self, arg2)
    ccall((:SteamAPI_ISteamMatchmakingPingResponse_ServerResponded, libsteam_api), Cint, (Ptr{Cint}, Cint), self, arg2)
end

function SteamAPI_ISteamMatchmakingPingResponse_ServerFailedToRespond(self)
    ccall((:SteamAPI_ISteamMatchmakingPingResponse_ServerFailedToRespond, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamMatchmakingPlayersResponse_AddPlayerToList(self, pchName, nScore, flTimePlayed)
    ccall((:SteamAPI_ISteamMatchmakingPlayersResponse_AddPlayerToList, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}, Cint, Cfloat), self, pchName, nScore, flTimePlayed)
end

function SteamAPI_ISteamMatchmakingPlayersResponse_PlayersFailedToRespond(self)
    ccall((:SteamAPI_ISteamMatchmakingPlayersResponse_PlayersFailedToRespond, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamMatchmakingPlayersResponse_PlayersRefreshComplete(self)
    ccall((:SteamAPI_ISteamMatchmakingPlayersResponse_PlayersRefreshComplete, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamMatchmakingRulesResponse_RulesResponded(self, pchRule, pchValue)
    ccall((:SteamAPI_ISteamMatchmakingRulesResponse_RulesResponded, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}, Ptr{Cchar}), self, pchRule, pchValue)
end

function SteamAPI_ISteamMatchmakingRulesResponse_RulesFailedToRespond(self)
    ccall((:SteamAPI_ISteamMatchmakingRulesResponse_RulesFailedToRespond, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamMatchmakingRulesResponse_RulesRefreshComplete(self)
    ccall((:SteamAPI_ISteamMatchmakingRulesResponse_RulesRefreshComplete, libsteam_api), Cint, (Ptr{Cint},), self)
end

# no prototype is found for this function at steam_api_flat.h:302:34, please use with caution
function SteamAPI_SteamMatchmakingServers()
    ccall((:SteamAPI_SteamMatchmakingServers, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamMatchmakingServers_ReleaseRequest(self, hServerListRequest)
    ccall((:SteamAPI_ISteamMatchmakingServers_ReleaseRequest, libsteam_api), Cint, (Ptr{Cint}, Cint), self, hServerListRequest)
end

function SteamAPI_ISteamMatchmakingServers_CancelQuery(self, hRequest)
    ccall((:SteamAPI_ISteamMatchmakingServers_CancelQuery, libsteam_api), Cint, (Ptr{Cint}, Cint), self, hRequest)
end

function SteamAPI_ISteamMatchmakingServers_RefreshQuery(self, hRequest)
    ccall((:SteamAPI_ISteamMatchmakingServers_RefreshQuery, libsteam_api), Cint, (Ptr{Cint}, Cint), self, hRequest)
end

function SteamAPI_ISteamMatchmakingServers_GetServerCount(self, hRequest)
    ccall((:SteamAPI_ISteamMatchmakingServers_GetServerCount, libsteam_api), Cint, (Ptr{Cint}, Cint), self, hRequest)
end

function SteamAPI_ISteamMatchmakingServers_RefreshServer(self, hRequest, iServer)
    ccall((:SteamAPI_ISteamMatchmakingServers_RefreshServer, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, hRequest, iServer)
end

function SteamAPI_ISteamMatchmakingServers_CancelServerQuery(self, hServerQuery)
    ccall((:SteamAPI_ISteamMatchmakingServers_CancelServerQuery, libsteam_api), Cint, (Ptr{Cint}, Cint), self, hServerQuery)
end

# no prototype is found for this function at steam_api_flat.h:326:26, please use with caution
function SteamAPI_SteamGameSearch()
    ccall((:SteamAPI_SteamGameSearch, libsteam_api), Ptr{Cint}, ())
end

# no prototype is found for this function at steam_api_flat.h:347:23, please use with caution
function SteamAPI_SteamParties()
    ccall((:SteamAPI_SteamParties, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamParties_OnReservationCompleted(self, ulBeacon, steamIDUser)
    ccall((:SteamAPI_ISteamParties_OnReservationCompleted, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, ulBeacon, steamIDUser)
end

function SteamAPI_ISteamParties_CancelReservation(self, ulBeacon, steamIDUser)
    ccall((:SteamAPI_ISteamParties_CancelReservation, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, ulBeacon, steamIDUser)
end

# no prototype is found for this function at steam_api_flat.h:366:29, please use with caution
function SteamAPI_SteamRemoteStorage()
    ccall((:SteamAPI_SteamRemoteStorage, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamRemoteStorage_GetFileNameAndSize(self, iFile, pnFileSizeInBytes)
    ccall((:SteamAPI_ISteamRemoteStorage_GetFileNameAndSize, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint, Ptr{Cint}), self, iFile, pnFileSizeInBytes)
end

function SteamAPI_ISteamRemoteStorage_SetCloudEnabledForApp(self, bEnabled)
    ccall((:SteamAPI_ISteamRemoteStorage_SetCloudEnabledForApp, libsteam_api), Cint, (Ptr{Cint}, Cint), self, bEnabled)
end

function SteamAPI_ISteamRemoteStorage_GetLocalFileChange(self, iFile, pEChangeType, pEFilePathType)
    ccall((:SteamAPI_ISteamRemoteStorage_GetLocalFileChange, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Cint}), self, iFile, pEChangeType, pEFilePathType)
end

# no prototype is found for this function at steam_api_flat.h:432:25, please use with caution
function SteamAPI_SteamUserStats()
    ccall((:SteamAPI_SteamUserStats, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamUserStats_GetAchievementIcon(self, pchName)
    ccall((:SteamAPI_ISteamUserStats_GetAchievementIcon, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}), self, pchName)
end

function SteamAPI_ISteamUserStats_GetAchievementDisplayAttribute(self, pchName, pchKey)
    ccall((:SteamAPI_ISteamUserStats_GetAchievementDisplayAttribute, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Ptr{Cchar}, Ptr{Cchar}), self, pchName, pchKey)
end

function SteamAPI_ISteamUserStats_GetAchievementName(self, iAchievement)
    ccall((:SteamAPI_ISteamUserStats_GetAchievementName, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, iAchievement)
end

function SteamAPI_ISteamUserStats_GetLeaderboardName(self, hSteamLeaderboard)
    ccall((:SteamAPI_ISteamUserStats_GetLeaderboardName, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, hSteamLeaderboard)
end

function SteamAPI_ISteamUserStats_GetLeaderboardEntryCount(self, hSteamLeaderboard)
    ccall((:SteamAPI_ISteamUserStats_GetLeaderboardEntryCount, libsteam_api), Cint, (Ptr{Cint}, Cint), self, hSteamLeaderboard)
end

function SteamAPI_ISteamUserStats_GetMostAchievedAchievementInfo(self, pchName, unNameBufLen, pflPercent, pbAchieved)
    ccall((:SteamAPI_ISteamUserStats_GetMostAchievedAchievementInfo, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}, Cint, Ptr{Cfloat}, Ptr{Cint}), self, pchName, unNameBufLen, pflPercent, pbAchieved)
end

function SteamAPI_ISteamUserStats_GetNextMostAchievedAchievementInfo(self, iIteratorPrevious, pchName, unNameBufLen, pflPercent, pbAchieved)
    ccall((:SteamAPI_ISteamUserStats_GetNextMostAchievedAchievementInfo, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Cchar}, Cint, Ptr{Cfloat}, Ptr{Cint}), self, iIteratorPrevious, pchName, unNameBufLen, pflPercent, pbAchieved)
end

# no prototype is found for this function at steam_api_flat.h:483:20, please use with caution
function SteamAPI_SteamApps()
    ccall((:SteamAPI_SteamApps, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamApps_GetCurrentGameLanguage(self)
    ccall((:SteamAPI_ISteamApps_GetCurrentGameLanguage, libsteam_api), Ptr{Cint}, (Ptr{Cint},), self)
end

function SteamAPI_ISteamApps_GetAvailableGameLanguages(self)
    ccall((:SteamAPI_ISteamApps_GetAvailableGameLanguages, libsteam_api), Ptr{Cint}, (Ptr{Cint},), self)
end

function SteamAPI_ISteamApps_GetDLCCount(self)
    ccall((:SteamAPI_ISteamApps_GetDLCCount, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamApps_InstallDLC(self, nAppID)
    ccall((:SteamAPI_ISteamApps_InstallDLC, libsteam_api), Cint, (Ptr{Cint}, Cint), self, nAppID)
end

function SteamAPI_ISteamApps_UninstallDLC(self, nAppID)
    ccall((:SteamAPI_ISteamApps_UninstallDLC, libsteam_api), Cint, (Ptr{Cint}, Cint), self, nAppID)
end

function SteamAPI_ISteamApps_RequestAppProofOfPurchaseKey(self, nAppID)
    ccall((:SteamAPI_ISteamApps_RequestAppProofOfPurchaseKey, libsteam_api), Cint, (Ptr{Cint}, Cint), self, nAppID)
end

function SteamAPI_ISteamApps_GetLaunchQueryParam(self, pchKey)
    ccall((:SteamAPI_ISteamApps_GetLaunchQueryParam, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Ptr{Cchar}), self, pchKey)
end

function SteamAPI_ISteamApps_GetAppBuildId(self)
    ccall((:SteamAPI_ISteamApps_GetAppBuildId, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamApps_RequestAllProofOfPurchaseKeys(self)
    ccall((:SteamAPI_ISteamApps_RequestAllProofOfPurchaseKeys, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamApps_GetLaunchCommandLine(self, pszCommandLine, cubCommandLine)
    ccall((:SteamAPI_ISteamApps_GetLaunchCommandLine, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}, Cint), self, pszCommandLine, cubCommandLine)
end

function SteamAPI_ISteamApps_GetNumBetas(self, pnAvailable, pnPrivate)
    ccall((:SteamAPI_ISteamApps_GetNumBetas, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), self, pnAvailable, pnPrivate)
end

# no prototype is found for this function at steam_api_flat.h:523:26, please use with caution
function SteamAPI_SteamNetworking()
    ccall((:SteamAPI_SteamNetworking, libsteam_api), Ptr{Cint}, ())
end

# no prototype is found for this function at steam_api_flat.h:528:26, please use with caution
function SteamAPI_SteamGameServerNetworking()
    ccall((:SteamAPI_SteamGameServerNetworking, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamNetworking_GetMaxPacketSize(self, hSocket)
    ccall((:SteamAPI_ISteamNetworking_GetMaxPacketSize, libsteam_api), Cint, (Ptr{Cint}, Cint), self, hSocket)
end

# no prototype is found for this function at steam_api_flat.h:557:27, please use with caution
function SteamAPI_SteamScreenshots()
    ccall((:SteamAPI_SteamScreenshots, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamScreenshots_TriggerScreenshot(self)
    ccall((:SteamAPI_ISteamScreenshots_TriggerScreenshot, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamScreenshots_HookScreenshots(self, bHook)
    ccall((:SteamAPI_ISteamScreenshots_HookScreenshots, libsteam_api), Cint, (Ptr{Cint}, Cint), self, bHook)
end

# no prototype is found for this function at steam_api_flat.h:573:21, please use with caution
function SteamAPI_SteamMusic()
    ccall((:SteamAPI_SteamMusic, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamMusic_Play(self)
    ccall((:SteamAPI_ISteamMusic_Play, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamMusic_Pause(self)
    ccall((:SteamAPI_ISteamMusic_Pause, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamMusic_PlayPrevious(self)
    ccall((:SteamAPI_ISteamMusic_PlayPrevious, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamMusic_PlayNext(self)
    ccall((:SteamAPI_ISteamMusic_PlayNext, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamMusic_SetVolume(self, flVolume)
    ccall((:SteamAPI_ISteamMusic_SetVolume, libsteam_api), Cint, (Ptr{Cint}, Cfloat), self, flVolume)
end

function SteamAPI_ISteamMusic_GetVolume(self)
    ccall((:SteamAPI_ISteamMusic_GetVolume, libsteam_api), Cint, (Ptr{Cint},), self)
end

# no prototype is found for this function at steam_api_flat.h:589:27, please use with caution
function SteamAPI_SteamMusicRemote()
    ccall((:SteamAPI_SteamMusicRemote, libsteam_api), Ptr{Cint}, ())
end

# no prototype is found for this function at steam_api_flat.h:628:20, please use with caution
function SteamAPI_SteamHTTP()
    ccall((:SteamAPI_SteamHTTP, libsteam_api), Ptr{Cint}, ())
end

# no prototype is found for this function at steam_api_flat.h:633:20, please use with caution
function SteamAPI_SteamGameServerHTTP()
    ccall((:SteamAPI_SteamGameServerHTTP, libsteam_api), Ptr{Cint}, ())
end

# no prototype is found for this function at steam_api_flat.h:665:21, please use with caution
function SteamAPI_SteamInput()
    ccall((:SteamAPI_SteamInput, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamInput_RunFrame(self, bReservedValue)
    ccall((:SteamAPI_ISteamInput_RunFrame, libsteam_api), Cint, (Ptr{Cint}, Cint), self, bReservedValue)
end

function SteamAPI_ISteamInput_GetConnectedControllers(self, handlesOut)
    ccall((:SteamAPI_ISteamInput_GetConnectedControllers, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cint}), self, handlesOut)
end

function SteamAPI_ISteamInput_EnableDeviceCallbacks(self)
    ccall((:SteamAPI_ISteamInput_EnableDeviceCallbacks, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamInput_EnableActionEventCallbacks(self, pCallback)
    ccall((:SteamAPI_ISteamInput_EnableActionEventCallbacks, libsteam_api), Cint, (Ptr{Cint}, Cint), self, pCallback)
end

function SteamAPI_ISteamInput_ActivateActionSet(self, inputHandle, actionSetHandle)
    ccall((:SteamAPI_ISteamInput_ActivateActionSet, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, inputHandle, actionSetHandle)
end

function SteamAPI_ISteamInput_ActivateActionSetLayer(self, inputHandle, actionSetLayerHandle)
    ccall((:SteamAPI_ISteamInput_ActivateActionSetLayer, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, inputHandle, actionSetLayerHandle)
end

function SteamAPI_ISteamInput_DeactivateActionSetLayer(self, inputHandle, actionSetLayerHandle)
    ccall((:SteamAPI_ISteamInput_DeactivateActionSetLayer, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, inputHandle, actionSetLayerHandle)
end

function SteamAPI_ISteamInput_DeactivateAllActionSetLayers(self, inputHandle)
    ccall((:SteamAPI_ISteamInput_DeactivateAllActionSetLayers, libsteam_api), Cint, (Ptr{Cint}, Cint), self, inputHandle)
end

function SteamAPI_ISteamInput_GetActiveActionSetLayers(self, inputHandle, handlesOut)
    ccall((:SteamAPI_ISteamInput_GetActiveActionSetLayers, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Cint}), self, inputHandle, handlesOut)
end

function SteamAPI_ISteamInput_GetDigitalActionOrigins(self, inputHandle, actionSetHandle, digitalActionHandle, originsOut)
    ccall((:SteamAPI_ISteamInput_GetDigitalActionOrigins, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cint, Ptr{Cint}), self, inputHandle, actionSetHandle, digitalActionHandle, originsOut)
end

function SteamAPI_ISteamInput_GetStringForDigitalActionName(self, eActionHandle)
    ccall((:SteamAPI_ISteamInput_GetStringForDigitalActionName, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, eActionHandle)
end

function SteamAPI_ISteamInput_GetAnalogActionOrigins(self, inputHandle, actionSetHandle, analogActionHandle, originsOut)
    ccall((:SteamAPI_ISteamInput_GetAnalogActionOrigins, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cint, Ptr{Cint}), self, inputHandle, actionSetHandle, analogActionHandle, originsOut)
end

function SteamAPI_ISteamInput_GetGlyphPNGForActionOrigin(self, eOrigin, eSize, unFlags)
    ccall((:SteamAPI_ISteamInput_GetGlyphPNGForActionOrigin, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint, Cint, Cint), self, eOrigin, eSize, unFlags)
end

function SteamAPI_ISteamInput_GetGlyphSVGForActionOrigin(self, eOrigin, unFlags)
    ccall((:SteamAPI_ISteamInput_GetGlyphSVGForActionOrigin, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint, Cint), self, eOrigin, unFlags)
end

function SteamAPI_ISteamInput_GetGlyphForActionOrigin_Legacy(self, eOrigin)
    ccall((:SteamAPI_ISteamInput_GetGlyphForActionOrigin_Legacy, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, eOrigin)
end

function SteamAPI_ISteamInput_GetStringForActionOrigin(self, eOrigin)
    ccall((:SteamAPI_ISteamInput_GetStringForActionOrigin, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, eOrigin)
end

function SteamAPI_ISteamInput_GetStringForAnalogActionName(self, eActionHandle)
    ccall((:SteamAPI_ISteamInput_GetStringForAnalogActionName, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, eActionHandle)
end

function SteamAPI_ISteamInput_StopAnalogActionMomentum(self, inputHandle, eAction)
    ccall((:SteamAPI_ISteamInput_StopAnalogActionMomentum, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, inputHandle, eAction)
end

function SteamAPI_ISteamInput_TriggerVibration(self, inputHandle, usLeftSpeed, usRightSpeed)
    ccall((:SteamAPI_ISteamInput_TriggerVibration, libsteam_api), Cint, (Ptr{Cint}, Cint, Cushort, Cushort), self, inputHandle, usLeftSpeed, usRightSpeed)
end

function SteamAPI_ISteamInput_TriggerVibrationExtended(self, inputHandle, usLeftSpeed, usRightSpeed, usLeftTriggerSpeed, usRightTriggerSpeed)
    ccall((:SteamAPI_ISteamInput_TriggerVibrationExtended, libsteam_api), Cint, (Ptr{Cint}, Cint, Cushort, Cushort, Cushort, Cushort), self, inputHandle, usLeftSpeed, usRightSpeed, usLeftTriggerSpeed, usRightTriggerSpeed)
end

function SteamAPI_ISteamInput_TriggerSimpleHapticEvent(self, inputHandle, eHapticLocation, nIntensity, nGainDB, nOtherIntensity, nOtherGainDB)
    ccall((:SteamAPI_ISteamInput_TriggerSimpleHapticEvent, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cint, Cchar, Cint, Cchar), self, inputHandle, eHapticLocation, nIntensity, nGainDB, nOtherIntensity, nOtherGainDB)
end

function SteamAPI_ISteamInput_SetLEDColor(self, inputHandle, nColorR, nColorG, nColorB, nFlags)
    ccall((:SteamAPI_ISteamInput_SetLEDColor, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cint, Cint, Cuint), self, inputHandle, nColorR, nColorG, nColorB, nFlags)
end

function SteamAPI_ISteamInput_Legacy_TriggerHapticPulse(self, inputHandle, eTargetPad, usDurationMicroSec)
    ccall((:SteamAPI_ISteamInput_Legacy_TriggerHapticPulse, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cushort), self, inputHandle, eTargetPad, usDurationMicroSec)
end

function SteamAPI_ISteamInput_Legacy_TriggerRepeatedHapticPulse(self, inputHandle, eTargetPad, usDurationMicroSec, usOffMicroSec, unRepeat, nFlags)
    ccall((:SteamAPI_ISteamInput_Legacy_TriggerRepeatedHapticPulse, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cushort, Cushort, Cushort, Cuint), self, inputHandle, eTargetPad, usDurationMicroSec, usOffMicroSec, unRepeat, nFlags)
end

function SteamAPI_ISteamInput_GetGamepadIndexForController(self, ulinputHandle)
    ccall((:SteamAPI_ISteamInput_GetGamepadIndexForController, libsteam_api), Cint, (Ptr{Cint}, Cint), self, ulinputHandle)
end

function SteamAPI_ISteamInput_GetStringForXboxOrigin(self, eOrigin)
    ccall((:SteamAPI_ISteamInput_GetStringForXboxOrigin, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, eOrigin)
end

function SteamAPI_ISteamInput_GetGlyphForXboxOrigin(self, eOrigin)
    ccall((:SteamAPI_ISteamInput_GetGlyphForXboxOrigin, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, eOrigin)
end

function SteamAPI_ISteamInput_SetDualSenseTriggerEffect(self, inputHandle, pParam)
    ccall((:SteamAPI_ISteamInput_SetDualSenseTriggerEffect, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Cint}), self, inputHandle, pParam)
end

# no prototype is found for this function at steam_api_flat.h:720:26, please use with caution
function SteamAPI_SteamController()
    ccall((:SteamAPI_SteamController, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamController_RunFrame(self)
    ccall((:SteamAPI_ISteamController_RunFrame, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamController_GetConnectedControllers(self, handlesOut)
    ccall((:SteamAPI_ISteamController_GetConnectedControllers, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cint}), self, handlesOut)
end

function SteamAPI_ISteamController_ActivateActionSet(self, controllerHandle, actionSetHandle)
    ccall((:SteamAPI_ISteamController_ActivateActionSet, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, controllerHandle, actionSetHandle)
end

function SteamAPI_ISteamController_ActivateActionSetLayer(self, controllerHandle, actionSetLayerHandle)
    ccall((:SteamAPI_ISteamController_ActivateActionSetLayer, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, controllerHandle, actionSetLayerHandle)
end

function SteamAPI_ISteamController_DeactivateActionSetLayer(self, controllerHandle, actionSetLayerHandle)
    ccall((:SteamAPI_ISteamController_DeactivateActionSetLayer, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, controllerHandle, actionSetLayerHandle)
end

function SteamAPI_ISteamController_DeactivateAllActionSetLayers(self, controllerHandle)
    ccall((:SteamAPI_ISteamController_DeactivateAllActionSetLayers, libsteam_api), Cint, (Ptr{Cint}, Cint), self, controllerHandle)
end

function SteamAPI_ISteamController_GetActiveActionSetLayers(self, controllerHandle, handlesOut)
    ccall((:SteamAPI_ISteamController_GetActiveActionSetLayers, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Cint}), self, controllerHandle, handlesOut)
end

function SteamAPI_ISteamController_GetDigitalActionOrigins(self, controllerHandle, actionSetHandle, digitalActionHandle, originsOut)
    ccall((:SteamAPI_ISteamController_GetDigitalActionOrigins, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cint, Ptr{Cint}), self, controllerHandle, actionSetHandle, digitalActionHandle, originsOut)
end

function SteamAPI_ISteamController_GetAnalogActionOrigins(self, controllerHandle, actionSetHandle, analogActionHandle, originsOut)
    ccall((:SteamAPI_ISteamController_GetAnalogActionOrigins, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cint, Ptr{Cint}), self, controllerHandle, actionSetHandle, analogActionHandle, originsOut)
end

function SteamAPI_ISteamController_GetGlyphForActionOrigin(self, eOrigin)
    ccall((:SteamAPI_ISteamController_GetGlyphForActionOrigin, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, eOrigin)
end

function SteamAPI_ISteamController_GetStringForActionOrigin(self, eOrigin)
    ccall((:SteamAPI_ISteamController_GetStringForActionOrigin, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, eOrigin)
end

function SteamAPI_ISteamController_StopAnalogActionMomentum(self, controllerHandle, eAction)
    ccall((:SteamAPI_ISteamController_StopAnalogActionMomentum, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, controllerHandle, eAction)
end

function SteamAPI_ISteamController_TriggerHapticPulse(self, controllerHandle, eTargetPad, usDurationMicroSec)
    ccall((:SteamAPI_ISteamController_TriggerHapticPulse, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cushort), self, controllerHandle, eTargetPad, usDurationMicroSec)
end

function SteamAPI_ISteamController_TriggerRepeatedHapticPulse(self, controllerHandle, eTargetPad, usDurationMicroSec, usOffMicroSec, unRepeat, nFlags)
    ccall((:SteamAPI_ISteamController_TriggerRepeatedHapticPulse, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cushort, Cushort, Cushort, Cuint), self, controllerHandle, eTargetPad, usDurationMicroSec, usOffMicroSec, unRepeat, nFlags)
end

function SteamAPI_ISteamController_TriggerVibration(self, controllerHandle, usLeftSpeed, usRightSpeed)
    ccall((:SteamAPI_ISteamController_TriggerVibration, libsteam_api), Cint, (Ptr{Cint}, Cint, Cushort, Cushort), self, controllerHandle, usLeftSpeed, usRightSpeed)
end

function SteamAPI_ISteamController_SetLEDColor(self, controllerHandle, nColorR, nColorG, nColorB, nFlags)
    ccall((:SteamAPI_ISteamController_SetLEDColor, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cint, Cint, Cuint), self, controllerHandle, nColorR, nColorG, nColorB, nFlags)
end

function SteamAPI_ISteamController_GetGamepadIndexForController(self, ulControllerHandle)
    ccall((:SteamAPI_ISteamController_GetGamepadIndexForController, libsteam_api), Cint, (Ptr{Cint}, Cint), self, ulControllerHandle)
end

function SteamAPI_ISteamController_GetStringForXboxOrigin(self, eOrigin)
    ccall((:SteamAPI_ISteamController_GetStringForXboxOrigin, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, eOrigin)
end

function SteamAPI_ISteamController_GetGlyphForXboxOrigin(self, eOrigin)
    ccall((:SteamAPI_ISteamController_GetGlyphForXboxOrigin, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, eOrigin)
end

# no prototype is found for this function at steam_api_flat.h:761:19, please use with caution
function SteamAPI_SteamUGC()
    ccall((:SteamAPI_SteamUGC, libsteam_api), Ptr{Cint}, ())
end

# no prototype is found for this function at steam_api_flat.h:766:19, please use with caution
function SteamAPI_SteamGameServerUGC()
    ccall((:SteamAPI_SteamGameServerUGC, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamUGC_SuspendDownloads(self, bSuspend)
    ccall((:SteamAPI_ISteamUGC_SuspendDownloads, libsteam_api), Cint, (Ptr{Cint}, Cint), self, bSuspend)
end

# no prototype is found for this function at steam_api_flat.h:867:27, please use with caution
function SteamAPI_SteamHTMLSurface()
    ccall((:SteamAPI_SteamHTMLSurface, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamHTMLSurface_RemoveBrowser(self, unBrowserHandle)
    ccall((:SteamAPI_ISteamHTMLSurface_RemoveBrowser, libsteam_api), Cint, (Ptr{Cint}, Cint), self, unBrowserHandle)
end

function SteamAPI_ISteamHTMLSurface_LoadURL(self, unBrowserHandle, pchURL, pchPostData)
    ccall((:SteamAPI_ISteamHTMLSurface_LoadURL, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Cchar}, Ptr{Cchar}), self, unBrowserHandle, pchURL, pchPostData)
end

function SteamAPI_ISteamHTMLSurface_SetSize(self, unBrowserHandle, unWidth, unHeight)
    ccall((:SteamAPI_ISteamHTMLSurface_SetSize, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cint), self, unBrowserHandle, unWidth, unHeight)
end

function SteamAPI_ISteamHTMLSurface_StopLoad(self, unBrowserHandle)
    ccall((:SteamAPI_ISteamHTMLSurface_StopLoad, libsteam_api), Cint, (Ptr{Cint}, Cint), self, unBrowserHandle)
end

function SteamAPI_ISteamHTMLSurface_Reload(self, unBrowserHandle)
    ccall((:SteamAPI_ISteamHTMLSurface_Reload, libsteam_api), Cint, (Ptr{Cint}, Cint), self, unBrowserHandle)
end

function SteamAPI_ISteamHTMLSurface_GoBack(self, unBrowserHandle)
    ccall((:SteamAPI_ISteamHTMLSurface_GoBack, libsteam_api), Cint, (Ptr{Cint}, Cint), self, unBrowserHandle)
end

function SteamAPI_ISteamHTMLSurface_GoForward(self, unBrowserHandle)
    ccall((:SteamAPI_ISteamHTMLSurface_GoForward, libsteam_api), Cint, (Ptr{Cint}, Cint), self, unBrowserHandle)
end

function SteamAPI_ISteamHTMLSurface_AddHeader(self, unBrowserHandle, pchKey, pchValue)
    ccall((:SteamAPI_ISteamHTMLSurface_AddHeader, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Cchar}, Ptr{Cchar}), self, unBrowserHandle, pchKey, pchValue)
end

function SteamAPI_ISteamHTMLSurface_ExecuteJavascript(self, unBrowserHandle, pchScript)
    ccall((:SteamAPI_ISteamHTMLSurface_ExecuteJavascript, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Cchar}), self, unBrowserHandle, pchScript)
end

function SteamAPI_ISteamHTMLSurface_MouseUp(self, unBrowserHandle, ISteamHTMLSurface)
    ccall((:SteamAPI_ISteamHTMLSurface_MouseUp, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, unBrowserHandle, ISteamHTMLSurface)
end

function SteamAPI_ISteamHTMLSurface_MouseDown(self, unBrowserHandle, ISteamHTMLSurface)
    ccall((:SteamAPI_ISteamHTMLSurface_MouseDown, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, unBrowserHandle, ISteamHTMLSurface)
end

function SteamAPI_ISteamHTMLSurface_MouseDoubleClick(self, unBrowserHandle, ISteamHTMLSurface)
    ccall((:SteamAPI_ISteamHTMLSurface_MouseDoubleClick, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, unBrowserHandle, ISteamHTMLSurface)
end

function SteamAPI_ISteamHTMLSurface_MouseMove(self, unBrowserHandle, x, y)
    ccall((:SteamAPI_ISteamHTMLSurface_MouseMove, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cint), self, unBrowserHandle, x, y)
end

function SteamAPI_ISteamHTMLSurface_MouseWheel(self, unBrowserHandle, nDelta)
    ccall((:SteamAPI_ISteamHTMLSurface_MouseWheel, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, unBrowserHandle, nDelta)
end

function SteamAPI_ISteamHTMLSurface_KeyDown(self, unBrowserHandle, nNativeKeyCode, ISteamHTMLSurface)
    ccall((:SteamAPI_ISteamHTMLSurface_KeyDown, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cint), self, unBrowserHandle, nNativeKeyCode, ISteamHTMLSurface)
end

function SteamAPI_ISteamHTMLSurface_KeyUp(self, unBrowserHandle, nNativeKeyCode, ISteamHTMLSurface)
    ccall((:SteamAPI_ISteamHTMLSurface_KeyUp, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cint), self, unBrowserHandle, nNativeKeyCode, ISteamHTMLSurface)
end

function SteamAPI_ISteamHTMLSurface_KeyChar(self, unBrowserHandle, cUnicodeChar, ISteamHTMLSurface)
    ccall((:SteamAPI_ISteamHTMLSurface_KeyChar, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cint), self, unBrowserHandle, cUnicodeChar, ISteamHTMLSurface)
end

function SteamAPI_ISteamHTMLSurface_SetHorizontalScroll(self, unBrowserHandle, nAbsolutePixelScroll)
    ccall((:SteamAPI_ISteamHTMLSurface_SetHorizontalScroll, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, unBrowserHandle, nAbsolutePixelScroll)
end

function SteamAPI_ISteamHTMLSurface_SetVerticalScroll(self, unBrowserHandle, nAbsolutePixelScroll)
    ccall((:SteamAPI_ISteamHTMLSurface_SetVerticalScroll, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, unBrowserHandle, nAbsolutePixelScroll)
end

function SteamAPI_ISteamHTMLSurface_SetKeyFocus(self, unBrowserHandle, bHasKeyFocus)
    ccall((:SteamAPI_ISteamHTMLSurface_SetKeyFocus, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, unBrowserHandle, bHasKeyFocus)
end

function SteamAPI_ISteamHTMLSurface_ViewSource(self, unBrowserHandle)
    ccall((:SteamAPI_ISteamHTMLSurface_ViewSource, libsteam_api), Cint, (Ptr{Cint}, Cint), self, unBrowserHandle)
end

function SteamAPI_ISteamHTMLSurface_CopyToClipboard(self, unBrowserHandle)
    ccall((:SteamAPI_ISteamHTMLSurface_CopyToClipboard, libsteam_api), Cint, (Ptr{Cint}, Cint), self, unBrowserHandle)
end

function SteamAPI_ISteamHTMLSurface_PasteFromClipboard(self, unBrowserHandle)
    ccall((:SteamAPI_ISteamHTMLSurface_PasteFromClipboard, libsteam_api), Cint, (Ptr{Cint}, Cint), self, unBrowserHandle)
end

function SteamAPI_ISteamHTMLSurface_Find(self, unBrowserHandle, pchSearchStr, bCurrentlyInFind, bReverse)
    ccall((:SteamAPI_ISteamHTMLSurface_Find, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Cchar}, Cint, Cint), self, unBrowserHandle, pchSearchStr, bCurrentlyInFind, bReverse)
end

function SteamAPI_ISteamHTMLSurface_StopFind(self, unBrowserHandle)
    ccall((:SteamAPI_ISteamHTMLSurface_StopFind, libsteam_api), Cint, (Ptr{Cint}, Cint), self, unBrowserHandle)
end

function SteamAPI_ISteamHTMLSurface_GetLinkAtPosition(self, unBrowserHandle, x, y)
    ccall((:SteamAPI_ISteamHTMLSurface_GetLinkAtPosition, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cint), self, unBrowserHandle, x, y)
end

function SteamAPI_ISteamHTMLSurface_SetCookie(self, pchHostname, pchKey, pchValue, pchPath, nExpires, bSecure, bHTTPOnly)
    ccall((:SteamAPI_ISteamHTMLSurface_SetCookie, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Cint), self, pchHostname, pchKey, pchValue, pchPath, nExpires, bSecure, bHTTPOnly)
end

function SteamAPI_ISteamHTMLSurface_SetPageScaleFactor(self, unBrowserHandle, flZoom, nPointX, nPointY)
    ccall((:SteamAPI_ISteamHTMLSurface_SetPageScaleFactor, libsteam_api), Cint, (Ptr{Cint}, Cint, Cfloat, Cint, Cint), self, unBrowserHandle, flZoom, nPointX, nPointY)
end

function SteamAPI_ISteamHTMLSurface_SetBackgroundMode(self, unBrowserHandle, bBackgroundMode)
    ccall((:SteamAPI_ISteamHTMLSurface_SetBackgroundMode, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, unBrowserHandle, bBackgroundMode)
end

function SteamAPI_ISteamHTMLSurface_SetDPIScalingFactor(self, unBrowserHandle, flDPIScaling)
    ccall((:SteamAPI_ISteamHTMLSurface_SetDPIScalingFactor, libsteam_api), Cint, (Ptr{Cint}, Cint, Cfloat), self, unBrowserHandle, flDPIScaling)
end

function SteamAPI_ISteamHTMLSurface_OpenDeveloperTools(self, unBrowserHandle)
    ccall((:SteamAPI_ISteamHTMLSurface_OpenDeveloperTools, libsteam_api), Cint, (Ptr{Cint}, Cint), self, unBrowserHandle)
end

function SteamAPI_ISteamHTMLSurface_AllowStartRequest(self, unBrowserHandle, bAllowed)
    ccall((:SteamAPI_ISteamHTMLSurface_AllowStartRequest, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, unBrowserHandle, bAllowed)
end

function SteamAPI_ISteamHTMLSurface_JSDialogResponse(self, unBrowserHandle, bResult)
    ccall((:SteamAPI_ISteamHTMLSurface_JSDialogResponse, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, unBrowserHandle, bResult)
end

function SteamAPI_ISteamHTMLSurface_FileLoadDialogResponse(self, unBrowserHandle, pchSelectedFiles)
    ccall((:SteamAPI_ISteamHTMLSurface_FileLoadDialogResponse, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Ptr{Cchar}}), self, unBrowserHandle, pchSelectedFiles)
end

# no prototype is found for this function at steam_api_flat.h:911:25, please use with caution
function SteamAPI_SteamInventory()
    ccall((:SteamAPI_SteamInventory, libsteam_api), Ptr{Cint}, ())
end

# no prototype is found for this function at steam_api_flat.h:916:25, please use with caution
function SteamAPI_SteamGameServerInventory()
    ccall((:SteamAPI_SteamGameServerInventory, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamInventory_DestroyResult(self, resultHandle)
    ccall((:SteamAPI_ISteamInventory_DestroyResult, libsteam_api), Cint, (Ptr{Cint}, Cint), self, resultHandle)
end

function SteamAPI_ISteamInventory_SendItemDropHeartbeat(self)
    ccall((:SteamAPI_ISteamInventory_SendItemDropHeartbeat, libsteam_api), Cint, (Ptr{Cint},), self)
end

# no prototype is found for this function at steam_api_flat.h:961:24, please use with caution
function SteamAPI_SteamTimeline()
    ccall((:SteamAPI_SteamTimeline, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamTimeline_SetTimelineTooltip(self, pchDescription, flTimeDelta)
    ccall((:SteamAPI_ISteamTimeline_SetTimelineTooltip, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}, Cfloat), self, pchDescription, flTimeDelta)
end

function SteamAPI_ISteamTimeline_ClearTimelineTooltip(self, flTimeDelta)
    ccall((:SteamAPI_ISteamTimeline_ClearTimelineTooltip, libsteam_api), Cint, (Ptr{Cint}, Cfloat), self, flTimeDelta)
end

function SteamAPI_ISteamTimeline_SetTimelineGameMode(self, eMode)
    ccall((:SteamAPI_ISteamTimeline_SetTimelineGameMode, libsteam_api), Cint, (Ptr{Cint}, Cint), self, eMode)
end

function SteamAPI_ISteamTimeline_UpdateRangeTimelineEvent(self, ulEvent, pchTitle, pchDescription, pchIcon, unPriority, ePossibleClip)
    ccall((:SteamAPI_ISteamTimeline_UpdateRangeTimelineEvent, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Cint, Cint), self, ulEvent, pchTitle, pchDescription, pchIcon, unPriority, ePossibleClip)
end

function SteamAPI_ISteamTimeline_EndRangeTimelineEvent(self, ulEvent, flEndOffsetSeconds)
    ccall((:SteamAPI_ISteamTimeline_EndRangeTimelineEvent, libsteam_api), Cint, (Ptr{Cint}, Cint, Cfloat), self, ulEvent, flEndOffsetSeconds)
end

function SteamAPI_ISteamTimeline_RemoveTimelineEvent(self, ulEvent)
    ccall((:SteamAPI_ISteamTimeline_RemoveTimelineEvent, libsteam_api), Cint, (Ptr{Cint}, Cint), self, ulEvent)
end

function SteamAPI_ISteamTimeline_StartGamePhase(self)
    ccall((:SteamAPI_ISteamTimeline_StartGamePhase, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamTimeline_EndGamePhase(self)
    ccall((:SteamAPI_ISteamTimeline_EndGamePhase, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamTimeline_SetGamePhaseID(self, pchPhaseID)
    ccall((:SteamAPI_ISteamTimeline_SetGamePhaseID, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}), self, pchPhaseID)
end

function SteamAPI_ISteamTimeline_AddGamePhaseTag(self, pchTagName, pchTagIcon, pchTagGroup, unPriority)
    ccall((:SteamAPI_ISteamTimeline_AddGamePhaseTag, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Cint), self, pchTagName, pchTagIcon, pchTagGroup, unPriority)
end

function SteamAPI_ISteamTimeline_SetGamePhaseAttribute(self, pchAttributeGroup, pchAttributeValue, unPriority)
    ccall((:SteamAPI_ISteamTimeline_SetGamePhaseAttribute, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}, Ptr{Cchar}, Cint), self, pchAttributeGroup, pchAttributeValue, unPriority)
end

function SteamAPI_ISteamTimeline_OpenOverlayToGamePhase(self, pchPhaseID)
    ccall((:SteamAPI_ISteamTimeline_OpenOverlayToGamePhase, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}), self, pchPhaseID)
end

function SteamAPI_ISteamTimeline_OpenOverlayToTimelineEvent(self, ulEvent)
    ccall((:SteamAPI_ISteamTimeline_OpenOverlayToTimelineEvent, libsteam_api), Cint, (Ptr{Cint}, Cint), self, ulEvent)
end

# no prototype is found for this function at steam_api_flat.h:986:21, please use with caution
function SteamAPI_SteamVideo()
    ccall((:SteamAPI_SteamVideo, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamVideo_GetVideoURL(self, unVideoAppID)
    ccall((:SteamAPI_ISteamVideo_GetVideoURL, libsteam_api), Cint, (Ptr{Cint}, Cint), self, unVideoAppID)
end

function SteamAPI_ISteamVideo_GetOPFSettings(self, unVideoAppID)
    ccall((:SteamAPI_ISteamVideo_GetOPFSettings, libsteam_api), Cint, (Ptr{Cint}, Cint), self, unVideoAppID)
end

# no prototype is found for this function at steam_api_flat.h:997:32, please use with caution
function SteamAPI_SteamParentalSettings()
    ccall((:SteamAPI_SteamParentalSettings, libsteam_api), Ptr{Cint}, ())
end

# no prototype is found for this function at steam_api_flat.h:1010:26, please use with caution
function SteamAPI_SteamRemotePlay()
    ccall((:SteamAPI_SteamRemotePlay, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamRemotePlay_GetSessionClientName(self, unSessionID)
    ccall((:SteamAPI_ISteamRemotePlay_GetSessionClientName, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint), self, unSessionID)
end

# no prototype is found for this function at steam_api_flat.h:1025:34, please use with caution
function SteamAPI_SteamNetworkingMessages_SteamAPI()
    ccall((:SteamAPI_SteamNetworkingMessages_SteamAPI, libsteam_api), Ptr{Cint}, ())
end

# no prototype is found for this function at steam_api_flat.h:1030:34, please use with caution
function SteamAPI_SteamGameServerNetworkingMessages_SteamAPI()
    ccall((:SteamAPI_SteamGameServerNetworkingMessages_SteamAPI, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamNetworkingMessages_ReceiveMessagesOnChannel(self, nLocalChannel, ppOutMessages, nMaxMessages)
    ccall((:SteamAPI_ISteamNetworkingMessages_ReceiveMessagesOnChannel, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Ptr{Cint}}, Cint), self, nLocalChannel, ppOutMessages, nMaxMessages)
end

# no prototype is found for this function at steam_api_flat.h:1043:33, please use with caution
function SteamAPI_SteamNetworkingSockets_SteamAPI()
    ccall((:SteamAPI_SteamNetworkingSockets_SteamAPI, libsteam_api), Ptr{Cint}, ())
end

# no prototype is found for this function at steam_api_flat.h:1048:33, please use with caution
function SteamAPI_SteamGameServerNetworkingSockets_SteamAPI()
    ccall((:SteamAPI_SteamGameServerNetworkingSockets_SteamAPI, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamNetworkingSockets_SetConnectionName(self, hPeer, pszName)
    ccall((:SteamAPI_ISteamNetworkingSockets_SetConnectionName, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Cchar}), self, hPeer, pszName)
end

function SteamAPI_ISteamNetworkingSockets_SendMessages(self, nMessages, pMessages, pOutMessageNumberOrResult)
    ccall((:SteamAPI_ISteamNetworkingSockets_SendMessages, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Ptr{Cint}}, Ptr{Cint}), self, nMessages, pMessages, pOutMessageNumberOrResult)
end

function SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnConnection(self, hConn, ppOutMessages, nMaxMessages)
    ccall((:SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnConnection, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Ptr{Cint}}, Cint), self, hConn, ppOutMessages, nMaxMessages)
end

function SteamAPI_ISteamNetworkingSockets_GetDetailedConnectionStatus(self, hConn, pszBuf, cbBuf)
    ccall((:SteamAPI_ISteamNetworkingSockets_GetDetailedConnectionStatus, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Cchar}, Cint), self, hConn, pszBuf, cbBuf)
end

function SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnPollGroup(self, hPollGroup, ppOutMessages, nMaxMessages)
    ccall((:SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnPollGroup, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Ptr{Cint}}, Cint), self, hPollGroup, ppOutMessages, nMaxMessages)
end

function SteamAPI_ISteamNetworkingSockets_FindRelayAuthTicketForServer(self, arg2)
    ccall((:SteamAPI_ISteamNetworkingSockets_FindRelayAuthTicketForServer, libsteam_api), Cint, (Ptr{Cint}, Cint), self, arg2)
end

function SteamAPI_ISteamNetworkingSockets_ResetIdentity(self, pIdentity)
    ccall((:SteamAPI_ISteamNetworkingSockets_ResetIdentity, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cint}), self, pIdentity)
end

function SteamAPI_ISteamNetworkingSockets_RunCallbacks(self)
    ccall((:SteamAPI_ISteamNetworkingSockets_RunCallbacks, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamNetworkingSockets_GetFakeIP(self, idxFirstPort, pInfo)
    ccall((:SteamAPI_ISteamNetworkingSockets_GetFakeIP, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Cint}), self, idxFirstPort, pInfo)
end

# no prototype is found for this function at steam_api_flat.h:1102:31, please use with caution
function SteamAPI_SteamNetworkingUtils_SteamAPI()
    ccall((:SteamAPI_SteamNetworkingUtils_SteamAPI, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamNetworkingUtils_InitRelayNetworkAccess(self)
    ccall((:SteamAPI_ISteamNetworkingUtils_InitRelayNetworkAccess, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamNetworkingUtils_GetLocalPingLocation(self, arg2)
    ccall((:SteamAPI_ISteamNetworkingUtils_GetLocalPingLocation, libsteam_api), Cint, (Ptr{Cint}, Cint), self, arg2)
end

function SteamAPI_ISteamNetworkingUtils_EstimatePingTimeBetweenTwoLocations(self, arg2)
    ccall((:SteamAPI_ISteamNetworkingUtils_EstimatePingTimeBetweenTwoLocations, libsteam_api), Cint, (Ptr{Cint}, Cint), self, arg2)
end

function SteamAPI_ISteamNetworkingUtils_EstimatePingTimeFromLocalHost(self, arg2)
    ccall((:SteamAPI_ISteamNetworkingUtils_EstimatePingTimeFromLocalHost, libsteam_api), Cint, (Ptr{Cint}, Cint), self, arg2)
end

function SteamAPI_ISteamNetworkingUtils_ConvertPingLocationToString(self, arg2)
    ccall((:SteamAPI_ISteamNetworkingUtils_ConvertPingLocationToString, libsteam_api), Cint, (Ptr{Cint}, Cint), self, arg2)
end

function SteamAPI_ISteamNetworkingUtils_GetPingToDataCenter(self, popID, pViaRelayPoP)
    ccall((:SteamAPI_ISteamNetworkingUtils_GetPingToDataCenter, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Cint}), self, popID, pViaRelayPoP)
end

function SteamAPI_ISteamNetworkingUtils_GetDirectPingToPOP(self, popID)
    ccall((:SteamAPI_ISteamNetworkingUtils_GetDirectPingToPOP, libsteam_api), Cint, (Ptr{Cint}, Cint), self, popID)
end

function SteamAPI_ISteamNetworkingUtils_GetPOPCount(self)
    ccall((:SteamAPI_ISteamNetworkingUtils_GetPOPCount, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamNetworkingUtils_GetPOPList(self, list, nListSz)
    ccall((:SteamAPI_ISteamNetworkingUtils_GetPOPList, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cint}, Cint), self, list, nListSz)
end

function SteamAPI_ISteamNetworkingUtils_SetDebugOutputFunction(self, eDetailLevel, pfnFunc)
    ccall((:SteamAPI_ISteamNetworkingUtils_SetDebugOutputFunction, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, eDetailLevel, pfnFunc)
end

function SteamAPI_ISteamNetworkingUtils_GetConfigValueInfo(self, eValue, pOutDataType, pOutScope)
    ccall((:SteamAPI_ISteamNetworkingUtils_GetConfigValueInfo, libsteam_api), Ptr{Cint}, (Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Cint}), self, eValue, pOutDataType, pOutScope)
end

function SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_ToString(self, arg2)
    ccall((:SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_ToString, libsteam_api), Cint, (Ptr{Cint}, Cint), self, arg2)
end

function SteamAPI_ISteamNetworkingUtils_SteamNetworkingIdentity_ToString(self, arg2)
    ccall((:SteamAPI_ISteamNetworkingUtils_SteamNetworkingIdentity_ToString, libsteam_api), Cint, (Ptr{Cint}, Cint), self, arg2)
end

# no prototype is found for this function at steam_api_flat.h:1150:26, please use with caution
function SteamAPI_SteamGameServer()
    ccall((:SteamAPI_SteamGameServer, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamGameServer_SetProduct(self, pszProduct)
    ccall((:SteamAPI_ISteamGameServer_SetProduct, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}), self, pszProduct)
end

function SteamAPI_ISteamGameServer_SetGameDescription(self, pszGameDescription)
    ccall((:SteamAPI_ISteamGameServer_SetGameDescription, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}), self, pszGameDescription)
end

function SteamAPI_ISteamGameServer_SetModDir(self, pszModDir)
    ccall((:SteamAPI_ISteamGameServer_SetModDir, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}), self, pszModDir)
end

function SteamAPI_ISteamGameServer_SetDedicatedServer(self, bDedicated)
    ccall((:SteamAPI_ISteamGameServer_SetDedicatedServer, libsteam_api), Cint, (Ptr{Cint}, Cint), self, bDedicated)
end

function SteamAPI_ISteamGameServer_LogOn(self, pszToken)
    ccall((:SteamAPI_ISteamGameServer_LogOn, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}), self, pszToken)
end

function SteamAPI_ISteamGameServer_LogOnAnonymous(self)
    ccall((:SteamAPI_ISteamGameServer_LogOnAnonymous, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamGameServer_LogOff(self)
    ccall((:SteamAPI_ISteamGameServer_LogOff, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamGameServer_SetMaxPlayerCount(self, cPlayersMax)
    ccall((:SteamAPI_ISteamGameServer_SetMaxPlayerCount, libsteam_api), Cint, (Ptr{Cint}, Cint), self, cPlayersMax)
end

function SteamAPI_ISteamGameServer_SetBotPlayerCount(self, cBotplayers)
    ccall((:SteamAPI_ISteamGameServer_SetBotPlayerCount, libsteam_api), Cint, (Ptr{Cint}, Cint), self, cBotplayers)
end

function SteamAPI_ISteamGameServer_SetServerName(self, pszServerName)
    ccall((:SteamAPI_ISteamGameServer_SetServerName, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}), self, pszServerName)
end

function SteamAPI_ISteamGameServer_SetMapName(self, pszMapName)
    ccall((:SteamAPI_ISteamGameServer_SetMapName, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}), self, pszMapName)
end

function SteamAPI_ISteamGameServer_SetPasswordProtected(self, bPasswordProtected)
    ccall((:SteamAPI_ISteamGameServer_SetPasswordProtected, libsteam_api), Cint, (Ptr{Cint}, Cint), self, bPasswordProtected)
end

function SteamAPI_ISteamGameServer_SetSpectatorPort(self, unSpectatorPort)
    ccall((:SteamAPI_ISteamGameServer_SetSpectatorPort, libsteam_api), Cint, (Ptr{Cint}, Cint), self, unSpectatorPort)
end

function SteamAPI_ISteamGameServer_SetSpectatorServerName(self, pszSpectatorServerName)
    ccall((:SteamAPI_ISteamGameServer_SetSpectatorServerName, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}), self, pszSpectatorServerName)
end

function SteamAPI_ISteamGameServer_ClearAllKeyValues(self)
    ccall((:SteamAPI_ISteamGameServer_ClearAllKeyValues, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamGameServer_SetKeyValue(self, pKey, pValue)
    ccall((:SteamAPI_ISteamGameServer_SetKeyValue, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}, Ptr{Cchar}), self, pKey, pValue)
end

function SteamAPI_ISteamGameServer_SetGameTags(self, pchGameTags)
    ccall((:SteamAPI_ISteamGameServer_SetGameTags, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}), self, pchGameTags)
end

function SteamAPI_ISteamGameServer_SetGameData(self, pchGameData)
    ccall((:SteamAPI_ISteamGameServer_SetGameData, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}), self, pchGameData)
end

function SteamAPI_ISteamGameServer_SetRegion(self, pszRegion)
    ccall((:SteamAPI_ISteamGameServer_SetRegion, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}), self, pszRegion)
end

function SteamAPI_ISteamGameServer_SetAdvertiseServerActive(self, bActive)
    ccall((:SteamAPI_ISteamGameServer_SetAdvertiseServerActive, libsteam_api), Cint, (Ptr{Cint}, Cint), self, bActive)
end

function SteamAPI_ISteamGameServer_EndAuthSession(self, steamID)
    ccall((:SteamAPI_ISteamGameServer_EndAuthSession, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamID)
end

function SteamAPI_ISteamGameServer_CancelAuthTicket(self, hAuthTicket)
    ccall((:SteamAPI_ISteamGameServer_CancelAuthTicket, libsteam_api), Cint, (Ptr{Cint}, Cint), self, hAuthTicket)
end

function SteamAPI_ISteamGameServer_GetGameplayStats(self)
    ccall((:SteamAPI_ISteamGameServer_GetGameplayStats, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamGameServer_GetNextOutgoingPacket(self, pOut, cbMaxOut, pNetAdr, pPort)
    ccall((:SteamAPI_ISteamGameServer_GetNextOutgoingPacket, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Cint}), self, pOut, cbMaxOut, pNetAdr, pPort)
end

function SteamAPI_ISteamGameServer_SendUserDisconnect_DEPRECATED(self, steamIDUser)
    ccall((:SteamAPI_ISteamGameServer_SendUserDisconnect_DEPRECATED, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamIDUser)
end

# no prototype is found for this function at steam_api_flat.h:1198:31, please use with caution
function SteamAPI_SteamGameServerStats()
    ccall((:SteamAPI_SteamGameServerStats, libsteam_api), Ptr{Cint}, ())
end

function SteamAPI_ISteamNetworkingFakeUDPPort_DestroyFakeUDPPort(self)
    ccall((:SteamAPI_ISteamNetworkingFakeUDPPort_DestroyFakeUDPPort, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_ISteamNetworkingFakeUDPPort_ReceiveMessages(self, ppOutMessages, nMaxMessages)
    ccall((:SteamAPI_ISteamNetworkingFakeUDPPort_ReceiveMessages, libsteam_api), Cint, (Ptr{Cint}, Ptr{Ptr{Cint}}, Cint), self, ppOutMessages, nMaxMessages)
end

function SteamAPI_ISteamNetworkingFakeUDPPort_ScheduleCleanup(self, arg2)
    ccall((:SteamAPI_ISteamNetworkingFakeUDPPort_ScheduleCleanup, libsteam_api), Cint, (Ptr{Cint}, Cint), self, arg2)
end

function SteamAPI_MatchMakingKeyValuePair_t_Construct(self)
    ccall((:SteamAPI_MatchMakingKeyValuePair_t_Construct, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_servernetadr_t_Construct(self)
    ccall((:SteamAPI_servernetadr_t_Construct, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_servernetadr_t_Init(self, ip, usQueryPort, usConnectionPort)
    ccall((:SteamAPI_servernetadr_t_Init, libsteam_api), Cint, (Ptr{Cint}, Cuint, Cint, Cint), self, ip, usQueryPort, usConnectionPort)
end

function SteamAPI_servernetadr_t_SetQueryPort(self, usPort)
    ccall((:SteamAPI_servernetadr_t_SetQueryPort, libsteam_api), Cint, (Ptr{Cint}, Cint), self, usPort)
end

function SteamAPI_servernetadr_t_SetConnectionPort(self, usPort)
    ccall((:SteamAPI_servernetadr_t_SetConnectionPort, libsteam_api), Cint, (Ptr{Cint}, Cint), self, usPort)
end

function SteamAPI_servernetadr_t_SetIP(self, unIP)
    ccall((:SteamAPI_servernetadr_t_SetIP, libsteam_api), Cint, (Ptr{Cint}, Cint), self, unIP)
end

function SteamAPI_servernetadr_t_GetConnectionAddressString(self)
    ccall((:SteamAPI_servernetadr_t_GetConnectionAddressString, libsteam_api), Ptr{Cint}, (Ptr{Cint},), self)
end

function SteamAPI_servernetadr_t_GetQueryAddressString(self)
    ccall((:SteamAPI_servernetadr_t_GetQueryAddressString, libsteam_api), Ptr{Cint}, (Ptr{Cint},), self)
end

function SteamAPI_servernetadr_t_Assign(self, arg2)
    ccall((:SteamAPI_servernetadr_t_Assign, libsteam_api), Cint, (Ptr{Cint}, Cint), self, arg2)
end

function SteamAPI_gameserveritem_t_Construct(self)
    ccall((:SteamAPI_gameserveritem_t_Construct, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_gameserveritem_t_GetName(self)
    ccall((:SteamAPI_gameserveritem_t_GetName, libsteam_api), Ptr{Cint}, (Ptr{Cint},), self)
end

function SteamAPI_gameserveritem_t_SetName(self, pName)
    ccall((:SteamAPI_gameserveritem_t_SetName, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}), self, pName)
end

function SteamAPI_SteamNetworkingIPAddr_Clear(self)
    ccall((:SteamAPI_SteamNetworkingIPAddr_Clear, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_SteamNetworkingIPAddr_SetIPv6(self, ipv6, nPort)
    ccall((:SteamAPI_SteamNetworkingIPAddr_SetIPv6, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cint}, Cint), self, ipv6, nPort)
end

function SteamAPI_SteamNetworkingIPAddr_SetIPv4(self, nIP, nPort)
    ccall((:SteamAPI_SteamNetworkingIPAddr_SetIPv4, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, nIP, nPort)
end

function SteamAPI_SteamNetworkingIPAddr_SetIPv6LocalHost(self, nPort)
    ccall((:SteamAPI_SteamNetworkingIPAddr_SetIPv6LocalHost, libsteam_api), Cint, (Ptr{Cint}, Cint), self, nPort)
end

function SteamAPI_SteamNetworkingIPAddr_ToString(self, buf, cbBuf, bWithPort)
    ccall((:SteamAPI_SteamNetworkingIPAddr_ToString, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}, Cint, Cint), self, buf, cbBuf, bWithPort)
end

function SteamAPI_SteamNetworkingIdentity_Clear(self)
    ccall((:SteamAPI_SteamNetworkingIdentity_Clear, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_SteamNetworkingIdentity_SetSteamID(self, steamID)
    ccall((:SteamAPI_SteamNetworkingIdentity_SetSteamID, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamID)
end

function SteamAPI_SteamNetworkingIdentity_SetSteamID64(self, steamID)
    ccall((:SteamAPI_SteamNetworkingIdentity_SetSteamID64, libsteam_api), Cint, (Ptr{Cint}, Cint), self, steamID)
end

function SteamAPI_SteamNetworkingIdentity_GetXboxPairwiseID(self)
    ccall((:SteamAPI_SteamNetworkingIdentity_GetXboxPairwiseID, libsteam_api), Ptr{Cint}, (Ptr{Cint},), self)
end

function SteamAPI_SteamNetworkingIdentity_SetPSNID(self, id)
    ccall((:SteamAPI_SteamNetworkingIdentity_SetPSNID, libsteam_api), Cint, (Ptr{Cint}, Cint), self, id)
end

function SteamAPI_SteamNetworkingIdentity_SetIPAddr(self, arg2)
    ccall((:SteamAPI_SteamNetworkingIdentity_SetIPAddr, libsteam_api), Cint, (Ptr{Cint}, Cint), self, arg2)
end

function SteamAPI_SteamNetworkingIdentity_SetIPv4Addr(self, nIPv4, nPort)
    ccall((:SteamAPI_SteamNetworkingIdentity_SetIPv4Addr, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, nIPv4, nPort)
end

function SteamAPI_SteamNetworkingIdentity_SetLocalHost(self)
    ccall((:SteamAPI_SteamNetworkingIdentity_SetLocalHost, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_SteamNetworkingIdentity_GetGenericString(self)
    ccall((:SteamAPI_SteamNetworkingIdentity_GetGenericString, libsteam_api), Ptr{Cint}, (Ptr{Cint},), self)
end

function SteamAPI_SteamNetworkingIdentity_ToString(self, buf, cbBuf)
    ccall((:SteamAPI_SteamNetworkingIdentity_ToString, libsteam_api), Cint, (Ptr{Cint}, Ptr{Cchar}, Cint), self, buf, cbBuf)
end

function SteamAPI_SteamNetworkingMessage_t_Release(self)
    ccall((:SteamAPI_SteamNetworkingMessage_t_Release, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_SteamNetworkingConfigValue_t_SetInt32(self, eVal, data)
    ccall((:SteamAPI_SteamNetworkingConfigValue_t_SetInt32, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, eVal, data)
end

function SteamAPI_SteamNetworkingConfigValue_t_SetInt64(self, eVal, data)
    ccall((:SteamAPI_SteamNetworkingConfigValue_t_SetInt64, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint), self, eVal, data)
end

function SteamAPI_SteamNetworkingConfigValue_t_SetFloat(self, eVal, data)
    ccall((:SteamAPI_SteamNetworkingConfigValue_t_SetFloat, libsteam_api), Cint, (Ptr{Cint}, Cint, Cfloat), self, eVal, data)
end

function SteamAPI_SteamNetworkingConfigValue_t_SetPtr(self, eVal, data)
    ccall((:SteamAPI_SteamNetworkingConfigValue_t_SetPtr, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Cvoid}), self, eVal, data)
end

function SteamAPI_SteamNetworkingConfigValue_t_SetString(self, eVal, data)
    ccall((:SteamAPI_SteamNetworkingConfigValue_t_SetString, libsteam_api), Cint, (Ptr{Cint}, Cint, Ptr{Cchar}), self, eVal, data)
end

function SteamAPI_SteamDatagramHostedAddress_Clear(self)
    ccall((:SteamAPI_SteamDatagramHostedAddress_Clear, libsteam_api), Cint, (Ptr{Cint},), self)
end

function SteamAPI_SteamDatagramHostedAddress_SetDevAddress(self, nIP, nPort, popid)
    ccall((:SteamAPI_SteamDatagramHostedAddress_SetDevAddress, libsteam_api), Cint, (Ptr{Cint}, Cint, Cint, Cint), self, nIP, nPort, popid)
end

const compile_time_assert_type = NTuple{1, Cchar}

const uint8 = Cuchar

const int8 = Int8

const int16 = Cshort

const uint16 = Cushort

const int32 = Cint

const uint32 = Cuint

const int64 = Clonglong

const uint64 = Culonglong

const lint64 = Clong

const ulint64 = Culong

const intp = Clonglong

const uintp = Culonglong

const AppId_t = uint32

const DepotId_t = uint32

const RTime32 = uint32

const SteamAPICall_t = uint64

const AccountID_t = uint32

const PartyBeaconID_t = uint64

@cenum ESteamIPType::UInt32 begin
    k_ESteamIPTypeIPv4 = 0
    k_ESteamIPTypeIPv6 = 1
end

struct SteamIPAddress_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SteamIPAddress_t}, f::Symbol)
    f === Symbol("union (anonymous at sdk/public/steam/steamtypes.h:117:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_eType && return Ptr{ESteamIPType}(x + 0)
    f === :IsSet && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamIPAddress_t, f::Symbol)
    r = Ref{SteamIPAddress_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamIPAddress_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamIPAddress_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum EUniverse::UInt32 begin
    k_EUniverseInvalid = 0
    k_EUniversePublic = 1
    k_EUniverseBeta = 2
    k_EUniverseInternal = 3
    k_EUniverseDev = 4
    k_EUniverseMax = 5
end

@cenum EResult::UInt32 begin
    k_EResultNone = 0
    k_EResultOK = 1
    k_EResultFail = 2
    k_EResultNoConnection = 3
    k_EResultInvalidPassword = 5
    k_EResultLoggedInElsewhere = 6
    k_EResultInvalidProtocolVer = 7
    k_EResultInvalidParam = 8
    k_EResultFileNotFound = 9
    k_EResultBusy = 10
    k_EResultInvalidState = 11
    k_EResultInvalidName = 12
    k_EResultInvalidEmail = 13
    k_EResultDuplicateName = 14
    k_EResultAccessDenied = 15
    k_EResultTimeout = 16
    k_EResultBanned = 17
    k_EResultAccountNotFound = 18
    k_EResultInvalidSteamID = 19
    k_EResultServiceUnavailable = 20
    k_EResultNotLoggedOn = 21
    k_EResultPending = 22
    k_EResultEncryptionFailure = 23
    k_EResultInsufficientPrivilege = 24
    k_EResultLimitExceeded = 25
    k_EResultRevoked = 26
    k_EResultExpired = 27
    k_EResultAlreadyRedeemed = 28
    k_EResultDuplicateRequest = 29
    k_EResultAlreadyOwned = 30
    k_EResultIPNotFound = 31
    k_EResultPersistFailed = 32
    k_EResultLockingFailed = 33
    k_EResultLogonSessionReplaced = 34
    k_EResultConnectFailed = 35
    k_EResultHandshakeFailed = 36
    k_EResultIOFailure = 37
    k_EResultRemoteDisconnect = 38
    k_EResultShoppingCartNotFound = 39
    k_EResultBlocked = 40
    k_EResultIgnored = 41
    k_EResultNoMatch = 42
    k_EResultAccountDisabled = 43
    k_EResultServiceReadOnly = 44
    k_EResultAccountNotFeatured = 45
    k_EResultAdministratorOK = 46
    k_EResultContentVersion = 47
    k_EResultTryAnotherCM = 48
    k_EResultPasswordRequiredToKickSession = 49
    k_EResultAlreadyLoggedInElsewhere = 50
    k_EResultSuspended = 51
    k_EResultCancelled = 52
    k_EResultDataCorruption = 53
    k_EResultDiskFull = 54
    k_EResultRemoteCallFailed = 55
    k_EResultPasswordUnset = 56
    k_EResultExternalAccountUnlinked = 57
    k_EResultPSNTicketInvalid = 58
    k_EResultExternalAccountAlreadyLinked = 59
    k_EResultRemoteFileConflict = 60
    k_EResultIllegalPassword = 61
    k_EResultSameAsPreviousValue = 62
    k_EResultAccountLogonDenied = 63
    k_EResultCannotUseOldPassword = 64
    k_EResultInvalidLoginAuthCode = 65
    k_EResultAccountLogonDeniedNoMail = 66
    k_EResultHardwareNotCapableOfIPT = 67
    k_EResultIPTInitError = 68
    k_EResultParentalControlRestricted = 69
    k_EResultFacebookQueryError = 70
    k_EResultExpiredLoginAuthCode = 71
    k_EResultIPLoginRestrictionFailed = 72
    k_EResultAccountLockedDown = 73
    k_EResultAccountLogonDeniedVerifiedEmailRequired = 74
    k_EResultNoMatchingURL = 75
    k_EResultBadResponse = 76
    k_EResultRequirePasswordReEntry = 77
    k_EResultValueOutOfRange = 78
    k_EResultUnexpectedError = 79
    k_EResultDisabled = 80
    k_EResultInvalidCEGSubmission = 81
    k_EResultRestrictedDevice = 82
    k_EResultRegionLocked = 83
    k_EResultRateLimitExceeded = 84
    k_EResultAccountLoginDeniedNeedTwoFactor = 85
    k_EResultItemDeleted = 86
    k_EResultAccountLoginDeniedThrottle = 87
    k_EResultTwoFactorCodeMismatch = 88
    k_EResultTwoFactorActivationCodeMismatch = 89
    k_EResultAccountAssociatedToMultiplePartners = 90
    k_EResultNotModified = 91
    k_EResultNoMobileDevice = 92
    k_EResultTimeNotSynced = 93
    k_EResultSmsCodeFailed = 94
    k_EResultAccountLimitExceeded = 95
    k_EResultAccountActivityLimitExceeded = 96
    k_EResultPhoneActivityLimitExceeded = 97
    k_EResultRefundToWallet = 98
    k_EResultEmailSendFailure = 99
    k_EResultNotSettled = 100
    k_EResultNeedCaptcha = 101
    k_EResultGSLTDenied = 102
    k_EResultGSOwnerDenied = 103
    k_EResultInvalidItemType = 104
    k_EResultIPBanned = 105
    k_EResultGSLTExpired = 106
    k_EResultInsufficientFunds = 107
    k_EResultTooManyPending = 108
    k_EResultNoSiteLicensesFound = 109
    k_EResultWGNetworkSendExceeded = 110
    k_EResultAccountNotFriends = 111
    k_EResultLimitedUserAccount = 112
    k_EResultCantRemoveItem = 113
    k_EResultAccountDeleted = 114
    k_EResultExistingUserCancelledLicense = 115
    k_EResultCommunityCooldown = 116
    k_EResultNoLauncherSpecified = 117
    k_EResultMustAgreeToSSA = 118
    k_EResultLauncherMigrated = 119
    k_EResultSteamRealmMismatch = 120
    k_EResultInvalidSignature = 121
    k_EResultParseFailure = 122
    k_EResultNoVerifiedPhone = 123
    k_EResultInsufficientBattery = 124
    k_EResultChargerRequired = 125
    k_EResultCachedCredentialInvalid = 126
    K_EResultPhoneNumberIsVOIP = 127
    k_EResultNotSupported = 128
    k_EResultFamilySizeLimitExceeded = 129
    k_EResultOfflineAppCacheInvalid = 130
end

@cenum EVoiceResult::UInt32 begin
    k_EVoiceResultOK = 0
    k_EVoiceResultNotInitialized = 1
    k_EVoiceResultNotRecording = 2
    k_EVoiceResultNoData = 3
    k_EVoiceResultBufferTooSmall = 4
    k_EVoiceResultDataCorrupted = 5
    k_EVoiceResultRestricted = 6
    k_EVoiceResultUnsupportedCodec = 7
    k_EVoiceResultReceiverOutOfDate = 8
    k_EVoiceResultReceiverDidNotAnswer = 9
end

@cenum EDenyReason::UInt32 begin
    k_EDenyInvalid = 0
    k_EDenyInvalidVersion = 1
    k_EDenyGeneric = 2
    k_EDenyNotLoggedOn = 3
    k_EDenyNoLicense = 4
    k_EDenyCheater = 5
    k_EDenyLoggedInElseWhere = 6
    k_EDenyUnknownText = 7
    k_EDenyIncompatibleAnticheat = 8
    k_EDenyMemoryCorruption = 9
    k_EDenyIncompatibleSoftware = 10
    k_EDenySteamConnectionLost = 11
    k_EDenySteamConnectionError = 12
    k_EDenySteamResponseTimedOut = 13
    k_EDenySteamValidationStalled = 14
    k_EDenySteamOwnerLeftGuestUser = 15
end

const HAuthTicket = uint32

@cenum EBeginAuthSessionResult::UInt32 begin
    k_EBeginAuthSessionResultOK = 0
    k_EBeginAuthSessionResultInvalidTicket = 1
    k_EBeginAuthSessionResultDuplicateRequest = 2
    k_EBeginAuthSessionResultInvalidVersion = 3
    k_EBeginAuthSessionResultGameMismatch = 4
    k_EBeginAuthSessionResultExpiredTicket = 5
end

@cenum EAuthSessionResponse::UInt32 begin
    k_EAuthSessionResponseOK = 0
    k_EAuthSessionResponseUserNotConnectedToSteam = 1
    k_EAuthSessionResponseNoLicenseOrExpired = 2
    k_EAuthSessionResponseVACBanned = 3
    k_EAuthSessionResponseLoggedInElseWhere = 4
    k_EAuthSessionResponseVACCheckTimedOut = 5
    k_EAuthSessionResponseAuthTicketCanceled = 6
    k_EAuthSessionResponseAuthTicketInvalidAlreadyUsed = 7
    k_EAuthSessionResponseAuthTicketInvalid = 8
    k_EAuthSessionResponsePublisherIssuedBan = 9
    k_EAuthSessionResponseAuthTicketNetworkIdentityFailure = 10
end

@cenum EUserHasLicenseForAppResult::UInt32 begin
    k_EUserHasLicenseResultHasLicense = 0
    k_EUserHasLicenseResultDoesNotHaveLicense = 1
    k_EUserHasLicenseResultNoAuth = 2
end

@cenum EAccountType::UInt32 begin
    k_EAccountTypeInvalid = 0
    k_EAccountTypeIndividual = 1
    k_EAccountTypeMultiseat = 2
    k_EAccountTypeGameServer = 3
    k_EAccountTypeAnonGameServer = 4
    k_EAccountTypePending = 5
    k_EAccountTypeContentServer = 6
    k_EAccountTypeClan = 7
    k_EAccountTypeChat = 8
    k_EAccountTypeConsoleUser = 9
    k_EAccountTypeAnonUser = 10
    k_EAccountTypeMax = 11
end

@cenum EChatEntryType::UInt32 begin
    k_EChatEntryTypeInvalid = 0
    k_EChatEntryTypeChatMsg = 1
    k_EChatEntryTypeTyping = 2
    k_EChatEntryTypeInviteGame = 3
    k_EChatEntryTypeEmote = 4
    k_EChatEntryTypeLeftConversation = 6
    k_EChatEntryTypeEntered = 7
    k_EChatEntryTypeWasKicked = 8
    k_EChatEntryTypeWasBanned = 9
    k_EChatEntryTypeDisconnected = 10
    k_EChatEntryTypeHistoricalChat = 11
    k_EChatEntryTypeLinkBlocked = 14
end

@cenum EChatRoomEnterResponse::UInt32 begin
    k_EChatRoomEnterResponseSuccess = 1
    k_EChatRoomEnterResponseDoesntExist = 2
    k_EChatRoomEnterResponseNotAllowed = 3
    k_EChatRoomEnterResponseFull = 4
    k_EChatRoomEnterResponseError = 5
    k_EChatRoomEnterResponseBanned = 6
    k_EChatRoomEnterResponseLimited = 7
    k_EChatRoomEnterResponseClanDisabled = 8
    k_EChatRoomEnterResponseCommunityBan = 9
    k_EChatRoomEnterResponseMemberBlockedYou = 10
    k_EChatRoomEnterResponseYouBlockedMember = 11
    k_EChatRoomEnterResponseRatelimitExceeded = 15
end

@cenum EChatSteamIDInstanceFlags::UInt32 begin
    k_EChatAccountInstanceMask = 4095
    k_EChatInstanceFlagClan = 524288
    k_EChatInstanceFlagLobby = 262144
    k_EChatInstanceFlagMMSLobby = 131072
end

@cenum ENotificationPosition::Int32 begin
    k_EPositionInvalid = -1
    k_EPositionTopLeft = 0
    k_EPositionTopRight = 1
    k_EPositionBottomLeft = 2
    k_EPositionBottomRight = 3
end

@cenum EBroadcastUploadResult::UInt32 begin
    k_EBroadcastUploadResultNone = 0
    k_EBroadcastUploadResultOK = 1
    k_EBroadcastUploadResultInitFailed = 2
    k_EBroadcastUploadResultFrameFailed = 3
    k_EBroadcastUploadResultTimeout = 4
    k_EBroadcastUploadResultBandwidthExceeded = 5
    k_EBroadcastUploadResultLowFPS = 6
    k_EBroadcastUploadResultMissingKeyFrames = 7
    k_EBroadcastUploadResultNoConnection = 8
    k_EBroadcastUploadResultRelayFailed = 9
    k_EBroadcastUploadResultSettingsChanged = 10
    k_EBroadcastUploadResultMissingAudio = 11
    k_EBroadcastUploadResultTooFarBehind = 12
    k_EBroadcastUploadResultTranscodeBehind = 13
    k_EBroadcastUploadResultNotAllowedToPlay = 14
    k_EBroadcastUploadResultBusy = 15
    k_EBroadcastUploadResultBanned = 16
    k_EBroadcastUploadResultAlreadyActive = 17
    k_EBroadcastUploadResultForcedOff = 18
    k_EBroadcastUploadResultAudioBehind = 19
    k_EBroadcastUploadResultShutdown = 20
    k_EBroadcastUploadResultDisconnect = 21
    k_EBroadcastUploadResultVideoInitFailed = 22
    k_EBroadcastUploadResultAudioInitFailed = 23
end

@cenum EMarketNotAllowedReasonFlags::UInt32 begin
    k_EMarketNotAllowedReason_None = 0
    k_EMarketNotAllowedReason_TemporaryFailure = 1
    k_EMarketNotAllowedReason_AccountDisabled = 2
    k_EMarketNotAllowedReason_AccountLockedDown = 4
    k_EMarketNotAllowedReason_AccountLimited = 8
    k_EMarketNotAllowedReason_TradeBanned = 16
    k_EMarketNotAllowedReason_AccountNotTrusted = 32
    k_EMarketNotAllowedReason_SteamGuardNotEnabled = 64
    k_EMarketNotAllowedReason_SteamGuardOnlyRecentlyEnabled = 128
    k_EMarketNotAllowedReason_RecentPasswordReset = 256
    k_EMarketNotAllowedReason_NewPaymentMethod = 512
    k_EMarketNotAllowedReason_InvalidCookie = 1024
    k_EMarketNotAllowedReason_UsingNewDevice = 2048
    k_EMarketNotAllowedReason_RecentSelfRefund = 4096
    k_EMarketNotAllowedReason_NewPaymentMethodCannotBeVerified = 8192
    k_EMarketNotAllowedReason_NoRecentPurchases = 16384
    k_EMarketNotAllowedReason_AcceptedWalletGift = 32768
end

@cenum EDurationControlProgress::UInt32 begin
    k_EDurationControlProgress_Full = 0
    k_EDurationControlProgress_Half = 1
    k_EDurationControlProgress_None = 2
    k_EDurationControl_ExitSoon_3h = 3
    k_EDurationControl_ExitSoon_5h = 4
    k_EDurationControl_ExitSoon_Night = 5
end

@cenum EDurationControlNotification::UInt32 begin
    k_EDurationControlNotification_None = 0
    k_EDurationControlNotification_1Hour = 1
    k_EDurationControlNotification_3Hours = 2
    k_EDurationControlNotification_HalfProgress = 3
    k_EDurationControlNotification_NoProgress = 4
    k_EDurationControlNotification_ExitSoon_3h = 5
    k_EDurationControlNotification_ExitSoon_5h = 6
    k_EDurationControlNotification_ExitSoon_Night = 7
end

@cenum EDurationControlOnlineState::UInt32 begin
    k_EDurationControlOnlineState_Invalid = 0
    k_EDurationControlOnlineState_Offline = 1
    k_EDurationControlOnlineState_Online = 2
    k_EDurationControlOnlineState_OnlineHighPri = 3
end

@cenum EBetaBranchFlags::UInt32 begin
    k_EBetaBranch_None = 0
    k_EBetaBranch_Default = 1
    k_EBetaBranch_Available = 2
    k_EBetaBranch_Private = 4
    k_EBetaBranch_Selected = 8
    k_EBetaBranch_Installed = 16
end

# typedef void ( * PFNPreMinidumpCallback ) ( void * context )
const PFNPreMinidumpCallback = Ptr{Cvoid}

@cenum EGameSearchErrorCode_t::UInt32 begin
    k_EGameSearchErrorCode_OK = 1
    k_EGameSearchErrorCode_Failed_Search_Already_In_Progress = 2
    k_EGameSearchErrorCode_Failed_No_Search_In_Progress = 3
    k_EGameSearchErrorCode_Failed_Not_Lobby_Leader = 4
    k_EGameSearchErrorCode_Failed_No_Host_Available = 5
    k_EGameSearchErrorCode_Failed_Search_Params_Invalid = 6
    k_EGameSearchErrorCode_Failed_Offline = 7
    k_EGameSearchErrorCode_Failed_NotAuthorized = 8
    k_EGameSearchErrorCode_Failed_Unknown_Error = 9
end

@cenum EPlayerResult_t::UInt32 begin
    k_EPlayerResultFailedToConnect = 1
    k_EPlayerResultAbandoned = 2
    k_EPlayerResultKicked = 3
    k_EPlayerResultIncomplete = 4
    k_EPlayerResultCompleted = 5
end

@cenum ESteamIPv6ConnectivityProtocol::UInt32 begin
    k_ESteamIPv6ConnectivityProtocol_Invalid = 0
    k_ESteamIPv6ConnectivityProtocol_HTTP = 1
    k_ESteamIPv6ConnectivityProtocol_UDP = 2
end

@cenum ESteamIPv6ConnectivityState::UInt32 begin
    k_ESteamIPv6ConnectivityState_Unknown = 0
    k_ESteamIPv6ConnectivityState_Good = 1
    k_ESteamIPv6ConnectivityState_Bad = 2
end

struct ValvePackingSentinel_t
    data::NTuple{24, UInt8}
end

function Base.getproperty(x::Ptr{ValvePackingSentinel_t}, f::Symbol)
    f === :m_u32 && return Ptr{uint32}(x + 0)
    f === :m_u64 && return Ptr{uint64}(x + 4)
    f === :m_u16 && return Ptr{uint16}(x + 12)
    f === :m_d && return Ptr{Cdouble}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::ValvePackingSentinel_t, f::Symbol)
    r = Ref{ValvePackingSentinel_t}(x)
    ptr = Base.unsafe_convert(Ptr{ValvePackingSentinel_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{ValvePackingSentinel_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const HSteamPipe = int32

const HSteamUser = int32

const SteamErrMsg = NTuple{1024, Cchar}

"""
    CallbackMsg_t

Internal structure used in manual callback dispatch
"""
struct CallbackMsg_t
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{CallbackMsg_t}, f::Symbol)
    f === :m_hSteamUser && return Ptr{HSteamUser}(x + 0)
    f === :m_iCallback && return Ptr{Cint}(x + 4)
    f === :m_pubParam && return Ptr{Ptr{uint8}}(x + 8)
    f === :m_cubParam && return Ptr{Cint}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::CallbackMsg_t, f::Symbol)
    r = Ref{CallbackMsg_t}(x)
    ptr = Base.unsafe_convert(Ptr{CallbackMsg_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{CallbackMsg_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum var"##Ctag#230"::UInt32 begin
    k_iSteamUserCallbacks = 100
end

@cenum var"##Ctag#231"::UInt32 begin
    k_iSteamGameServerCallbacks = 200
end

@cenum var"##Ctag#232"::UInt32 begin
    k_iSteamFriendsCallbacks = 300
end

@cenum var"##Ctag#233"::UInt32 begin
    k_iSteamBillingCallbacks = 400
end

@cenum var"##Ctag#234"::UInt32 begin
    k_iSteamMatchmakingCallbacks = 500
end

@cenum var"##Ctag#235"::UInt32 begin
    k_iSteamContentServerCallbacks = 600
end

@cenum var"##Ctag#236"::UInt32 begin
    k_iSteamUtilsCallbacks = 700
end

@cenum var"##Ctag#237"::UInt32 begin
    k_iSteamAppsCallbacks = 1000
end

@cenum var"##Ctag#238"::UInt32 begin
    k_iSteamUserStatsCallbacks = 1100
end

@cenum var"##Ctag#239"::UInt32 begin
    k_iSteamNetworkingCallbacks = 1200
end

@cenum var"##Ctag#240"::UInt32 begin
    k_iSteamNetworkingSocketsCallbacks = 1220
end

@cenum var"##Ctag#241"::UInt32 begin
    k_iSteamNetworkingMessagesCallbacks = 1250
end

@cenum var"##Ctag#242"::UInt32 begin
    k_iSteamNetworkingUtilsCallbacks = 1280
end

@cenum var"##Ctag#243"::UInt32 begin
    k_iSteamRemoteStorageCallbacks = 1300
end

@cenum var"##Ctag#244"::UInt32 begin
    k_iSteamGameServerItemsCallbacks = 1500
end

@cenum var"##Ctag#245"::UInt32 begin
    k_iSteamGameCoordinatorCallbacks = 1700
end

@cenum var"##Ctag#246"::UInt32 begin
    k_iSteamGameServerStatsCallbacks = 1800
end

@cenum var"##Ctag#247"::UInt32 begin
    k_iSteam2AsyncCallbacks = 1900
end

@cenum var"##Ctag#248"::UInt32 begin
    k_iSteamGameStatsCallbacks = 2000
end

@cenum var"##Ctag#249"::UInt32 begin
    k_iSteamHTTPCallbacks = 2100
end

@cenum var"##Ctag#250"::UInt32 begin
    k_iSteamScreenshotsCallbacks = 2300
end

@cenum var"##Ctag#251"::UInt32 begin
    k_iSteamStreamLauncherCallbacks = 2600
end

@cenum var"##Ctag#252"::UInt32 begin
    k_iSteamControllerCallbacks = 2800
end

@cenum var"##Ctag#253"::UInt32 begin
    k_iSteamUGCCallbacks = 3400
end

@cenum var"##Ctag#254"::UInt32 begin
    k_iSteamStreamClientCallbacks = 3500
end

@cenum var"##Ctag#255"::UInt32 begin
    k_iSteamMusicCallbacks = 4000
end

@cenum var"##Ctag#256"::UInt32 begin
    k_iSteamMusicRemoteCallbacks = 4100
end

@cenum var"##Ctag#257"::UInt32 begin
    k_iSteamGameNotificationCallbacks = 4400
end

@cenum var"##Ctag#258"::UInt32 begin
    k_iSteamHTMLSurfaceCallbacks = 4500
end

@cenum var"##Ctag#259"::UInt32 begin
    k_iSteamVideoCallbacks = 4600
end

@cenum var"##Ctag#260"::UInt32 begin
    k_iSteamInventoryCallbacks = 4700
end

@cenum var"##Ctag#261"::UInt32 begin
    k_ISteamParentalSettingsCallbacks = 5000
end

@cenum var"##Ctag#262"::UInt32 begin
    k_iSteamGameSearchCallbacks = 5200
end

@cenum var"##Ctag#263"::UInt32 begin
    k_iSteamPartiesCallbacks = 5300
end

@cenum var"##Ctag#264"::UInt32 begin
    k_iSteamSTARCallbacks = 5500
end

@cenum var"##Ctag#265"::UInt32 begin
    k_iSteamRemotePlayCallbacks = 5700
end

@cenum var"##Ctag#266"::UInt32 begin
    k_iSteamChatCallbacks = 5900
end

@cenum var"##Ctag#267"::UInt32 begin
    k_iSteamTimelineCallbacks = 6000
end

# no prototype is found for this function at isteamclient.h:164:22, please use with caution
function SteamClient()
    ccall((:SteamClient, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamClient(p)
    ccall((:SteamInternal_Init_SteamClient, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

# no prototype is found for this function at isteamclient.h:169:22, please use with caution
function SteamGameServerClient()
    ccall((:SteamGameServerClient, libsteam_api), Ptr{Cint}, ())
end

# no prototype is found for this function at isteamuser.h:225:20, please use with caution
function SteamUser()
    ccall((:SteamUser, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamUser(p)
    ccall((:SteamInternal_Init_SteamUser, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct SteamServersConnected_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{SteamServersConnected_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamuser.h:247:2)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamServersConnected_t, f::Symbol)
    r = Ref{SteamServersConnected_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamServersConnected_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamServersConnected_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamServerConnectFailure_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SteamServerConnectFailure_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamuser.h:257:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_bStillRetrying && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamServerConnectFailure_t, f::Symbol)
    r = Ref{SteamServerConnectFailure_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamServerConnectFailure_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamServerConnectFailure_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamServersDisconnected_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{SteamServersDisconnected_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamServersDisconnected_t, f::Symbol)
    r = Ref{SteamServersDisconnected_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamServersDisconnected_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamServersDisconnected_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct ClientGameServerDeny_t
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{ClientGameServerDeny_t}, f::Symbol)
    f === :m_uAppID && return Ptr{uint32}(x + 0)
    f === :m_unGameServerIP && return Ptr{uint32}(x + 4)
    f === :m_usGameServerPort && return Ptr{uint16}(x + 8)
    f === :m_bSecure && return Ptr{uint16}(x + 10)
    f === :m_uReason && return Ptr{uint32}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::ClientGameServerDeny_t, f::Symbol)
    r = Ref{ClientGameServerDeny_t}(x)
    ptr = Base.unsafe_convert(Ptr{ClientGameServerDeny_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{ClientGameServerDeny_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct IPCFailure_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{IPCFailure_t}, f::Symbol)
    f === :m_eFailureType && return Ptr{uint8}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::IPCFailure_t, f::Symbol)
    r = Ref{IPCFailure_t}(x)
    ptr = Base.unsafe_convert(Ptr{IPCFailure_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{IPCFailure_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct LicensesUpdated_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{LicensesUpdated_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamuser.h:314:2)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::LicensesUpdated_t, f::Symbol)
    r = Ref{LicensesUpdated_t}(x)
    ptr = Base.unsafe_convert(Ptr{LicensesUpdated_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{LicensesUpdated_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct ValidateAuthTicketResponse_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{ValidateAuthTicketResponse_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamuser.h:323:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_SteamID && return Ptr{Cint}(x + 0)
    f === :m_eAuthSessionResponse && return Ptr{EAuthSessionResponse}(x + 0)
    f === :m_OwnerSteamID && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::ValidateAuthTicketResponse_t, f::Symbol)
    r = Ref{ValidateAuthTicketResponse_t}(x)
    ptr = Base.unsafe_convert(Ptr{ValidateAuthTicketResponse_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{ValidateAuthTicketResponse_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct MicroTxnAuthorizationResponse_t
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{MicroTxnAuthorizationResponse_t}, f::Symbol)
    f === :m_unAppID && return Ptr{uint32}(x + 0)
    f === :m_ulOrderID && return Ptr{uint64}(x + 4)
    f === :m_bAuthorized && return Ptr{uint8}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::MicroTxnAuthorizationResponse_t, f::Symbol)
    r = Ref{MicroTxnAuthorizationResponse_t}(x)
    ptr = Base.unsafe_convert(Ptr{MicroTxnAuthorizationResponse_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MicroTxnAuthorizationResponse_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct EncryptedAppTicketResponse_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{EncryptedAppTicketResponse_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::EncryptedAppTicketResponse_t, f::Symbol)
    r = Ref{EncryptedAppTicketResponse_t}(x)
    ptr = Base.unsafe_convert(Ptr{EncryptedAppTicketResponse_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{EncryptedAppTicketResponse_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct GetAuthSessionTicketResponse_t
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{GetAuthSessionTicketResponse_t}, f::Symbol)
    f === :m_hAuthTicket && return Ptr{HAuthTicket}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::GetAuthSessionTicketResponse_t, f::Symbol)
    r = Ref{GetAuthSessionTicketResponse_t}(x)
    ptr = Base.unsafe_convert(Ptr{GetAuthSessionTicketResponse_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GetAuthSessionTicketResponse_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct GameWebCallback_t
    data::NTuple{256, UInt8}
end

function Base.getproperty(x::Ptr{GameWebCallback_t}, f::Symbol)
    f === :m_szURL && return Ptr{NTuple{256, Cchar}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::GameWebCallback_t, f::Symbol)
    r = Ref{GameWebCallback_t}(x)
    ptr = Base.unsafe_convert(Ptr{GameWebCallback_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GameWebCallback_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct StoreAuthURLResponse_t
    data::NTuple{512, UInt8}
end

function Base.getproperty(x::Ptr{StoreAuthURLResponse_t}, f::Symbol)
    f === :m_szURL && return Ptr{NTuple{512, Cchar}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::StoreAuthURLResponse_t, f::Symbol)
    r = Ref{StoreAuthURLResponse_t}(x)
    ptr = Base.unsafe_convert(Ptr{StoreAuthURLResponse_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{StoreAuthURLResponse_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct MarketEligibilityResponse_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{MarketEligibilityResponse_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamuser.h:387:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_bAllowed && return Ptr{Cint}(x + 0)
    f === :m_eNotAllowedReason && return Ptr{EMarketNotAllowedReasonFlags}(x + 0)
    f === :m_rtAllowedAtTime && return Ptr{RTime32}(x + 0)
    f === :m_cdaySteamGuardRequiredDays && return Ptr{Cint}(x + 0)
    f === :m_cdayNewDeviceCooldown && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::MarketEligibilityResponse_t, f::Symbol)
    r = Ref{MarketEligibilityResponse_t}(x)
    ptr = Base.unsafe_convert(Ptr{MarketEligibilityResponse_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MarketEligibilityResponse_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct DurationControl_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{DurationControl_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamuser.h:407:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_appid && return Ptr{AppId_t}(x + 0)
    f === :m_bApplicable && return Ptr{Cint}(x + 0)
    f === :m_csecsLast5h && return Ptr{int32}(x + 0)
    f === :m_progress && return Ptr{EDurationControlProgress}(x + 0)
    f === :m_notification && return Ptr{EDurationControlNotification}(x + 0)
    f === :m_csecsToday && return Ptr{int32}(x + 0)
    f === :m_csecsRemaining && return Ptr{int32}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::DurationControl_t, f::Symbol)
    r = Ref{DurationControl_t}(x)
    ptr = Base.unsafe_convert(Ptr{DurationControl_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{DurationControl_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct GetTicketForWebApiResponse_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{GetTicketForWebApiResponse_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamuser.h:428:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_hAuthTicket && return Ptr{HAuthTicket}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_cubTicket && return Ptr{Cint}(x + 0)
    f === :k_nCubTicketMaxLength && return Ptr{Cint}(x + 0)
    f === :m_rgubTicket && return Ptr{uint8}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::GetTicketForWebApiResponse_t, f::Symbol)
    r = Ref{GetTicketForWebApiResponse_t}(x)
    ptr = Base.unsafe_convert(Ptr{GetTicketForWebApiResponse_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GetTicketForWebApiResponse_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum EFriendRelationship::UInt32 begin
    k_EFriendRelationshipNone = 0
    k_EFriendRelationshipBlocked = 1
    k_EFriendRelationshipRequestRecipient = 2
    k_EFriendRelationshipFriend = 3
    k_EFriendRelationshipRequestInitiator = 4
    k_EFriendRelationshipIgnored = 5
    k_EFriendRelationshipIgnoredFriend = 6
    k_EFriendRelationshipSuggested_DEPRECATED = 7
    k_EFriendRelationshipMax = 8
end

const FriendsGroupID_t = int16

@cenum EPersonaState::UInt32 begin
    k_EPersonaStateOffline = 0
    k_EPersonaStateOnline = 1
    k_EPersonaStateBusy = 2
    k_EPersonaStateAway = 3
    k_EPersonaStateSnooze = 4
    k_EPersonaStateLookingToTrade = 5
    k_EPersonaStateLookingToPlay = 6
    k_EPersonaStateInvisible = 7
    k_EPersonaStateMax = 8
end

@cenum EFriendFlags::UInt32 begin
    k_EFriendFlagNone = 0
    k_EFriendFlagBlocked = 1
    k_EFriendFlagFriendshipRequested = 2
    k_EFriendFlagImmediate = 4
    k_EFriendFlagClanMember = 8
    k_EFriendFlagOnGameServer = 16
    k_EFriendFlagRequestingFriendship = 128
    k_EFriendFlagRequestingInfo = 256
    k_EFriendFlagIgnored = 512
    k_EFriendFlagIgnoredFriend = 1024
    k_EFriendFlagChatMember = 4096
    k_EFriendFlagAll = 65535
end

struct FriendGameInfo_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{FriendGameInfo_t}, f::Symbol)
    f === :m_gameID && return Ptr{Cint}(x + 0)
    f === :m_unGameIP && return Ptr{uint32}(x + 0)
    f === :m_usGamePort && return Ptr{uint16}(x + 0)
    f === :m_usQueryPort && return Ptr{uint16}(x + 0)
    f === :m_steamIDLobby && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::FriendGameInfo_t, f::Symbol)
    r = Ref{FriendGameInfo_t}(x)
    ptr = Base.unsafe_convert(Ptr{FriendGameInfo_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{FriendGameInfo_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum var"##Ctag#268"::UInt32 begin
    k_cchPersonaNameMax = 128
    k_cwchPersonaNameMax = 32
end

@cenum EUserRestriction::UInt32 begin
    k_nUserRestrictionNone = 0
    k_nUserRestrictionUnknown = 1
    k_nUserRestrictionAnyChat = 2
    k_nUserRestrictionVoiceChat = 4
    k_nUserRestrictionGroupChat = 8
    k_nUserRestrictionRating = 16
    k_nUserRestrictionGameInvites = 32
    k_nUserRestrictionTrading = 64
end

@cenum var"##Ctag#269"::UInt32 begin
    k_cchMaxRichPresenceKeys = 30
end

@cenum var"##Ctag#270"::UInt32 begin
    k_cchMaxRichPresenceKeyLength = 64
end

@cenum var"##Ctag#271"::UInt32 begin
    k_cchMaxRichPresenceValueLength = 256
end

@cenum EOverlayToStoreFlag::UInt32 begin
    k_EOverlayToStoreFlag_None = 0
    k_EOverlayToStoreFlag_AddToCart = 1
    k_EOverlayToStoreFlag_AddToCartAndShow = 2
end

@cenum EActivateGameOverlayToWebPageMode::UInt32 begin
    k_EActivateGameOverlayToWebPageMode_Default = 0
    k_EActivateGameOverlayToWebPageMode_Modal = 1
end

@cenum ECommunityProfileItemType::UInt32 begin
    k_ECommunityProfileItemType_AnimatedAvatar = 0
    k_ECommunityProfileItemType_AvatarFrame = 1
    k_ECommunityProfileItemType_ProfileModifier = 2
    k_ECommunityProfileItemType_ProfileBackground = 3
    k_ECommunityProfileItemType_MiniProfileBackground = 4
end

@cenum ECommunityProfileItemProperty::UInt32 begin
    k_ECommunityProfileItemProperty_ImageSmall = 0
    k_ECommunityProfileItemProperty_ImageLarge = 1
    k_ECommunityProfileItemProperty_InternalName = 2
    k_ECommunityProfileItemProperty_Title = 3
    k_ECommunityProfileItemProperty_Description = 4
    k_ECommunityProfileItemProperty_AppID = 5
    k_ECommunityProfileItemProperty_TypeID = 6
    k_ECommunityProfileItemProperty_Class = 7
    k_ECommunityProfileItemProperty_MovieWebM = 8
    k_ECommunityProfileItemProperty_MovieMP4 = 9
    k_ECommunityProfileItemProperty_MovieWebMSmall = 10
    k_ECommunityProfileItemProperty_MovieMP4Small = 11
end

# no prototype is found for this function at isteamfriends.h:468:23, please use with caution
function SteamFriends()
    ccall((:SteamFriends, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamFriends(p)
    ccall((:SteamInternal_Init_SteamFriends, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct PersonaStateChange_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{PersonaStateChange_t}, f::Symbol)
    f === :m_ulSteamID && return Ptr{uint64}(x + 0)
    f === :m_nChangeFlags && return Ptr{Cint}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::PersonaStateChange_t, f::Symbol)
    r = Ref{PersonaStateChange_t}(x)
    ptr = Base.unsafe_convert(Ptr{PersonaStateChange_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{PersonaStateChange_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum EPersonaChange::UInt32 begin
    k_EPersonaChangeName = 1
    k_EPersonaChangeStatus = 2
    k_EPersonaChangeComeOnline = 4
    k_EPersonaChangeGoneOffline = 8
    k_EPersonaChangeGamePlayed = 16
    k_EPersonaChangeGameServer = 32
    k_EPersonaChangeAvatar = 64
    k_EPersonaChangeJoinedSource = 128
    k_EPersonaChangeLeftSource = 256
    k_EPersonaChangeRelationshipChanged = 512
    k_EPersonaChangeNameFirstSet = 1024
    k_EPersonaChangeBroadcast = 2048
    k_EPersonaChangeNickname = 4096
    k_EPersonaChangeSteamLevel = 8192
    k_EPersonaChangeRichPresence = 16384
end

struct GameOverlayActivated_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{GameOverlayActivated_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:520:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_bActive && return Ptr{uint8}(x + 0)
    f === :m_bUserInitiated && return Ptr{Cint}(x + 0)
    f === :m_nAppID && return Ptr{AppId_t}(x + 0)
    f === :m_dwOverlayPID && return Ptr{uint32}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::GameOverlayActivated_t, f::Symbol)
    r = Ref{GameOverlayActivated_t}(x)
    ptr = Base.unsafe_convert(Ptr{GameOverlayActivated_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GameOverlayActivated_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct GameServerChangeRequested_t
    data::NTuple{128, UInt8}
end

function Base.getproperty(x::Ptr{GameServerChangeRequested_t}, f::Symbol)
    f === :m_rgchServer && return Ptr{NTuple{64, Cchar}}(x + 0)
    f === :m_rgchPassword && return Ptr{NTuple{64, Cchar}}(x + 64)
    return getfield(x, f)
end

function Base.getproperty(x::GameServerChangeRequested_t, f::Symbol)
    r = Ref{GameServerChangeRequested_t}(x)
    ptr = Base.unsafe_convert(Ptr{GameServerChangeRequested_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GameServerChangeRequested_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct GameLobbyJoinRequested_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{GameLobbyJoinRequested_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:546:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_steamIDLobby && return Ptr{Cint}(x + 0)
    f === :m_steamIDFriend && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::GameLobbyJoinRequested_t, f::Symbol)
    r = Ref{GameLobbyJoinRequested_t}(x)
    ptr = Base.unsafe_convert(Ptr{GameLobbyJoinRequested_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GameLobbyJoinRequested_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct AvatarImageLoaded_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{AvatarImageLoaded_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:564:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_steamID && return Ptr{Cint}(x + 0)
    f === :m_iImage && return Ptr{Cint}(x + 0)
    f === :m_iWide && return Ptr{Cint}(x + 0)
    f === :m_iTall && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::AvatarImageLoaded_t, f::Symbol)
    r = Ref{AvatarImageLoaded_t}(x)
    ptr = Base.unsafe_convert(Ptr{AvatarImageLoaded_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{AvatarImageLoaded_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct ClanOfficerListResponse_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{ClanOfficerListResponse_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:577:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_steamIDClan && return Ptr{Cint}(x + 0)
    f === :m_cOfficers && return Ptr{Cint}(x + 0)
    f === :m_bSuccess && return Ptr{uint8}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::ClanOfficerListResponse_t, f::Symbol)
    r = Ref{ClanOfficerListResponse_t}(x)
    ptr = Base.unsafe_convert(Ptr{ClanOfficerListResponse_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{ClanOfficerListResponse_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct FriendRichPresenceUpdate_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{FriendRichPresenceUpdate_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:589:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_steamIDFriend && return Ptr{Cint}(x + 0)
    f === :m_nAppID && return Ptr{AppId_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::FriendRichPresenceUpdate_t, f::Symbol)
    r = Ref{FriendRichPresenceUpdate_t}(x)
    ptr = Base.unsafe_convert(Ptr{FriendRichPresenceUpdate_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{FriendRichPresenceUpdate_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct GameRichPresenceJoinRequested_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{GameRichPresenceJoinRequested_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:601:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_steamIDFriend && return Ptr{Cint}(x + 0)
    f === :m_rgchConnect && return Ptr{NTuple{256, Cchar}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::GameRichPresenceJoinRequested_t, f::Symbol)
    r = Ref{GameRichPresenceJoinRequested_t}(x)
    ptr = Base.unsafe_convert(Ptr{GameRichPresenceJoinRequested_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GameRichPresenceJoinRequested_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct GameConnectedClanChatMsg_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{GameConnectedClanChatMsg_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:612:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_steamIDClanChat && return Ptr{Cint}(x + 0)
    f === :m_steamIDUser && return Ptr{Cint}(x + 0)
    f === :m_iMessageID && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::GameConnectedClanChatMsg_t, f::Symbol)
    r = Ref{GameConnectedClanChatMsg_t}(x)
    ptr = Base.unsafe_convert(Ptr{GameConnectedClanChatMsg_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GameConnectedClanChatMsg_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct GameConnectedChatJoin_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{GameConnectedChatJoin_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:624:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_steamIDClanChat && return Ptr{Cint}(x + 0)
    f === :m_steamIDUser && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::GameConnectedChatJoin_t, f::Symbol)
    r = Ref{GameConnectedChatJoin_t}(x)
    ptr = Base.unsafe_convert(Ptr{GameConnectedChatJoin_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GameConnectedChatJoin_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct GameConnectedChatLeave_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{GameConnectedChatLeave_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:635:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_steamIDClanChat && return Ptr{Cint}(x + 0)
    f === :m_steamIDUser && return Ptr{Cint}(x + 0)
    f === :m_bKicked && return Ptr{Cint}(x + 0)
    f === :m_bDropped && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::GameConnectedChatLeave_t, f::Symbol)
    r = Ref{GameConnectedChatLeave_t}(x)
    ptr = Base.unsafe_convert(Ptr{GameConnectedChatLeave_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GameConnectedChatLeave_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct DownloadClanActivityCountsResult_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{DownloadClanActivityCountsResult_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:648:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_bSuccess && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::DownloadClanActivityCountsResult_t, f::Symbol)
    r = Ref{DownloadClanActivityCountsResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{DownloadClanActivityCountsResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{DownloadClanActivityCountsResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct JoinClanChatRoomCompletionResult_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{JoinClanChatRoomCompletionResult_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:658:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_steamIDClanChat && return Ptr{Cint}(x + 0)
    f === :m_eChatRoomEnterResponse && return Ptr{EChatRoomEnterResponse}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::JoinClanChatRoomCompletionResult_t, f::Symbol)
    r = Ref{JoinClanChatRoomCompletionResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{JoinClanChatRoomCompletionResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{JoinClanChatRoomCompletionResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct GameConnectedFriendChatMsg_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{GameConnectedFriendChatMsg_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:668:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_steamIDUser && return Ptr{Cint}(x + 0)
    f === :m_iMessageID && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::GameConnectedFriendChatMsg_t, f::Symbol)
    r = Ref{GameConnectedFriendChatMsg_t}(x)
    ptr = Base.unsafe_convert(Ptr{GameConnectedFriendChatMsg_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GameConnectedFriendChatMsg_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct FriendsGetFollowerCount_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{FriendsGetFollowerCount_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:676:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_steamID && return Ptr{Cint}(x + 0)
    f === :m_nCount && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::FriendsGetFollowerCount_t, f::Symbol)
    r = Ref{FriendsGetFollowerCount_t}(x)
    ptr = Base.unsafe_convert(Ptr{FriendsGetFollowerCount_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{FriendsGetFollowerCount_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct FriendsIsFollowing_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{FriendsIsFollowing_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:685:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_steamID && return Ptr{Cint}(x + 0)
    f === :m_bIsFollowing && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::FriendsIsFollowing_t, f::Symbol)
    r = Ref{FriendsIsFollowing_t}(x)
    ptr = Base.unsafe_convert(Ptr{FriendsIsFollowing_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{FriendsIsFollowing_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct FriendsEnumerateFollowingList_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{FriendsEnumerateFollowingList_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:694:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_rgSteamID && return Ptr{Ptr{Cint}}(x + 0)
    f === :m_nResultsReturned && return Ptr{int32}(x + 0)
    f === :m_nTotalResultCount && return Ptr{int32}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::FriendsEnumerateFollowingList_t, f::Symbol)
    r = Ref{FriendsEnumerateFollowingList_t}(x)
    ptr = Base.unsafe_convert(Ptr{FriendsEnumerateFollowingList_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{FriendsEnumerateFollowingList_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SetPersonaNameResponse_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SetPersonaNameResponse_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:706:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_bSuccess && return Ptr{Cint}(x + 0)
    f === :m_bLocalSuccess && return Ptr{Cint}(x + 0)
    f === :m_result && return Ptr{EResult}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SetPersonaNameResponse_t, f::Symbol)
    r = Ref{SetPersonaNameResponse_t}(x)
    ptr = Base.unsafe_convert(Ptr{SetPersonaNameResponse_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SetPersonaNameResponse_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct UnreadChatMessagesChanged_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{UnreadChatMessagesChanged_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:718:2)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::UnreadChatMessagesChanged_t, f::Symbol)
    r = Ref{UnreadChatMessagesChanged_t}(x)
    ptr = Base.unsafe_convert(Ptr{UnreadChatMessagesChanged_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{UnreadChatMessagesChanged_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct OverlayBrowserProtocolNavigation_t
    data::NTuple{1024, UInt8}
end

function Base.getproperty(x::Ptr{OverlayBrowserProtocolNavigation_t}, f::Symbol)
    f === :rgchURI && return Ptr{NTuple{1024, Cchar}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::OverlayBrowserProtocolNavigation_t, f::Symbol)
    r = Ref{OverlayBrowserProtocolNavigation_t}(x)
    ptr = Base.unsafe_convert(Ptr{OverlayBrowserProtocolNavigation_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{OverlayBrowserProtocolNavigation_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct EquippedProfileItemsChanged_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{EquippedProfileItemsChanged_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:736:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_steamID && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::EquippedProfileItemsChanged_t, f::Symbol)
    r = Ref{EquippedProfileItemsChanged_t}(x)
    ptr = Base.unsafe_convert(Ptr{EquippedProfileItemsChanged_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{EquippedProfileItemsChanged_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct EquippedProfileItems_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{EquippedProfileItems_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamfriends.h:745:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_steamID && return Ptr{Cint}(x + 0)
    f === :m_bHasAnimatedAvatar && return Ptr{Cint}(x + 0)
    f === :m_bHasAvatarFrame && return Ptr{Cint}(x + 0)
    f === :m_bHasProfileModifier && return Ptr{Cint}(x + 0)
    f === :m_bHasProfileBackground && return Ptr{Cint}(x + 0)
    f === :m_bHasMiniProfileBackground && return Ptr{Cint}(x + 0)
    f === :m_bFromCache && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::EquippedProfileItems_t, f::Symbol)
    r = Ref{EquippedProfileItems_t}(x)
    ptr = Base.unsafe_convert(Ptr{EquippedProfileItems_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{EquippedProfileItems_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum ESteamAPICallFailure::Int32 begin
    k_ESteamAPICallFailureNone = -1
    k_ESteamAPICallFailureSteamGone = 0
    k_ESteamAPICallFailureNetworkFailure = 1
    k_ESteamAPICallFailureInvalidHandle = 2
    k_ESteamAPICallFailureMismatchedCallback = 3
end

@cenum EGamepadTextInputMode::UInt32 begin
    k_EGamepadTextInputModeNormal = 0
    k_EGamepadTextInputModePassword = 1
end

@cenum EGamepadTextInputLineMode::UInt32 begin
    k_EGamepadTextInputLineModeSingleLine = 0
    k_EGamepadTextInputLineModeMultipleLines = 1
end

@cenum EFloatingGamepadTextInputMode::UInt32 begin
    k_EFloatingGamepadTextInputModeModeSingleLine = 0
    k_EFloatingGamepadTextInputModeModeMultipleLines = 1
    k_EFloatingGamepadTextInputModeModeEmail = 2
    k_EFloatingGamepadTextInputModeModeNumeric = 3
end

@cenum ETextFilteringContext::UInt32 begin
    k_ETextFilteringContextUnknown = 0
    k_ETextFilteringContextGameContent = 1
    k_ETextFilteringContextChat = 2
    k_ETextFilteringContextName = 3
end

# no prototype is found for this function at isteamutils.h:226:21, please use with caution
function SteamUtils()
    ccall((:SteamUtils, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamUtils(p)
    ccall((:SteamInternal_Init_SteamUtils, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

# no prototype is found for this function at isteamutils.h:230:21, please use with caution
function SteamGameServerUtils()
    ccall((:SteamGameServerUtils, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamGameServerUtils(p)
    ccall((:SteamInternal_Init_SteamGameServerUtils, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct IPCountry_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{IPCountry_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamutils.h:247:2)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::IPCountry_t, f::Symbol)
    r = Ref{IPCountry_t}(x)
    ptr = Base.unsafe_convert(Ptr{IPCountry_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{IPCountry_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct LowBatteryPower_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{LowBatteryPower_t}, f::Symbol)
    f === :m_nMinutesBatteryLeft && return Ptr{uint8}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::LowBatteryPower_t, f::Symbol)
    r = Ref{LowBatteryPower_t}(x)
    ptr = Base.unsafe_convert(Ptr{LowBatteryPower_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{LowBatteryPower_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamAPICallCompleted_t
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{SteamAPICallCompleted_t}, f::Symbol)
    f === :m_hAsyncCall && return Ptr{SteamAPICall_t}(x + 0)
    f === :m_iCallback && return Ptr{Cint}(x + 8)
    f === :m_cubParam && return Ptr{uint32}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::SteamAPICallCompleted_t, f::Symbol)
    r = Ref{SteamAPICallCompleted_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamAPICallCompleted_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamAPICallCompleted_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamShutdown_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{SteamShutdown_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamutils.h:278:2)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamShutdown_t, f::Symbol)
    r = Ref{SteamShutdown_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamShutdown_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamShutdown_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum ECheckFileSignature::UInt32 begin
    k_ECheckFileSignatureInvalidSignature = 0
    k_ECheckFileSignatureValidSignature = 1
    k_ECheckFileSignatureFileNotFound = 2
    k_ECheckFileSignatureNoSignaturesFoundForThisApp = 3
    k_ECheckFileSignatureNoSignaturesFoundForThisFile = 4
end

struct CheckFileSignature_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{CheckFileSignature_t}, f::Symbol)
    f === :m_eCheckFileSignature && return Ptr{ECheckFileSignature}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::CheckFileSignature_t, f::Symbol)
    r = Ref{CheckFileSignature_t}(x)
    ptr = Base.unsafe_convert(Ptr{CheckFileSignature_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{CheckFileSignature_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct GamepadTextInputDismissed_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{GamepadTextInputDismissed_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamutils.h:311:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_bSubmitted && return Ptr{Cint}(x + 0)
    f === :m_unSubmittedText && return Ptr{uint32}(x + 0)
    f === :m_unAppID && return Ptr{AppId_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::GamepadTextInputDismissed_t, f::Symbol)
    r = Ref{GamepadTextInputDismissed_t}(x)
    ptr = Base.unsafe_convert(Ptr{GamepadTextInputDismissed_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GamepadTextInputDismissed_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct AppResumingFromSuspend_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{AppResumingFromSuspend_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamutils.h:319:1)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::AppResumingFromSuspend_t, f::Symbol)
    r = Ref{AppResumingFromSuspend_t}(x)
    ptr = Base.unsafe_convert(Ptr{AppResumingFromSuspend_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{AppResumingFromSuspend_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct FloatingGamepadTextInputDismissed_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{FloatingGamepadTextInputDismissed_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamutils.h:329:2)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::FloatingGamepadTextInputDismissed_t, f::Symbol)
    r = Ref{FloatingGamepadTextInputDismissed_t}(x)
    ptr = Base.unsafe_convert(Ptr{FloatingGamepadTextInputDismissed_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{FloatingGamepadTextInputDismissed_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct FilterTextDictionaryChanged_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{FilterTextDictionaryChanged_t}, f::Symbol)
    f === :m_eLanguage && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::FilterTextDictionaryChanged_t, f::Symbol)
    r = Ref{FilterTextDictionaryChanged_t}(x)
    ptr = Base.unsafe_convert(Ptr{FilterTextDictionaryChanged_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{FilterTextDictionaryChanged_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct MatchMakingKeyValuePair_t
    MatchMakingKeyValuePair_t::Cvoid
    m_szValue::NTuple{256, Cchar}
end

@cenum EMatchMakingServerResponse::UInt32 begin
    eServerResponded = 0
    eServerFailedToRespond = 1
    eNoServersListedOnMasterServer = 2
end

@cenum ELobbyType::UInt32 begin
    k_ELobbyTypePrivate = 0
    k_ELobbyTypeFriendsOnly = 1
    k_ELobbyTypePublic = 2
    k_ELobbyTypeInvisible = 3
    k_ELobbyTypePrivateUnique = 4
end

@cenum ELobbyComparison::Int32 begin
    k_ELobbyComparisonEqualToOrLessThan = -2
    k_ELobbyComparisonLessThan = -1
    k_ELobbyComparisonEqual = 0
    k_ELobbyComparisonGreaterThan = 1
    k_ELobbyComparisonEqualToOrGreaterThan = 2
    k_ELobbyComparisonNotEqual = 3
end

@cenum ELobbyDistanceFilter::UInt32 begin
    k_ELobbyDistanceFilterClose = 0
    k_ELobbyDistanceFilterDefault = 1
    k_ELobbyDistanceFilterFar = 2
    k_ELobbyDistanceFilterWorldwide = 3
end

# no prototype is found for this function at isteammatchmaking.h:263:27, please use with caution
function SteamMatchmaking()
    ccall((:SteamMatchmaking, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamMatchmaking(p)
    ccall((:SteamInternal_Init_SteamMatchmaking, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

const HServerListRequest = Ptr{Cvoid}

const HServerQuery = Cint

# no prototype is found for this function at isteammatchmaking.h:528:34, please use with caution
function SteamMatchmakingServers()
    ccall((:SteamMatchmakingServers, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamMatchmakingServers(p)
    ccall((:SteamInternal_Init_SteamMatchmakingServers, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

@cenum EChatMemberStateChange::UInt32 begin
    k_EChatMemberStateChangeEntered = 1
    k_EChatMemberStateChangeLeft = 2
    k_EChatMemberStateChangeDisconnected = 4
    k_EChatMemberStateChangeKicked = 8
    k_EChatMemberStateChangeBanned = 16
end

# no prototype is found for this function at isteammatchmaking.h:625:26, please use with caution
function SteamGameSearch()
    ccall((:SteamGameSearch, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamGameSearch(p)
    ccall((:SteamInternal_Init_SteamGameSearch, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

@cenum ESteamPartyBeaconLocationType::UInt32 begin
    k_ESteamPartyBeaconLocationType_Invalid = 0
    k_ESteamPartyBeaconLocationType_ChatGroup = 1
    k_ESteamPartyBeaconLocationType_Max = 2
end

struct SteamPartyBeaconLocation_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{SteamPartyBeaconLocation_t}, f::Symbol)
    f === :m_eType && return Ptr{ESteamPartyBeaconLocationType}(x + 0)
    f === :m_ulLocationID && return Ptr{uint64}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::SteamPartyBeaconLocation_t, f::Symbol)
    r = Ref{SteamPartyBeaconLocation_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamPartyBeaconLocation_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamPartyBeaconLocation_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum ESteamPartyBeaconLocationData::UInt32 begin
    k_ESteamPartyBeaconLocationDataInvalid = 0
    k_ESteamPartyBeaconLocationDataName = 1
    k_ESteamPartyBeaconLocationDataIconURLSmall = 2
    k_ESteamPartyBeaconLocationDataIconURLMedium = 3
    k_ESteamPartyBeaconLocationDataIconURLLarge = 4
end

# no prototype is found for this function at isteammatchmaking.h:722:23, please use with caution
function SteamParties()
    ccall((:SteamParties, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamParties(p)
    ccall((:SteamInternal_Init_SteamParties, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct FavoritesListChanged_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{FavoritesListChanged_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammatchmaking.h:734:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_nIP && return Ptr{uint32}(x + 0)
    f === :m_nQueryPort && return Ptr{uint32}(x + 0)
    f === :m_nConnPort && return Ptr{uint32}(x + 0)
    f === :m_nAppID && return Ptr{uint32}(x + 0)
    f === :m_nFlags && return Ptr{uint32}(x + 0)
    f === :m_bAdd && return Ptr{Cint}(x + 0)
    f === :m_unAccountId && return Ptr{AccountID_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::FavoritesListChanged_t, f::Symbol)
    r = Ref{FavoritesListChanged_t}(x)
    ptr = Base.unsafe_convert(Ptr{FavoritesListChanged_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{FavoritesListChanged_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct LobbyInvite_t
    data::NTuple{24, UInt8}
end

function Base.getproperty(x::Ptr{LobbyInvite_t}, f::Symbol)
    f === :m_ulSteamIDUser && return Ptr{uint64}(x + 0)
    f === :m_ulSteamIDLobby && return Ptr{uint64}(x + 8)
    f === :m_ulGameID && return Ptr{uint64}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::LobbyInvite_t, f::Symbol)
    r = Ref{LobbyInvite_t}(x)
    ptr = Base.unsafe_convert(Ptr{LobbyInvite_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{LobbyInvite_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct LobbyEnter_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{LobbyEnter_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammatchmaking.h:770:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_ulSteamIDLobby && return Ptr{uint64}(x + 0)
    f === :m_rgfChatPermissions && return Ptr{uint32}(x + 0)
    f === :m_bLocked && return Ptr{Cint}(x + 0)
    f === :m_EChatRoomEnterResponse && return Ptr{uint32}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::LobbyEnter_t, f::Symbol)
    r = Ref{LobbyEnter_t}(x)
    ptr = Base.unsafe_convert(Ptr{LobbyEnter_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{LobbyEnter_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct LobbyDataUpdate_t
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{LobbyDataUpdate_t}, f::Symbol)
    f === :m_ulSteamIDLobby && return Ptr{uint64}(x + 0)
    f === :m_ulSteamIDMember && return Ptr{uint64}(x + 8)
    f === :m_bSuccess && return Ptr{uint8}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::LobbyDataUpdate_t, f::Symbol)
    r = Ref{LobbyDataUpdate_t}(x)
    ptr = Base.unsafe_convert(Ptr{LobbyDataUpdate_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{LobbyDataUpdate_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct LobbyChatUpdate_t
    data::NTuple{28, UInt8}
end

function Base.getproperty(x::Ptr{LobbyChatUpdate_t}, f::Symbol)
    f === :m_ulSteamIDLobby && return Ptr{uint64}(x + 0)
    f === :m_ulSteamIDUserChanged && return Ptr{uint64}(x + 8)
    f === :m_ulSteamIDMakingChange && return Ptr{uint64}(x + 16)
    f === :m_rgfChatMemberStateChange && return Ptr{uint32}(x + 24)
    return getfield(x, f)
end

function Base.getproperty(x::LobbyChatUpdate_t, f::Symbol)
    r = Ref{LobbyChatUpdate_t}(x)
    ptr = Base.unsafe_convert(Ptr{LobbyChatUpdate_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{LobbyChatUpdate_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct LobbyChatMsg_t
    data::NTuple{24, UInt8}
end

function Base.getproperty(x::Ptr{LobbyChatMsg_t}, f::Symbol)
    f === :m_ulSteamIDLobby && return Ptr{uint64}(x + 0)
    f === :m_ulSteamIDUser && return Ptr{uint64}(x + 8)
    f === :m_eChatEntryType && return Ptr{uint8}(x + 16)
    f === :m_iChatID && return Ptr{uint32}(x + 20)
    return getfield(x, f)
end

function Base.getproperty(x::LobbyChatMsg_t, f::Symbol)
    r = Ref{LobbyChatMsg_t}(x)
    ptr = Base.unsafe_convert(Ptr{LobbyChatMsg_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{LobbyChatMsg_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct LobbyGameCreated_t
    data::NTuple{24, UInt8}
end

function Base.getproperty(x::Ptr{LobbyGameCreated_t}, f::Symbol)
    f === :m_ulSteamIDLobby && return Ptr{uint64}(x + 0)
    f === :m_ulSteamIDGameServer && return Ptr{uint64}(x + 8)
    f === :m_unIP && return Ptr{uint32}(x + 16)
    f === :m_usPort && return Ptr{uint16}(x + 20)
    return getfield(x, f)
end

function Base.getproperty(x::LobbyGameCreated_t, f::Symbol)
    r = Ref{LobbyGameCreated_t}(x)
    ptr = Base.unsafe_convert(Ptr{LobbyGameCreated_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{LobbyGameCreated_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct LobbyMatchList_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{LobbyMatchList_t}, f::Symbol)
    f === :m_nLobbiesMatching && return Ptr{uint32}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::LobbyMatchList_t, f::Symbol)
    r = Ref{LobbyMatchList_t}(x)
    ptr = Base.unsafe_convert(Ptr{LobbyMatchList_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{LobbyMatchList_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct LobbyKicked_t
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{LobbyKicked_t}, f::Symbol)
    f === :m_ulSteamIDLobby && return Ptr{uint64}(x + 0)
    f === :m_ulSteamIDAdmin && return Ptr{uint64}(x + 8)
    f === :m_bKickedDueToDisconnect && return Ptr{uint8}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::LobbyKicked_t, f::Symbol)
    r = Ref{LobbyKicked_t}(x)
    ptr = Base.unsafe_convert(Ptr{LobbyKicked_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{LobbyKicked_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct LobbyCreated_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{LobbyCreated_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_ulSteamIDLobby && return Ptr{uint64}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::LobbyCreated_t, f::Symbol)
    r = Ref{LobbyCreated_t}(x)
    ptr = Base.unsafe_convert(Ptr{LobbyCreated_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{LobbyCreated_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct PSNGameBootInviteResult_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{PSNGameBootInviteResult_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammatchmaking.h:899:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_bGameBootInviteExists && return Ptr{Cint}(x + 0)
    f === :m_steamIDLobby && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::PSNGameBootInviteResult_t, f::Symbol)
    r = Ref{PSNGameBootInviteResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{PSNGameBootInviteResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{PSNGameBootInviteResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct FavoritesListAccountsUpdated_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{FavoritesListAccountsUpdated_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::FavoritesListAccountsUpdated_t, f::Symbol)
    r = Ref{FavoritesListAccountsUpdated_t}(x)
    ptr = Base.unsafe_convert(Ptr{FavoritesListAccountsUpdated_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{FavoritesListAccountsUpdated_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SearchForGameProgressCallback_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SearchForGameProgressCallback_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammatchmaking.h:926:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_ullSearchID && return Ptr{uint64}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_lobbyID && return Ptr{Cint}(x + 0)
    f === :m_steamIDEndedSearch && return Ptr{Cint}(x + 0)
    f === :m_nSecondsRemainingEstimate && return Ptr{int32}(x + 0)
    f === :m_cPlayersSearching && return Ptr{int32}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SearchForGameProgressCallback_t, f::Symbol)
    r = Ref{SearchForGameProgressCallback_t}(x)
    ptr = Base.unsafe_convert(Ptr{SearchForGameProgressCallback_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SearchForGameProgressCallback_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SearchForGameResultCallback_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SearchForGameResultCallback_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammatchmaking.h:941:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_ullSearchID && return Ptr{uint64}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nCountPlayersInGame && return Ptr{int32}(x + 0)
    f === :m_nCountAcceptedGame && return Ptr{int32}(x + 0)
    f === :m_steamIDHost && return Ptr{Cint}(x + 0)
    f === :m_bFinalCallback && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SearchForGameResultCallback_t, f::Symbol)
    r = Ref{SearchForGameResultCallback_t}(x)
    ptr = Base.unsafe_convert(Ptr{SearchForGameResultCallback_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SearchForGameResultCallback_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RequestPlayersForGameProgressCallback_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{RequestPlayersForGameProgressCallback_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_ullSearchID && return Ptr{uint64}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::RequestPlayersForGameProgressCallback_t, f::Symbol)
    r = Ref{RequestPlayersForGameProgressCallback_t}(x)
    ptr = Base.unsafe_convert(Ptr{RequestPlayersForGameProgressCallback_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RequestPlayersForGameProgressCallback_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RequestPlayersForGameResultCallback_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{RequestPlayersForGameResultCallback_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammatchmaking.h:974:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_ullSearchID && return Ptr{uint64}(x + 0)
    f === :m_SteamIDPlayerFound && return Ptr{Cint}(x + 0)
    f === :m_SteamIDLobby && return Ptr{Cint}(x + 0)
    f === :PlayerAcceptState_t && return Ptr{Cvoid}(x + 0)
    f === :m_ePlayerAcceptState && return Ptr{Cvoid}(x + 0)
    f === :m_nPlayerIndex && return Ptr{int32}(x + 0)
    f === :m_nTotalPlayersFound && return Ptr{int32}(x + 0)
    f === :m_nTotalPlayersAcceptedGame && return Ptr{int32}(x + 0)
    f === :m_nSuggestedTeamIndex && return Ptr{int32}(x + 0)
    f === :m_ullUniqueGameID && return Ptr{uint64}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::RequestPlayersForGameResultCallback_t, f::Symbol)
    r = Ref{RequestPlayersForGameResultCallback_t}(x)
    ptr = Base.unsafe_convert(Ptr{RequestPlayersForGameResultCallback_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RequestPlayersForGameResultCallback_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RequestPlayersForGameFinalResultCallback_t
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{RequestPlayersForGameFinalResultCallback_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_ullSearchID && return Ptr{uint64}(x + 4)
    f === :m_ullUniqueGameID && return Ptr{uint64}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::RequestPlayersForGameFinalResultCallback_t, f::Symbol)
    r = Ref{RequestPlayersForGameFinalResultCallback_t}(x)
    ptr = Base.unsafe_convert(Ptr{RequestPlayersForGameFinalResultCallback_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RequestPlayersForGameFinalResultCallback_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SubmitPlayerResultResultCallback_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SubmitPlayerResultResultCallback_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammatchmaking.h:1010:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :ullUniqueGameID && return Ptr{uint64}(x + 0)
    f === :steamIDPlayer && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SubmitPlayerResultResultCallback_t, f::Symbol)
    r = Ref{SubmitPlayerResultResultCallback_t}(x)
    ptr = Base.unsafe_convert(Ptr{SubmitPlayerResultResultCallback_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SubmitPlayerResultResultCallback_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct EndGameResultCallback_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{EndGameResultCallback_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :ullUniqueGameID && return Ptr{uint64}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::EndGameResultCallback_t, f::Symbol)
    r = Ref{EndGameResultCallback_t}(x)
    ptr = Base.unsafe_convert(Ptr{EndGameResultCallback_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{EndGameResultCallback_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct JoinPartyCallback_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{JoinPartyCallback_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammatchmaking.h:1034:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_ulBeaconID && return Ptr{PartyBeaconID_t}(x + 0)
    f === :m_SteamIDBeaconOwner && return Ptr{Cint}(x + 0)
    f === :m_rgchConnectString && return Ptr{NTuple{256, Cchar}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::JoinPartyCallback_t, f::Symbol)
    r = Ref{JoinPartyCallback_t}(x)
    ptr = Base.unsafe_convert(Ptr{JoinPartyCallback_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{JoinPartyCallback_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct CreateBeaconCallback_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{CreateBeaconCallback_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_ulBeaconID && return Ptr{PartyBeaconID_t}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::CreateBeaconCallback_t, f::Symbol)
    r = Ref{CreateBeaconCallback_t}(x)
    ptr = Base.unsafe_convert(Ptr{CreateBeaconCallback_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{CreateBeaconCallback_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct ReservationNotificationCallback_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{ReservationNotificationCallback_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammatchmaking.h:1057:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_ulBeaconID && return Ptr{PartyBeaconID_t}(x + 0)
    f === :m_steamIDJoiner && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::ReservationNotificationCallback_t, f::Symbol)
    r = Ref{ReservationNotificationCallback_t}(x)
    ptr = Base.unsafe_convert(Ptr{ReservationNotificationCallback_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{ReservationNotificationCallback_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct ChangeNumOpenSlotsCallback_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{ChangeNumOpenSlotsCallback_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::ChangeNumOpenSlotsCallback_t, f::Symbol)
    r = Ref{ChangeNumOpenSlotsCallback_t}(x)
    ptr = Base.unsafe_convert(Ptr{ChangeNumOpenSlotsCallback_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{ChangeNumOpenSlotsCallback_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct AvailableBeaconLocationsUpdated_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{AvailableBeaconLocationsUpdated_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammatchmaking.h:1074:2)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::AvailableBeaconLocationsUpdated_t, f::Symbol)
    r = Ref{AvailableBeaconLocationsUpdated_t}(x)
    ptr = Base.unsafe_convert(Ptr{AvailableBeaconLocationsUpdated_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{AvailableBeaconLocationsUpdated_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct ActiveBeaconsUpdated_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{ActiveBeaconsUpdated_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammatchmaking.h:1080:2)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::ActiveBeaconsUpdated_t, f::Symbol)
    r = Ref{ActiveBeaconsUpdated_t}(x)
    ptr = Base.unsafe_convert(Ptr{ActiveBeaconsUpdated_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{ActiveBeaconsUpdated_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamParamStringArray_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{SteamParamStringArray_t}, f::Symbol)
    f === :m_ppStrings && return Ptr{Ptr{Ptr{Cchar}}}(x + 0)
    f === :m_nNumStrings && return Ptr{int32}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::SteamParamStringArray_t, f::Symbol)
    r = Ref{SteamParamStringArray_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamParamStringArray_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamParamStringArray_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const UGCHandle_t = uint64

const PublishedFileUpdateHandle_t = uint64

const PublishedFileId_t = uint64

const UGCFileWriteStreamHandle_t = uint64

@cenum ERemoteStoragePlatform::UInt32 begin
    k_ERemoteStoragePlatformNone = 0
    k_ERemoteStoragePlatformWindows = 1
    k_ERemoteStoragePlatformOSX = 2
    k_ERemoteStoragePlatformPS3 = 4
    k_ERemoteStoragePlatformLinux = 8
    k_ERemoteStoragePlatformSwitch = 16
    k_ERemoteStoragePlatformAndroid = 32
    k_ERemoteStoragePlatformIOS = 64
    k_ERemoteStoragePlatformAll = 0x00000000ffffffff
end

@cenum ERemoteStoragePublishedFileVisibility::UInt32 begin
    k_ERemoteStoragePublishedFileVisibilityPublic = 0
    k_ERemoteStoragePublishedFileVisibilityFriendsOnly = 1
    k_ERemoteStoragePublishedFileVisibilityPrivate = 2
    k_ERemoteStoragePublishedFileVisibilityUnlisted = 3
end

@cenum EWorkshopFileType::UInt32 begin
    k_EWorkshopFileTypeFirst = 0
    k_EWorkshopFileTypeCommunity = 0
    k_EWorkshopFileTypeMicrotransaction = 1
    k_EWorkshopFileTypeCollection = 2
    k_EWorkshopFileTypeArt = 3
    k_EWorkshopFileTypeVideo = 4
    k_EWorkshopFileTypeScreenshot = 5
    k_EWorkshopFileTypeGame = 6
    k_EWorkshopFileTypeSoftware = 7
    k_EWorkshopFileTypeConcept = 8
    k_EWorkshopFileTypeWebGuide = 9
    k_EWorkshopFileTypeIntegratedGuide = 10
    k_EWorkshopFileTypeMerch = 11
    k_EWorkshopFileTypeControllerBinding = 12
    k_EWorkshopFileTypeSteamworksAccessInvite = 13
    k_EWorkshopFileTypeSteamVideo = 14
    k_EWorkshopFileTypeGameManagedItem = 15
    k_EWorkshopFileTypeClip = 16
    k_EWorkshopFileTypeMax = 17
end

@cenum EWorkshopVote::UInt32 begin
    k_EWorkshopVoteUnvoted = 0
    k_EWorkshopVoteFor = 1
    k_EWorkshopVoteAgainst = 2
    k_EWorkshopVoteLater = 3
end

@cenum EWorkshopFileAction::UInt32 begin
    k_EWorkshopFileActionPlayed = 0
    k_EWorkshopFileActionCompleted = 1
end

@cenum EWorkshopEnumerationType::UInt32 begin
    k_EWorkshopEnumerationTypeRankedByVote = 0
    k_EWorkshopEnumerationTypeRecent = 1
    k_EWorkshopEnumerationTypeTrending = 2
    k_EWorkshopEnumerationTypeFavoritesOfFriends = 3
    k_EWorkshopEnumerationTypeVotedByFriends = 4
    k_EWorkshopEnumerationTypeContentByFriends = 5
    k_EWorkshopEnumerationTypeRecentFromFollowedUsers = 6
end

@cenum EWorkshopVideoProvider::UInt32 begin
    k_EWorkshopVideoProviderNone = 0
    k_EWorkshopVideoProviderYoutube = 1
end

@cenum EUGCReadAction::UInt32 begin
    k_EUGCRead_ContinueReadingUntilFinished = 0
    k_EUGCRead_ContinueReading = 1
    k_EUGCRead_Close = 2
end

@cenum ERemoteStorageLocalFileChange::UInt32 begin
    k_ERemoteStorageLocalFileChange_Invalid = 0
    k_ERemoteStorageLocalFileChange_FileUpdated = 1
    k_ERemoteStorageLocalFileChange_FileDeleted = 2
end

@cenum ERemoteStorageFilePathType::UInt32 begin
    k_ERemoteStorageFilePathType_Invalid = 0
    k_ERemoteStorageFilePathType_Absolute = 1
    k_ERemoteStorageFilePathType_APIFilename = 2
end

# no prototype is found for this function at isteamremotestorage.h:327:29, please use with caution
function SteamRemoteStorage()
    ccall((:SteamRemoteStorage, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamRemoteStorage(p)
    ccall((:SteamInternal_Init_SteamRemoteStorage, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct RemoteStorageFileShareResult_t
    data::NTuple{272, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageFileShareResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_hFile && return Ptr{UGCHandle_t}(x + 4)
    f === :m_rgchFilename && return Ptr{NTuple{260, Cchar}}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageFileShareResult_t, f::Symbol)
    r = Ref{RemoteStorageFileShareResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageFileShareResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageFileShareResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStoragePublishFileResult_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStoragePublishFileResult_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamremotestorage.h:362:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 0)
    f === :m_bUserNeedsToAcceptWorkshopLegalAgreement && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStoragePublishFileResult_t, f::Symbol)
    r = Ref{RemoteStoragePublishFileResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStoragePublishFileResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStoragePublishFileResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageDeletePublishedFileResult_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageDeletePublishedFileResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageDeletePublishedFileResult_t, f::Symbol)
    r = Ref{RemoteStorageDeletePublishedFileResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageDeletePublishedFileResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageDeletePublishedFileResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageEnumerateUserPublishedFilesResult_t
    data::NTuple{412, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageEnumerateUserPublishedFilesResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nResultsReturned && return Ptr{int32}(x + 4)
    f === :m_nTotalResultCount && return Ptr{int32}(x + 8)
    f === :m_rgPublishedFileId && return Ptr{NTuple{50, PublishedFileId_t}}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageEnumerateUserPublishedFilesResult_t, f::Symbol)
    r = Ref{RemoteStorageEnumerateUserPublishedFilesResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageEnumerateUserPublishedFilesResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageEnumerateUserPublishedFilesResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageSubscribePublishedFileResult_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageSubscribePublishedFileResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageSubscribePublishedFileResult_t, f::Symbol)
    r = Ref{RemoteStorageSubscribePublishedFileResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageSubscribePublishedFileResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageSubscribePublishedFileResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageEnumerateUserSubscribedFilesResult_t
    data::NTuple{612, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageEnumerateUserSubscribedFilesResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nResultsReturned && return Ptr{int32}(x + 4)
    f === :m_nTotalResultCount && return Ptr{int32}(x + 8)
    f === :m_rgPublishedFileId && return Ptr{NTuple{50, PublishedFileId_t}}(x + 12)
    f === :m_rgRTimeSubscribed && return Ptr{NTuple{50, uint32}}(x + 412)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageEnumerateUserSubscribedFilesResult_t, f::Symbol)
    r = Ref{RemoteStorageEnumerateUserSubscribedFilesResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageEnumerateUserSubscribedFilesResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageEnumerateUserSubscribedFilesResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageUnsubscribePublishedFileResult_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageUnsubscribePublishedFileResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageUnsubscribePublishedFileResult_t, f::Symbol)
    r = Ref{RemoteStorageUnsubscribePublishedFileResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageUnsubscribePublishedFileResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageUnsubscribePublishedFileResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageUpdatePublishedFileResult_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageUpdatePublishedFileResult_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamremotestorage.h:444:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 0)
    f === :m_bUserNeedsToAcceptWorkshopLegalAgreement && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageUpdatePublishedFileResult_t, f::Symbol)
    r = Ref{RemoteStorageUpdatePublishedFileResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageUpdatePublishedFileResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageUpdatePublishedFileResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageDownloadUGCResult_t
    data::NTuple{288, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageDownloadUGCResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_hFile && return Ptr{UGCHandle_t}(x + 4)
    f === :m_nAppID && return Ptr{AppId_t}(x + 12)
    f === :m_nSizeInBytes && return Ptr{int32}(x + 16)
    f === :m_pchFileName && return Ptr{NTuple{260, Cchar}}(x + 20)
    f === :m_ulSteamIDOwner && return Ptr{uint64}(x + 280)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageDownloadUGCResult_t, f::Symbol)
    r = Ref{RemoteStorageDownloadUGCResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageDownloadUGCResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageDownloadUGCResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageGetPublishedFileDetailsResult_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageGetPublishedFileDetailsResult_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamremotestorage.h:471:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 0)
    f === :m_nCreatorAppID && return Ptr{AppId_t}(x + 0)
    f === :m_nConsumerAppID && return Ptr{AppId_t}(x + 0)
    f === :m_rgchTitle && return Ptr{NTuple{129, Cchar}}(x + 0)
    f === :m_rgchDescription && return Ptr{NTuple{8000, Cchar}}(x + 0)
    f === :m_hFile && return Ptr{UGCHandle_t}(x + 0)
    f === :m_hPreviewFile && return Ptr{UGCHandle_t}(x + 0)
    f === :m_ulSteamIDOwner && return Ptr{uint64}(x + 0)
    f === :m_rtimeCreated && return Ptr{uint32}(x + 0)
    f === :m_rtimeUpdated && return Ptr{uint32}(x + 0)
    f === :m_eVisibility && return Ptr{ERemoteStoragePublishedFileVisibility}(x + 0)
    f === :m_bBanned && return Ptr{Cint}(x + 0)
    f === :m_rgchTags && return Ptr{NTuple{1025, Cchar}}(x + 0)
    f === :m_bTagsTruncated && return Ptr{Cint}(x + 0)
    f === :m_pchFileName && return Ptr{NTuple{260, Cchar}}(x + 0)
    f === :m_nFileSize && return Ptr{int32}(x + 0)
    f === :m_nPreviewFileSize && return Ptr{int32}(x + 0)
    f === :m_rgchURL && return Ptr{NTuple{256, Cchar}}(x + 0)
    f === :m_eFileType && return Ptr{EWorkshopFileType}(x + 0)
    f === :m_bAcceptedForUse && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageGetPublishedFileDetailsResult_t, f::Symbol)
    r = Ref{RemoteStorageGetPublishedFileDetailsResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageGetPublishedFileDetailsResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageGetPublishedFileDetailsResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageEnumerateWorkshopFilesResult_t
    data::NTuple{620, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageEnumerateWorkshopFilesResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nResultsReturned && return Ptr{int32}(x + 4)
    f === :m_nTotalResultCount && return Ptr{int32}(x + 8)
    f === :m_rgPublishedFileId && return Ptr{NTuple{50, PublishedFileId_t}}(x + 12)
    f === :m_rgScore && return Ptr{NTuple{50, Cfloat}}(x + 412)
    f === :m_nAppId && return Ptr{AppId_t}(x + 612)
    f === :m_unStartIndex && return Ptr{uint32}(x + 616)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageEnumerateWorkshopFilesResult_t, f::Symbol)
    r = Ref{RemoteStorageEnumerateWorkshopFilesResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageEnumerateWorkshopFilesResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageEnumerateWorkshopFilesResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageGetPublishedItemVoteDetailsResult_t
    data::NTuple{28, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageGetPublishedItemVoteDetailsResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_unPublishedFileId && return Ptr{PublishedFileId_t}(x + 4)
    f === :m_nVotesFor && return Ptr{int32}(x + 12)
    f === :m_nVotesAgainst && return Ptr{int32}(x + 16)
    f === :m_nReports && return Ptr{int32}(x + 20)
    f === :m_fScore && return Ptr{Cfloat}(x + 24)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageGetPublishedItemVoteDetailsResult_t, f::Symbol)
    r = Ref{RemoteStorageGetPublishedItemVoteDetailsResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageGetPublishedItemVoteDetailsResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageGetPublishedItemVoteDetailsResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStoragePublishedFileSubscribed_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStoragePublishedFileSubscribed_t}, f::Symbol)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 0)
    f === :m_nAppID && return Ptr{AppId_t}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStoragePublishedFileSubscribed_t, f::Symbol)
    r = Ref{RemoteStoragePublishedFileSubscribed_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStoragePublishedFileSubscribed_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStoragePublishedFileSubscribed_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStoragePublishedFileUnsubscribed_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStoragePublishedFileUnsubscribed_t}, f::Symbol)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 0)
    f === :m_nAppID && return Ptr{AppId_t}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStoragePublishedFileUnsubscribed_t, f::Symbol)
    r = Ref{RemoteStoragePublishedFileUnsubscribed_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStoragePublishedFileUnsubscribed_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStoragePublishedFileUnsubscribed_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStoragePublishedFileDeleted_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStoragePublishedFileDeleted_t}, f::Symbol)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 0)
    f === :m_nAppID && return Ptr{AppId_t}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStoragePublishedFileDeleted_t, f::Symbol)
    r = Ref{RemoteStoragePublishedFileDeleted_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStoragePublishedFileDeleted_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStoragePublishedFileDeleted_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageUpdateUserPublishedItemVoteResult_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageUpdateUserPublishedItemVoteResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageUpdateUserPublishedItemVoteResult_t, f::Symbol)
    r = Ref{RemoteStorageUpdateUserPublishedItemVoteResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageUpdateUserPublishedItemVoteResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageUpdateUserPublishedItemVoteResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageUserVoteDetails_t
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageUserVoteDetails_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 4)
    f === :m_eVote && return Ptr{EWorkshopVote}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageUserVoteDetails_t, f::Symbol)
    r = Ref{RemoteStorageUserVoteDetails_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageUserVoteDetails_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageUserVoteDetails_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageEnumerateUserSharedWorkshopFilesResult_t
    data::NTuple{412, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageEnumerateUserSharedWorkshopFilesResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nResultsReturned && return Ptr{int32}(x + 4)
    f === :m_nTotalResultCount && return Ptr{int32}(x + 8)
    f === :m_rgPublishedFileId && return Ptr{NTuple{50, PublishedFileId_t}}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageEnumerateUserSharedWorkshopFilesResult_t, f::Symbol)
    r = Ref{RemoteStorageEnumerateUserSharedWorkshopFilesResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageEnumerateUserSharedWorkshopFilesResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageEnumerateUserSharedWorkshopFilesResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageSetUserPublishedFileActionResult_t
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageSetUserPublishedFileActionResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 4)
    f === :m_eAction && return Ptr{EWorkshopFileAction}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageSetUserPublishedFileActionResult_t, f::Symbol)
    r = Ref{RemoteStorageSetUserPublishedFileActionResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageSetUserPublishedFileActionResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageSetUserPublishedFileActionResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageEnumeratePublishedFilesByUserActionResult_t
    data::NTuple{616, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageEnumeratePublishedFilesByUserActionResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_eAction && return Ptr{EWorkshopFileAction}(x + 4)
    f === :m_nResultsReturned && return Ptr{int32}(x + 8)
    f === :m_nTotalResultCount && return Ptr{int32}(x + 12)
    f === :m_rgPublishedFileId && return Ptr{NTuple{50, PublishedFileId_t}}(x + 16)
    f === :m_rgRTimeUpdated && return Ptr{NTuple{50, uint32}}(x + 416)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageEnumeratePublishedFilesByUserActionResult_t, f::Symbol)
    r = Ref{RemoteStorageEnumeratePublishedFilesByUserActionResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageEnumeratePublishedFilesByUserActionResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageEnumeratePublishedFilesByUserActionResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStoragePublishFileProgress_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStoragePublishFileProgress_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamremotestorage.h:612:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_dPercentFile && return Ptr{Cdouble}(x + 0)
    f === :m_bPreview && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStoragePublishFileProgress_t, f::Symbol)
    r = Ref{RemoteStoragePublishFileProgress_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStoragePublishFileProgress_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStoragePublishFileProgress_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStoragePublishedFileUpdated_t
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStoragePublishedFileUpdated_t}, f::Symbol)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 0)
    f === :m_nAppID && return Ptr{AppId_t}(x + 8)
    f === :m_ulUnused && return Ptr{uint64}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStoragePublishedFileUpdated_t, f::Symbol)
    r = Ref{RemoteStoragePublishedFileUpdated_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStoragePublishedFileUpdated_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStoragePublishedFileUpdated_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageFileWriteAsyncComplete_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageFileWriteAsyncComplete_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageFileWriteAsyncComplete_t, f::Symbol)
    r = Ref{RemoteStorageFileWriteAsyncComplete_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageFileWriteAsyncComplete_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageFileWriteAsyncComplete_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageFileReadAsyncComplete_t
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageFileReadAsyncComplete_t}, f::Symbol)
    f === :m_hFileReadAsync && return Ptr{SteamAPICall_t}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 8)
    f === :m_nOffset && return Ptr{uint32}(x + 12)
    f === :m_cubRead && return Ptr{uint32}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageFileReadAsyncComplete_t, f::Symbol)
    r = Ref{RemoteStorageFileReadAsyncComplete_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageFileReadAsyncComplete_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageFileReadAsyncComplete_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoteStorageLocalFileChange_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{RemoteStorageLocalFileChange_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamremotestorage.h:655:1)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::RemoteStorageLocalFileChange_t, f::Symbol)
    r = Ref{RemoteStorageLocalFileChange_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoteStorageLocalFileChange_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoteStorageLocalFileChange_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum var"##Ctag#272"::UInt32 begin
    k_cchStatNameMax = 128
end

@cenum var"##Ctag#273"::UInt32 begin
    k_cchLeaderboardNameMax = 128
end

@cenum var"##Ctag#274"::UInt32 begin
    k_cLeaderboardDetailsMax = 64
end

const SteamLeaderboard_t = uint64

const SteamLeaderboardEntries_t = uint64

@cenum ELeaderboardDataRequest::UInt32 begin
    k_ELeaderboardDataRequestGlobal = 0
    k_ELeaderboardDataRequestGlobalAroundUser = 1
    k_ELeaderboardDataRequestFriends = 2
    k_ELeaderboardDataRequestUsers = 3
end

@cenum ELeaderboardSortMethod::UInt32 begin
    k_ELeaderboardSortMethodNone = 0
    k_ELeaderboardSortMethodAscending = 1
    k_ELeaderboardSortMethodDescending = 2
end

@cenum ELeaderboardDisplayType::UInt32 begin
    k_ELeaderboardDisplayTypeNone = 0
    k_ELeaderboardDisplayTypeNumeric = 1
    k_ELeaderboardDisplayTypeTimeSeconds = 2
    k_ELeaderboardDisplayTypeTimeMilliSeconds = 3
end

@cenum ELeaderboardUploadScoreMethod::UInt32 begin
    k_ELeaderboardUploadScoreMethodNone = 0
    k_ELeaderboardUploadScoreMethodKeepBest = 1
    k_ELeaderboardUploadScoreMethodForceUpdate = 2
end

struct LeaderboardEntry_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{LeaderboardEntry_t}, f::Symbol)
    f === :m_steamIDUser && return Ptr{Cint}(x + 0)
    f === :m_nGlobalRank && return Ptr{int32}(x + 0)
    f === :m_nScore && return Ptr{int32}(x + 0)
    f === :m_cDetails && return Ptr{int32}(x + 0)
    f === :m_hUGC && return Ptr{UGCHandle_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::LeaderboardEntry_t, f::Symbol)
    r = Ref{LeaderboardEntry_t}(x)
    ptr = Base.unsafe_convert(Ptr{LeaderboardEntry_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{LeaderboardEntry_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

# no prototype is found for this function at isteamuserstats.h:311:25, please use with caution
function SteamUserStats()
    ccall((:SteamUserStats, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamUserStats(p)
    ccall((:SteamInternal_Init_SteamUserStats, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct UserStatsReceived_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{UserStatsReceived_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamuserstats.h:329:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_nGameID && return Ptr{uint64}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_steamIDUser && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::UserStatsReceived_t, f::Symbol)
    r = Ref{UserStatsReceived_t}(x)
    ptr = Base.unsafe_convert(Ptr{UserStatsReceived_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{UserStatsReceived_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct UserStatsStored_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{UserStatsStored_t}, f::Symbol)
    f === :m_nGameID && return Ptr{uint64}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::UserStatsStored_t, f::Symbol)
    r = Ref{UserStatsStored_t}(x)
    ptr = Base.unsafe_convert(Ptr{UserStatsStored_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{UserStatsStored_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct UserAchievementStored_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{UserAchievementStored_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamuserstats.h:354:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_nGameID && return Ptr{uint64}(x + 0)
    f === :m_bGroupAchievement && return Ptr{Cint}(x + 0)
    f === :m_rgchAchievementName && return Ptr{NTuple{128, Cchar}}(x + 0)
    f === :m_nCurProgress && return Ptr{uint32}(x + 0)
    f === :m_nMaxProgress && return Ptr{uint32}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::UserAchievementStored_t, f::Symbol)
    r = Ref{UserAchievementStored_t}(x)
    ptr = Base.unsafe_convert(Ptr{UserAchievementStored_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{UserAchievementStored_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct LeaderboardFindResult_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{LeaderboardFindResult_t}, f::Symbol)
    f === :m_hSteamLeaderboard && return Ptr{SteamLeaderboard_t}(x + 0)
    f === :m_bLeaderboardFound && return Ptr{uint8}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::LeaderboardFindResult_t, f::Symbol)
    r = Ref{LeaderboardFindResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{LeaderboardFindResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{LeaderboardFindResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct LeaderboardScoresDownloaded_t
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{LeaderboardScoresDownloaded_t}, f::Symbol)
    f === :m_hSteamLeaderboard && return Ptr{SteamLeaderboard_t}(x + 0)
    f === :m_hSteamLeaderboardEntries && return Ptr{SteamLeaderboardEntries_t}(x + 8)
    f === :m_cEntryCount && return Ptr{Cint}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::LeaderboardScoresDownloaded_t, f::Symbol)
    r = Ref{LeaderboardScoresDownloaded_t}(x)
    ptr = Base.unsafe_convert(Ptr{LeaderboardScoresDownloaded_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{LeaderboardScoresDownloaded_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct LeaderboardScoreUploaded_t
    data::NTuple{28, UInt8}
end

function Base.getproperty(x::Ptr{LeaderboardScoreUploaded_t}, f::Symbol)
    f === :m_bSuccess && return Ptr{uint8}(x + 0)
    f === :m_hSteamLeaderboard && return Ptr{SteamLeaderboard_t}(x + 4)
    f === :m_nScore && return Ptr{int32}(x + 12)
    f === :m_bScoreChanged && return Ptr{uint8}(x + 16)
    f === :m_nGlobalRankNew && return Ptr{Cint}(x + 20)
    f === :m_nGlobalRankPrevious && return Ptr{Cint}(x + 24)
    return getfield(x, f)
end

function Base.getproperty(x::LeaderboardScoreUploaded_t, f::Symbol)
    r = Ref{LeaderboardScoreUploaded_t}(x)
    ptr = Base.unsafe_convert(Ptr{LeaderboardScoreUploaded_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{LeaderboardScoreUploaded_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct NumberOfCurrentPlayers_t
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{NumberOfCurrentPlayers_t}, f::Symbol)
    f === :m_bSuccess && return Ptr{uint8}(x + 0)
    f === :m_cPlayers && return Ptr{int32}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::NumberOfCurrentPlayers_t, f::Symbol)
    r = Ref{NumberOfCurrentPlayers_t}(x)
    ptr = Base.unsafe_convert(Ptr{NumberOfCurrentPlayers_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{NumberOfCurrentPlayers_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct UserStatsUnloaded_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{UserStatsUnloaded_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamuserstats.h:419:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_steamIDUser && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::UserStatsUnloaded_t, f::Symbol)
    r = Ref{UserStatsUnloaded_t}(x)
    ptr = Base.unsafe_convert(Ptr{UserStatsUnloaded_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{UserStatsUnloaded_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct UserAchievementIconFetched_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{UserAchievementIconFetched_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamuserstats.h:430:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_nGameID && return Ptr{Cint}(x + 0)
    f === :m_rgchAchievementName && return Ptr{NTuple{128, Cchar}}(x + 0)
    f === :m_bAchieved && return Ptr{Cint}(x + 0)
    f === :m_nIconHandle && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::UserAchievementIconFetched_t, f::Symbol)
    r = Ref{UserAchievementIconFetched_t}(x)
    ptr = Base.unsafe_convert(Ptr{UserAchievementIconFetched_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{UserAchievementIconFetched_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct GlobalAchievementPercentagesReady_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{GlobalAchievementPercentagesReady_t}, f::Symbol)
    f === :m_nGameID && return Ptr{uint64}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::GlobalAchievementPercentagesReady_t, f::Symbol)
    r = Ref{GlobalAchievementPercentagesReady_t}(x)
    ptr = Base.unsafe_convert(Ptr{GlobalAchievementPercentagesReady_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GlobalAchievementPercentagesReady_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct LeaderboardUGCSet_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{LeaderboardUGCSet_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_hSteamLeaderboard && return Ptr{SteamLeaderboard_t}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::LeaderboardUGCSet_t, f::Symbol)
    r = Ref{LeaderboardUGCSet_t}(x)
    ptr = Base.unsafe_convert(Ptr{LeaderboardUGCSet_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{LeaderboardUGCSet_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct PS3TrophiesInstalled_t
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{PS3TrophiesInstalled_t}, f::Symbol)
    f === :m_nGameID && return Ptr{uint64}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 8)
    f === :m_ulRequiredDiskSpace && return Ptr{uint64}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::PS3TrophiesInstalled_t, f::Symbol)
    r = Ref{PS3TrophiesInstalled_t}(x)
    ptr = Base.unsafe_convert(Ptr{PS3TrophiesInstalled_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{PS3TrophiesInstalled_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct GlobalStatsReceived_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{GlobalStatsReceived_t}, f::Symbol)
    f === :m_nGameID && return Ptr{uint64}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::GlobalStatsReceived_t, f::Symbol)
    r = Ref{GlobalStatsReceived_t}(x)
    ptr = Base.unsafe_convert(Ptr{GlobalStatsReceived_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GlobalStatsReceived_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

# no prototype is found for this function at isteamapps.h:128:20, please use with caution
function SteamApps()
    ccall((:SteamApps, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamApps(p)
    ccall((:SteamInternal_Init_SteamApps, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct DlcInstalled_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{DlcInstalled_t}, f::Symbol)
    f === :m_nAppID && return Ptr{AppId_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::DlcInstalled_t, f::Symbol)
    r = Ref{DlcInstalled_t}(x)
    ptr = Base.unsafe_convert(Ptr{DlcInstalled_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{DlcInstalled_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct NewUrlLaunchParameters_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{NewUrlLaunchParameters_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamapps.h:157:2)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::NewUrlLaunchParameters_t, f::Symbol)
    r = Ref{NewUrlLaunchParameters_t}(x)
    ptr = Base.unsafe_convert(Ptr{NewUrlLaunchParameters_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{NewUrlLaunchParameters_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct AppProofOfPurchaseKeyResponse_t
    data::NTuple{252, UInt8}
end

function Base.getproperty(x::Ptr{AppProofOfPurchaseKeyResponse_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nAppID && return Ptr{uint32}(x + 4)
    f === :m_cchKeyLength && return Ptr{uint32}(x + 8)
    f === :m_rgchKey && return Ptr{NTuple{240, Cchar}}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::AppProofOfPurchaseKeyResponse_t, f::Symbol)
    r = Ref{AppProofOfPurchaseKeyResponse_t}(x)
    ptr = Base.unsafe_convert(Ptr{AppProofOfPurchaseKeyResponse_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{AppProofOfPurchaseKeyResponse_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct FileDetailsResult_t
    data::NTuple{36, UInt8}
end

function Base.getproperty(x::Ptr{FileDetailsResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_ulFileSize && return Ptr{uint64}(x + 4)
    f === :m_FileSHA && return Ptr{NTuple{20, uint8}}(x + 12)
    f === :m_unFlags && return Ptr{uint32}(x + 32)
    return getfield(x, f)
end

function Base.getproperty(x::FileDetailsResult_t, f::Symbol)
    r = Ref{FileDetailsResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{FileDetailsResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{FileDetailsResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct TimedTrialStatus_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{TimedTrialStatus_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamapps.h:193:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_unAppID && return Ptr{AppId_t}(x + 0)
    f === :m_bIsOffline && return Ptr{Cint}(x + 0)
    f === :m_unSecondsAllowed && return Ptr{uint32}(x + 0)
    f === :m_unSecondsPlayed && return Ptr{uint32}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::TimedTrialStatus_t, f::Symbol)
    r = Ref{TimedTrialStatus_t}(x)
    ptr = Base.unsafe_convert(Ptr{TimedTrialStatus_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{TimedTrialStatus_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum EP2PSessionError::UInt32 begin
    k_EP2PSessionErrorNone = 0
    k_EP2PSessionErrorNoRightsToApp = 2
    k_EP2PSessionErrorTimeout = 4
    k_EP2PSessionErrorNotRunningApp_DELETED = 1
    k_EP2PSessionErrorDestinationNotLoggedIn_DELETED = 3
    k_EP2PSessionErrorMax = 5
end

@cenum EP2PSend::UInt32 begin
    k_EP2PSendUnreliable = 0
    k_EP2PSendUnreliableNoDelay = 1
    k_EP2PSendReliable = 2
    k_EP2PSendReliableWithBuffering = 3
end

struct P2PSessionState_t
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{P2PSessionState_t}, f::Symbol)
    f === :m_bConnectionActive && return Ptr{uint8}(x + 0)
    f === :m_bConnecting && return Ptr{uint8}(x + 1)
    f === :m_eP2PSessionError && return Ptr{uint8}(x + 2)
    f === :m_bUsingRelay && return Ptr{uint8}(x + 3)
    f === :m_nBytesQueuedForSend && return Ptr{int32}(x + 4)
    f === :m_nPacketsQueuedForSend && return Ptr{int32}(x + 8)
    f === :m_nRemoteIP && return Ptr{uint32}(x + 12)
    f === :m_nRemotePort && return Ptr{uint16}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::P2PSessionState_t, f::Symbol)
    r = Ref{P2PSessionState_t}(x)
    ptr = Base.unsafe_convert(Ptr{P2PSessionState_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{P2PSessionState_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const SNetSocket_t = uint32

const SNetListenSocket_t = uint32

@cenum ESNetSocketState::UInt32 begin
    k_ESNetSocketStateInvalid = 0
    k_ESNetSocketStateConnected = 1
    k_ESNetSocketStateInitiated = 10
    k_ESNetSocketStateLocalCandidatesFound = 11
    k_ESNetSocketStateReceivedRemoteCandidates = 12
    k_ESNetSocketStateChallengeHandshake = 15
    k_ESNetSocketStateDisconnecting = 21
    k_ESNetSocketStateLocalDisconnect = 22
    k_ESNetSocketStateTimeoutDuringConnect = 23
    k_ESNetSocketStateRemoteEndDisconnected = 24
    k_ESNetSocketStateConnectionBroken = 25
end

@cenum ESNetSocketConnectionType::UInt32 begin
    k_ESNetSocketConnectionTypeNotConnected = 0
    k_ESNetSocketConnectionTypeUDP = 1
    k_ESNetSocketConnectionTypeUDPRelay = 2
end

# no prototype is found for this function at isteamnetworking.h:294:26, please use with caution
function SteamNetworking()
    ccall((:SteamNetworking, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamNetworking(p)
    ccall((:SteamInternal_Init_SteamNetworking, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

# no prototype is found for this function at isteamnetworking.h:298:26, please use with caution
function SteamGameServerNetworking()
    ccall((:SteamGameServerNetworking, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamGameServerNetworking(p)
    ccall((:SteamInternal_Init_SteamGameServerNetworking, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct P2PSessionRequest_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{P2PSessionRequest_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamnetworking.h:314:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_steamIDRemote && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::P2PSessionRequest_t, f::Symbol)
    r = Ref{P2PSessionRequest_t}(x)
    ptr = Base.unsafe_convert(Ptr{P2PSessionRequest_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{P2PSessionRequest_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct P2PSessionConnectFail_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{P2PSessionConnectFail_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamnetworking.h:324:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_steamIDRemote && return Ptr{Cint}(x + 0)
    f === :m_eP2PSessionError && return Ptr{uint8}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::P2PSessionConnectFail_t, f::Symbol)
    r = Ref{P2PSessionConnectFail_t}(x)
    ptr = Base.unsafe_convert(Ptr{P2PSessionConnectFail_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{P2PSessionConnectFail_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SocketStatusCallback_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SocketStatusCallback_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamnetworking.h:334:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_hSocket && return Ptr{SNetSocket_t}(x + 0)
    f === :m_hListenSocket && return Ptr{SNetListenSocket_t}(x + 0)
    f === :m_steamIDRemote && return Ptr{Cint}(x + 0)
    f === :m_eSNetSocketState && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SocketStatusCallback_t, f::Symbol)
    r = Ref{SocketStatusCallback_t}(x)
    ptr = Base.unsafe_convert(Ptr{SocketStatusCallback_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SocketStatusCallback_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const ScreenshotHandle = uint32

@cenum EVRScreenshotType::UInt32 begin
    k_EVRScreenshotType_None = 0
    k_EVRScreenshotType_Mono = 1
    k_EVRScreenshotType_Stereo = 2
    k_EVRScreenshotType_MonoCubemap = 3
    k_EVRScreenshotType_MonoPanorama = 4
    k_EVRScreenshotType_StereoPanorama = 5
end

# no prototype is found for this function at isteamscreenshots.h:85:27, please use with caution
function SteamScreenshots()
    ccall((:SteamScreenshots, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamScreenshots(p)
    ccall((:SteamInternal_Init_SteamScreenshots, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct ScreenshotReady_t
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{ScreenshotReady_t}, f::Symbol)
    f === :m_hLocal && return Ptr{ScreenshotHandle}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::ScreenshotReady_t, f::Symbol)
    r = Ref{ScreenshotReady_t}(x)
    ptr = Base.unsafe_convert(Ptr{ScreenshotReady_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{ScreenshotReady_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct ScreenshotRequested_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{ScreenshotRequested_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamscreenshots.h:114:2)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::ScreenshotRequested_t, f::Symbol)
    r = Ref{ScreenshotRequested_t}(x)
    ptr = Base.unsafe_convert(Ptr{ScreenshotRequested_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{ScreenshotRequested_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum AudioPlayback_Status::UInt32 begin
    AudioPlayback_Undefined = 0
    AudioPlayback_Playing = 1
    AudioPlayback_Paused = 2
    AudioPlayback_Idle = 3
end

# no prototype is found for this function at isteammusic.h:48:21, please use with caution
function SteamMusic()
    ccall((:SteamMusic, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamMusic(p)
    ccall((:SteamInternal_Init_SteamMusic, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct PlaybackStatusHasChanged_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{PlaybackStatusHasChanged_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammusic.h:61:1)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::PlaybackStatusHasChanged_t, f::Symbol)
    r = Ref{PlaybackStatusHasChanged_t}(x)
    ptr = Base.unsafe_convert(Ptr{PlaybackStatusHasChanged_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{PlaybackStatusHasChanged_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct VolumeHasChanged_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{VolumeHasChanged_t}, f::Symbol)
    f === :m_flNewVolume && return Ptr{Cfloat}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::VolumeHasChanged_t, f::Symbol)
    r = Ref{VolumeHasChanged_t}(x)
    ptr = Base.unsafe_convert(Ptr{VolumeHasChanged_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{VolumeHasChanged_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

# no prototype is found for this function at isteammusicremote.h:68:27, please use with caution
function SteamMusicRemote()
    ccall((:SteamMusicRemote, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamMusicRemote(p)
    ccall((:SteamInternal_Init_SteamMusicRemote, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct MusicPlayerRemoteWillActivate_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{MusicPlayerRemoteWillActivate_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammusicremote.h:81:1)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::MusicPlayerRemoteWillActivate_t, f::Symbol)
    r = Ref{MusicPlayerRemoteWillActivate_t}(x)
    ptr = Base.unsafe_convert(Ptr{MusicPlayerRemoteWillActivate_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MusicPlayerRemoteWillActivate_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct MusicPlayerRemoteWillDeactivate_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{MusicPlayerRemoteWillDeactivate_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammusicremote.h:84:1)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::MusicPlayerRemoteWillDeactivate_t, f::Symbol)
    r = Ref{MusicPlayerRemoteWillDeactivate_t}(x)
    ptr = Base.unsafe_convert(Ptr{MusicPlayerRemoteWillDeactivate_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MusicPlayerRemoteWillDeactivate_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct MusicPlayerRemoteToFront_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{MusicPlayerRemoteToFront_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammusicremote.h:87:1)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::MusicPlayerRemoteToFront_t, f::Symbol)
    r = Ref{MusicPlayerRemoteToFront_t}(x)
    ptr = Base.unsafe_convert(Ptr{MusicPlayerRemoteToFront_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MusicPlayerRemoteToFront_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct MusicPlayerWillQuit_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{MusicPlayerWillQuit_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammusicremote.h:90:1)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::MusicPlayerWillQuit_t, f::Symbol)
    r = Ref{MusicPlayerWillQuit_t}(x)
    ptr = Base.unsafe_convert(Ptr{MusicPlayerWillQuit_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MusicPlayerWillQuit_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct MusicPlayerWantsPlay_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{MusicPlayerWantsPlay_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammusicremote.h:93:1)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::MusicPlayerWantsPlay_t, f::Symbol)
    r = Ref{MusicPlayerWantsPlay_t}(x)
    ptr = Base.unsafe_convert(Ptr{MusicPlayerWantsPlay_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MusicPlayerWantsPlay_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct MusicPlayerWantsPause_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{MusicPlayerWantsPause_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammusicremote.h:96:1)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::MusicPlayerWantsPause_t, f::Symbol)
    r = Ref{MusicPlayerWantsPause_t}(x)
    ptr = Base.unsafe_convert(Ptr{MusicPlayerWantsPause_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MusicPlayerWantsPause_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct MusicPlayerWantsPlayPrevious_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{MusicPlayerWantsPlayPrevious_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammusicremote.h:99:1)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::MusicPlayerWantsPlayPrevious_t, f::Symbol)
    r = Ref{MusicPlayerWantsPlayPrevious_t}(x)
    ptr = Base.unsafe_convert(Ptr{MusicPlayerWantsPlayPrevious_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MusicPlayerWantsPlayPrevious_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct MusicPlayerWantsPlayNext_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{MusicPlayerWantsPlayNext_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammusicremote.h:102:1)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::MusicPlayerWantsPlayNext_t, f::Symbol)
    r = Ref{MusicPlayerWantsPlayNext_t}(x)
    ptr = Base.unsafe_convert(Ptr{MusicPlayerWantsPlayNext_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MusicPlayerWantsPlayNext_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct MusicPlayerWantsShuffled_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{MusicPlayerWantsShuffled_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammusicremote.h:105:1)") && return Ptr{Cvoid}(x + 0)
    f === :m_bShuffled && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::MusicPlayerWantsShuffled_t, f::Symbol)
    r = Ref{MusicPlayerWantsShuffled_t}(x)
    ptr = Base.unsafe_convert(Ptr{MusicPlayerWantsShuffled_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MusicPlayerWantsShuffled_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct MusicPlayerWantsLooped_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{MusicPlayerWantsLooped_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteammusicremote.h:109:1)") && return Ptr{Cvoid}(x + 0)
    f === :m_bLooped && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::MusicPlayerWantsLooped_t, f::Symbol)
    r = Ref{MusicPlayerWantsLooped_t}(x)
    ptr = Base.unsafe_convert(Ptr{MusicPlayerWantsLooped_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MusicPlayerWantsLooped_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct MusicPlayerWantsVolume_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{MusicPlayerWantsVolume_t}, f::Symbol)
    f === :m_flNewVolume && return Ptr{Cfloat}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::MusicPlayerWantsVolume_t, f::Symbol)
    r = Ref{MusicPlayerWantsVolume_t}(x)
    ptr = Base.unsafe_convert(Ptr{MusicPlayerWantsVolume_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MusicPlayerWantsVolume_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct MusicPlayerSelectsQueueEntry_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{MusicPlayerSelectsQueueEntry_t}, f::Symbol)
    f === :nID && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::MusicPlayerSelectsQueueEntry_t, f::Symbol)
    r = Ref{MusicPlayerSelectsQueueEntry_t}(x)
    ptr = Base.unsafe_convert(Ptr{MusicPlayerSelectsQueueEntry_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MusicPlayerSelectsQueueEntry_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct MusicPlayerSelectsPlaylistEntry_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{MusicPlayerSelectsPlaylistEntry_t}, f::Symbol)
    f === :nID && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::MusicPlayerSelectsPlaylistEntry_t, f::Symbol)
    r = Ref{MusicPlayerSelectsPlaylistEntry_t}(x)
    ptr = Base.unsafe_convert(Ptr{MusicPlayerSelectsPlaylistEntry_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MusicPlayerSelectsPlaylistEntry_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct MusicPlayerWantsPlayingRepeatStatus_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{MusicPlayerWantsPlayingRepeatStatus_t}, f::Symbol)
    f === :m_nPlayingRepeatStatus && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::MusicPlayerWantsPlayingRepeatStatus_t, f::Symbol)
    r = Ref{MusicPlayerWantsPlayingRepeatStatus_t}(x)
    ptr = Base.unsafe_convert(Ptr{MusicPlayerWantsPlayingRepeatStatus_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MusicPlayerWantsPlayingRepeatStatus_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum EHTTPMethod::UInt32 begin
    k_EHTTPMethodInvalid = 0
    k_EHTTPMethodGET = 1
    k_EHTTPMethodHEAD = 2
    k_EHTTPMethodPOST = 3
    k_EHTTPMethodPUT = 4
    k_EHTTPMethodDELETE = 5
    k_EHTTPMethodOPTIONS = 6
    k_EHTTPMethodPATCH = 7
end

@cenum EHTTPStatusCode::UInt32 begin
    k_EHTTPStatusCodeInvalid = 0
    k_EHTTPStatusCode100Continue = 100
    k_EHTTPStatusCode101SwitchingProtocols = 101
    k_EHTTPStatusCode200OK = 200
    k_EHTTPStatusCode201Created = 201
    k_EHTTPStatusCode202Accepted = 202
    k_EHTTPStatusCode203NonAuthoritative = 203
    k_EHTTPStatusCode204NoContent = 204
    k_EHTTPStatusCode205ResetContent = 205
    k_EHTTPStatusCode206PartialContent = 206
    k_EHTTPStatusCode300MultipleChoices = 300
    k_EHTTPStatusCode301MovedPermanently = 301
    k_EHTTPStatusCode302Found = 302
    k_EHTTPStatusCode303SeeOther = 303
    k_EHTTPStatusCode304NotModified = 304
    k_EHTTPStatusCode305UseProxy = 305
    k_EHTTPStatusCode307TemporaryRedirect = 307
    k_EHTTPStatusCode308PermanentRedirect = 308
    k_EHTTPStatusCode400BadRequest = 400
    k_EHTTPStatusCode401Unauthorized = 401
    k_EHTTPStatusCode402PaymentRequired = 402
    k_EHTTPStatusCode403Forbidden = 403
    k_EHTTPStatusCode404NotFound = 404
    k_EHTTPStatusCode405MethodNotAllowed = 405
    k_EHTTPStatusCode406NotAcceptable = 406
    k_EHTTPStatusCode407ProxyAuthRequired = 407
    k_EHTTPStatusCode408RequestTimeout = 408
    k_EHTTPStatusCode409Conflict = 409
    k_EHTTPStatusCode410Gone = 410
    k_EHTTPStatusCode411LengthRequired = 411
    k_EHTTPStatusCode412PreconditionFailed = 412
    k_EHTTPStatusCode413RequestEntityTooLarge = 413
    k_EHTTPStatusCode414RequestURITooLong = 414
    k_EHTTPStatusCode415UnsupportedMediaType = 415
    k_EHTTPStatusCode416RequestedRangeNotSatisfiable = 416
    k_EHTTPStatusCode417ExpectationFailed = 417
    k_EHTTPStatusCode4xxUnknown = 418
    k_EHTTPStatusCode429TooManyRequests = 429
    k_EHTTPStatusCode444ConnectionClosed = 444
    k_EHTTPStatusCode500InternalServerError = 500
    k_EHTTPStatusCode501NotImplemented = 501
    k_EHTTPStatusCode502BadGateway = 502
    k_EHTTPStatusCode503ServiceUnavailable = 503
    k_EHTTPStatusCode504GatewayTimeout = 504
    k_EHTTPStatusCode505HTTPVersionNotSupported = 505
    k_EHTTPStatusCode5xxUnknown = 599
end

function BIsHTTPStatusSuccess(eStatus)
    ccall((:BIsHTTPStatusSuccess, libsteam_api), Cint, (EHTTPStatusCode,), eStatus)
end

const HTTPRequestHandle = uint32

const HTTPCookieContainerHandle = uint32

# no prototype is found for this function at isteamhttp.h:146:20, please use with caution
function SteamHTTP()
    ccall((:SteamHTTP, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamHTTP(p)
    ccall((:SteamInternal_Init_SteamHTTP, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

# no prototype is found for this function at isteamhttp.h:150:20, please use with caution
function SteamGameServerHTTP()
    ccall((:SteamGameServerHTTP, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamGameServerHTTP(p)
    ccall((:SteamInternal_Init_SteamGameServerHTTP, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct HTTPRequestCompleted_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{HTTPRequestCompleted_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamhttp.h:164:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_hRequest && return Ptr{HTTPRequestHandle}(x + 0)
    f === :m_ulContextValue && return Ptr{uint64}(x + 0)
    f === :m_bRequestSuccessful && return Ptr{Cint}(x + 0)
    f === :m_eStatusCode && return Ptr{EHTTPStatusCode}(x + 0)
    f === :m_unBodySize && return Ptr{uint32}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::HTTPRequestCompleted_t, f::Symbol)
    r = Ref{HTTPRequestCompleted_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTTPRequestCompleted_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTTPRequestCompleted_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTTPRequestHeadersReceived_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{HTTPRequestHeadersReceived_t}, f::Symbol)
    f === :m_hRequest && return Ptr{HTTPRequestHandle}(x + 0)
    f === :m_ulContextValue && return Ptr{uint64}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::HTTPRequestHeadersReceived_t, f::Symbol)
    r = Ref{HTTPRequestHeadersReceived_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTTPRequestHeadersReceived_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTTPRequestHeadersReceived_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTTPRequestDataReceived_t
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{HTTPRequestDataReceived_t}, f::Symbol)
    f === :m_hRequest && return Ptr{HTTPRequestHandle}(x + 0)
    f === :m_ulContextValue && return Ptr{uint64}(x + 4)
    f === :m_cOffset && return Ptr{uint32}(x + 12)
    f === :m_cBytesReceived && return Ptr{uint32}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::HTTPRequestDataReceived_t, f::Symbol)
    r = Ref{HTTPRequestDataReceived_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTTPRequestDataReceived_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTTPRequestDataReceived_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum EInputSourceMode::UInt32 begin
    k_EInputSourceMode_None = 0
    k_EInputSourceMode_Dpad = 1
    k_EInputSourceMode_Buttons = 2
    k_EInputSourceMode_FourButtons = 3
    k_EInputSourceMode_AbsoluteMouse = 4
    k_EInputSourceMode_RelativeMouse = 5
    k_EInputSourceMode_JoystickMove = 6
    k_EInputSourceMode_JoystickMouse = 7
    k_EInputSourceMode_JoystickCamera = 8
    k_EInputSourceMode_ScrollWheel = 9
    k_EInputSourceMode_Trigger = 10
    k_EInputSourceMode_TouchMenu = 11
    k_EInputSourceMode_MouseJoystick = 12
    k_EInputSourceMode_MouseRegion = 13
    k_EInputSourceMode_RadialMenu = 14
    k_EInputSourceMode_SingleButton = 15
    k_EInputSourceMode_Switches = 16
end

@cenum EInputActionOrigin::UInt32 begin
    k_EInputActionOrigin_None = 0
    k_EInputActionOrigin_SteamController_A = 1
    k_EInputActionOrigin_SteamController_B = 2
    k_EInputActionOrigin_SteamController_X = 3
    k_EInputActionOrigin_SteamController_Y = 4
    k_EInputActionOrigin_SteamController_LeftBumper = 5
    k_EInputActionOrigin_SteamController_RightBumper = 6
    k_EInputActionOrigin_SteamController_LeftGrip = 7
    k_EInputActionOrigin_SteamController_RightGrip = 8
    k_EInputActionOrigin_SteamController_Start = 9
    k_EInputActionOrigin_SteamController_Back = 10
    k_EInputActionOrigin_SteamController_LeftPad_Touch = 11
    k_EInputActionOrigin_SteamController_LeftPad_Swipe = 12
    k_EInputActionOrigin_SteamController_LeftPad_Click = 13
    k_EInputActionOrigin_SteamController_LeftPad_DPadNorth = 14
    k_EInputActionOrigin_SteamController_LeftPad_DPadSouth = 15
    k_EInputActionOrigin_SteamController_LeftPad_DPadWest = 16
    k_EInputActionOrigin_SteamController_LeftPad_DPadEast = 17
    k_EInputActionOrigin_SteamController_RightPad_Touch = 18
    k_EInputActionOrigin_SteamController_RightPad_Swipe = 19
    k_EInputActionOrigin_SteamController_RightPad_Click = 20
    k_EInputActionOrigin_SteamController_RightPad_DPadNorth = 21
    k_EInputActionOrigin_SteamController_RightPad_DPadSouth = 22
    k_EInputActionOrigin_SteamController_RightPad_DPadWest = 23
    k_EInputActionOrigin_SteamController_RightPad_DPadEast = 24
    k_EInputActionOrigin_SteamController_LeftTrigger_Pull = 25
    k_EInputActionOrigin_SteamController_LeftTrigger_Click = 26
    k_EInputActionOrigin_SteamController_RightTrigger_Pull = 27
    k_EInputActionOrigin_SteamController_RightTrigger_Click = 28
    k_EInputActionOrigin_SteamController_LeftStick_Move = 29
    k_EInputActionOrigin_SteamController_LeftStick_Click = 30
    k_EInputActionOrigin_SteamController_LeftStick_DPadNorth = 31
    k_EInputActionOrigin_SteamController_LeftStick_DPadSouth = 32
    k_EInputActionOrigin_SteamController_LeftStick_DPadWest = 33
    k_EInputActionOrigin_SteamController_LeftStick_DPadEast = 34
    k_EInputActionOrigin_SteamController_Gyro_Move = 35
    k_EInputActionOrigin_SteamController_Gyro_Pitch = 36
    k_EInputActionOrigin_SteamController_Gyro_Yaw = 37
    k_EInputActionOrigin_SteamController_Gyro_Roll = 38
    k_EInputActionOrigin_SteamController_Reserved0 = 39
    k_EInputActionOrigin_SteamController_Reserved1 = 40
    k_EInputActionOrigin_SteamController_Reserved2 = 41
    k_EInputActionOrigin_SteamController_Reserved3 = 42
    k_EInputActionOrigin_SteamController_Reserved4 = 43
    k_EInputActionOrigin_SteamController_Reserved5 = 44
    k_EInputActionOrigin_SteamController_Reserved6 = 45
    k_EInputActionOrigin_SteamController_Reserved7 = 46
    k_EInputActionOrigin_SteamController_Reserved8 = 47
    k_EInputActionOrigin_SteamController_Reserved9 = 48
    k_EInputActionOrigin_SteamController_Reserved10 = 49
    k_EInputActionOrigin_PS4_X = 50
    k_EInputActionOrigin_PS4_Circle = 51
    k_EInputActionOrigin_PS4_Triangle = 52
    k_EInputActionOrigin_PS4_Square = 53
    k_EInputActionOrigin_PS4_LeftBumper = 54
    k_EInputActionOrigin_PS4_RightBumper = 55
    k_EInputActionOrigin_PS4_Options = 56
    k_EInputActionOrigin_PS4_Share = 57
    k_EInputActionOrigin_PS4_LeftPad_Touch = 58
    k_EInputActionOrigin_PS4_LeftPad_Swipe = 59
    k_EInputActionOrigin_PS4_LeftPad_Click = 60
    k_EInputActionOrigin_PS4_LeftPad_DPadNorth = 61
    k_EInputActionOrigin_PS4_LeftPad_DPadSouth = 62
    k_EInputActionOrigin_PS4_LeftPad_DPadWest = 63
    k_EInputActionOrigin_PS4_LeftPad_DPadEast = 64
    k_EInputActionOrigin_PS4_RightPad_Touch = 65
    k_EInputActionOrigin_PS4_RightPad_Swipe = 66
    k_EInputActionOrigin_PS4_RightPad_Click = 67
    k_EInputActionOrigin_PS4_RightPad_DPadNorth = 68
    k_EInputActionOrigin_PS4_RightPad_DPadSouth = 69
    k_EInputActionOrigin_PS4_RightPad_DPadWest = 70
    k_EInputActionOrigin_PS4_RightPad_DPadEast = 71
    k_EInputActionOrigin_PS4_CenterPad_Touch = 72
    k_EInputActionOrigin_PS4_CenterPad_Swipe = 73
    k_EInputActionOrigin_PS4_CenterPad_Click = 74
    k_EInputActionOrigin_PS4_CenterPad_DPadNorth = 75
    k_EInputActionOrigin_PS4_CenterPad_DPadSouth = 76
    k_EInputActionOrigin_PS4_CenterPad_DPadWest = 77
    k_EInputActionOrigin_PS4_CenterPad_DPadEast = 78
    k_EInputActionOrigin_PS4_LeftTrigger_Pull = 79
    k_EInputActionOrigin_PS4_LeftTrigger_Click = 80
    k_EInputActionOrigin_PS4_RightTrigger_Pull = 81
    k_EInputActionOrigin_PS4_RightTrigger_Click = 82
    k_EInputActionOrigin_PS4_LeftStick_Move = 83
    k_EInputActionOrigin_PS4_LeftStick_Click = 84
    k_EInputActionOrigin_PS4_LeftStick_DPadNorth = 85
    k_EInputActionOrigin_PS4_LeftStick_DPadSouth = 86
    k_EInputActionOrigin_PS4_LeftStick_DPadWest = 87
    k_EInputActionOrigin_PS4_LeftStick_DPadEast = 88
    k_EInputActionOrigin_PS4_RightStick_Move = 89
    k_EInputActionOrigin_PS4_RightStick_Click = 90
    k_EInputActionOrigin_PS4_RightStick_DPadNorth = 91
    k_EInputActionOrigin_PS4_RightStick_DPadSouth = 92
    k_EInputActionOrigin_PS4_RightStick_DPadWest = 93
    k_EInputActionOrigin_PS4_RightStick_DPadEast = 94
    k_EInputActionOrigin_PS4_DPad_North = 95
    k_EInputActionOrigin_PS4_DPad_South = 96
    k_EInputActionOrigin_PS4_DPad_West = 97
    k_EInputActionOrigin_PS4_DPad_East = 98
    k_EInputActionOrigin_PS4_Gyro_Move = 99
    k_EInputActionOrigin_PS4_Gyro_Pitch = 100
    k_EInputActionOrigin_PS4_Gyro_Yaw = 101
    k_EInputActionOrigin_PS4_Gyro_Roll = 102
    k_EInputActionOrigin_PS4_DPad_Move = 103
    k_EInputActionOrigin_PS4_Reserved1 = 104
    k_EInputActionOrigin_PS4_Reserved2 = 105
    k_EInputActionOrigin_PS4_Reserved3 = 106
    k_EInputActionOrigin_PS4_Reserved4 = 107
    k_EInputActionOrigin_PS4_Reserved5 = 108
    k_EInputActionOrigin_PS4_Reserved6 = 109
    k_EInputActionOrigin_PS4_Reserved7 = 110
    k_EInputActionOrigin_PS4_Reserved8 = 111
    k_EInputActionOrigin_PS4_Reserved9 = 112
    k_EInputActionOrigin_PS4_Reserved10 = 113
    k_EInputActionOrigin_XBoxOne_A = 114
    k_EInputActionOrigin_XBoxOne_B = 115
    k_EInputActionOrigin_XBoxOne_X = 116
    k_EInputActionOrigin_XBoxOne_Y = 117
    k_EInputActionOrigin_XBoxOne_LeftBumper = 118
    k_EInputActionOrigin_XBoxOne_RightBumper = 119
    k_EInputActionOrigin_XBoxOne_Menu = 120
    k_EInputActionOrigin_XBoxOne_View = 121
    k_EInputActionOrigin_XBoxOne_LeftTrigger_Pull = 122
    k_EInputActionOrigin_XBoxOne_LeftTrigger_Click = 123
    k_EInputActionOrigin_XBoxOne_RightTrigger_Pull = 124
    k_EInputActionOrigin_XBoxOne_RightTrigger_Click = 125
    k_EInputActionOrigin_XBoxOne_LeftStick_Move = 126
    k_EInputActionOrigin_XBoxOne_LeftStick_Click = 127
    k_EInputActionOrigin_XBoxOne_LeftStick_DPadNorth = 128
    k_EInputActionOrigin_XBoxOne_LeftStick_DPadSouth = 129
    k_EInputActionOrigin_XBoxOne_LeftStick_DPadWest = 130
    k_EInputActionOrigin_XBoxOne_LeftStick_DPadEast = 131
    k_EInputActionOrigin_XBoxOne_RightStick_Move = 132
    k_EInputActionOrigin_XBoxOne_RightStick_Click = 133
    k_EInputActionOrigin_XBoxOne_RightStick_DPadNorth = 134
    k_EInputActionOrigin_XBoxOne_RightStick_DPadSouth = 135
    k_EInputActionOrigin_XBoxOne_RightStick_DPadWest = 136
    k_EInputActionOrigin_XBoxOne_RightStick_DPadEast = 137
    k_EInputActionOrigin_XBoxOne_DPad_North = 138
    k_EInputActionOrigin_XBoxOne_DPad_South = 139
    k_EInputActionOrigin_XBoxOne_DPad_West = 140
    k_EInputActionOrigin_XBoxOne_DPad_East = 141
    k_EInputActionOrigin_XBoxOne_DPad_Move = 142
    k_EInputActionOrigin_XBoxOne_LeftGrip_Lower = 143
    k_EInputActionOrigin_XBoxOne_LeftGrip_Upper = 144
    k_EInputActionOrigin_XBoxOne_RightGrip_Lower = 145
    k_EInputActionOrigin_XBoxOne_RightGrip_Upper = 146
    k_EInputActionOrigin_XBoxOne_Share = 147
    k_EInputActionOrigin_XBoxOne_Reserved6 = 148
    k_EInputActionOrigin_XBoxOne_Reserved7 = 149
    k_EInputActionOrigin_XBoxOne_Reserved8 = 150
    k_EInputActionOrigin_XBoxOne_Reserved9 = 151
    k_EInputActionOrigin_XBoxOne_Reserved10 = 152
    k_EInputActionOrigin_XBox360_A = 153
    k_EInputActionOrigin_XBox360_B = 154
    k_EInputActionOrigin_XBox360_X = 155
    k_EInputActionOrigin_XBox360_Y = 156
    k_EInputActionOrigin_XBox360_LeftBumper = 157
    k_EInputActionOrigin_XBox360_RightBumper = 158
    k_EInputActionOrigin_XBox360_Start = 159
    k_EInputActionOrigin_XBox360_Back = 160
    k_EInputActionOrigin_XBox360_LeftTrigger_Pull = 161
    k_EInputActionOrigin_XBox360_LeftTrigger_Click = 162
    k_EInputActionOrigin_XBox360_RightTrigger_Pull = 163
    k_EInputActionOrigin_XBox360_RightTrigger_Click = 164
    k_EInputActionOrigin_XBox360_LeftStick_Move = 165
    k_EInputActionOrigin_XBox360_LeftStick_Click = 166
    k_EInputActionOrigin_XBox360_LeftStick_DPadNorth = 167
    k_EInputActionOrigin_XBox360_LeftStick_DPadSouth = 168
    k_EInputActionOrigin_XBox360_LeftStick_DPadWest = 169
    k_EInputActionOrigin_XBox360_LeftStick_DPadEast = 170
    k_EInputActionOrigin_XBox360_RightStick_Move = 171
    k_EInputActionOrigin_XBox360_RightStick_Click = 172
    k_EInputActionOrigin_XBox360_RightStick_DPadNorth = 173
    k_EInputActionOrigin_XBox360_RightStick_DPadSouth = 174
    k_EInputActionOrigin_XBox360_RightStick_DPadWest = 175
    k_EInputActionOrigin_XBox360_RightStick_DPadEast = 176
    k_EInputActionOrigin_XBox360_DPad_North = 177
    k_EInputActionOrigin_XBox360_DPad_South = 178
    k_EInputActionOrigin_XBox360_DPad_West = 179
    k_EInputActionOrigin_XBox360_DPad_East = 180
    k_EInputActionOrigin_XBox360_DPad_Move = 181
    k_EInputActionOrigin_XBox360_Reserved1 = 182
    k_EInputActionOrigin_XBox360_Reserved2 = 183
    k_EInputActionOrigin_XBox360_Reserved3 = 184
    k_EInputActionOrigin_XBox360_Reserved4 = 185
    k_EInputActionOrigin_XBox360_Reserved5 = 186
    k_EInputActionOrigin_XBox360_Reserved6 = 187
    k_EInputActionOrigin_XBox360_Reserved7 = 188
    k_EInputActionOrigin_XBox360_Reserved8 = 189
    k_EInputActionOrigin_XBox360_Reserved9 = 190
    k_EInputActionOrigin_XBox360_Reserved10 = 191
    k_EInputActionOrigin_Switch_A = 192
    k_EInputActionOrigin_Switch_B = 193
    k_EInputActionOrigin_Switch_X = 194
    k_EInputActionOrigin_Switch_Y = 195
    k_EInputActionOrigin_Switch_LeftBumper = 196
    k_EInputActionOrigin_Switch_RightBumper = 197
    k_EInputActionOrigin_Switch_Plus = 198
    k_EInputActionOrigin_Switch_Minus = 199
    k_EInputActionOrigin_Switch_Capture = 200
    k_EInputActionOrigin_Switch_LeftTrigger_Pull = 201
    k_EInputActionOrigin_Switch_LeftTrigger_Click = 202
    k_EInputActionOrigin_Switch_RightTrigger_Pull = 203
    k_EInputActionOrigin_Switch_RightTrigger_Click = 204
    k_EInputActionOrigin_Switch_LeftStick_Move = 205
    k_EInputActionOrigin_Switch_LeftStick_Click = 206
    k_EInputActionOrigin_Switch_LeftStick_DPadNorth = 207
    k_EInputActionOrigin_Switch_LeftStick_DPadSouth = 208
    k_EInputActionOrigin_Switch_LeftStick_DPadWest = 209
    k_EInputActionOrigin_Switch_LeftStick_DPadEast = 210
    k_EInputActionOrigin_Switch_RightStick_Move = 211
    k_EInputActionOrigin_Switch_RightStick_Click = 212
    k_EInputActionOrigin_Switch_RightStick_DPadNorth = 213
    k_EInputActionOrigin_Switch_RightStick_DPadSouth = 214
    k_EInputActionOrigin_Switch_RightStick_DPadWest = 215
    k_EInputActionOrigin_Switch_RightStick_DPadEast = 216
    k_EInputActionOrigin_Switch_DPad_North = 217
    k_EInputActionOrigin_Switch_DPad_South = 218
    k_EInputActionOrigin_Switch_DPad_West = 219
    k_EInputActionOrigin_Switch_DPad_East = 220
    k_EInputActionOrigin_Switch_ProGyro_Move = 221
    k_EInputActionOrigin_Switch_ProGyro_Pitch = 222
    k_EInputActionOrigin_Switch_ProGyro_Yaw = 223
    k_EInputActionOrigin_Switch_ProGyro_Roll = 224
    k_EInputActionOrigin_Switch_DPad_Move = 225
    k_EInputActionOrigin_Switch_Reserved1 = 226
    k_EInputActionOrigin_Switch_Reserved2 = 227
    k_EInputActionOrigin_Switch_Reserved3 = 228
    k_EInputActionOrigin_Switch_Reserved4 = 229
    k_EInputActionOrigin_Switch_Reserved5 = 230
    k_EInputActionOrigin_Switch_Reserved6 = 231
    k_EInputActionOrigin_Switch_Reserved7 = 232
    k_EInputActionOrigin_Switch_Reserved8 = 233
    k_EInputActionOrigin_Switch_Reserved9 = 234
    k_EInputActionOrigin_Switch_Reserved10 = 235
    k_EInputActionOrigin_Switch_RightGyro_Move = 236
    k_EInputActionOrigin_Switch_RightGyro_Pitch = 237
    k_EInputActionOrigin_Switch_RightGyro_Yaw = 238
    k_EInputActionOrigin_Switch_RightGyro_Roll = 239
    k_EInputActionOrigin_Switch_LeftGyro_Move = 240
    k_EInputActionOrigin_Switch_LeftGyro_Pitch = 241
    k_EInputActionOrigin_Switch_LeftGyro_Yaw = 242
    k_EInputActionOrigin_Switch_LeftGyro_Roll = 243
    k_EInputActionOrigin_Switch_LeftGrip_Lower = 244
    k_EInputActionOrigin_Switch_LeftGrip_Upper = 245
    k_EInputActionOrigin_Switch_RightGrip_Lower = 246
    k_EInputActionOrigin_Switch_RightGrip_Upper = 247
    k_EInputActionOrigin_Switch_JoyConButton_N = 248
    k_EInputActionOrigin_Switch_JoyConButton_E = 249
    k_EInputActionOrigin_Switch_JoyConButton_S = 250
    k_EInputActionOrigin_Switch_JoyConButton_W = 251
    k_EInputActionOrigin_Switch_Reserved15 = 252
    k_EInputActionOrigin_Switch_Reserved16 = 253
    k_EInputActionOrigin_Switch_Reserved17 = 254
    k_EInputActionOrigin_Switch_Reserved18 = 255
    k_EInputActionOrigin_Switch_Reserved19 = 256
    k_EInputActionOrigin_Switch_Reserved20 = 257
    k_EInputActionOrigin_PS5_X = 258
    k_EInputActionOrigin_PS5_Circle = 259
    k_EInputActionOrigin_PS5_Triangle = 260
    k_EInputActionOrigin_PS5_Square = 261
    k_EInputActionOrigin_PS5_LeftBumper = 262
    k_EInputActionOrigin_PS5_RightBumper = 263
    k_EInputActionOrigin_PS5_Option = 264
    k_EInputActionOrigin_PS5_Create = 265
    k_EInputActionOrigin_PS5_Mute = 266
    k_EInputActionOrigin_PS5_LeftPad_Touch = 267
    k_EInputActionOrigin_PS5_LeftPad_Swipe = 268
    k_EInputActionOrigin_PS5_LeftPad_Click = 269
    k_EInputActionOrigin_PS5_LeftPad_DPadNorth = 270
    k_EInputActionOrigin_PS5_LeftPad_DPadSouth = 271
    k_EInputActionOrigin_PS5_LeftPad_DPadWest = 272
    k_EInputActionOrigin_PS5_LeftPad_DPadEast = 273
    k_EInputActionOrigin_PS5_RightPad_Touch = 274
    k_EInputActionOrigin_PS5_RightPad_Swipe = 275
    k_EInputActionOrigin_PS5_RightPad_Click = 276
    k_EInputActionOrigin_PS5_RightPad_DPadNorth = 277
    k_EInputActionOrigin_PS5_RightPad_DPadSouth = 278
    k_EInputActionOrigin_PS5_RightPad_DPadWest = 279
    k_EInputActionOrigin_PS5_RightPad_DPadEast = 280
    k_EInputActionOrigin_PS5_CenterPad_Touch = 281
    k_EInputActionOrigin_PS5_CenterPad_Swipe = 282
    k_EInputActionOrigin_PS5_CenterPad_Click = 283
    k_EInputActionOrigin_PS5_CenterPad_DPadNorth = 284
    k_EInputActionOrigin_PS5_CenterPad_DPadSouth = 285
    k_EInputActionOrigin_PS5_CenterPad_DPadWest = 286
    k_EInputActionOrigin_PS5_CenterPad_DPadEast = 287
    k_EInputActionOrigin_PS5_LeftTrigger_Pull = 288
    k_EInputActionOrigin_PS5_LeftTrigger_Click = 289
    k_EInputActionOrigin_PS5_RightTrigger_Pull = 290
    k_EInputActionOrigin_PS5_RightTrigger_Click = 291
    k_EInputActionOrigin_PS5_LeftStick_Move = 292
    k_EInputActionOrigin_PS5_LeftStick_Click = 293
    k_EInputActionOrigin_PS5_LeftStick_DPadNorth = 294
    k_EInputActionOrigin_PS5_LeftStick_DPadSouth = 295
    k_EInputActionOrigin_PS5_LeftStick_DPadWest = 296
    k_EInputActionOrigin_PS5_LeftStick_DPadEast = 297
    k_EInputActionOrigin_PS5_RightStick_Move = 298
    k_EInputActionOrigin_PS5_RightStick_Click = 299
    k_EInputActionOrigin_PS5_RightStick_DPadNorth = 300
    k_EInputActionOrigin_PS5_RightStick_DPadSouth = 301
    k_EInputActionOrigin_PS5_RightStick_DPadWest = 302
    k_EInputActionOrigin_PS5_RightStick_DPadEast = 303
    k_EInputActionOrigin_PS5_DPad_North = 304
    k_EInputActionOrigin_PS5_DPad_South = 305
    k_EInputActionOrigin_PS5_DPad_West = 306
    k_EInputActionOrigin_PS5_DPad_East = 307
    k_EInputActionOrigin_PS5_Gyro_Move = 308
    k_EInputActionOrigin_PS5_Gyro_Pitch = 309
    k_EInputActionOrigin_PS5_Gyro_Yaw = 310
    k_EInputActionOrigin_PS5_Gyro_Roll = 311
    k_EInputActionOrigin_PS5_DPad_Move = 312
    k_EInputActionOrigin_PS5_LeftGrip = 313
    k_EInputActionOrigin_PS5_RightGrip = 314
    k_EInputActionOrigin_PS5_LeftFn = 315
    k_EInputActionOrigin_PS5_RightFn = 316
    k_EInputActionOrigin_PS5_Reserved5 = 317
    k_EInputActionOrigin_PS5_Reserved6 = 318
    k_EInputActionOrigin_PS5_Reserved7 = 319
    k_EInputActionOrigin_PS5_Reserved8 = 320
    k_EInputActionOrigin_PS5_Reserved9 = 321
    k_EInputActionOrigin_PS5_Reserved10 = 322
    k_EInputActionOrigin_PS5_Reserved11 = 323
    k_EInputActionOrigin_PS5_Reserved12 = 324
    k_EInputActionOrigin_PS5_Reserved13 = 325
    k_EInputActionOrigin_PS5_Reserved14 = 326
    k_EInputActionOrigin_PS5_Reserved15 = 327
    k_EInputActionOrigin_PS5_Reserved16 = 328
    k_EInputActionOrigin_PS5_Reserved17 = 329
    k_EInputActionOrigin_PS5_Reserved18 = 330
    k_EInputActionOrigin_PS5_Reserved19 = 331
    k_EInputActionOrigin_PS5_Reserved20 = 332
    k_EInputActionOrigin_SteamDeck_A = 333
    k_EInputActionOrigin_SteamDeck_B = 334
    k_EInputActionOrigin_SteamDeck_X = 335
    k_EInputActionOrigin_SteamDeck_Y = 336
    k_EInputActionOrigin_SteamDeck_L1 = 337
    k_EInputActionOrigin_SteamDeck_R1 = 338
    k_EInputActionOrigin_SteamDeck_Menu = 339
    k_EInputActionOrigin_SteamDeck_View = 340
    k_EInputActionOrigin_SteamDeck_LeftPad_Touch = 341
    k_EInputActionOrigin_SteamDeck_LeftPad_Swipe = 342
    k_EInputActionOrigin_SteamDeck_LeftPad_Click = 343
    k_EInputActionOrigin_SteamDeck_LeftPad_DPadNorth = 344
    k_EInputActionOrigin_SteamDeck_LeftPad_DPadSouth = 345
    k_EInputActionOrigin_SteamDeck_LeftPad_DPadWest = 346
    k_EInputActionOrigin_SteamDeck_LeftPad_DPadEast = 347
    k_EInputActionOrigin_SteamDeck_RightPad_Touch = 348
    k_EInputActionOrigin_SteamDeck_RightPad_Swipe = 349
    k_EInputActionOrigin_SteamDeck_RightPad_Click = 350
    k_EInputActionOrigin_SteamDeck_RightPad_DPadNorth = 351
    k_EInputActionOrigin_SteamDeck_RightPad_DPadSouth = 352
    k_EInputActionOrigin_SteamDeck_RightPad_DPadWest = 353
    k_EInputActionOrigin_SteamDeck_RightPad_DPadEast = 354
    k_EInputActionOrigin_SteamDeck_L2_SoftPull = 355
    k_EInputActionOrigin_SteamDeck_L2 = 356
    k_EInputActionOrigin_SteamDeck_R2_SoftPull = 357
    k_EInputActionOrigin_SteamDeck_R2 = 358
    k_EInputActionOrigin_SteamDeck_LeftStick_Move = 359
    k_EInputActionOrigin_SteamDeck_L3 = 360
    k_EInputActionOrigin_SteamDeck_LeftStick_DPadNorth = 361
    k_EInputActionOrigin_SteamDeck_LeftStick_DPadSouth = 362
    k_EInputActionOrigin_SteamDeck_LeftStick_DPadWest = 363
    k_EInputActionOrigin_SteamDeck_LeftStick_DPadEast = 364
    k_EInputActionOrigin_SteamDeck_LeftStick_Touch = 365
    k_EInputActionOrigin_SteamDeck_RightStick_Move = 366
    k_EInputActionOrigin_SteamDeck_R3 = 367
    k_EInputActionOrigin_SteamDeck_RightStick_DPadNorth = 368
    k_EInputActionOrigin_SteamDeck_RightStick_DPadSouth = 369
    k_EInputActionOrigin_SteamDeck_RightStick_DPadWest = 370
    k_EInputActionOrigin_SteamDeck_RightStick_DPadEast = 371
    k_EInputActionOrigin_SteamDeck_RightStick_Touch = 372
    k_EInputActionOrigin_SteamDeck_L4 = 373
    k_EInputActionOrigin_SteamDeck_R4 = 374
    k_EInputActionOrigin_SteamDeck_L5 = 375
    k_EInputActionOrigin_SteamDeck_R5 = 376
    k_EInputActionOrigin_SteamDeck_DPad_Move = 377
    k_EInputActionOrigin_SteamDeck_DPad_North = 378
    k_EInputActionOrigin_SteamDeck_DPad_South = 379
    k_EInputActionOrigin_SteamDeck_DPad_West = 380
    k_EInputActionOrigin_SteamDeck_DPad_East = 381
    k_EInputActionOrigin_SteamDeck_Gyro_Move = 382
    k_EInputActionOrigin_SteamDeck_Gyro_Pitch = 383
    k_EInputActionOrigin_SteamDeck_Gyro_Yaw = 384
    k_EInputActionOrigin_SteamDeck_Gyro_Roll = 385
    k_EInputActionOrigin_SteamDeck_Reserved1 = 386
    k_EInputActionOrigin_SteamDeck_Reserved2 = 387
    k_EInputActionOrigin_SteamDeck_Reserved3 = 388
    k_EInputActionOrigin_SteamDeck_Reserved4 = 389
    k_EInputActionOrigin_SteamDeck_Reserved5 = 390
    k_EInputActionOrigin_SteamDeck_Reserved6 = 391
    k_EInputActionOrigin_SteamDeck_Reserved7 = 392
    k_EInputActionOrigin_SteamDeck_Reserved8 = 393
    k_EInputActionOrigin_SteamDeck_Reserved9 = 394
    k_EInputActionOrigin_SteamDeck_Reserved10 = 395
    k_EInputActionOrigin_SteamDeck_Reserved11 = 396
    k_EInputActionOrigin_SteamDeck_Reserved12 = 397
    k_EInputActionOrigin_SteamDeck_Reserved13 = 398
    k_EInputActionOrigin_SteamDeck_Reserved14 = 399
    k_EInputActionOrigin_SteamDeck_Reserved15 = 400
    k_EInputActionOrigin_SteamDeck_Reserved16 = 401
    k_EInputActionOrigin_SteamDeck_Reserved17 = 402
    k_EInputActionOrigin_SteamDeck_Reserved18 = 403
    k_EInputActionOrigin_SteamDeck_Reserved19 = 404
    k_EInputActionOrigin_SteamDeck_Reserved20 = 405
    k_EInputActionOrigin_Horipad_M1 = 406
    k_EInputActionOrigin_Horipad_M2 = 407
    k_EInputActionOrigin_Horipad_L4 = 408
    k_EInputActionOrigin_Horipad_R4 = 409
    k_EInputActionOrigin_Count = 410
    k_EInputActionOrigin_MaximumPossibleValue = 32767
end

@cenum EXboxOrigin::UInt32 begin
    k_EXboxOrigin_A = 0
    k_EXboxOrigin_B = 1
    k_EXboxOrigin_X = 2
    k_EXboxOrigin_Y = 3
    k_EXboxOrigin_LeftBumper = 4
    k_EXboxOrigin_RightBumper = 5
    k_EXboxOrigin_Menu = 6
    k_EXboxOrigin_View = 7
    k_EXboxOrigin_LeftTrigger_Pull = 8
    k_EXboxOrigin_LeftTrigger_Click = 9
    k_EXboxOrigin_RightTrigger_Pull = 10
    k_EXboxOrigin_RightTrigger_Click = 11
    k_EXboxOrigin_LeftStick_Move = 12
    k_EXboxOrigin_LeftStick_Click = 13
    k_EXboxOrigin_LeftStick_DPadNorth = 14
    k_EXboxOrigin_LeftStick_DPadSouth = 15
    k_EXboxOrigin_LeftStick_DPadWest = 16
    k_EXboxOrigin_LeftStick_DPadEast = 17
    k_EXboxOrigin_RightStick_Move = 18
    k_EXboxOrigin_RightStick_Click = 19
    k_EXboxOrigin_RightStick_DPadNorth = 20
    k_EXboxOrigin_RightStick_DPadSouth = 21
    k_EXboxOrigin_RightStick_DPadWest = 22
    k_EXboxOrigin_RightStick_DPadEast = 23
    k_EXboxOrigin_DPad_North = 24
    k_EXboxOrigin_DPad_South = 25
    k_EXboxOrigin_DPad_West = 26
    k_EXboxOrigin_DPad_East = 27
    k_EXboxOrigin_Count = 28
end

@cenum ESteamControllerPad::UInt32 begin
    k_ESteamControllerPad_Left = 0
    k_ESteamControllerPad_Right = 1
end

@cenum EControllerHapticLocation::UInt32 begin
    k_EControllerHapticLocation_Left = 1
    k_EControllerHapticLocation_Right = 2
    k_EControllerHapticLocation_Both = 3
end

@cenum EControllerHapticType::UInt32 begin
    k_EControllerHapticType_Off = 0
    k_EControllerHapticType_Tick = 1
    k_EControllerHapticType_Click = 2
end

@cenum ESteamInputType::UInt32 begin
    k_ESteamInputType_Unknown = 0
    k_ESteamInputType_SteamController = 1
    k_ESteamInputType_XBox360Controller = 2
    k_ESteamInputType_XBoxOneController = 3
    k_ESteamInputType_GenericGamepad = 4
    k_ESteamInputType_PS4Controller = 5
    k_ESteamInputType_AppleMFiController = 6
    k_ESteamInputType_AndroidController = 7
    k_ESteamInputType_SwitchJoyConPair = 8
    k_ESteamInputType_SwitchJoyConSingle = 9
    k_ESteamInputType_SwitchProController = 10
    k_ESteamInputType_MobileTouch = 11
    k_ESteamInputType_PS3Controller = 12
    k_ESteamInputType_PS5Controller = 13
    k_ESteamInputType_SteamDeckController = 14
    k_ESteamInputType_Count = 15
    k_ESteamInputType_MaximumPossibleValue = 255
end

@cenum ESteamInputConfigurationEnableType::UInt32 begin
    k_ESteamInputConfigurationEnableType_None = 0
    k_ESteamInputConfigurationEnableType_Playstation = 1
    k_ESteamInputConfigurationEnableType_Xbox = 2
    k_ESteamInputConfigurationEnableType_Generic = 4
    k_ESteamInputConfigurationEnableType_Switch = 8
end

@cenum ESteamInputLEDFlag::UInt32 begin
    k_ESteamInputLEDFlag_SetColor = 0
    k_ESteamInputLEDFlag_RestoreUserDefault = 1
end

@cenum ESteamInputGlyphSize::UInt32 begin
    k_ESteamInputGlyphSize_Small = 0
    k_ESteamInputGlyphSize_Medium = 1
    k_ESteamInputGlyphSize_Large = 2
    k_ESteamInputGlyphSize_Count = 3
end

@cenum ESteamInputGlyphStyle::UInt32 begin
    ESteamInputGlyphStyle_Knockout = 0
    ESteamInputGlyphStyle_Light = 1
    ESteamInputGlyphStyle_Dark = 2
    ESteamInputGlyphStyle_NeutralColorABXY = 16
    ESteamInputGlyphStyle_SolidABXY = 32
end

@cenum ESteamInputActionEventType::UInt32 begin
    ESteamInputActionEventType_DigitalAction = 0
    ESteamInputActionEventType_AnalogAction = 1
end

const InputHandle_t = uint64

const InputActionSetHandle_t = uint64

const InputDigitalActionHandle_t = uint64

const InputAnalogActionHandle_t = uint64

struct InputAnalogActionData_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{InputAnalogActionData_t}, f::Symbol)
    f === :eMode && return Ptr{EInputSourceMode}(x + 0)
    f === :x && return Ptr{Cfloat}(x + 0)
    f === :y && return Ptr{Cfloat}(x + 0)
    f === :bActive && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::InputAnalogActionData_t, f::Symbol)
    r = Ref{InputAnalogActionData_t}(x)
    ptr = Base.unsafe_convert(Ptr{InputAnalogActionData_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{InputAnalogActionData_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct InputDigitalActionData_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{InputDigitalActionData_t}, f::Symbol)
    f === :bState && return Ptr{Cint}(x + 0)
    f === :bActive && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::InputDigitalActionData_t, f::Symbol)
    r = Ref{InputDigitalActionData_t}(x)
    ptr = Base.unsafe_convert(Ptr{InputDigitalActionData_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{InputDigitalActionData_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct InputMotionData_t
    data::NTuple{40, UInt8}
end

function Base.getproperty(x::Ptr{InputMotionData_t}, f::Symbol)
    f === :rotQuatX && return Ptr{Cfloat}(x + 0)
    f === :rotQuatY && return Ptr{Cfloat}(x + 4)
    f === :rotQuatZ && return Ptr{Cfloat}(x + 8)
    f === :rotQuatW && return Ptr{Cfloat}(x + 12)
    f === :posAccelX && return Ptr{Cfloat}(x + 16)
    f === :posAccelY && return Ptr{Cfloat}(x + 20)
    f === :posAccelZ && return Ptr{Cfloat}(x + 24)
    f === :rotVelX && return Ptr{Cfloat}(x + 28)
    f === :rotVelY && return Ptr{Cfloat}(x + 32)
    f === :rotVelZ && return Ptr{Cfloat}(x + 36)
    return getfield(x, f)
end

function Base.getproperty(x::InputMotionData_t, f::Symbol)
    r = Ref{InputMotionData_t}(x)
    ptr = Base.unsafe_convert(Ptr{InputMotionData_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{InputMotionData_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamInputActionEvent_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{SteamInputActionEvent_t}, f::Symbol)
    f === :controllerHandle && return Ptr{InputHandle_t}(x + 0)
    f === :eEventType && return Ptr{ESteamInputActionEventType}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::SteamInputActionEvent_t, f::Symbol)
    r = Ref{SteamInputActionEvent_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamInputActionEvent_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamInputActionEvent_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

mutable struct ScePadTriggerEffectParam end

# typedef void ( * SteamInputActionEventCallbackPointer ) ( SteamInputActionEvent_t * )
const SteamInputActionEventCallbackPointer = Ptr{Cvoid}

# no prototype is found for this function at isteaminput.h:939:21, please use with caution
function SteamInput()
    ccall((:SteamInput, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamInput(p)
    ccall((:SteamInternal_Init_SteamInput, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct SteamInputDeviceConnected_t
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{SteamInputDeviceConnected_t}, f::Symbol)
    f === :m_ulConnectedDeviceHandle && return Ptr{InputHandle_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamInputDeviceConnected_t, f::Symbol)
    r = Ref{SteamInputDeviceConnected_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamInputDeviceConnected_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamInputDeviceConnected_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamInputDeviceDisconnected_t
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{SteamInputDeviceDisconnected_t}, f::Symbol)
    f === :m_ulDisconnectedDeviceHandle && return Ptr{InputHandle_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamInputDeviceDisconnected_t, f::Symbol)
    r = Ref{SteamInputDeviceDisconnected_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamInputDeviceDisconnected_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamInputDeviceDisconnected_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamInputConfigurationLoaded_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SteamInputConfigurationLoaded_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteaminput.h:976:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_unAppID && return Ptr{AppId_t}(x + 0)
    f === :m_ulDeviceHandle && return Ptr{InputHandle_t}(x + 0)
    f === :m_ulMappingCreator && return Ptr{Cint}(x + 0)
    f === :m_unMajorRevision && return Ptr{uint32}(x + 0)
    f === :m_unMinorRevision && return Ptr{uint32}(x + 0)
    f === :m_bUsesSteamInputAPI && return Ptr{Cint}(x + 0)
    f === :m_bUsesGamepadAPI && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamInputConfigurationLoaded_t, f::Symbol)
    r = Ref{SteamInputConfigurationLoaded_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamInputConfigurationLoaded_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamInputConfigurationLoaded_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamInputGamepadSlotChange_t
    data::NTuple{24, UInt8}
end

function Base.getproperty(x::Ptr{SteamInputGamepadSlotChange_t}, f::Symbol)
    f === :m_unAppID && return Ptr{AppId_t}(x + 0)
    f === :m_ulDeviceHandle && return Ptr{InputHandle_t}(x + 4)
    f === :m_eDeviceType && return Ptr{ESteamInputType}(x + 12)
    f === :m_nOldGamepadSlot && return Ptr{Cint}(x + 16)
    f === :m_nNewGamepadSlot && return Ptr{Cint}(x + 20)
    return getfield(x, f)
end

function Base.getproperty(x::SteamInputGamepadSlotChange_t, f::Symbol)
    r = Ref{SteamInputGamepadSlotChange_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamInputGamepadSlotChange_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamInputGamepadSlotChange_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum EControllerActionOrigin::UInt32 begin
    k_EControllerActionOrigin_None = 0
    k_EControllerActionOrigin_A = 1
    k_EControllerActionOrigin_B = 2
    k_EControllerActionOrigin_X = 3
    k_EControllerActionOrigin_Y = 4
    k_EControllerActionOrigin_LeftBumper = 5
    k_EControllerActionOrigin_RightBumper = 6
    k_EControllerActionOrigin_LeftGrip = 7
    k_EControllerActionOrigin_RightGrip = 8
    k_EControllerActionOrigin_Start = 9
    k_EControllerActionOrigin_Back = 10
    k_EControllerActionOrigin_LeftPad_Touch = 11
    k_EControllerActionOrigin_LeftPad_Swipe = 12
    k_EControllerActionOrigin_LeftPad_Click = 13
    k_EControllerActionOrigin_LeftPad_DPadNorth = 14
    k_EControllerActionOrigin_LeftPad_DPadSouth = 15
    k_EControllerActionOrigin_LeftPad_DPadWest = 16
    k_EControllerActionOrigin_LeftPad_DPadEast = 17
    k_EControllerActionOrigin_RightPad_Touch = 18
    k_EControllerActionOrigin_RightPad_Swipe = 19
    k_EControllerActionOrigin_RightPad_Click = 20
    k_EControllerActionOrigin_RightPad_DPadNorth = 21
    k_EControllerActionOrigin_RightPad_DPadSouth = 22
    k_EControllerActionOrigin_RightPad_DPadWest = 23
    k_EControllerActionOrigin_RightPad_DPadEast = 24
    k_EControllerActionOrigin_LeftTrigger_Pull = 25
    k_EControllerActionOrigin_LeftTrigger_Click = 26
    k_EControllerActionOrigin_RightTrigger_Pull = 27
    k_EControllerActionOrigin_RightTrigger_Click = 28
    k_EControllerActionOrigin_LeftStick_Move = 29
    k_EControllerActionOrigin_LeftStick_Click = 30
    k_EControllerActionOrigin_LeftStick_DPadNorth = 31
    k_EControllerActionOrigin_LeftStick_DPadSouth = 32
    k_EControllerActionOrigin_LeftStick_DPadWest = 33
    k_EControllerActionOrigin_LeftStick_DPadEast = 34
    k_EControllerActionOrigin_Gyro_Move = 35
    k_EControllerActionOrigin_Gyro_Pitch = 36
    k_EControllerActionOrigin_Gyro_Yaw = 37
    k_EControllerActionOrigin_Gyro_Roll = 38
    k_EControllerActionOrigin_PS4_X = 39
    k_EControllerActionOrigin_PS4_Circle = 40
    k_EControllerActionOrigin_PS4_Triangle = 41
    k_EControllerActionOrigin_PS4_Square = 42
    k_EControllerActionOrigin_PS4_LeftBumper = 43
    k_EControllerActionOrigin_PS4_RightBumper = 44
    k_EControllerActionOrigin_PS4_Options = 45
    k_EControllerActionOrigin_PS4_Share = 46
    k_EControllerActionOrigin_PS4_LeftPad_Touch = 47
    k_EControllerActionOrigin_PS4_LeftPad_Swipe = 48
    k_EControllerActionOrigin_PS4_LeftPad_Click = 49
    k_EControllerActionOrigin_PS4_LeftPad_DPadNorth = 50
    k_EControllerActionOrigin_PS4_LeftPad_DPadSouth = 51
    k_EControllerActionOrigin_PS4_LeftPad_DPadWest = 52
    k_EControllerActionOrigin_PS4_LeftPad_DPadEast = 53
    k_EControllerActionOrigin_PS4_RightPad_Touch = 54
    k_EControllerActionOrigin_PS4_RightPad_Swipe = 55
    k_EControllerActionOrigin_PS4_RightPad_Click = 56
    k_EControllerActionOrigin_PS4_RightPad_DPadNorth = 57
    k_EControllerActionOrigin_PS4_RightPad_DPadSouth = 58
    k_EControllerActionOrigin_PS4_RightPad_DPadWest = 59
    k_EControllerActionOrigin_PS4_RightPad_DPadEast = 60
    k_EControllerActionOrigin_PS4_CenterPad_Touch = 61
    k_EControllerActionOrigin_PS4_CenterPad_Swipe = 62
    k_EControllerActionOrigin_PS4_CenterPad_Click = 63
    k_EControllerActionOrigin_PS4_CenterPad_DPadNorth = 64
    k_EControllerActionOrigin_PS4_CenterPad_DPadSouth = 65
    k_EControllerActionOrigin_PS4_CenterPad_DPadWest = 66
    k_EControllerActionOrigin_PS4_CenterPad_DPadEast = 67
    k_EControllerActionOrigin_PS4_LeftTrigger_Pull = 68
    k_EControllerActionOrigin_PS4_LeftTrigger_Click = 69
    k_EControllerActionOrigin_PS4_RightTrigger_Pull = 70
    k_EControllerActionOrigin_PS4_RightTrigger_Click = 71
    k_EControllerActionOrigin_PS4_LeftStick_Move = 72
    k_EControllerActionOrigin_PS4_LeftStick_Click = 73
    k_EControllerActionOrigin_PS4_LeftStick_DPadNorth = 74
    k_EControllerActionOrigin_PS4_LeftStick_DPadSouth = 75
    k_EControllerActionOrigin_PS4_LeftStick_DPadWest = 76
    k_EControllerActionOrigin_PS4_LeftStick_DPadEast = 77
    k_EControllerActionOrigin_PS4_RightStick_Move = 78
    k_EControllerActionOrigin_PS4_RightStick_Click = 79
    k_EControllerActionOrigin_PS4_RightStick_DPadNorth = 80
    k_EControllerActionOrigin_PS4_RightStick_DPadSouth = 81
    k_EControllerActionOrigin_PS4_RightStick_DPadWest = 82
    k_EControllerActionOrigin_PS4_RightStick_DPadEast = 83
    k_EControllerActionOrigin_PS4_DPad_North = 84
    k_EControllerActionOrigin_PS4_DPad_South = 85
    k_EControllerActionOrigin_PS4_DPad_West = 86
    k_EControllerActionOrigin_PS4_DPad_East = 87
    k_EControllerActionOrigin_PS4_Gyro_Move = 88
    k_EControllerActionOrigin_PS4_Gyro_Pitch = 89
    k_EControllerActionOrigin_PS4_Gyro_Yaw = 90
    k_EControllerActionOrigin_PS4_Gyro_Roll = 91
    k_EControllerActionOrigin_XBoxOne_A = 92
    k_EControllerActionOrigin_XBoxOne_B = 93
    k_EControllerActionOrigin_XBoxOne_X = 94
    k_EControllerActionOrigin_XBoxOne_Y = 95
    k_EControllerActionOrigin_XBoxOne_LeftBumper = 96
    k_EControllerActionOrigin_XBoxOne_RightBumper = 97
    k_EControllerActionOrigin_XBoxOne_Menu = 98
    k_EControllerActionOrigin_XBoxOne_View = 99
    k_EControllerActionOrigin_XBoxOne_LeftTrigger_Pull = 100
    k_EControllerActionOrigin_XBoxOne_LeftTrigger_Click = 101
    k_EControllerActionOrigin_XBoxOne_RightTrigger_Pull = 102
    k_EControllerActionOrigin_XBoxOne_RightTrigger_Click = 103
    k_EControllerActionOrigin_XBoxOne_LeftStick_Move = 104
    k_EControllerActionOrigin_XBoxOne_LeftStick_Click = 105
    k_EControllerActionOrigin_XBoxOne_LeftStick_DPadNorth = 106
    k_EControllerActionOrigin_XBoxOne_LeftStick_DPadSouth = 107
    k_EControllerActionOrigin_XBoxOne_LeftStick_DPadWest = 108
    k_EControllerActionOrigin_XBoxOne_LeftStick_DPadEast = 109
    k_EControllerActionOrigin_XBoxOne_RightStick_Move = 110
    k_EControllerActionOrigin_XBoxOne_RightStick_Click = 111
    k_EControllerActionOrigin_XBoxOne_RightStick_DPadNorth = 112
    k_EControllerActionOrigin_XBoxOne_RightStick_DPadSouth = 113
    k_EControllerActionOrigin_XBoxOne_RightStick_DPadWest = 114
    k_EControllerActionOrigin_XBoxOne_RightStick_DPadEast = 115
    k_EControllerActionOrigin_XBoxOne_DPad_North = 116
    k_EControllerActionOrigin_XBoxOne_DPad_South = 117
    k_EControllerActionOrigin_XBoxOne_DPad_West = 118
    k_EControllerActionOrigin_XBoxOne_DPad_East = 119
    k_EControllerActionOrigin_XBox360_A = 120
    k_EControllerActionOrigin_XBox360_B = 121
    k_EControllerActionOrigin_XBox360_X = 122
    k_EControllerActionOrigin_XBox360_Y = 123
    k_EControllerActionOrigin_XBox360_LeftBumper = 124
    k_EControllerActionOrigin_XBox360_RightBumper = 125
    k_EControllerActionOrigin_XBox360_Start = 126
    k_EControllerActionOrigin_XBox360_Back = 127
    k_EControllerActionOrigin_XBox360_LeftTrigger_Pull = 128
    k_EControllerActionOrigin_XBox360_LeftTrigger_Click = 129
    k_EControllerActionOrigin_XBox360_RightTrigger_Pull = 130
    k_EControllerActionOrigin_XBox360_RightTrigger_Click = 131
    k_EControllerActionOrigin_XBox360_LeftStick_Move = 132
    k_EControllerActionOrigin_XBox360_LeftStick_Click = 133
    k_EControllerActionOrigin_XBox360_LeftStick_DPadNorth = 134
    k_EControllerActionOrigin_XBox360_LeftStick_DPadSouth = 135
    k_EControllerActionOrigin_XBox360_LeftStick_DPadWest = 136
    k_EControllerActionOrigin_XBox360_LeftStick_DPadEast = 137
    k_EControllerActionOrigin_XBox360_RightStick_Move = 138
    k_EControllerActionOrigin_XBox360_RightStick_Click = 139
    k_EControllerActionOrigin_XBox360_RightStick_DPadNorth = 140
    k_EControllerActionOrigin_XBox360_RightStick_DPadSouth = 141
    k_EControllerActionOrigin_XBox360_RightStick_DPadWest = 142
    k_EControllerActionOrigin_XBox360_RightStick_DPadEast = 143
    k_EControllerActionOrigin_XBox360_DPad_North = 144
    k_EControllerActionOrigin_XBox360_DPad_South = 145
    k_EControllerActionOrigin_XBox360_DPad_West = 146
    k_EControllerActionOrigin_XBox360_DPad_East = 147
    k_EControllerActionOrigin_SteamV2_A = 148
    k_EControllerActionOrigin_SteamV2_B = 149
    k_EControllerActionOrigin_SteamV2_X = 150
    k_EControllerActionOrigin_SteamV2_Y = 151
    k_EControllerActionOrigin_SteamV2_LeftBumper = 152
    k_EControllerActionOrigin_SteamV2_RightBumper = 153
    k_EControllerActionOrigin_SteamV2_LeftGrip_Lower = 154
    k_EControllerActionOrigin_SteamV2_LeftGrip_Upper = 155
    k_EControllerActionOrigin_SteamV2_RightGrip_Lower = 156
    k_EControllerActionOrigin_SteamV2_RightGrip_Upper = 157
    k_EControllerActionOrigin_SteamV2_LeftBumper_Pressure = 158
    k_EControllerActionOrigin_SteamV2_RightBumper_Pressure = 159
    k_EControllerActionOrigin_SteamV2_LeftGrip_Pressure = 160
    k_EControllerActionOrigin_SteamV2_RightGrip_Pressure = 161
    k_EControllerActionOrigin_SteamV2_LeftGrip_Upper_Pressure = 162
    k_EControllerActionOrigin_SteamV2_RightGrip_Upper_Pressure = 163
    k_EControllerActionOrigin_SteamV2_Start = 164
    k_EControllerActionOrigin_SteamV2_Back = 165
    k_EControllerActionOrigin_SteamV2_LeftPad_Touch = 166
    k_EControllerActionOrigin_SteamV2_LeftPad_Swipe = 167
    k_EControllerActionOrigin_SteamV2_LeftPad_Click = 168
    k_EControllerActionOrigin_SteamV2_LeftPad_Pressure = 169
    k_EControllerActionOrigin_SteamV2_LeftPad_DPadNorth = 170
    k_EControllerActionOrigin_SteamV2_LeftPad_DPadSouth = 171
    k_EControllerActionOrigin_SteamV2_LeftPad_DPadWest = 172
    k_EControllerActionOrigin_SteamV2_LeftPad_DPadEast = 173
    k_EControllerActionOrigin_SteamV2_RightPad_Touch = 174
    k_EControllerActionOrigin_SteamV2_RightPad_Swipe = 175
    k_EControllerActionOrigin_SteamV2_RightPad_Click = 176
    k_EControllerActionOrigin_SteamV2_RightPad_Pressure = 177
    k_EControllerActionOrigin_SteamV2_RightPad_DPadNorth = 178
    k_EControllerActionOrigin_SteamV2_RightPad_DPadSouth = 179
    k_EControllerActionOrigin_SteamV2_RightPad_DPadWest = 180
    k_EControllerActionOrigin_SteamV2_RightPad_DPadEast = 181
    k_EControllerActionOrigin_SteamV2_LeftTrigger_Pull = 182
    k_EControllerActionOrigin_SteamV2_LeftTrigger_Click = 183
    k_EControllerActionOrigin_SteamV2_RightTrigger_Pull = 184
    k_EControllerActionOrigin_SteamV2_RightTrigger_Click = 185
    k_EControllerActionOrigin_SteamV2_LeftStick_Move = 186
    k_EControllerActionOrigin_SteamV2_LeftStick_Click = 187
    k_EControllerActionOrigin_SteamV2_LeftStick_DPadNorth = 188
    k_EControllerActionOrigin_SteamV2_LeftStick_DPadSouth = 189
    k_EControllerActionOrigin_SteamV2_LeftStick_DPadWest = 190
    k_EControllerActionOrigin_SteamV2_LeftStick_DPadEast = 191
    k_EControllerActionOrigin_SteamV2_Gyro_Move = 192
    k_EControllerActionOrigin_SteamV2_Gyro_Pitch = 193
    k_EControllerActionOrigin_SteamV2_Gyro_Yaw = 194
    k_EControllerActionOrigin_SteamV2_Gyro_Roll = 195
    k_EControllerActionOrigin_Switch_A = 196
    k_EControllerActionOrigin_Switch_B = 197
    k_EControllerActionOrigin_Switch_X = 198
    k_EControllerActionOrigin_Switch_Y = 199
    k_EControllerActionOrigin_Switch_LeftBumper = 200
    k_EControllerActionOrigin_Switch_RightBumper = 201
    k_EControllerActionOrigin_Switch_Plus = 202
    k_EControllerActionOrigin_Switch_Minus = 203
    k_EControllerActionOrigin_Switch_Capture = 204
    k_EControllerActionOrigin_Switch_LeftTrigger_Pull = 205
    k_EControllerActionOrigin_Switch_LeftTrigger_Click = 206
    k_EControllerActionOrigin_Switch_RightTrigger_Pull = 207
    k_EControllerActionOrigin_Switch_RightTrigger_Click = 208
    k_EControllerActionOrigin_Switch_LeftStick_Move = 209
    k_EControllerActionOrigin_Switch_LeftStick_Click = 210
    k_EControllerActionOrigin_Switch_LeftStick_DPadNorth = 211
    k_EControllerActionOrigin_Switch_LeftStick_DPadSouth = 212
    k_EControllerActionOrigin_Switch_LeftStick_DPadWest = 213
    k_EControllerActionOrigin_Switch_LeftStick_DPadEast = 214
    k_EControllerActionOrigin_Switch_RightStick_Move = 215
    k_EControllerActionOrigin_Switch_RightStick_Click = 216
    k_EControllerActionOrigin_Switch_RightStick_DPadNorth = 217
    k_EControllerActionOrigin_Switch_RightStick_DPadSouth = 218
    k_EControllerActionOrigin_Switch_RightStick_DPadWest = 219
    k_EControllerActionOrigin_Switch_RightStick_DPadEast = 220
    k_EControllerActionOrigin_Switch_DPad_North = 221
    k_EControllerActionOrigin_Switch_DPad_South = 222
    k_EControllerActionOrigin_Switch_DPad_West = 223
    k_EControllerActionOrigin_Switch_DPad_East = 224
    k_EControllerActionOrigin_Switch_ProGyro_Move = 225
    k_EControllerActionOrigin_Switch_ProGyro_Pitch = 226
    k_EControllerActionOrigin_Switch_ProGyro_Yaw = 227
    k_EControllerActionOrigin_Switch_ProGyro_Roll = 228
    k_EControllerActionOrigin_Switch_RightGyro_Move = 229
    k_EControllerActionOrigin_Switch_RightGyro_Pitch = 230
    k_EControllerActionOrigin_Switch_RightGyro_Yaw = 231
    k_EControllerActionOrigin_Switch_RightGyro_Roll = 232
    k_EControllerActionOrigin_Switch_LeftGyro_Move = 233
    k_EControllerActionOrigin_Switch_LeftGyro_Pitch = 234
    k_EControllerActionOrigin_Switch_LeftGyro_Yaw = 235
    k_EControllerActionOrigin_Switch_LeftGyro_Roll = 236
    k_EControllerActionOrigin_Switch_LeftGrip_Lower = 237
    k_EControllerActionOrigin_Switch_LeftGrip_Upper = 238
    k_EControllerActionOrigin_Switch_RightGrip_Lower = 239
    k_EControllerActionOrigin_Switch_RightGrip_Upper = 240
    k_EControllerActionOrigin_PS4_DPad_Move = 241
    k_EControllerActionOrigin_XBoxOne_DPad_Move = 242
    k_EControllerActionOrigin_XBox360_DPad_Move = 243
    k_EControllerActionOrigin_Switch_DPad_Move = 244
    k_EControllerActionOrigin_PS5_X = 245
    k_EControllerActionOrigin_PS5_Circle = 246
    k_EControllerActionOrigin_PS5_Triangle = 247
    k_EControllerActionOrigin_PS5_Square = 248
    k_EControllerActionOrigin_PS5_LeftBumper = 249
    k_EControllerActionOrigin_PS5_RightBumper = 250
    k_EControllerActionOrigin_PS5_Option = 251
    k_EControllerActionOrigin_PS5_Create = 252
    k_EControllerActionOrigin_PS5_Mute = 253
    k_EControllerActionOrigin_PS5_LeftPad_Touch = 254
    k_EControllerActionOrigin_PS5_LeftPad_Swipe = 255
    k_EControllerActionOrigin_PS5_LeftPad_Click = 256
    k_EControllerActionOrigin_PS5_LeftPad_DPadNorth = 257
    k_EControllerActionOrigin_PS5_LeftPad_DPadSouth = 258
    k_EControllerActionOrigin_PS5_LeftPad_DPadWest = 259
    k_EControllerActionOrigin_PS5_LeftPad_DPadEast = 260
    k_EControllerActionOrigin_PS5_RightPad_Touch = 261
    k_EControllerActionOrigin_PS5_RightPad_Swipe = 262
    k_EControllerActionOrigin_PS5_RightPad_Click = 263
    k_EControllerActionOrigin_PS5_RightPad_DPadNorth = 264
    k_EControllerActionOrigin_PS5_RightPad_DPadSouth = 265
    k_EControllerActionOrigin_PS5_RightPad_DPadWest = 266
    k_EControllerActionOrigin_PS5_RightPad_DPadEast = 267
    k_EControllerActionOrigin_PS5_CenterPad_Touch = 268
    k_EControllerActionOrigin_PS5_CenterPad_Swipe = 269
    k_EControllerActionOrigin_PS5_CenterPad_Click = 270
    k_EControllerActionOrigin_PS5_CenterPad_DPadNorth = 271
    k_EControllerActionOrigin_PS5_CenterPad_DPadSouth = 272
    k_EControllerActionOrigin_PS5_CenterPad_DPadWest = 273
    k_EControllerActionOrigin_PS5_CenterPad_DPadEast = 274
    k_EControllerActionOrigin_PS5_LeftTrigger_Pull = 275
    k_EControllerActionOrigin_PS5_LeftTrigger_Click = 276
    k_EControllerActionOrigin_PS5_RightTrigger_Pull = 277
    k_EControllerActionOrigin_PS5_RightTrigger_Click = 278
    k_EControllerActionOrigin_PS5_LeftStick_Move = 279
    k_EControllerActionOrigin_PS5_LeftStick_Click = 280
    k_EControllerActionOrigin_PS5_LeftStick_DPadNorth = 281
    k_EControllerActionOrigin_PS5_LeftStick_DPadSouth = 282
    k_EControllerActionOrigin_PS5_LeftStick_DPadWest = 283
    k_EControllerActionOrigin_PS5_LeftStick_DPadEast = 284
    k_EControllerActionOrigin_PS5_RightStick_Move = 285
    k_EControllerActionOrigin_PS5_RightStick_Click = 286
    k_EControllerActionOrigin_PS5_RightStick_DPadNorth = 287
    k_EControllerActionOrigin_PS5_RightStick_DPadSouth = 288
    k_EControllerActionOrigin_PS5_RightStick_DPadWest = 289
    k_EControllerActionOrigin_PS5_RightStick_DPadEast = 290
    k_EControllerActionOrigin_PS5_DPad_Move = 291
    k_EControllerActionOrigin_PS5_DPad_North = 292
    k_EControllerActionOrigin_PS5_DPad_South = 293
    k_EControllerActionOrigin_PS5_DPad_West = 294
    k_EControllerActionOrigin_PS5_DPad_East = 295
    k_EControllerActionOrigin_PS5_Gyro_Move = 296
    k_EControllerActionOrigin_PS5_Gyro_Pitch = 297
    k_EControllerActionOrigin_PS5_Gyro_Yaw = 298
    k_EControllerActionOrigin_PS5_Gyro_Roll = 299
    k_EControllerActionOrigin_XBoxOne_LeftGrip_Lower = 300
    k_EControllerActionOrigin_XBoxOne_LeftGrip_Upper = 301
    k_EControllerActionOrigin_XBoxOne_RightGrip_Lower = 302
    k_EControllerActionOrigin_XBoxOne_RightGrip_Upper = 303
    k_EControllerActionOrigin_XBoxOne_Share = 304
    k_EControllerActionOrigin_SteamDeck_A = 305
    k_EControllerActionOrigin_SteamDeck_B = 306
    k_EControllerActionOrigin_SteamDeck_X = 307
    k_EControllerActionOrigin_SteamDeck_Y = 308
    k_EControllerActionOrigin_SteamDeck_L1 = 309
    k_EControllerActionOrigin_SteamDeck_R1 = 310
    k_EControllerActionOrigin_SteamDeck_Menu = 311
    k_EControllerActionOrigin_SteamDeck_View = 312
    k_EControllerActionOrigin_SteamDeck_LeftPad_Touch = 313
    k_EControllerActionOrigin_SteamDeck_LeftPad_Swipe = 314
    k_EControllerActionOrigin_SteamDeck_LeftPad_Click = 315
    k_EControllerActionOrigin_SteamDeck_LeftPad_DPadNorth = 316
    k_EControllerActionOrigin_SteamDeck_LeftPad_DPadSouth = 317
    k_EControllerActionOrigin_SteamDeck_LeftPad_DPadWest = 318
    k_EControllerActionOrigin_SteamDeck_LeftPad_DPadEast = 319
    k_EControllerActionOrigin_SteamDeck_RightPad_Touch = 320
    k_EControllerActionOrigin_SteamDeck_RightPad_Swipe = 321
    k_EControllerActionOrigin_SteamDeck_RightPad_Click = 322
    k_EControllerActionOrigin_SteamDeck_RightPad_DPadNorth = 323
    k_EControllerActionOrigin_SteamDeck_RightPad_DPadSouth = 324
    k_EControllerActionOrigin_SteamDeck_RightPad_DPadWest = 325
    k_EControllerActionOrigin_SteamDeck_RightPad_DPadEast = 326
    k_EControllerActionOrigin_SteamDeck_L2_SoftPull = 327
    k_EControllerActionOrigin_SteamDeck_L2 = 328
    k_EControllerActionOrigin_SteamDeck_R2_SoftPull = 329
    k_EControllerActionOrigin_SteamDeck_R2 = 330
    k_EControllerActionOrigin_SteamDeck_LeftStick_Move = 331
    k_EControllerActionOrigin_SteamDeck_L3 = 332
    k_EControllerActionOrigin_SteamDeck_LeftStick_DPadNorth = 333
    k_EControllerActionOrigin_SteamDeck_LeftStick_DPadSouth = 334
    k_EControllerActionOrigin_SteamDeck_LeftStick_DPadWest = 335
    k_EControllerActionOrigin_SteamDeck_LeftStick_DPadEast = 336
    k_EControllerActionOrigin_SteamDeck_LeftStick_Touch = 337
    k_EControllerActionOrigin_SteamDeck_RightStick_Move = 338
    k_EControllerActionOrigin_SteamDeck_R3 = 339
    k_EControllerActionOrigin_SteamDeck_RightStick_DPadNorth = 340
    k_EControllerActionOrigin_SteamDeck_RightStick_DPadSouth = 341
    k_EControllerActionOrigin_SteamDeck_RightStick_DPadWest = 342
    k_EControllerActionOrigin_SteamDeck_RightStick_DPadEast = 343
    k_EControllerActionOrigin_SteamDeck_RightStick_Touch = 344
    k_EControllerActionOrigin_SteamDeck_L4 = 345
    k_EControllerActionOrigin_SteamDeck_R4 = 346
    k_EControllerActionOrigin_SteamDeck_L5 = 347
    k_EControllerActionOrigin_SteamDeck_R5 = 348
    k_EControllerActionOrigin_SteamDeck_DPad_Move = 349
    k_EControllerActionOrigin_SteamDeck_DPad_North = 350
    k_EControllerActionOrigin_SteamDeck_DPad_South = 351
    k_EControllerActionOrigin_SteamDeck_DPad_West = 352
    k_EControllerActionOrigin_SteamDeck_DPad_East = 353
    k_EControllerActionOrigin_SteamDeck_Gyro_Move = 354
    k_EControllerActionOrigin_SteamDeck_Gyro_Pitch = 355
    k_EControllerActionOrigin_SteamDeck_Gyro_Yaw = 356
    k_EControllerActionOrigin_SteamDeck_Gyro_Roll = 357
    k_EControllerActionOrigin_SteamDeck_Reserved1 = 358
    k_EControllerActionOrigin_SteamDeck_Reserved2 = 359
    k_EControllerActionOrigin_SteamDeck_Reserved3 = 360
    k_EControllerActionOrigin_SteamDeck_Reserved4 = 361
    k_EControllerActionOrigin_SteamDeck_Reserved5 = 362
    k_EControllerActionOrigin_SteamDeck_Reserved6 = 363
    k_EControllerActionOrigin_SteamDeck_Reserved7 = 364
    k_EControllerActionOrigin_SteamDeck_Reserved8 = 365
    k_EControllerActionOrigin_SteamDeck_Reserved9 = 366
    k_EControllerActionOrigin_SteamDeck_Reserved10 = 367
    k_EControllerActionOrigin_SteamDeck_Reserved11 = 368
    k_EControllerActionOrigin_SteamDeck_Reserved12 = 369
    k_EControllerActionOrigin_SteamDeck_Reserved13 = 370
    k_EControllerActionOrigin_SteamDeck_Reserved14 = 371
    k_EControllerActionOrigin_SteamDeck_Reserved15 = 372
    k_EControllerActionOrigin_SteamDeck_Reserved16 = 373
    k_EControllerActionOrigin_SteamDeck_Reserved17 = 374
    k_EControllerActionOrigin_SteamDeck_Reserved18 = 375
    k_EControllerActionOrigin_SteamDeck_Reserved19 = 376
    k_EControllerActionOrigin_SteamDeck_Reserved20 = 377
    k_EControllerActionOrigin_Switch_JoyConButton_N = 378
    k_EControllerActionOrigin_Switch_JoyConButton_E = 379
    k_EControllerActionOrigin_Switch_JoyConButton_S = 380
    k_EControllerActionOrigin_Switch_JoyConButton_W = 381
    k_EControllerActionOrigin_PS5_LeftGrip = 382
    k_EControllerActionOrigin_PS5_RightGrip = 383
    k_EControllerActionOrigin_PS5_LeftFn = 384
    k_EControllerActionOrigin_PS5_RightFn = 385
    k_EControllerActionOrigin_Horipad_M1 = 386
    k_EControllerActionOrigin_Horipad_M2 = 387
    k_EControllerActionOrigin_Horipad_L4 = 388
    k_EControllerActionOrigin_Horipad_R4 = 389
    k_EControllerActionOrigin_Count = 390
    k_EControllerActionOrigin_MaximumPossibleValue = 32767
end

@cenum ESteamControllerLEDFlag::UInt32 begin
    k_ESteamControllerLEDFlag_SetColor = 0
    k_ESteamControllerLEDFlag_RestoreUserDefault = 1
end

const ControllerHandle_t = uint64

const ControllerActionSetHandle_t = uint64

const ControllerDigitalActionHandle_t = uint64

const ControllerAnalogActionHandle_t = uint64

# no prototype is found for this function at isteamcontroller.h:728:26, please use with caution
function SteamController()
    ccall((:SteamController, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamController(p)
    ccall((:SteamInternal_Init_SteamController, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

const UGCQueryHandle_t = uint64

const UGCUpdateHandle_t = uint64

@cenum EUGCMatchingUGCType::Int32 begin
    k_EUGCMatchingUGCType_Items = 0
    k_EUGCMatchingUGCType_Items_Mtx = 1
    k_EUGCMatchingUGCType_Items_ReadyToUse = 2
    k_EUGCMatchingUGCType_Collections = 3
    k_EUGCMatchingUGCType_Artwork = 4
    k_EUGCMatchingUGCType_Videos = 5
    k_EUGCMatchingUGCType_Screenshots = 6
    k_EUGCMatchingUGCType_AllGuides = 7
    k_EUGCMatchingUGCType_WebGuides = 8
    k_EUGCMatchingUGCType_IntegratedGuides = 9
    k_EUGCMatchingUGCType_UsableInGame = 10
    k_EUGCMatchingUGCType_ControllerBindings = 11
    k_EUGCMatchingUGCType_GameManagedItems = 12
    k_EUGCMatchingUGCType_All = -1
end

@cenum EUserUGCList::UInt32 begin
    k_EUserUGCList_Published = 0
    k_EUserUGCList_VotedOn = 1
    k_EUserUGCList_VotedUp = 2
    k_EUserUGCList_VotedDown = 3
    k_EUserUGCList_WillVoteLater = 4
    k_EUserUGCList_Favorited = 5
    k_EUserUGCList_Subscribed = 6
    k_EUserUGCList_UsedOrPlayed = 7
    k_EUserUGCList_Followed = 8
end

@cenum EUserUGCListSortOrder::UInt32 begin
    k_EUserUGCListSortOrder_CreationOrderDesc = 0
    k_EUserUGCListSortOrder_CreationOrderAsc = 1
    k_EUserUGCListSortOrder_TitleAsc = 2
    k_EUserUGCListSortOrder_LastUpdatedDesc = 3
    k_EUserUGCListSortOrder_SubscriptionDateDesc = 4
    k_EUserUGCListSortOrder_VoteScoreDesc = 5
    k_EUserUGCListSortOrder_ForModeration = 6
end

@cenum EUGCQuery::UInt32 begin
    k_EUGCQuery_RankedByVote = 0
    k_EUGCQuery_RankedByPublicationDate = 1
    k_EUGCQuery_AcceptedForGameRankedByAcceptanceDate = 2
    k_EUGCQuery_RankedByTrend = 3
    k_EUGCQuery_FavoritedByFriendsRankedByPublicationDate = 4
    k_EUGCQuery_CreatedByFriendsRankedByPublicationDate = 5
    k_EUGCQuery_RankedByNumTimesReported = 6
    k_EUGCQuery_CreatedByFollowedUsersRankedByPublicationDate = 7
    k_EUGCQuery_NotYetRated = 8
    k_EUGCQuery_RankedByTotalVotesAsc = 9
    k_EUGCQuery_RankedByVotesUp = 10
    k_EUGCQuery_RankedByTextSearch = 11
    k_EUGCQuery_RankedByTotalUniqueSubscriptions = 12
    k_EUGCQuery_RankedByPlaytimeTrend = 13
    k_EUGCQuery_RankedByTotalPlaytime = 14
    k_EUGCQuery_RankedByAveragePlaytimeTrend = 15
    k_EUGCQuery_RankedByLifetimeAveragePlaytime = 16
    k_EUGCQuery_RankedByPlaytimeSessionsTrend = 17
    k_EUGCQuery_RankedByLifetimePlaytimeSessions = 18
    k_EUGCQuery_RankedByLastUpdatedDate = 19
end

@cenum EItemUpdateStatus::UInt32 begin
    k_EItemUpdateStatusInvalid = 0
    k_EItemUpdateStatusPreparingConfig = 1
    k_EItemUpdateStatusPreparingContent = 2
    k_EItemUpdateStatusUploadingContent = 3
    k_EItemUpdateStatusUploadingPreviewFile = 4
    k_EItemUpdateStatusCommittingChanges = 5
end

@cenum EItemState::UInt32 begin
    k_EItemStateNone = 0
    k_EItemStateSubscribed = 1
    k_EItemStateLegacyItem = 2
    k_EItemStateInstalled = 4
    k_EItemStateNeedsUpdate = 8
    k_EItemStateDownloading = 16
    k_EItemStateDownloadPending = 32
    k_EItemStateDisabledLocally = 64
end

@cenum EItemStatistic::UInt32 begin
    k_EItemStatistic_NumSubscriptions = 0
    k_EItemStatistic_NumFavorites = 1
    k_EItemStatistic_NumFollowers = 2
    k_EItemStatistic_NumUniqueSubscriptions = 3
    k_EItemStatistic_NumUniqueFavorites = 4
    k_EItemStatistic_NumUniqueFollowers = 5
    k_EItemStatistic_NumUniqueWebsiteViews = 6
    k_EItemStatistic_ReportScore = 7
    k_EItemStatistic_NumSecondsPlayed = 8
    k_EItemStatistic_NumPlaytimeSessions = 9
    k_EItemStatistic_NumComments = 10
    k_EItemStatistic_NumSecondsPlayedDuringTimePeriod = 11
    k_EItemStatistic_NumPlaytimeSessionsDuringTimePeriod = 12
end

@cenum EItemPreviewType::UInt32 begin
    k_EItemPreviewType_Image = 0
    k_EItemPreviewType_YouTubeVideo = 1
    k_EItemPreviewType_Sketchfab = 2
    k_EItemPreviewType_EnvironmentMap_HorizontalCross = 3
    k_EItemPreviewType_EnvironmentMap_LatLong = 4
    k_EItemPreviewType_Clip = 5
    k_EItemPreviewType_ReservedMax = 255
end

@cenum EUGCContentDescriptorID::UInt32 begin
    k_EUGCContentDescriptor_NudityOrSexualContent = 1
    k_EUGCContentDescriptor_FrequentViolenceOrGore = 2
    k_EUGCContentDescriptor_AdultOnlySexualContent = 3
    k_EUGCContentDescriptor_GratuitousSexualContent = 4
    k_EUGCContentDescriptor_AnyMatureContent = 5
end

struct SteamUGCDetails_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SteamUGCDetails_t}, f::Symbol)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_eFileType && return Ptr{EWorkshopFileType}(x + 0)
    f === :m_nCreatorAppID && return Ptr{AppId_t}(x + 0)
    f === :m_nConsumerAppID && return Ptr{AppId_t}(x + 0)
    f === :m_rgchTitle && return Ptr{NTuple{129, Cchar}}(x + 0)
    f === :m_rgchDescription && return Ptr{NTuple{8000, Cchar}}(x + 0)
    f === :m_ulSteamIDOwner && return Ptr{uint64}(x + 0)
    f === :m_rtimeCreated && return Ptr{uint32}(x + 0)
    f === :m_rtimeUpdated && return Ptr{uint32}(x + 0)
    f === :m_rtimeAddedToUserList && return Ptr{uint32}(x + 0)
    f === :m_eVisibility && return Ptr{ERemoteStoragePublishedFileVisibility}(x + 0)
    f === :m_bBanned && return Ptr{Cint}(x + 0)
    f === :m_bAcceptedForUse && return Ptr{Cint}(x + 0)
    f === :m_bTagsTruncated && return Ptr{Cint}(x + 0)
    f === :m_rgchTags && return Ptr{NTuple{1025, Cchar}}(x + 0)
    f === :m_hFile && return Ptr{UGCHandle_t}(x + 0)
    f === :m_hPreviewFile && return Ptr{UGCHandle_t}(x + 0)
    f === :m_pchFileName && return Ptr{NTuple{260, Cchar}}(x + 0)
    f === :m_nFileSize && return Ptr{int32}(x + 0)
    f === :m_nPreviewFileSize && return Ptr{int32}(x + 0)
    f === :m_rgchURL && return Ptr{NTuple{256, Cchar}}(x + 0)
    f === :m_unVotesUp && return Ptr{uint32}(x + 0)
    f === :m_unVotesDown && return Ptr{uint32}(x + 0)
    f === :m_flScore && return Ptr{Cfloat}(x + 0)
    f === :m_unNumChildren && return Ptr{uint32}(x + 0)
    f === :m_ulTotalFilesSize && return Ptr{uint64}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamUGCDetails_t, f::Symbol)
    r = Ref{SteamUGCDetails_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamUGCDetails_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamUGCDetails_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

# no prototype is found for this function at isteamugc.h:402:19, please use with caution
function SteamUGC()
    ccall((:SteamUGC, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamUGC(p)
    ccall((:SteamInternal_Init_SteamUGC, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

# no prototype is found for this function at isteamugc.h:406:19, please use with caution
function SteamGameServerUGC()
    ccall((:SteamGameServerUGC, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamGameServerUGC(p)
    ccall((:SteamInternal_Init_SteamGameServerUGC, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct SteamUGCQueryCompleted_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SteamUGCQueryCompleted_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamugc.h:414:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_handle && return Ptr{UGCQueryHandle_t}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_unNumResultsReturned && return Ptr{uint32}(x + 0)
    f === :m_unTotalMatchingResults && return Ptr{uint32}(x + 0)
    f === :m_bCachedData && return Ptr{Cint}(x + 0)
    f === :m_rgchNextCursor && return Ptr{NTuple{256, Cchar}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamUGCQueryCompleted_t, f::Symbol)
    r = Ref{SteamUGCQueryCompleted_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamUGCQueryCompleted_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamUGCQueryCompleted_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamUGCRequestUGCDetailsResult_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SteamUGCRequestUGCDetailsResult_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamugc.h:429:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_details && return Ptr{SteamUGCDetails_t}(x + 0)
    f === :m_bCachedData && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamUGCRequestUGCDetailsResult_t, f::Symbol)
    r = Ref{SteamUGCRequestUGCDetailsResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamUGCRequestUGCDetailsResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamUGCRequestUGCDetailsResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct CreateItemResult_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{CreateItemResult_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamugc.h:440:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 0)
    f === :m_bUserNeedsToAcceptWorkshopLegalAgreement && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::CreateItemResult_t, f::Symbol)
    r = Ref{CreateItemResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{CreateItemResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{CreateItemResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SubmitItemUpdateResult_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SubmitItemUpdateResult_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamugc.h:452:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_bUserNeedsToAcceptWorkshopLegalAgreement && return Ptr{Cint}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SubmitItemUpdateResult_t, f::Symbol)
    r = Ref{SubmitItemUpdateResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{SubmitItemUpdateResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SubmitItemUpdateResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct ItemInstalled_t
    data::NTuple{28, UInt8}
end

function Base.getproperty(x::Ptr{ItemInstalled_t}, f::Symbol)
    f === :m_unAppID && return Ptr{AppId_t}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 4)
    f === :m_hLegacyContent && return Ptr{UGCHandle_t}(x + 12)
    f === :m_unManifestID && return Ptr{uint64}(x + 20)
    return getfield(x, f)
end

function Base.getproperty(x::ItemInstalled_t, f::Symbol)
    r = Ref{ItemInstalled_t}(x)
    ptr = Base.unsafe_convert(Ptr{ItemInstalled_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{ItemInstalled_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct DownloadItemResult_t
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{DownloadItemResult_t}, f::Symbol)
    f === :m_unAppID && return Ptr{AppId_t}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 4)
    f === :m_eResult && return Ptr{EResult}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::DownloadItemResult_t, f::Symbol)
    r = Ref{DownloadItemResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{DownloadItemResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{DownloadItemResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct UserFavoriteItemsListChanged_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{UserFavoriteItemsListChanged_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamugc.h:488:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_bWasAddRequest && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::UserFavoriteItemsListChanged_t, f::Symbol)
    r = Ref{UserFavoriteItemsListChanged_t}(x)
    ptr = Base.unsafe_convert(Ptr{UserFavoriteItemsListChanged_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{UserFavoriteItemsListChanged_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SetUserItemVoteResult_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SetUserItemVoteResult_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamugc.h:499:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_bVoteUp && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SetUserItemVoteResult_t, f::Symbol)
    r = Ref{SetUserItemVoteResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{SetUserItemVoteResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SetUserItemVoteResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct GetUserItemVoteResult_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{GetUserItemVoteResult_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamugc.h:510:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_bVotedUp && return Ptr{Cint}(x + 0)
    f === :m_bVotedDown && return Ptr{Cint}(x + 0)
    f === :m_bVoteSkipped && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::GetUserItemVoteResult_t, f::Symbol)
    r = Ref{GetUserItemVoteResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{GetUserItemVoteResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GetUserItemVoteResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct StartPlaytimeTrackingResult_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{StartPlaytimeTrackingResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::StartPlaytimeTrackingResult_t, f::Symbol)
    r = Ref{StartPlaytimeTrackingResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{StartPlaytimeTrackingResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{StartPlaytimeTrackingResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct StopPlaytimeTrackingResult_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{StopPlaytimeTrackingResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::StopPlaytimeTrackingResult_t, f::Symbol)
    r = Ref{StopPlaytimeTrackingResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{StopPlaytimeTrackingResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{StopPlaytimeTrackingResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct AddUGCDependencyResult_t
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{AddUGCDependencyResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 4)
    f === :m_nChildPublishedFileId && return Ptr{PublishedFileId_t}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::AddUGCDependencyResult_t, f::Symbol)
    r = Ref{AddUGCDependencyResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{AddUGCDependencyResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{AddUGCDependencyResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoveUGCDependencyResult_t
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{RemoveUGCDependencyResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 4)
    f === :m_nChildPublishedFileId && return Ptr{PublishedFileId_t}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::RemoveUGCDependencyResult_t, f::Symbol)
    r = Ref{RemoveUGCDependencyResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoveUGCDependencyResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoveUGCDependencyResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct AddAppDependencyResult_t
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{AddAppDependencyResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 4)
    f === :m_nAppID && return Ptr{AppId_t}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::AddAppDependencyResult_t, f::Symbol)
    r = Ref{AddAppDependencyResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{AddAppDependencyResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{AddAppDependencyResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct RemoveAppDependencyResult_t
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{RemoveAppDependencyResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 4)
    f === :m_nAppID && return Ptr{AppId_t}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::RemoveAppDependencyResult_t, f::Symbol)
    r = Ref{RemoveAppDependencyResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{RemoveAppDependencyResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{RemoveAppDependencyResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct GetAppDependenciesResult_t
    data::NTuple{148, UInt8}
end

function Base.getproperty(x::Ptr{GetAppDependenciesResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 4)
    f === :m_rgAppIDs && return Ptr{NTuple{32, AppId_t}}(x + 12)
    f === :m_nNumAppDependencies && return Ptr{uint32}(x + 140)
    f === :m_nTotalNumAppDependencies && return Ptr{uint32}(x + 144)
    return getfield(x, f)
end

function Base.getproperty(x::GetAppDependenciesResult_t, f::Symbol)
    r = Ref{GetAppDependenciesResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{GetAppDependenciesResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GetAppDependenciesResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct DeleteItemResult_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{DeleteItemResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nPublishedFileId && return Ptr{PublishedFileId_t}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::DeleteItemResult_t, f::Symbol)
    r = Ref{DeleteItemResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{DeleteItemResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{DeleteItemResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct UserSubscribedItemsListChanged_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{UserSubscribedItemsListChanged_t}, f::Symbol)
    f === :m_nAppID && return Ptr{AppId_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::UserSubscribedItemsListChanged_t, f::Symbol)
    r = Ref{UserSubscribedItemsListChanged_t}(x)
    ptr = Base.unsafe_convert(Ptr{UserSubscribedItemsListChanged_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{UserSubscribedItemsListChanged_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct WorkshopEULAStatus_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{WorkshopEULAStatus_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamugc.h:621:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_nAppID && return Ptr{AppId_t}(x + 0)
    f === :m_unVersion && return Ptr{uint32}(x + 0)
    f === :m_rtAction && return Ptr{RTime32}(x + 0)
    f === :m_bAccepted && return Ptr{Cint}(x + 0)
    f === :m_bNeedsAction && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::WorkshopEULAStatus_t, f::Symbol)
    r = Ref{WorkshopEULAStatus_t}(x)
    ptr = Base.unsafe_convert(Ptr{WorkshopEULAStatus_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{WorkshopEULAStatus_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const HHTMLBrowser = uint32

# no prototype is found for this function at isteamhtmlsurface.h:210:27, please use with caution
function SteamHTMLSurface()
    ccall((:SteamHTMLSurface, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamHTMLSurface(p)
    ccall((:SteamInternal_Init_SteamHTMLSurface, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct HTML_BrowserReady_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{HTML_BrowserReady_t}, f::Symbol)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_BrowserReady_t, f::Symbol)
    r = Ref{HTML_BrowserReady_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_BrowserReady_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_BrowserReady_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_NeedsPaint_t
    data::NTuple{52, UInt8}
end

function Base.getproperty(x::Ptr{HTML_NeedsPaint_t}, f::Symbol)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :pBGRA && return Ptr{Ptr{Cchar}}(x + 4)
    f === :unWide && return Ptr{uint32}(x + 12)
    f === :unTall && return Ptr{uint32}(x + 16)
    f === :unUpdateX && return Ptr{uint32}(x + 20)
    f === :unUpdateY && return Ptr{uint32}(x + 24)
    f === :unUpdateWide && return Ptr{uint32}(x + 28)
    f === :unUpdateTall && return Ptr{uint32}(x + 32)
    f === :unScrollX && return Ptr{uint32}(x + 36)
    f === :unScrollY && return Ptr{uint32}(x + 40)
    f === :flPageScale && return Ptr{Cfloat}(x + 44)
    f === :unPageSerial && return Ptr{uint32}(x + 48)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_NeedsPaint_t, f::Symbol)
    r = Ref{HTML_NeedsPaint_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_NeedsPaint_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_NeedsPaint_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_StartRequest_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{HTML_StartRequest_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamhtmlsurface.h:254:1)") && return Ptr{Cvoid}(x + 0)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :pchURL && return Ptr{Ptr{Cchar}}(x + 0)
    f === :pchTarget && return Ptr{Ptr{Cchar}}(x + 0)
    f === :pchPostData && return Ptr{Ptr{Cchar}}(x + 0)
    f === :bIsRedirect && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_StartRequest_t, f::Symbol)
    r = Ref{HTML_StartRequest_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_StartRequest_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_StartRequest_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_CloseBrowser_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{HTML_CloseBrowser_t}, f::Symbol)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_CloseBrowser_t, f::Symbol)
    r = Ref{HTML_CloseBrowser_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_CloseBrowser_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_CloseBrowser_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_URLChanged_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{HTML_URLChanged_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamhtmlsurface.h:274:1)") && return Ptr{Cvoid}(x + 0)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :pchURL && return Ptr{Ptr{Cchar}}(x + 0)
    f === :pchPostData && return Ptr{Ptr{Cchar}}(x + 0)
    f === :bIsRedirect && return Ptr{Cint}(x + 0)
    f === :pchPageTitle && return Ptr{Ptr{Cchar}}(x + 0)
    f === :bNewNavigation && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_URLChanged_t, f::Symbol)
    r = Ref{HTML_URLChanged_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_URLChanged_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_URLChanged_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_FinishedRequest_t
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{HTML_FinishedRequest_t}, f::Symbol)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :pchURL && return Ptr{Ptr{Cchar}}(x + 4)
    f === :pchPageTitle && return Ptr{Ptr{Cchar}}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_FinishedRequest_t, f::Symbol)
    r = Ref{HTML_FinishedRequest_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_FinishedRequest_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_FinishedRequest_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_OpenLinkInNewTab_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{HTML_OpenLinkInNewTab_t}, f::Symbol)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :pchURL && return Ptr{Ptr{Cchar}}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_OpenLinkInNewTab_t, f::Symbol)
    r = Ref{HTML_OpenLinkInNewTab_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_OpenLinkInNewTab_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_OpenLinkInNewTab_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_ChangedTitle_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{HTML_ChangedTitle_t}, f::Symbol)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :pchTitle && return Ptr{Ptr{Cchar}}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_ChangedTitle_t, f::Symbol)
    r = Ref{HTML_ChangedTitle_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_ChangedTitle_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_ChangedTitle_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_SearchResults_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{HTML_SearchResults_t}, f::Symbol)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :unResults && return Ptr{uint32}(x + 4)
    f === :unCurrentMatch && return Ptr{uint32}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_SearchResults_t, f::Symbol)
    r = Ref{HTML_SearchResults_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_SearchResults_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_SearchResults_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_CanGoBackAndForward_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{HTML_CanGoBackAndForward_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamhtmlsurface.h:325:1)") && return Ptr{Cvoid}(x + 0)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :bCanGoBack && return Ptr{Cint}(x + 0)
    f === :bCanGoForward && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_CanGoBackAndForward_t, f::Symbol)
    r = Ref{HTML_CanGoBackAndForward_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_CanGoBackAndForward_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_CanGoBackAndForward_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_HorizontalScroll_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{HTML_HorizontalScroll_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamhtmlsurface.h:335:1)") && return Ptr{Cvoid}(x + 0)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :unScrollMax && return Ptr{uint32}(x + 0)
    f === :unScrollCurrent && return Ptr{uint32}(x + 0)
    f === :flPageScale && return Ptr{Cfloat}(x + 0)
    f === :bVisible && return Ptr{Cint}(x + 0)
    f === :unPageSize && return Ptr{uint32}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_HorizontalScroll_t, f::Symbol)
    r = Ref{HTML_HorizontalScroll_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_HorizontalScroll_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_HorizontalScroll_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_VerticalScroll_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{HTML_VerticalScroll_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamhtmlsurface.h:348:1)") && return Ptr{Cvoid}(x + 0)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :unScrollMax && return Ptr{uint32}(x + 0)
    f === :unScrollCurrent && return Ptr{uint32}(x + 0)
    f === :flPageScale && return Ptr{Cfloat}(x + 0)
    f === :bVisible && return Ptr{Cint}(x + 0)
    f === :unPageSize && return Ptr{uint32}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_VerticalScroll_t, f::Symbol)
    r = Ref{HTML_VerticalScroll_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_VerticalScroll_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_VerticalScroll_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_LinkAtPosition_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{HTML_LinkAtPosition_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamhtmlsurface.h:361:1)") && return Ptr{Cvoid}(x + 0)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :x && return Ptr{uint32}(x + 0)
    f === :y && return Ptr{uint32}(x + 0)
    f === :pchURL && return Ptr{Ptr{Cchar}}(x + 0)
    f === :bInput && return Ptr{Cint}(x + 0)
    f === :bLiveLink && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_LinkAtPosition_t, f::Symbol)
    r = Ref{HTML_LinkAtPosition_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_LinkAtPosition_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_LinkAtPosition_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_JSAlert_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{HTML_JSAlert_t}, f::Symbol)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :pchMessage && return Ptr{Ptr{Cchar}}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_JSAlert_t, f::Symbol)
    r = Ref{HTML_JSAlert_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_JSAlert_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_JSAlert_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_JSConfirm_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{HTML_JSConfirm_t}, f::Symbol)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :pchMessage && return Ptr{Ptr{Cchar}}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_JSConfirm_t, f::Symbol)
    r = Ref{HTML_JSConfirm_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_JSConfirm_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_JSConfirm_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_FileOpenDialog_t
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{HTML_FileOpenDialog_t}, f::Symbol)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :pchTitle && return Ptr{Ptr{Cchar}}(x + 4)
    f === :pchInitialFile && return Ptr{Ptr{Cchar}}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_FileOpenDialog_t, f::Symbol)
    r = Ref{HTML_FileOpenDialog_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_FileOpenDialog_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_FileOpenDialog_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_NewWindow_t
    data::NTuple{32, UInt8}
end

function Base.getproperty(x::Ptr{HTML_NewWindow_t}, f::Symbol)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :pchURL && return Ptr{Ptr{Cchar}}(x + 4)
    f === :unX && return Ptr{uint32}(x + 12)
    f === :unY && return Ptr{uint32}(x + 16)
    f === :unWide && return Ptr{uint32}(x + 20)
    f === :unTall && return Ptr{uint32}(x + 24)
    f === :unNewWindow_BrowserHandle_IGNORE && return Ptr{HHTMLBrowser}(x + 28)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_NewWindow_t, f::Symbol)
    r = Ref{HTML_NewWindow_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_NewWindow_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_NewWindow_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_SetCursor_t
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{HTML_SetCursor_t}, f::Symbol)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :eMouseCursor && return Ptr{uint32}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_SetCursor_t, f::Symbol)
    r = Ref{HTML_SetCursor_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_SetCursor_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_SetCursor_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_StatusText_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{HTML_StatusText_t}, f::Symbol)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :pchMsg && return Ptr{Ptr{Cchar}}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_StatusText_t, f::Symbol)
    r = Ref{HTML_StatusText_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_StatusText_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_StatusText_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_ShowToolTip_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{HTML_ShowToolTip_t}, f::Symbol)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :pchMsg && return Ptr{Ptr{Cchar}}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_ShowToolTip_t, f::Symbol)
    r = Ref{HTML_ShowToolTip_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_ShowToolTip_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_ShowToolTip_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_UpdateToolTip_t
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{HTML_UpdateToolTip_t}, f::Symbol)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :pchMsg && return Ptr{Ptr{Cchar}}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_UpdateToolTip_t, f::Symbol)
    r = Ref{HTML_UpdateToolTip_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_UpdateToolTip_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_UpdateToolTip_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_HideToolTip_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{HTML_HideToolTip_t}, f::Symbol)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_HideToolTip_t, f::Symbol)
    r = Ref{HTML_HideToolTip_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_HideToolTip_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_HideToolTip_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct HTML_BrowserRestarted_t
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{HTML_BrowserRestarted_t}, f::Symbol)
    f === :unBrowserHandle && return Ptr{HHTMLBrowser}(x + 0)
    f === :unOldBrowserHandle && return Ptr{HHTMLBrowser}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::HTML_BrowserRestarted_t, f::Symbol)
    r = Ref{HTML_BrowserRestarted_t}(x)
    ptr = Base.unsafe_convert(Ptr{HTML_BrowserRestarted_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{HTML_BrowserRestarted_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const SteamItemInstanceID_t = uint64

const SteamItemDef_t = int32

@cenum ESteamItemFlags::UInt32 begin
    k_ESteamItemNoTrade = 1
    k_ESteamItemRemoved = 256
    k_ESteamItemConsumed = 512
end

struct SteamItemDetails_t
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{SteamItemDetails_t}, f::Symbol)
    f === :m_itemId && return Ptr{SteamItemInstanceID_t}(x + 0)
    f === :m_iDefinition && return Ptr{SteamItemDef_t}(x + 8)
    f === :m_unQuantity && return Ptr{uint16}(x + 12)
    f === :m_unFlags && return Ptr{uint16}(x + 14)
    return getfield(x, f)
end

function Base.getproperty(x::SteamItemDetails_t, f::Symbol)
    r = Ref{SteamItemDetails_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamItemDetails_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamItemDetails_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const SteamInventoryResult_t = int32

const SteamInventoryUpdateHandle_t = uint64

# no prototype is found for this function at isteaminventory.h:363:25, please use with caution
function SteamInventory()
    ccall((:SteamInventory, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamInventory(p)
    ccall((:SteamInternal_Init_SteamInventory, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

# no prototype is found for this function at isteaminventory.h:367:25, please use with caution
function SteamGameServerInventory()
    ccall((:SteamGameServerInventory, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamGameServerInventory(p)
    ccall((:SteamInternal_Init_SteamGameServerInventory, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct SteamInventoryResultReady_t
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{SteamInventoryResultReady_t}, f::Symbol)
    f === :m_handle && return Ptr{SteamInventoryResult_t}(x + 0)
    f === :m_result && return Ptr{EResult}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::SteamInventoryResultReady_t, f::Symbol)
    r = Ref{SteamInventoryResultReady_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamInventoryResultReady_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamInventoryResultReady_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamInventoryFullUpdate_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{SteamInventoryFullUpdate_t}, f::Symbol)
    f === :m_handle && return Ptr{SteamInventoryResult_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamInventoryFullUpdate_t, f::Symbol)
    r = Ref{SteamInventoryFullUpdate_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamInventoryFullUpdate_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamInventoryFullUpdate_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamInventoryDefinitionUpdate_t
    data::NTuple{0, UInt8}
end

function Base.getproperty(x::Ptr{SteamInventoryDefinitionUpdate_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteaminventory.h:401:2)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamInventoryDefinitionUpdate_t, f::Symbol)
    r = Ref{SteamInventoryDefinitionUpdate_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamInventoryDefinitionUpdate_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamInventoryDefinitionUpdate_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamInventoryEligiblePromoItemDefIDs_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SteamInventoryEligiblePromoItemDefIDs_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteaminventory.h:407:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_result && return Ptr{EResult}(x + 0)
    f === :m_steamID && return Ptr{Cint}(x + 0)
    f === :m_numEligiblePromoItemDefs && return Ptr{Cint}(x + 0)
    f === :m_bCachedData && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamInventoryEligiblePromoItemDefIDs_t, f::Symbol)
    r = Ref{SteamInventoryEligiblePromoItemDefIDs_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamInventoryEligiblePromoItemDefIDs_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamInventoryEligiblePromoItemDefIDs_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamInventoryStartPurchaseResult_t
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{SteamInventoryStartPurchaseResult_t}, f::Symbol)
    f === :m_result && return Ptr{EResult}(x + 0)
    f === :m_ulOrderID && return Ptr{uint64}(x + 4)
    f === :m_ulTransID && return Ptr{uint64}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::SteamInventoryStartPurchaseResult_t, f::Symbol)
    r = Ref{SteamInventoryStartPurchaseResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamInventoryStartPurchaseResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamInventoryStartPurchaseResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamInventoryRequestPricesResult_t
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{SteamInventoryRequestPricesResult_t}, f::Symbol)
    f === :m_result && return Ptr{EResult}(x + 0)
    f === :m_rgchCurrency && return Ptr{NTuple{4, Cchar}}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::SteamInventoryRequestPricesResult_t, f::Symbol)
    r = Ref{SteamInventoryRequestPricesResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamInventoryRequestPricesResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamInventoryRequestPricesResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum ETimelineGameMode::UInt32 begin
    k_ETimelineGameMode_Invalid = 0
    k_ETimelineGameMode_Playing = 1
    k_ETimelineGameMode_Staging = 2
    k_ETimelineGameMode_Menus = 3
    k_ETimelineGameMode_LoadingScreen = 4
    k_ETimelineGameMode_Max = 5
end

@cenum ETimelineEventClipPriority::UInt32 begin
    k_ETimelineEventClipPriority_Invalid = 0
    k_ETimelineEventClipPriority_None = 1
    k_ETimelineEventClipPriority_Standard = 2
    k_ETimelineEventClipPriority_Featured = 3
end

const TimelineEventHandle_t = uint64

# no prototype is found for this function at isteamtimeline.h:229:24, please use with caution
function SteamTimeline()
    ccall((:SteamTimeline, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamTimeline(p)
    ccall((:SteamInternal_Init_SteamTimeline, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct SteamTimelineGamePhaseRecordingExists_t
    data::NTuple{88, UInt8}
end

function Base.getproperty(x::Ptr{SteamTimelineGamePhaseRecordingExists_t}, f::Symbol)
    f === :m_rgchPhaseID && return Ptr{NTuple{64, Cchar}}(x + 0)
    f === :m_ulRecordingMS && return Ptr{uint64}(x + 64)
    f === :m_ulLongestClipMS && return Ptr{uint64}(x + 72)
    f === :m_unClipCount && return Ptr{uint32}(x + 80)
    f === :m_unScreenshotCount && return Ptr{uint32}(x + 84)
    return getfield(x, f)
end

function Base.getproperty(x::SteamTimelineGamePhaseRecordingExists_t, f::Symbol)
    r = Ref{SteamTimelineGamePhaseRecordingExists_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamTimelineGamePhaseRecordingExists_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamTimelineGamePhaseRecordingExists_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamTimelineEventRecordingExists_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SteamTimelineEventRecordingExists_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamtimeline.h:251:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_ulEventID && return Ptr{uint64}(x + 0)
    f === :m_bRecordingExists && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamTimelineEventRecordingExists_t, f::Symbol)
    r = Ref{SteamTimelineEventRecordingExists_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamTimelineEventRecordingExists_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamTimelineEventRecordingExists_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

# no prototype is found for this function at isteamvideo.h:48:21, please use with caution
function SteamVideo()
    ccall((:SteamVideo, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamVideo(p)
    ccall((:SteamInternal_Init_SteamVideo, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct GetVideoURLResult_t
    data::NTuple{264, UInt8}
end

function Base.getproperty(x::Ptr{GetVideoURLResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_unVideoAppID && return Ptr{AppId_t}(x + 4)
    f === :m_rgchURL && return Ptr{NTuple{256, Cchar}}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::GetVideoURLResult_t, f::Symbol)
    r = Ref{GetVideoURLResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{GetVideoURLResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GetVideoURLResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct GetOPFSettingsResult_t
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{GetOPFSettingsResult_t}, f::Symbol)
    f === :m_eResult && return Ptr{EResult}(x + 0)
    f === :m_unVideoAppID && return Ptr{AppId_t}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::GetOPFSettingsResult_t, f::Symbol)
    r = Ref{GetOPFSettingsResult_t}(x)
    ptr = Base.unsafe_convert(Ptr{GetOPFSettingsResult_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{GetOPFSettingsResult_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct BroadcastUploadStart_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{BroadcastUploadStart_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamvideo.h:63:1)") && return Ptr{Cvoid}(x + 0)
    f === :m_bIsRTMP && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::BroadcastUploadStart_t, f::Symbol)
    r = Ref{BroadcastUploadStart_t}(x)
    ptr = Base.unsafe_convert(Ptr{BroadcastUploadStart_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{BroadcastUploadStart_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct BroadcastUploadStop_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{BroadcastUploadStop_t}, f::Symbol)
    f === :m_eResult && return Ptr{EBroadcastUploadResult}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::BroadcastUploadStop_t, f::Symbol)
    r = Ref{BroadcastUploadStop_t}(x)
    ptr = Base.unsafe_convert(Ptr{BroadcastUploadStop_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{BroadcastUploadStop_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum EParentalFeature::UInt32 begin
    k_EFeatureInvalid = 0
    k_EFeatureStore = 1
    k_EFeatureCommunity = 2
    k_EFeatureProfile = 3
    k_EFeatureFriends = 4
    k_EFeatureNews = 5
    k_EFeatureTrading = 6
    k_EFeatureSettings = 7
    k_EFeatureConsole = 8
    k_EFeatureBrowser = 9
    k_EFeatureParentalSetup = 10
    k_EFeatureLibrary = 11
    k_EFeatureTest = 12
    k_EFeatureSiteLicense = 13
    k_EFeatureKioskMode_Deprecated = 14
    k_EFeatureBlockAlways = 15
    k_EFeatureMax = 16
end

# no prototype is found for this function at isteamparentalsettings.h:53:32, please use with caution
function SteamParentalSettings()
    ccall((:SteamParentalSettings, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamParentalSettings(p)
    ccall((:SteamInternal_Init_SteamParentalSettings, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct SteamParentalSettingsChanged_t
end

@cenum ESteamDeviceFormFactor::UInt32 begin
    k_ESteamDeviceFormFactorUnknown = 0
    k_ESteamDeviceFormFactorPhone = 1
    k_ESteamDeviceFormFactorTablet = 2
    k_ESteamDeviceFormFactorComputer = 3
    k_ESteamDeviceFormFactorTV = 4
    k_ESteamDeviceFormFactorVRHeadset = 5
end

const RemotePlaySessionID_t = uint32

# no prototype is found for this function at isteamremoteplay.h:68:26, please use with caution
function SteamRemotePlay()
    ccall((:SteamRemotePlay, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamRemotePlay(p)
    ccall((:SteamInternal_Init_SteamRemotePlay, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

struct SteamRemotePlaySessionConnected_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{SteamRemotePlaySessionConnected_t}, f::Symbol)
    f === :m_unSessionID && return Ptr{RemotePlaySessionID_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamRemotePlaySessionConnected_t, f::Symbol)
    r = Ref{SteamRemotePlaySessionConnected_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamRemotePlaySessionConnected_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamRemotePlaySessionConnected_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamRemotePlaySessionDisconnected_t
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{SteamRemotePlaySessionDisconnected_t}, f::Symbol)
    f === :m_unSessionID && return Ptr{RemotePlaySessionID_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamRemotePlaySessionDisconnected_t, f::Symbol)
    r = Ref{SteamRemotePlaySessionDisconnected_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamRemotePlaySessionDisconnected_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamRemotePlaySessionDisconnected_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamRemotePlayTogetherGuestInvite_t
    data::NTuple{1024, UInt8}
end

function Base.getproperty(x::Ptr{SteamRemotePlayTogetherGuestInvite_t}, f::Symbol)
    f === :m_szConnectURL && return Ptr{NTuple{1024, Cchar}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamRemotePlayTogetherGuestInvite_t, f::Symbol)
    r = Ref{SteamRemotePlayTogetherGuestInvite_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamRemotePlayTogetherGuestInvite_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamRemotePlayTogetherGuestInvite_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

mutable struct SteamDatagramRelayAuthTicket end

mutable struct SteamDatagramHostedAddress end

mutable struct SteamDatagramGameCoordinatorServerLogin end

mutable struct SteamNetworkingFakeIPResult_t end

# typedef void ( * FnSteamNetConnectionStatusChanged ) ( SteamNetConnectionStatusChangedCallback_t * )
const FnSteamNetConnectionStatusChanged = Ptr{Cvoid}

# typedef void ( * FnSteamNetAuthenticationStatusChanged ) ( SteamNetAuthenticationStatus_t * )
const FnSteamNetAuthenticationStatusChanged = Ptr{Cvoid}

# typedef void ( * FnSteamRelayNetworkStatusChanged ) ( SteamRelayNetworkStatus_t * )
const FnSteamRelayNetworkStatusChanged = Ptr{Cvoid}

# typedef void ( * FnSteamNetworkingMessagesSessionRequest ) ( SteamNetworkingMessagesSessionRequest_t * )
const FnSteamNetworkingMessagesSessionRequest = Ptr{Cvoid}

# typedef void ( * FnSteamNetworkingMessagesSessionFailed ) ( SteamNetworkingMessagesSessionFailed_t * )
const FnSteamNetworkingMessagesSessionFailed = Ptr{Cvoid}

# typedef void ( * FnSteamNetworkingFakeIPResult ) ( SteamNetworkingFakeIPResult_t * )
const FnSteamNetworkingFakeIPResult = Ptr{Cvoid}

"""
Handle used to identify a connection to a remote host.
"""
const HSteamNetConnection = uint32

"""
Handle used to identify a "listen socket". Unlike traditional Berkeley sockets, a listen socket and a connection are two different abstractions.
"""
const HSteamListenSocket = uint32

"""
Handle used to identify a poll group, used to query many connections at once efficiently.
"""
const HSteamNetPollGroup = uint32

"""
Used to return English-language diagnostic error messages to caller. (For debugging or spewing to a console, etc. Not intended for UI.)
"""
const SteamNetworkingErrMsg = NTuple{1024, Cchar}

"""
Identifier used for a network location point of presence. (E.g. a Valve data center.) Typically you won't need to directly manipulate these.
"""
const SteamNetworkingPOPID = uint32

"""
A local timestamp. You can subtract two timestamps to get the number of elapsed microseconds. This is guaranteed to increase over time during the lifetime of a process, but not globally across runs. You don't need to worry about the value wrapping around. Note that the underlying clock might not actually have microsecond resolution.
"""
const SteamNetworkingMicroseconds = int64

"""
    ESteamNetworkingAvailability

Describe the status of a particular network resource
"""
@cenum ESteamNetworkingAvailability::Int32 begin
    k_ESteamNetworkingAvailability_CannotTry = -102
    k_ESteamNetworkingAvailability_Failed = -101
    k_ESteamNetworkingAvailability_Previously = -100
    k_ESteamNetworkingAvailability_Retrying = -10
    k_ESteamNetworkingAvailability_NeverTried = 1
    k_ESteamNetworkingAvailability_Waiting = 2
    k_ESteamNetworkingAvailability_Attempting = 3
    k_ESteamNetworkingAvailability_Current = 100
    k_ESteamNetworkingAvailability_Unknown = 0
    k_ESteamNetworkingAvailability__Force32bit = 2147483647
end

"""
    ESteamNetworkingIdentityType

Different methods of describing the identity of a network host
"""
@cenum ESteamNetworkingIdentityType::UInt32 begin
    k_ESteamNetworkingIdentityType_Invalid = 0
    k_ESteamNetworkingIdentityType_SteamID = 16
    k_ESteamNetworkingIdentityType_XboxPairwiseID = 17
    k_ESteamNetworkingIdentityType_SonyPSN = 18
    k_ESteamNetworkingIdentityType_IPAddress = 1
    k_ESteamNetworkingIdentityType_GenericString = 2
    k_ESteamNetworkingIdentityType_GenericBytes = 3
    k_ESteamNetworkingIdentityType_UnknownType = 4
    k_ESteamNetworkingIdentityType__Force32bit = 2147483647
end

"""
    ESteamNetworkingFakeIPType

"Fake IPs" are assigned to hosts, to make it easier to interface with older code that assumed all hosts will have an IPv4 address
"""
@cenum ESteamNetworkingFakeIPType::UInt32 begin
    k_ESteamNetworkingFakeIPType_Invalid = 0
    k_ESteamNetworkingFakeIPType_NotFake = 1
    k_ESteamNetworkingFakeIPType_GlobalIPv4 = 2
    k_ESteamNetworkingFakeIPType_LocalIPv4 = 3
    k_ESteamNetworkingFakeIPType__Force32Bit = 2147483647
end

struct SteamNetworkingIPAddr
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SteamNetworkingIPAddr}, f::Symbol)
    f === :Clear && return Ptr{Cvoid}(x + 0)
    f === :IsIPv6AllZeros && return Ptr{Cvoid}(x + 0)
    f === :SetIPv6 && return Ptr{Cvoid}(x + 0)
    f === :SetIPv4 && return Ptr{Cvoid}(x + 0)
    f === :IsIPv4 && return Ptr{Cvoid}(x + 0)
    f === :GetIPv4 && return Ptr{Cvoid}(x + 0)
    f === :SetIPv6LocalHost && return Ptr{Cvoid}(x + 0)
    f === :IsLocalHost && return Ptr{Cvoid}(x + 0)
    f === Symbol("enum (unnamed at sdk/public/steam/steamnetworkingtypes.h:211:2)") && return Ptr{Cvoid}(x + 0)
    f === :ToString && return Ptr{Cvoid}(x + 0)
    f === :ParseString && return Ptr{Cvoid}(x + 0)
    f === :IPv4MappedAddress && return Ptr{Cvoid}(x + 0)
    f === Symbol("union (anonymous at sdk/public/steam/steamnetworkingtypes.h:234:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_port && return Ptr{uint16}(x + 0)
    f === :operator && return Ptr{Cint}(x + 0)
    f === :GetFakeIPType && return Ptr{Cvoid}(x + 0)
    f === :IsFakeIP && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamNetworkingIPAddr, f::Symbol)
    r = Ref{SteamNetworkingIPAddr}(x)
    ptr = Base.unsafe_convert(Ptr{SteamNetworkingIPAddr}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamNetworkingIPAddr}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamNetworkingIdentity
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SteamNetworkingIdentity}, f::Symbol)
    f === :m_eType && return Ptr{ESteamNetworkingIdentityType}(x + 0)
    f === :Clear && return Ptr{Cvoid}(x + 0)
    f === :IsInvalid && return Ptr{Cvoid}(x + 0)
    f === :SetSteamID && return Ptr{Cvoid}(x + 0)
    f === :GetSteamID && return Ptr{Cvoid}(x + 0)
    f === :SetSteamID64 && return Ptr{Cvoid}(x + 0)
    f === :GetSteamID64 && return Ptr{Cvoid}(x + 0)
    f === :SetXboxPairwiseID && return Ptr{Cvoid}(x + 0)
    f === :GetXboxPairwiseID && return Ptr{Cvoid}(x + 0)
    f === :SetPSNID && return Ptr{Cvoid}(x + 0)
    f === :GetPSNID && return Ptr{Cvoid}(x + 0)
    f === :SetIPAddr && return Ptr{Cvoid}(x + 0)
    f === :GetIPAddr && return Ptr{Cvoid}(x + 0)
    f === :SetIPv4Addr && return Ptr{Cvoid}(x + 0)
    f === :GetIPv4 && return Ptr{Cvoid}(x + 0)
    f === :GetFakeIPType && return Ptr{Cvoid}(x + 0)
    f === :IsFakeIP && return Ptr{Cvoid}(x + 0)
    f === :IsLocalHost && return Ptr{Cvoid}(x + 0)
    f === :SetGenericString && return Ptr{Cvoid}(x + 0)
    f === :GetGenericString && return Ptr{Cvoid}(x + 0)
    f === :SetGenericBytes && return Ptr{Cvoid}(x + 0)
    f === :GetGenericBytes && return Ptr{Cvoid}(x + 0)
    f === :operator && return Ptr{Cint}(x + 0)
    f === :ToString && return Ptr{Cvoid}(x + 0)
    f === :ParseString && return Ptr{Cvoid}(x + 0)
    f === Symbol("enum (unnamed at sdk/public/steam/steamnetworkingtypes.h:318:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_cbSize && return Ptr{Cint}(x + 0)
    f === Symbol("union (unnamed at sdk/public/steam/steamnetworkingtypes.h:332:2)") && return Ptr{Cvoid}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamNetworkingIdentity, f::Symbol)
    r = Ref{SteamNetworkingIdentity}(x)
    ptr = Base.unsafe_convert(Ptr{SteamNetworkingIdentity}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamNetworkingIdentity}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    ESteamNetworkingConnectionState

High level connection status
"""
@cenum ESteamNetworkingConnectionState::Int32 begin
    k_ESteamNetworkingConnectionState_None = 0
    k_ESteamNetworkingConnectionState_Connecting = 1
    k_ESteamNetworkingConnectionState_FindingRoute = 2
    k_ESteamNetworkingConnectionState_Connected = 3
    k_ESteamNetworkingConnectionState_ClosedByPeer = 4
    k_ESteamNetworkingConnectionState_ProblemDetectedLocally = 5
    k_ESteamNetworkingConnectionState_FinWait = -1
    k_ESteamNetworkingConnectionState_Linger = -2
    k_ESteamNetworkingConnectionState_Dead = -3
    k_ESteamNetworkingConnectionState__Force32Bit = 2147483647
end

"""
    ESteamNetConnectionEnd

Enumerate various causes of connection termination. These are designed to work similar to HTTP error codes: the numeric range gives you a rough classification as to the source of the problem.
"""
@cenum ESteamNetConnectionEnd::UInt32 begin
    k_ESteamNetConnectionEnd_Invalid = 0
    k_ESteamNetConnectionEnd_App_Min = 1000
    k_ESteamNetConnectionEnd_App_Generic = 1000
    k_ESteamNetConnectionEnd_App_Max = 1999
    k_ESteamNetConnectionEnd_AppException_Min = 2000
    k_ESteamNetConnectionEnd_AppException_Generic = 2000
    k_ESteamNetConnectionEnd_AppException_Max = 2999
    k_ESteamNetConnectionEnd_Local_Min = 3000
    k_ESteamNetConnectionEnd_Local_OfflineMode = 3001
    k_ESteamNetConnectionEnd_Local_ManyRelayConnectivity = 3002
    k_ESteamNetConnectionEnd_Local_HostedServerPrimaryRelay = 3003
    k_ESteamNetConnectionEnd_Local_NetworkConfig = 3004
    k_ESteamNetConnectionEnd_Local_Rights = 3005
    k_ESteamNetConnectionEnd_Local_P2P_ICE_NoPublicAddresses = 3006
    k_ESteamNetConnectionEnd_Local_Max = 3999
    k_ESteamNetConnectionEnd_Remote_Min = 4000
    k_ESteamNetConnectionEnd_Remote_Timeout = 4001
    k_ESteamNetConnectionEnd_Remote_BadCrypt = 4002
    k_ESteamNetConnectionEnd_Remote_BadCert = 4003
    k_ESteamNetConnectionEnd_Remote_BadProtocolVersion = 4006
    k_ESteamNetConnectionEnd_Remote_P2P_ICE_NoPublicAddresses = 4007
    k_ESteamNetConnectionEnd_Remote_Max = 4999
    k_ESteamNetConnectionEnd_Misc_Min = 5000
    k_ESteamNetConnectionEnd_Misc_Generic = 5001
    k_ESteamNetConnectionEnd_Misc_InternalError = 5002
    k_ESteamNetConnectionEnd_Misc_Timeout = 5003
    k_ESteamNetConnectionEnd_Misc_SteamConnectivity = 5005
    k_ESteamNetConnectionEnd_Misc_NoRelaySessionsToClient = 5006
    k_ESteamNetConnectionEnd_Misc_P2P_Rendezvous = 5008
    k_ESteamNetConnectionEnd_Misc_P2P_NAT_Firewall = 5009
    k_ESteamNetConnectionEnd_Misc_PeerSentNoConnection = 5010
    k_ESteamNetConnectionEnd_Misc_Max = 5999
    k_ESteamNetConnectionEnd__Force32Bit = 2147483647
end

struct SteamNetConnectionInfo_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SteamNetConnectionInfo_t}, f::Symbol)
    f === :m_identityRemote && return Ptr{SteamNetworkingIdentity}(x + 0)
    f === :m_nUserData && return Ptr{int64}(x + 0)
    f === :m_hListenSocket && return Ptr{HSteamListenSocket}(x + 0)
    f === :m_addrRemote && return Ptr{SteamNetworkingIPAddr}(x + 0)
    f === :m__pad1 && return Ptr{uint16}(x + 0)
    f === :m_idPOPRemote && return Ptr{SteamNetworkingPOPID}(x + 0)
    f === :m_idPOPRelay && return Ptr{SteamNetworkingPOPID}(x + 0)
    f === :m_eState && return Ptr{ESteamNetworkingConnectionState}(x + 0)
    f === :m_eEndReason && return Ptr{Cint}(x + 0)
    f === :m_szEndDebug && return Ptr{NTuple{128, Cchar}}(x + 0)
    f === :m_szConnectionDescription && return Ptr{NTuple{128, Cchar}}(x + 0)
    f === :m_nFlags && return Ptr{Cint}(x + 0)
    f === :reserved && return Ptr{NTuple{63, uint32}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamNetConnectionInfo_t, f::Symbol)
    r = Ref{SteamNetConnectionInfo_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamNetConnectionInfo_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamNetConnectionInfo_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    SteamNetConnectionRealTimeStatus_t

Quick connection state, pared down to something you could call more frequently without it being too big of a perf hit.
"""
struct SteamNetConnectionRealTimeStatus_t
    data::NTuple{120, UInt8}
end

function Base.getproperty(x::Ptr{SteamNetConnectionRealTimeStatus_t}, f::Symbol)
    f === :m_eState && return Ptr{ESteamNetworkingConnectionState}(x + 0)
    f === :m_nPing && return Ptr{Cint}(x + 4)
    f === :m_flConnectionQualityLocal && return Ptr{Cfloat}(x + 8)
    f === :m_flConnectionQualityRemote && return Ptr{Cfloat}(x + 12)
    f === :m_flOutPacketsPerSec && return Ptr{Cfloat}(x + 16)
    f === :m_flOutBytesPerSec && return Ptr{Cfloat}(x + 20)
    f === :m_flInPacketsPerSec && return Ptr{Cfloat}(x + 24)
    f === :m_flInBytesPerSec && return Ptr{Cfloat}(x + 28)
    f === :m_nSendRateBytesPerSecond && return Ptr{Cint}(x + 32)
    f === :m_cbPendingUnreliable && return Ptr{Cint}(x + 36)
    f === :m_cbPendingReliable && return Ptr{Cint}(x + 40)
    f === :m_cbSentUnackedReliable && return Ptr{Cint}(x + 44)
    f === :m_usecQueueTime && return Ptr{SteamNetworkingMicroseconds}(x + 48)
    f === :reserved && return Ptr{NTuple{16, uint32}}(x + 56)
    return getfield(x, f)
end

function Base.getproperty(x::SteamNetConnectionRealTimeStatus_t, f::Symbol)
    r = Ref{SteamNetConnectionRealTimeStatus_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamNetConnectionRealTimeStatus_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamNetConnectionRealTimeStatus_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    SteamNetConnectionRealTimeLaneStatus_t

Quick status of a particular lane
"""
struct SteamNetConnectionRealTimeLaneStatus_t
    data::NTuple{64, UInt8}
end

function Base.getproperty(x::Ptr{SteamNetConnectionRealTimeLaneStatus_t}, f::Symbol)
    f === :m_cbPendingUnreliable && return Ptr{Cint}(x + 0)
    f === :m_cbPendingReliable && return Ptr{Cint}(x + 4)
    f === :m_cbSentUnackedReliable && return Ptr{Cint}(x + 8)
    f === :_reservePad1 && return Ptr{Cint}(x + 12)
    f === :m_usecQueueTime && return Ptr{SteamNetworkingMicroseconds}(x + 16)
    f === :reserved && return Ptr{NTuple{10, uint32}}(x + 24)
    return getfield(x, f)
end

function Base.getproperty(x::SteamNetConnectionRealTimeLaneStatus_t, f::Symbol)
    r = Ref{SteamNetConnectionRealTimeLaneStatus_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamNetConnectionRealTimeLaneStatus_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamNetConnectionRealTimeLaneStatus_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamNetworkingMessage_t
    m_pData::Ptr{Cvoid}
    m_cbSize::Cint
    m_conn::HSteamNetConnection
    m_identityPeer::SteamNetworkingIdentity
    m_nConnUserData::int64
    m_usecTimeReceived::SteamNetworkingMicroseconds
    m_nMessageNumber::int64
    m_pfnFreeData::Ptr{Cvoid}
    m_pfnRelease::Ptr{Cvoid}
    m_nChannel::Cint
    m_nFlags::Cint
    m_nUserData::int64
    m_idxLane::uint16
    _pad1__::uint16
    Release::Cvoid
    GetSize::Cvoid
end

"""
    SteamNetworkPingLocation_t

Object that describes a "location" on the Internet with sufficient detail that we can reasonably estimate an upper bound on the ping between the two hosts, even if a direct route between the hosts is not possible, and the connection must be routed through the Steam Datagram Relay network. This does not contain any information that identifies the host. Indeed, if two hosts are in the same building or otherwise have nearly identical networking characteristics, then it's valid to use the same location object for both of them.

NOTE: This object should only be used in the same process! Do not serialize it, send it over the wire, or persist it in a file or database! If you need to do that, convert it to a string representation using the methods in ISteamNetworkingUtils().
"""
struct SteamNetworkPingLocation_t
    m_data::NTuple{512, uint8}
end

"""
    ESteamNetworkingConfigScope

Configuration values can be applied to different types of objects.
"""
@cenum ESteamNetworkingConfigScope::UInt32 begin
    k_ESteamNetworkingConfig_Global = 1
    k_ESteamNetworkingConfig_SocketsInterface = 2
    k_ESteamNetworkingConfig_ListenSocket = 3
    k_ESteamNetworkingConfig_Connection = 4
    k_ESteamNetworkingConfigScope__Force32Bit = 2147483647
end

@cenum ESteamNetworkingConfigDataType::UInt32 begin
    k_ESteamNetworkingConfig_Int32 = 1
    k_ESteamNetworkingConfig_Int64 = 2
    k_ESteamNetworkingConfig_Float = 3
    k_ESteamNetworkingConfig_String = 4
    k_ESteamNetworkingConfig_Ptr = 5
    k_ESteamNetworkingConfigDataType__Force32Bit = 2147483647
end

"""
    ESteamNetworkingConfigValue

Configuration options
"""
@cenum ESteamNetworkingConfigValue::UInt32 begin
    k_ESteamNetworkingConfig_Invalid = 0
    k_ESteamNetworkingConfig_TimeoutInitial = 24
    k_ESteamNetworkingConfig_TimeoutConnected = 25
    k_ESteamNetworkingConfig_SendBufferSize = 9
    k_ESteamNetworkingConfig_RecvBufferSize = 47
    k_ESteamNetworkingConfig_RecvBufferMessages = 48
    k_ESteamNetworkingConfig_RecvMaxMessageSize = 49
    k_ESteamNetworkingConfig_RecvMaxSegmentsPerPacket = 50
    k_ESteamNetworkingConfig_ConnectionUserData = 40
    k_ESteamNetworkingConfig_SendRateMin = 10
    k_ESteamNetworkingConfig_SendRateMax = 11
    k_ESteamNetworkingConfig_NagleTime = 12
    k_ESteamNetworkingConfig_IP_AllowWithoutAuth = 23
    k_ESteamNetworkingConfig_IPLocalHost_AllowWithoutAuth = 52
    k_ESteamNetworkingConfig_MTU_PacketSize = 32
    k_ESteamNetworkingConfig_MTU_DataSize = 33
    k_ESteamNetworkingConfig_Unencrypted = 34
    k_ESteamNetworkingConfig_SymmetricConnect = 37
    k_ESteamNetworkingConfig_LocalVirtualPort = 38
    k_ESteamNetworkingConfig_DualWifi_Enable = 39
    k_ESteamNetworkingConfig_EnableDiagnosticsUI = 46
    k_ESteamNetworkingConfig_SendTimeSincePreviousPacket = 59
    k_ESteamNetworkingConfig_FakePacketLoss_Send = 2
    k_ESteamNetworkingConfig_FakePacketLoss_Recv = 3
    k_ESteamNetworkingConfig_FakePacketLag_Send = 4
    k_ESteamNetworkingConfig_FakePacketLag_Recv = 5
    k_ESteamNetworkingConfig_FakePacketJitter_Send_Avg = 53
    k_ESteamNetworkingConfig_FakePacketJitter_Send_Max = 54
    k_ESteamNetworkingConfig_FakePacketJitter_Send_Pct = 55
    k_ESteamNetworkingConfig_FakePacketJitter_Recv_Avg = 56
    k_ESteamNetworkingConfig_FakePacketJitter_Recv_Max = 57
    k_ESteamNetworkingConfig_FakePacketJitter_Recv_Pct = 58
    k_ESteamNetworkingConfig_FakePacketReorder_Send = 6
    k_ESteamNetworkingConfig_FakePacketReorder_Recv = 7
    k_ESteamNetworkingConfig_FakePacketReorder_Time = 8
    k_ESteamNetworkingConfig_FakePacketDup_Send = 26
    k_ESteamNetworkingConfig_FakePacketDup_Recv = 27
    k_ESteamNetworkingConfig_FakePacketDup_TimeMax = 28
    k_ESteamNetworkingConfig_PacketTraceMaxBytes = 41
    k_ESteamNetworkingConfig_FakeRateLimit_Send_Rate = 42
    k_ESteamNetworkingConfig_FakeRateLimit_Send_Burst = 43
    k_ESteamNetworkingConfig_FakeRateLimit_Recv_Rate = 44
    k_ESteamNetworkingConfig_FakeRateLimit_Recv_Burst = 45
    k_ESteamNetworkingConfig_OutOfOrderCorrectionWindowMicroseconds = 51
    k_ESteamNetworkingConfig_Callback_ConnectionStatusChanged = 201
    k_ESteamNetworkingConfig_Callback_AuthStatusChanged = 202
    k_ESteamNetworkingConfig_Callback_RelayNetworkStatusChanged = 203
    k_ESteamNetworkingConfig_Callback_MessagesSessionRequest = 204
    k_ESteamNetworkingConfig_Callback_MessagesSessionFailed = 205
    k_ESteamNetworkingConfig_Callback_CreateConnectionSignaling = 206
    k_ESteamNetworkingConfig_Callback_FakeIPResult = 207
    k_ESteamNetworkingConfig_P2P_STUN_ServerList = 103
    k_ESteamNetworkingConfig_P2P_Transport_ICE_Enable = 104
    k_ESteamNetworkingConfig_P2P_Transport_ICE_Penalty = 105
    k_ESteamNetworkingConfig_P2P_Transport_SDR_Penalty = 106
    k_ESteamNetworkingConfig_P2P_TURN_ServerList = 107
    k_ESteamNetworkingConfig_P2P_TURN_UserList = 108
    k_ESteamNetworkingConfig_P2P_TURN_PassList = 109
    k_ESteamNetworkingConfig_P2P_Transport_ICE_Implementation = 110
    k_ESteamNetworkingConfig_SDRClient_ConsecutitivePingTimeoutsFailInitial = 19
    k_ESteamNetworkingConfig_SDRClient_ConsecutitivePingTimeoutsFail = 20
    k_ESteamNetworkingConfig_SDRClient_MinPingsBeforePingAccurate = 21
    k_ESteamNetworkingConfig_SDRClient_SingleSocket = 22
    k_ESteamNetworkingConfig_SDRClient_ForceRelayCluster = 29
    k_ESteamNetworkingConfig_SDRClient_DevTicket = 30
    k_ESteamNetworkingConfig_SDRClient_ForceProxyAddr = 31
    k_ESteamNetworkingConfig_SDRClient_FakeClusterPing = 36
    k_ESteamNetworkingConfig_SDRClient_LimitPingProbesToNearestN = 60
    k_ESteamNetworkingConfig_LogLevel_AckRTT = 13
    k_ESteamNetworkingConfig_LogLevel_PacketDecode = 14
    k_ESteamNetworkingConfig_LogLevel_Message = 15
    k_ESteamNetworkingConfig_LogLevel_PacketGaps = 16
    k_ESteamNetworkingConfig_LogLevel_P2PRendezvous = 17
    k_ESteamNetworkingConfig_LogLevel_SDRRelayPings = 18
    k_ESteamNetworkingConfig_ECN = 999
    k_ESteamNetworkingConfig_DELETED_EnumerateDevVars = 35
    k_ESteamNetworkingConfigValue__Force32Bit = 2147483647
end

struct SteamNetworkingConfigValue_t
    m_eValue::ESteamNetworkingConfigValue
    m_eDataType::ESteamNetworkingConfigDataType
    m_val#::var"union (unnamed at sdk/public/steam/steamnetworkingtypes.h:1730:2)"
    SetInt32::Cvoid
end

"""
    ESteamNetworkingGetConfigValueResult

Return value of ISteamNetworkintgUtils::GetConfigValue
"""
@cenum ESteamNetworkingGetConfigValueResult::Int32 begin
    k_ESteamNetworkingGetConfigValue_BadValue = -1
    k_ESteamNetworkingGetConfigValue_BadScopeObj = -2
    k_ESteamNetworkingGetConfigValue_BufferTooSmall = -3
    k_ESteamNetworkingGetConfigValue_OK = 1
    k_ESteamNetworkingGetConfigValue_OKInherited = 2
    k_ESteamNetworkingGetConfigValueResult__Force32Bit = 2147483647
end

"""
    ESteamNetworkingSocketsDebugOutputType

Detail level for diagnostic output callback. See ISteamNetworkingUtils::SetDebugOutputFunction
"""
@cenum ESteamNetworkingSocketsDebugOutputType::UInt32 begin
    k_ESteamNetworkingSocketsDebugOutputType_None = 0
    k_ESteamNetworkingSocketsDebugOutputType_Bug = 1
    k_ESteamNetworkingSocketsDebugOutputType_Error = 2
    k_ESteamNetworkingSocketsDebugOutputType_Important = 3
    k_ESteamNetworkingSocketsDebugOutputType_Warning = 4
    k_ESteamNetworkingSocketsDebugOutputType_Msg = 5
    k_ESteamNetworkingSocketsDebugOutputType_Verbose = 6
    k_ESteamNetworkingSocketsDebugOutputType_Debug = 7
    k_ESteamNetworkingSocketsDebugOutputType_Everything = 8
    k_ESteamNetworkingSocketsDebugOutputType__Force32Bit = 2147483647
end

# typedef void ( * FSteamNetworkingSocketsDebugOutput ) ( ESteamNetworkingSocketsDebugOutputType nType , const char * pszMsg )
"""
Setup callback for debug output, and the desired verbosity you want.
"""
const FSteamNetworkingSocketsDebugOutput = Ptr{Cvoid}

"""
    CalculateSteamNetworkingPOPIDFromString(pszCode)

Convert 3- or 4-character ID to 32-bit int.
"""
function CalculateSteamNetworkingPOPIDFromString(pszCode)
    ccall((:CalculateSteamNetworkingPOPIDFromString, libsteam_api), SteamNetworkingPOPID, (Ptr{Cchar},), pszCode)
end

struct SteamNetworkingPOPIDRender
    SteamNetworkingPOPIDRender::Cvoid
end

const ISteamNetworkingMessage = SteamNetworkingMessage_t

const SteamDatagramErrMsg = SteamNetworkingErrMsg

struct SteamNetworkingMessagesSessionRequest_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SteamNetworkingMessagesSessionRequest_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamnetworkingmessages.h:138:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_identityRemote && return Ptr{SteamNetworkingIdentity}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamNetworkingMessagesSessionRequest_t, f::Symbol)
    r = Ref{SteamNetworkingMessagesSessionRequest_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamNetworkingMessagesSessionRequest_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamNetworkingMessagesSessionRequest_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct SteamNetworkingMessagesSessionFailed_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SteamNetworkingMessagesSessionFailed_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamnetworkingmessages.h:155:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_info && return Ptr{SteamNetConnectionInfo_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamNetworkingMessagesSessionFailed_t, f::Symbol)
    r = Ref{SteamNetworkingMessagesSessionFailed_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamNetworkingMessagesSessionFailed_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamNetworkingMessagesSessionFailed_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

function SteamInternal_Init_SteamNetworkingMessages_SteamAPI(p)
    ccall((:SteamInternal_Init_SteamNetworkingMessages_SteamAPI, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

# no prototype is found for this function at isteamnetworkingmessages.h:189:2, please use with caution
function SteamNetworkingMessages_SteamAPI()
    ccall((:SteamNetworkingMessages_SteamAPI, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamGameServerNetworkingMessages_SteamAPI(p)
    ccall((:SteamInternal_Init_SteamGameServerNetworkingMessages_SteamAPI, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

# no prototype is found for this function at isteamnetworkingmessages.h:190:2, please use with caution
function SteamGameServerNetworkingMessages_SteamAPI()
    ccall((:SteamGameServerNetworkingMessages_SteamAPI, libsteam_api), Ptr{Cint}, ())
end

# no prototype is found for this function at isteamnetworkingmessages.h:193:36, please use with caution
function SteamNetworkingMessages()
    ccall((:SteamNetworkingMessages, libsteam_api), Ptr{Cint}, ())
end

# no prototype is found for this function at isteamnetworkingmessages.h:194:36, please use with caution
function SteamGameServerNetworkingMessages()
    ccall((:SteamGameServerNetworkingMessages, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamNetworkingSockets_SteamAPI(p)
    ccall((:SteamInternal_Init_SteamNetworkingSockets_SteamAPI, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

# no prototype is found for this function at isteamnetworkingsockets.h:941:2, please use with caution
function SteamNetworkingSockets_SteamAPI()
    ccall((:SteamNetworkingSockets_SteamAPI, libsteam_api), Ptr{Cint}, ())
end

function SteamInternal_Init_SteamGameServerNetworkingSockets_SteamAPI(p)
    ccall((:SteamInternal_Init_SteamGameServerNetworkingSockets_SteamAPI, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

# no prototype is found for this function at isteamnetworkingsockets.h:942:2, please use with caution
function SteamGameServerNetworkingSockets_SteamAPI()
    ccall((:SteamGameServerNetworkingSockets_SteamAPI, libsteam_api), Ptr{Cint}, ())
end

# no prototype is found for this function at isteamnetworkingsockets.h:945:35, please use with caution
function SteamNetworkingSockets()
    ccall((:SteamNetworkingSockets, libsteam_api), Ptr{Cint}, ())
end

# no prototype is found for this function at isteamnetworkingsockets.h:946:35, please use with caution
function SteamGameServerNetworkingSockets()
    ccall((:SteamGameServerNetworkingSockets, libsteam_api), Ptr{Cint}, ())
end

struct SteamNetConnectionStatusChangedCallback_t
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{SteamNetConnectionStatusChangedCallback_t}, f::Symbol)
    f === Symbol("enum (unnamed at sdk/public/steam/isteamnetworkingsockets.h:996:2)") && return Ptr{Cvoid}(x + 0)
    f === :m_hConn && return Ptr{HSteamNetConnection}(x + 0)
    f === :m_info && return Ptr{SteamNetConnectionInfo_t}(x + 0)
    f === :m_eOldState && return Ptr{ESteamNetworkingConnectionState}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::SteamNetConnectionStatusChangedCallback_t, f::Symbol)
    r = Ref{SteamNetConnectionStatusChangedCallback_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamNetConnectionStatusChangedCallback_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamNetConnectionStatusChangedCallback_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    SteamNetAuthenticationStatus_t

A struct used to describe our readiness to participate in authenticated, encrypted communication. In order to do this we need:

- The list of trusted CA certificates that might be relevant for this app. - A valid certificate issued by a CA.

This callback is posted whenever the state of our readiness changes.
"""
struct SteamNetAuthenticationStatus_t
    data::NTuple{260, UInt8}
end

function Base.getproperty(x::Ptr{SteamNetAuthenticationStatus_t}, f::Symbol)
    f === :m_eAvail && return Ptr{ESteamNetworkingAvailability}(x + 0)
    f === :m_debugMsg && return Ptr{NTuple{256, Cchar}}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::SteamNetAuthenticationStatus_t, f::Symbol)
    r = Ref{SteamNetAuthenticationStatus_t}(x)
    ptr = Base.unsafe_convert(Ptr{SteamNetAuthenticationStatus_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{SteamNetAuthenticationStatus_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

function SteamInternal_Init_SteamNetworkingUtils_SteamAPI(p)
    ccall((:SteamInternal_Init_SteamNetworkingUtils_SteamAPI, libsteam_api), Cvoid, (Ptr{Ptr{Cint}},), p)
end

# no prototype is found for this function at isteamnetworkingutils.h:372:2, please use with caution
function SteamNetworkingUtils_SteamAPI()
    ccall((:SteamNetworkingUtils_SteamAPI, libsteam_api), Ptr{Cint}, ())
end

# no prototype is found for this function at isteamnetworkingutils.h:383:33, please use with caution
function SteamNetworkingUtils()
    ccall((:SteamNetworkingUtils, libsteam_api), Ptr{Cint}, ())
end

"""
    SteamRelayNetworkStatus_t

A struct used to describe our readiness to use the relay network. To do this we first need to fetch the network configuration, which describes what POPs are available.
"""
struct SteamRelayNetworkStatus_t
    m_eAvail::ESteamNetworkingAvailability
    m_bPingMeasurementInProgress::Cint
    m_eAvailNetworkConfig::ESteamNetworkingAvailability
    m_eAvailAnyRelay::ESteamNetworkingAvailability
    m_debugMsg::NTuple{256, Cchar}
end

struct SteamNetworkingIdentityRender
    SteamNetworkingIdentityRender::Cvoid
end

struct SteamNetworkingIPAddrRender
    SteamNetworkingIPAddrRender::Cvoid
end

@cenum ESteamAPIInitResult::UInt32 begin
    k_ESteamAPIInitResult_OK = 0
    k_ESteamAPIInitResult_FailedGeneric = 1
    k_ESteamAPIInitResult_NoSteamClient = 2
    k_ESteamAPIInitResult_VersionMismatch = 3
end

function SteamAPI_InitEx(pOutErrMsg)
    ccall((:SteamAPI_InitFlat, libsteam_api), ESteamAPIInitResult, (Ptr{SteamErrMsg},), pOutErrMsg)
end

# no prototype is found for this function at steam_api.h:97:13, please use with caution
function SteamAPI_Init()
    ccall((:SteamAPI_Init, libsteam_api), Cint, ())
end

"""
    union (unnamed at sdk/public/steam/steamnetworkingtypes.h:1730:2)

Option value
"""
struct var"union (unnamed at sdk/public/steam/steamnetworkingtypes.h:1730:2)"
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{var"union (unnamed at sdk/public/steam/steamnetworkingtypes.h:1730:2)"}, f::Symbol)
    f === :m_int32 && return Ptr{Int32}(x + 0)
    f === :m_int64 && return Ptr{Int64}(x + 0)
    f === :m_float && return Ptr{Cfloat}(x + 0)
    f === :m_string && return Ptr{Ptr{Cchar}}(x + 0)
    f === :m_ptr && return Ptr{Ptr{Cvoid}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"union (unnamed at sdk/public/steam/steamnetworkingtypes.h:1730:2)", f::Symbol)
    r = Ref{var"union (unnamed at sdk/public/steam/steamnetworkingtypes.h:1730:2)"}(x)
    ptr = Base.unsafe_convert(Ptr{var"union (unnamed at sdk/public/steam/steamnetworkingtypes.h:1730:2)"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"union (unnamed at sdk/public/steam/steamnetworkingtypes.h:1730:2)"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

# Skipping MacroDefinition: S_CALLTYPE __cdecl

# Skipping MacroDefinition: S_API extern "C"

# Skipping MacroDefinition: __cdecl

const STEAMCLIENT_INTERFACE_VERSION = "SteamClient021"

const STEAMUSER_INTERFACE_VERSION = "SteamUser023"

const STEAMFRIENDS_INTERFACE_VERSION = "SteamFriends017"

const STEAMUTILS_INTERFACE_VERSION = "SteamUtils010"

const k_nMaxLobbyKeyLength = 255

const STEAMMATCHMAKING_INTERFACE_VERSION = "SteamMatchMaking009"

const STEAMMATCHMAKINGSERVERS_INTERFACE_VERSION = "SteamMatchMakingServers002"

const STEAMGAMESEARCH_INTERFACE_VERSION = "SteamMatchGameSearch001"

const STEAMPARTIES_INTERFACE_VERSION = "SteamParties002"

const STEAMREMOTESTORAGE_INTERFACE_VERSION = "STEAMREMOTESTORAGE_INTERFACE_VERSION016"

const STEAMUSERSTATS_INTERFACE_VERSION = "STEAMUSERSTATS_INTERFACE_VERSION013"

const STEAMAPPS_INTERFACE_VERSION = "STEAMAPPS_INTERFACE_VERSION008"

const STEAMNETWORKING_INTERFACE_VERSION = "SteamNetworking006"

const INVALID_SCREENSHOT_HANDLE = 0

const STEAMSCREENSHOTS_INTERFACE_VERSION = "STEAMSCREENSHOTS_INTERFACE_VERSION003"

const STEAMMUSIC_INTERFACE_VERSION = "STEAMMUSIC_INTERFACE_VERSION001"

const k_SteamMusicNameMaxLength = 255

const k_SteamMusicPNGMaxLength = 65535

const STEAMMUSICREMOTE_INTERFACE_VERSION = "STEAMMUSICREMOTE_INTERFACE_VERSION001"

const INVALID_HTTPREQUEST_HANDLE = 0

const INVALID_HTTPCOOKIE_HANDLE = 0

const STEAMHTTP_INTERFACE_VERSION = "STEAMHTTP_INTERFACE_VERSION003"

const STEAM_INPUT_MAX_COUNT = 16

const STEAM_INPUT_MAX_ANALOG_ACTIONS = 24

const STEAM_INPUT_MAX_DIGITAL_ACTIONS = 256

const STEAM_INPUT_MAX_ORIGINS = 8

const STEAM_INPUT_MAX_ACTIVE_LAYERS = 16

const STEAM_INPUT_MIN_ANALOG_ACTION_DATA = -(Float32(1.0))

const STEAM_INPUT_MAX_ANALOG_ACTION_DATA = Float32(1.0)

const STEAMINPUT_INTERFACE_VERSION = "SteamInput006"

const STEAM_CONTROLLER_MAX_COUNT = 16

const STEAM_CONTROLLER_MAX_ANALOG_ACTIONS = 24

const STEAM_CONTROLLER_MAX_DIGITAL_ACTIONS = 256

const STEAM_CONTROLLER_MAX_ORIGINS = 8

const STEAM_CONTROLLER_MAX_ACTIVE_LAYERS = 16

const STEAM_CONTROLLER_MIN_ANALOG_ACTION_DATA = -(Float32(1.0))

const STEAM_CONTROLLER_MAX_ANALOG_ACTION_DATA = Float32(1.0)

const ControllerAnalogActionData_t = InputAnalogActionData_t

const ControllerDigitalActionData_t = InputDigitalActionData_t

const ControllerMotionData_t = InputMotionData_t

const STEAMCONTROLLER_INTERFACE_VERSION = "SteamController008"

const STEAMUGC_INTERFACE_VERSION = "STEAMUGC_INTERFACE_VERSION020"

const STEAMHTMLSURFACE_INTERFACE_VERSION = "STEAMHTMLSURFACE_INTERFACE_VERSION_005"

const STEAMINVENTORY_INTERFACE_VERSION = "STEAMINVENTORY_INTERFACE_V003"

const STEAMTIMELINE_INTERFACE_VERSION = "STEAMTIMELINE_INTERFACE_V004"

const STEAMVIDEO_INTERFACE_VERSION = "STEAMVIDEO_INTERFACE_V007"

const STEAMPARENTALSETTINGS_INTERFACE_VERSION = "STEAMPARENTALSETTINGS_INTERFACE_VERSION001"

const STEAMREMOTEPLAY_INTERFACE_VERSION = "STEAMREMOTEPLAY_INTERFACE_VERSION002"

# Skipping MacroDefinition: STEAMNETWORKINGSOCKETS_INTERFACE extern "C"

const STEAMNETWORKINGMESSAGES_INTERFACE_VERSION = "SteamNetworkingMessages002"

const STEAMNETWORKINGSOCKETS_INTERFACE_VERSION = "SteamNetworkingSockets012"

const STEAMNETWORKINGUTILS_INTERFACE_VERSION = "SteamNetworkingUtils004"

end # module
