List = {}
Value = 0
NumberIndex = 1
IndexUsed = false
NumberTable = {
--[[{ 1,1,3,467 },
{ 1,6,8,114 },
{ 3,3,4,35 },
{ 3,7,9,633 },
{ 5,1,3,617 },
{ 6,8,9,58 },
{ 7,3,5,592 },
{ 8,7,9,755 },
{ 10,2,4,664 },
{ 10,6,8,598 },]]
}
SpecialCharTable = {
--[[{ 2,4 },
{ 4,7 },
{ 5,4 },
{ 6,6 },
{ 9,4 },
{ 9,6 },]]
}

function LineMatch(PartLine, CharLine)
	if PartLine == CharLine then
		return true
	elseif PartLine+1 == CharLine then
		return true
	elseif PartLine-1 == CharLine then
		return true
	end
	return false
end

function IndexMatch(PartIndexStart, PartIndexEnd, CharIndex)
	PartIndexStart = PartIndexStart-1 or PartIndexStart
	for j=PartIndexStart,PartIndexEnd+1,1 do
		if j == CharIndex then
			return true
		end
	end
	return false
end

function PartIsValid(PartTable)
	for j, charentry in ipairs(SpecialCharTable) do
		if LineMatch(PartTable[1], charentry[1]) then
			--print("Number "..PartTable[4].." Line Match using "..PartTable[1].." and "..charentry[1])
			if IndexMatch(PartTable[2], PartTable[3], charentry[2]) then
				--print("Number "..PartTable[4].." Index Match using "..PartTable[2].." to "..PartTable[3].." and "..charentry[2])
				return true
			end
		end
	end
	return false
end

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

function IsNumberString(String)
	if String ~= "." then
		if IsNumber(String) then
			return true
		end
	end
	return false
end

function IsSpecialChar(String)
	if String ~= "." and string.len(String) == 1 then
		if IsNumber(String) == false then
			return true
		end
	end
	return false
end

function IsPeriod(String)
	if String == "." then
		return true
	end
	return false
end

for i, entry in ipairs(List) do
	EntryString = entry.."."
	if IndexUsed then
		NumberIndex = NumberIndex + 1
		--print("Line Start Index "..NumberIndex)
		IndexUsed = false
	end
	--print(EntryString)
	_, PeriodCount = string.gsub(EntryString, ".", ".")
	StringSearchStart = 1
	for j=1,PeriodCount,1 do
		_, StringSearchEnd = string.find(EntryString,".",StringSearchStart)
		if StringSearchEnd then
			--print(tostring(StringSearchEnd))
			WorkString = string.sub(EntryString,StringSearchStart,StringSearchEnd)
			StringSearchStart = StringSearchEnd+1
			if WorkString then
				--print(WorkString)
				if not IsNumber(WorkString) and IndexUsed then
					if j ~= 1 then
						NumberIndex = NumberIndex + 1
						--print("Not a number new index "..NumberIndex)
						IndexUsed = false
					end
				end
				if IsSpecialChar(WorkString) then
					table.insert(SpecialCharTable,{i,j,WorkString})
				elseif IsNumber(WorkString) then
					if NumberTable[NumberIndex] then
						NumberTable[NumberIndex][3] = j
						NumberTable[NumberIndex][4] = NumberTable[NumberIndex][4]..WorkString
					else
						IndexUsed = true
						table.insert(NumberTable,NumberIndex,{i,j,j,WorkString})
					end
				end
			end
		end
	end
end

for i, entry in ipairs(NumberTable) do
	if PartIsValid(entry) then
		--print("Number "..tostring(i).." is valid")
		Value = Value + tonumber(entry[4])
	end
	for j, subentry in ipairs(entry) do
		--print(tostring(subentry))
	end
end
for i, entry in ipairs(SpecialCharTable) do
	for j, subentry in ipairs(entry) do
		print(tostring(subentry))
	end
end

print(tostring(Value))