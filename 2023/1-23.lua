List = { }
Value = 0

function IsNumber(string)
	if string == "1" then
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

function NumberFinder(string)
	Number = 0
	FirstNumber = nil
	LastNumber = nil
	for i=1,string.len(string),1 do
		if IsNumber(string.sub(string,i,i)) then
			FirstNumber = tonumber(string.sub(string,i,i))
			break
		end
	end
	for i=string.len(string),1,-1 do
		if IsNumber(string.sub(string,i,i)) then
			LastNumber = tonumber(string.sub(string,i,i))
			break
		end
	end
	if FirstNumber and LastNumber then
		Number = FirstNumber..LastNumber
	end
	return tonumber(Number)
end

for i, entry in ipairs(List) do
	Number = NumberFinder(entry)
	Value = Value + Number
end

print(tostring(Value))