local simRad, env, flags = false, getgenv(), {
	["TrackWinWebLaunchFlow"] = false,
	["ReworkFileWatcherWin32"] = false,
	["ShowClientFirstInFacePile"] = false,
	["DebugOutputAbuseReportScreenshot"] = false,
	["ScreenshotHudApi2"] = false,
	["AbuseReportScreenshot"] = false,
	["EnableMicroProfilerDumpScreenshot"] = false,
	["AbuseReportScreenshotPercentage"] = 0,
	["DebugOutputAbuseReportScreenshot"] = false,
	["DebugSimLDLProgramPrintBuildStats"] = false,
	["DebugSimLDLProgramPrintExecStats"] = false,
	["LDLBuildProgramTimeReportRate"] = 0,
	["LDLProgramOpsReportingMinOpCount"] = 0,
	["LDLProgramOpsReportingRate"] = 0,
	["DebugGameServerHeaderBypass"] = false,
	["QKick"] = 0	
}
if setfflag then
	for i,v in pairs(flags)do
		setfflag(i,tostring(v))
	end
end
if setsimulationradius and not simRad then
	hookfunction(setsimulationradius,function(...)
		return sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", ...);
	end);
end
if not checkclosure and isexecutorclosure then
	getgenv().checkclosure = isexecutorclosure;
end
getgenv().getscriptclosures = function(script)
	assert(typeof(script)=="Instance","failed to getscriptclosures, expected script at #1, got "..typeof(script))
	assert((script:IsA'Script'),"failed to getscriptclosures, expected script at #1, got "..script.ClassName)
	local closures={}
	for _,v in pairs(getgc(true))do
		if type(v)=="function" and getfenv(v)==getsenv(script) then
			closures[#closures+1]=v
		end
	end
	return #closures>0 and closures or warn'getscriptclosures: failed to find closures'
end
game:GetService("StarterGui"):SetCore("SendNotification", {
	Text = "Loaded! Credits to flowers.",
	Title = "Daphnе"
})
