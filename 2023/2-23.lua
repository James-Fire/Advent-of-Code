List = {
}
Value = 0

function IsValidGame(Value,String)
	if String == "red" and Value < 13 then
		return true
	elseif String == "green" and Value < 14 then
		return true
	elseif String == "blue" and Value < 15 then
		return true
	end
	return false
end

for i, entry in ipairs(List) do
	EntryString = entry..";"
	ValidGame = true
	ColonLoc, _ = string.find(EntryString, ":")
	FirstSpaceLoc, _ = string.find(EntryString, " ")
	_, SemiColonCount = string.gsub(EntryString, ";", ";")
	StringSearchStart = ColonLoc+2
	for j=1,SemiColonCount+1,1 do
		if ValidGame == false then
			break
		end
		_, StringSearchEnd = string.find(EntryString,";",StringSearchStart)
		if StringSearchEnd then
			WorkString = string.sub(EntryString,StringSearchStart,StringSearchEnd-1)
			WorkString = WorkString..","
			_, index = string.find(WorkString," ")
			--print("Index of first space in WorkString: "..Subindex)
			if index == 1 then
				WorkString = string.gsub(WorkString, " ", "", 1)
			end
			print(WorkString)
			StringSearchStart = StringSearchEnd+1
			_, CommaCount = string.gsub(WorkString, ",", ",")
			SubStringSearchStart = 1
			--print(tostring(CommaCount))
			for k=1,CommaCount+1,1 do
				if ValidGame == false then
					break
				end
				_, SubStringSearchEnd = string.find(WorkString,",",SubStringSearchStart)
				if SubStringSearchEnd then
					ColourString = string.sub(WorkString,SubStringSearchStart,SubStringSearchEnd-1)
					_, Subindex = string.find(ColourString," ")
					--print("Index of first space in ColourString: "..Subindex)
					if Subindex == 1 then
						ColourString = string.gsub(ColourString, " ", "", 1)
					end
					print(ColourString)
					_, SplitIndex = string.find(ColourString," ")
					ValidGame = IsValidGame(tonumber(string.sub(ColourString,1,SplitIndex-1)),string.sub(ColourString,SplitIndex+1,string.len(ColourString)))
					--print(tostring(ValidGame))
					SubStringSearchStart = SubStringSearchEnd+1
				end
			end
		end
	end
	if ValidGame == true then
		GameID = string.sub(EntryString,FirstSpaceLoc+1,ColonLoc-1)
		print("Game "..GameID)
		Value = Value + tonumber(GameID)
	end
end

print(tostring(Value))