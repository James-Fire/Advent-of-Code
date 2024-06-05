require "lanes"

List = { --Takes a table of index tables like this one
["NBN"] = {"BKF", "NNH"},
}
Directions = "LRLRLRLLRRLRRLRRRLRRLRLLRRRLRRRLRRLLLLRRRLRLLRRLRRLRRLLLRRRLRRRLRRLRLRRLRLRLRLLRRRLRRRLLRRRLRRRLRRRLRLLLRRLRLRRRLRLRRRLLRRRLRLLRLRRRLRLRRRLRRLLRLRLRRLRLRLRRLRLRLRRRLRRLRLLRRLRRRLRRRLRRLRRRLRRLRLRRRLLRRRLLRRLRLRRRLRRRLLRRRLRLRRLRLRLRRLRLLRRLRLRLRRLRRRLRRRLRLRRLRRLLLRRRLLRLRRRLLRRRR"
Value = 0
FinalSteps = 1
Positions = { "AAA", "DVA", "VXA", "JHA", "NMA", "PXA" }
PositionSteps = {}

function CheckTableValue(Value,Table,SubTableIndex)
	for i, v in pairs(Table) do
		if type(v) == "table" then
			if Value == v[SubTableIndex] then
				return true
			end
		else
			if Value == v then
				return true
			end
		end
	end
	return false
end

primes = {}

function isPrime(n)
  local cached = primes[n]
  if cached ~= nil then
    return cached
  end
  for i = 2, math.sqrt(n) do
    if n % i == 0 then
      primes[n] = false
      return false
    end
  end
  primes[n] = true
  return true 
end

function primeFactorization(n)
  local finale = {}
  local newNumber = n
  for i = 2, n do
    if isPrime(i) then
      while newNumber % i == 0 do 
        finale[#finale + 1] = i
        newNumber = newNumber / i
      end
    end
  end
  return finale --table.concat(finale, ", ")
end

function CheckWholeNumberDivisor(Number, Divisor)
	if Number % Divisor == 0 then
		return true
	else
		return false
	end
end

function GetDirection(Index)
	--print(tostring(Index))
	--print(tostring(NewIndex))
	local NewIndex = Index + 1
	while NewIndex > #Directions do
		--print(tostring(NewIndex))
		NewIndex = NewIndex - #Directions
	end
	--print(tostring(NewIndex))
	local Direction = string.sub(Directions,NewIndex,NewIndex)
	if Direction == "R" then
		return 2
	elseif Direction == "L" then
		return 1
	end
end

function StepsToZ(StartingPosition)
	local Steps = 0
	local CurrentPosition = StartingPosition
	local Direction = 1
	local DirectionN = 1
	while string.sub(CurrentPosition,3,3) ~= "Z" do
		DirectionN = GetDirection(Steps)
		Steps = Steps + 1
		CurrentPosition = List[CurrentPosition][DirectionN]
	end
	return Steps
end

Factors = { }

for i, entry in ipairs(Positions) do
	print(entry)
	for j, prime in ipairs(primeFactorization(StepsToZ(entry))) do
		print(prime)
		if CheckTableValue(prime,Factors) == false then
			table.insert(Factors, prime)
		end
	end
end

for i, entry in ipairs(Factors) do
	FinalSteps = FinalSteps * entry
end

print(tostring(FinalSteps))