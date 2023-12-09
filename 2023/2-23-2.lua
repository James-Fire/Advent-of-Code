List = {
}
Value = 0

for i, entry in ipairs(List) do
	EntryString = entry..";"
	MinRed = 0
	MinGreen = 0
	MinBlue = 0
	ColonLoc, _ = string.find(EntryString, ":")
	_, SemiColonCount = string.gsub(EntryString, ";", ";")
	StringSearchStart = ColonLoc+2
	for j=1,SemiColonCount+1,1 do
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
					if string.sub(ColourString,SplitIndex+1,string.len(ColourString)) == "red" and tonumber(string.sub(ColourString,1,SplitIndex-1)) > MinRed then
						MinRed = tonumber(string.sub(ColourString,1,SplitIndex-1))
					elseif string.sub(ColourString,SplitIndex+1,string.len(ColourString)) == "green" and tonumber(string.sub(ColourString,1,SplitIndex-1)) > MinGreen then
						MinGreen = tonumber(string.sub(ColourString,1,SplitIndex-1))
					elseif string.sub(ColourString,SplitIndex+1,string.len(ColourString)) == "blue" and tonumber(string.sub(ColourString,1,SplitIndex-1)) > MinBlue then
						MinBlue = tonumber(string.sub(ColourString,1,SplitIndex-1))
					end
					--print(tostring(ValidGame))
					SubStringSearchStart = SubStringSearchEnd+1
				end
			end
		end
	end
	Value = Value + MinBlue*MinGreen*MinRed
end

print(tostring(Value))