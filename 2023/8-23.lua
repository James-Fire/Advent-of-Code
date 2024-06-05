List = { --Takes a table of index tables like this one
["NBN"] = {"BKF", "NNH"},
}
Directions = "LRLRLRLLRRLRRLRRRLRRLRLLRRRLRRRLRRLLLLRRRLRLLRRLRRLRRLLLRRRLRRRLRRLRLRRLRLRLRLLRRRLRRRLLRRRLRRRLRRRLRLLLRRLRLRRRLRLRRRLLRRRLRLLRLRRRLRLRRRLRRLLRLRLRRLRLRLRRLRLRLRRRLRRLRLLRRLRRRLRRRLRRLRRRLRRLRLRRRLLRRRLLRRLRLRRRLRRRLLRRRLRLRRLRLRLRRLRLLRRLRLRLRRLRRRLRRRLRLRRLRRLLLRRRLLRLRRRLLRRRR"
Value = 0
Steps = 0
Position = "AAA"
Target = "ZZZ"
TimeStart = os.time()
TimeEnd = 0

function GetDirection(Index)
	--print(tostring(Index))
	--print(tostring(NewIndex))
	NewIndex = Index
	NewIndex = NewIndex + 1
	while NewIndex > #Directions do
		--print(tostring(NewIndex))
		NewIndex = NewIndex - #Directions
	end
	--print(tostring(NewIndex))
	Direction = string.sub(Directions,NewIndex,NewIndex)
	if Direction == "R" then
		return 2
	elseif Direction == "L" then
		return 1
	end
end

while Position ~= Target do
	print("Current position "..Position.." isn't "..Target)
	print("Current step count "..tostring(Steps))
	Position = List[Position][GetDirection(Steps)]
	Steps = Steps + 1
end
print("Final position "..Position)

TimeEnd = os.time()
print(tostring(TimeEnd-TimeStart))
print(tostring(Steps))