List = {
}
Value = 0

for i, entry in ipairs(List) do
	print("Length of string "..tostring(#entry))
	if Value == -1 then
		print(tostring(j))
		break
	end
	for j=1,#entry,1 do
		print(tostring(j).." "..tostring(Value))
		if string.sub(entry,j,j) == "(" then
			Value = Value + 1
		elseif string.sub(entry,j,j) == ")" then
			Value = Value - 1
		end
		if Value == -1 then
			print(tostring(j))
			break
		end
	end
end


--3569
--3431