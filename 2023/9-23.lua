List = {
{0,3,6,9,12,15},
{1,3,6,10,15,21},
{10,13,16,21,30,45},
}
Worklist = { }
Value = 0

function PrintAllTableValues(Table)
	for i, entry in ipairs(Table) do
		print(tostring(entry))
	end
end

function AllValuesSame(Table)
	Value1 = Table[1]
	for i, entry in ipairs(Table) do
		if entry ~= Value1 then
			return false
		end
	end
	return true
end

function AllValuesZero(Table)
	for i, entry in ipairs(Table) do
		if entry ~= 0 then
			return false
		end
	end
	return true
end

for i, entry in ipairs(List) do
	PrintAllTableValues(entry)
	--print(tostring(entry))
	--print(tostring(entry[1]))
	SubList = { }
	SubList[1] = entry
	Loop = 2
	while AllValuesZero(SubList[#SubList]) == false do
		print("Loop Count "..tostring(Loop))
		SubSubList = { }
		for j, subentry in ipairs(SubList[Loop-1]) do
			--print(tostring(subentry))
			if SubList[Loop-1][j+1] ~= nil then
				--print("Subtracted number "..tostring(SubList[Loop-1][j+1]-subentry))
				table.insert(SubSubList,SubList[Loop-1][j+1]-subentry)
			end
		end
		SubList[Loop] = SubSubList
		Loop = Loop + 1
	end
	for j, subentry in ipairs(SubList) do
		--PrintAllTableValues(subentry)
	end
	table.insert(Worklist,SubList)
end

for i, entry in ipairs(Worklist) do
	for j, subentry in ipairs(entry) do
		PrintLine = ""
		for k, subsubentry in ipairs(subentry) do
			PrintLine = PrintLine..", "..tostring(subsubentry)
		end
		print(PrintLine)
	end
end

for i, entry in ipairs(Worklist) do
	for j=#entry,1,-1 do
		WorkTable = entry[j]
		DifferenceTable = { }
		if AllValuesSame(WorkTable) then
			print("Current Table is all same values "..WorkTable[1])
			table.insert(WorkTable,WorkTable[#WorkTable])
		--elseif AllValuesSame(entry[j+1]) then
		--	print("Lower Table is all same values "..entry[j+1][1])
		--	table.insert(WorkTable,WorkTable[#WorkTable]+entry[j+1][#entry[j+1]])
		else
			print("Lower and Current Table are not all same values")
			table.insert(WorkTable,WorkTable[#WorkTable]+entry[j+1][#entry[j+1]])
			--[[for k, subentry in ipairs(WorkTable) do
				if WorkTable[k+1] ~= nil then
					table.insert(SubSubList,SubList[Loop-1][j+1]-subentry)
				end
			end]]
		end
	end
end

for i, entry in ipairs(Worklist) do
	print("Extrapolated Value "..i.." "..tostring(entry[1][#entry[1]]))
	Value = Value + entry[1][#entry[1]]
end

for i, entry in ipairs(Worklist) do
	for j, subentry in ipairs(entry) do
		PrintLine = ""
		for k, subsubentry in ipairs(subentry) do
			PrintLine = PrintLine..", "..tostring(subsubentry)
		end
		print(PrintLine)
	end
end

print(tostring(Value))