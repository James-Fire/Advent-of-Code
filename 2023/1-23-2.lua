List = { }
Value = 0

function SpelledNumberConverter(string)
	if string == "one" then
		return "1"
	elseif string == "two" then
		return "2"
	elseif string == "three" then
		return "3"
	elseif string == "four" then
		return "4"
	elseif string == "five" then
		return "5"
	elseif string == "six" then
		return "6"
	elseif string == "seven" then
		return "7"
	elseif string == "eight" then
		return "8"
	elseif string == "nine" then
		return "9"
	end
	return nil
end

function IsThreeLetterNumber(string)
	if string == "one" then
		return true
	elseif string == "two" then
		return true
	elseif string == "six" then
		return true
	end
	return false
end

function IsFourLetterNumber(string)
	if string == "four" then
		return true
	elseif string == "five" then
		return true
	elseif string == "nine" then
		return true
	end
	return false
end

function IsFiveLetterNumber(string)
	if string == "three" then
		return true
	elseif string == "seven" then
		return true
	elseif string == "eight" then
		return true
	end
	return false
end

function IsNumberFirstLetter(string)
	if string == "e" then
		return true
	elseif string == "f" then
		return true
	elseif string == "n" then
		return true
	elseif string == "o" then
		return true
	elseif string == "s" then
		return true
	elseif string == "t" then
		return true
	end
	return false
end

function IsNumberLastLetter(string)
	if string == "e" then
		return true
	elseif string == "f" then
		return true
	elseif string == "n" then
		return true
	elseif string == "o" then
		return true
	elseif string == "r" then
		return true
	elseif string == "t" then
		return true
	elseif string == "x" then
		return true
	end
	return false
end

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
	elseif IsThreeLetterNumber(string) then
		return true
	elseif IsFourLetterNumber(string) then
		return true
	elseif IsFiveLetterNumber(string) then
		return true
	end
	return false
end

function NumberFinder(string)
	Number = 0
	FirstNumber = nil
	LastNumber = nil
	for i=1,string.len(string),1 do
		if IsNumberFirstLetter(string.sub(string,i,i)) then
			--print("First Letter Found")
			if IsThreeLetterNumber(string.sub(string,i,i+2)) then
				--print("First Number is 3 letter")
				FirstNumber = SpelledNumberConverter(string.sub(string,i,i+2))
				break
			elseif IsFourLetterNumber(string.sub(string,i,i+3)) then
				--print("First Number is 4 letter")
				FirstNumber = SpelledNumberConverter(string.sub(string,i,i+3))
				break
			elseif IsFiveLetterNumber(string.sub(string,i,i+4)) then
				--print("First Number is 5 letter")
				FirstNumber = SpelledNumberConverter(string.sub(string,i,i+4))
				break
			end
		elseif IsNumber(string.sub(string,i,i)) then
			FirstNumber = tonumber(string.sub(string,i,i))
			break
		end
	end
	for i=string.len(string),1,-1 do
		if IsNumberLastLetter(string.sub(string,i,i)) then
			--print("Last Letter Found")
			if IsThreeLetterNumber(string.sub(string,i-2,i)) then
				--print("Last Number is 3 letter")
				LastNumber = SpelledNumberConverter(string.sub(string,i-2,i))
				break
			elseif IsFourLetterNumber(string.sub(string,i-3,i)) then
				--print("Last Number is 4 letter")
				LastNumber = SpelledNumberConverter(string.sub(string,i-3,i))
				break
			elseif IsFiveLetterNumber(string.sub(string,i-4,i)) then
				--print("Last Number is 5 letter")
				LastNumber = SpelledNumberConverter(string.sub(string,i-4,i))
				break
			end
		elseif IsNumber(string.sub(string,i,i)) then
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
	print("Line "..tostring(i).." value is "..tostring(Number))
	Value = Value + Number
end

print(tostring(Value))