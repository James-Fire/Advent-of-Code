require "lanes"


f = lanes.gen(function (RangeStart,RangeAdjust)
	Number = 0
	for i=RangeStart,RangeStart+RangeAdjust do
		Number = Number + i*(i-1)
	end
	return Number
end)

--f = lanes.gen( function( n) return 2 * n end)
TimeStart = os.time()
TimeEnd = 0
Values = {
{3037945983,7439482770},
{743948277,2623786093},
{2,400},
{2,800},
{2,600},
}
a = {}


for i=1,5 do
	a[i] = f(Values[i][1],Values[i][1])[1]
end


print( a[1], a[2], a[3], a[4], a[5] )
TimeEnd = os.time()
print(tostring(TimeEnd-TimeStart)) --98



TimeStart = os.time()
TimeEnd = 0

function f(RangeStart,RangeAdjust)
	Number = 0
	for i=RangeStart,RangeStart+RangeAdjust do
		Number = Number + i*(i-1)
	end
	return Number
end

a = f(3037945983,7439482770)

b = f(743948277,2623786093)

c = f(2,400)

d = f(2,800)

e = f(2,600)

TimeEnd = os.time()

print( a, b, c, d, e )
print(tostring(TimeEnd-TimeStart)) --259