List = {

}
Value = 0
HandList = { } --1 is hand, 2 is bid, 3 is rank, 4 is value
CardStrength = { "A", "K", "Q", "J", "T", "9", "8", "7", "6", "5", "4", "3", "2" }
HandValues = {
"5",
"41",
"32",
"311",
"221",
"2111",
"11111",
}

function CardValue(CardString)
	for i, entry in ipairs(CardStrength) do
		if entry == CardString then
			return i
		end
	end
end
function CalcHandValue(HandString)
	HandValue = 0
	TotalCards = 0
	HandValueString = ""
	TempHandTable = { }
	HandTable = { 0 }
	--print("Hand "..HandString.." value calc")
	for i, entry in ipairs(CardStrength) do
		_, CardCount = string.gsub(HandString, entry, entry)
		TotalCards = TotalCards + CardCount
		if CardCount > 0 then
			table.insert(TempHandTable,CardCount)
		end
		if TotalCards == 5 then
			break
		end
	end
	table.sort(TempHandTable)
	for i, entry in ipairs(TempHandTable) do
		--print(tostring(entry))
		if entry >= HandTable[1] then
			table.insert(HandTable,1,entry)
		else
			table.insert(HandTable,entry)
		end
	end
	for i, entry in ipairs(HandTable) do
		if entry == 0 then
			table.remove(HandTable,i)
			break
		end
	end
	for i, entry in ipairs(HandTable) do
		--print(tostring(entry))
		HandValueString = HandValueString..tostring(entry)
	end
	for i, entry in ipairs(HandValues) do
		if entry == HandValueString then
			HandValue = i
			break
		end
	end
	return HandValue
end

for i, entry in ipairs(List) do
	table.insert(HandList,{string.sub(entry,1,5),string.sub(entry,7,string.len(entry)), 1, CalcHandValue(string.sub(entry,1,5))})
end

HandOrder = { }
table.insert(HandOrder,HandList[1])
--print(tostring(#HandOrder))

for i, entry in ipairs(HandList) do
	print("Hand "..i..", "..tostring(entry[1])..", "..tostring(entry[2])..", "..tostring(entry[3])..", "..tostring(entry[4]))
	for j, subentry in ipairs(HandOrder) do
		print("Checking Hand "..entry[1].." against Hand "..HandOrder[j][1])
		One, Two = string.find(subentry[1], HandOrder[1][1])
		print(tostring(One).." "..tostring(Two))
		if One and Two then
			print("Hand "..entry[1].." is the same as "..HandOrder[1][1]..", doing nothing")
		elseif HandOrder[j][4] < entry[4] then
			print("Hand "..entry[1].." is greater hand value than Hand "..HandOrder[j][1])
			table.insert(HandOrder,j,entry)
			break
		elseif subentry[4] == entry[4] then
			print("Hand "..entry[1].." is equal hand value to Hand "..HandOrder[j][1])
			IncumbentHand = HandOrder[j][1]
			ChallengerHand = entry[1]
			for k=1,5,1 do
				IncumbentCard = CardValue(string.sub(IncumbentHand,k,k))
				ChallengerCard = CardValue(string.sub(ChallengerHand,k,k))
				--print("Card "..k.." Hand "..entry[1].." "..tostring(ChallengerCard).." compare card value to Hand "..HandOrder[j][1].." "..tostring(IncumbentCard))
				if IncumbentCard < ChallengerCard then
					--print("Card "..k.." Hand "..entry[1].." is less card value to Hand "..HandOrder[j][1])
					table.insert(HandOrder,j,entry)
					break
				elseif IncumbentCard > ChallengerCard then
					table.insert(HandOrder,j+1,entry)
					break
				end
			end
			break
		elseif HandOrder[j][4] > entry[4] then
			print("Hand "..entry[1].." is less hand value to Hand "..HandOrder[j][1])
			if HandOrder[j+1] == nil then
				table.insert(HandOrder,j+1,entry)
				break
			end
		end
	end
end

print("Ordered Hands")
for i, entry in ipairs(HandOrder) do
	print("Hand "..i..", "..tostring(entry[1])..", "..tostring(entry[2])..", "..tostring(entry[3])..", "..tostring(entry[4]))
end
print("Ordered Hands Bid Calc")
for i, entry in ipairs(HandOrder) do
	entry[2] = entry[2]*i
	Value = Value + entry[2]
	print("Hand "..i..", "..tostring(entry[1])..", "..tostring(entry[2])..", "..tostring(entry[3])..", "..tostring(entry[4]))
end

--[[for i, entry in ipairs(WinCount) do
	if Value == 0 then
		Value = entry
	else
		Value = Value*entry
	end
end]]

print(tostring(Value))