List = {
}
Value = 0
GameValue = { }
WinningNumbers = { }
CardNumbers = { }
NumCards = { }

function IsNumber(string)
	if string == "0" then
		return true
	elseif string == "1" then
		return true
	elseif string == "2" then
		return true
	elseif string == "3" then
		return true
	elseif string == "4" then
		return true
	elseif string == "5" then
		return true
	elseif string == "6" then
		return true
	elseif string == "7" then
		return true
	elseif string == "8" then
		return true
	elseif string == "9" then
		return true
	end
	return false
end

for i, entry in ipairs(List) do
	EntryString = entry
	CardNumberTable = { }
	--print(tostring(EntryString))
	ColonLoc, _ = string.find(EntryString, ":")
	BarLoc, _ = string.find(EntryString, "|")
	_, SemiColonCount = string.gsub(EntryString, ";", ";")
	table.insert(GameValue,0)
	table.insert(NumCards,1)
	table.insert(WinningNumbers," "..string.sub(EntryString,ColonLoc+2,BarLoc-2).." ")
	CardNumberString = string.sub(EntryString,BarLoc+2,string.len(entry))
	
	_, SpaceCount = string.gsub(EntryString, " ", " ")
	StringSearchStart = 1
	for j=1,SpaceCount+1,1 do
		StringSearchEnd = StringSearchStart + 1
		if StringSearchEnd then
			WorkString = string.sub(CardNumberString,StringSearchStart,StringSearchEnd)
			StringSearchStart = StringSearchEnd+2
			if IsNumber(string.sub(WorkString,1,1)) or IsNumber(string.sub(WorkString,2,2)) then
				WorkString = " "..WorkString.." "
				table.insert(CardNumberTable,WorkString)
			end
		end
	end
	table.insert(CardNumbers,CardNumberTable)
	--Value = Value + tonumber(GameID)
end

for i, entry in ipairs(CardNumbers) do
	WinNum = 0
	for j, subentry in ipairs(entry) do
		if string.find(WinningNumbers[i], subentry) then
			print("String "..subentry.." is a winner compared to "..WinningNumbers[i])
			WinNum = WinNum + 1
		end
		--print(tostring(string.len(subentry)))
		--print(tostring(subentry))
	end
	print(tostring("Total wins for game "..i.." "..WinNum))
	GameValue[i] = WinNum
	--print(tostring(WinningNumbers[i]))
	--print(tostring(GameValue[i]))
end

for i, entry in ipairs(GameValue) do
	--print(tostring(entry))
	for j=1,entry,1 do
		NumCards[i+j] = NumCards[i+j] + 1*NumCards[i]
	end
	--Value = Value + entry
end

for i, entry in ipairs(NumCards) do
	print(tostring(entry))
	Value = Value + entry
end

print(tostring(Value))