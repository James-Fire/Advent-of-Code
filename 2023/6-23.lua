List = { }
Value = 0
TimeList = { 7, 15,   30 }
DistanceList = { 9,  40,  200 }
WinCount = { }

for i, entry in ipairs(TimeList) do
	Wins = 0
	for j=1,entry-1,1 do
		Distance = (entry-j)*j
		if Distance > DistanceList[i] then
			Wins = Wins + 1
		end
	end
	table.insert(WinCount,Wins)
end

for i, entry in ipairs(WinCount) do
	if Value == 0 then
		Value = entry
	else
		Value = Value*entry
	end
end

print(tostring(Value))