function dumpKeys( a, level )
  level = level or 0
  for i,v in pairs(a) do
    if type(i)=='string' then
      for j=0,level*4 do
        io.write(' ')
      end
      print(i)
      if type(v) == 'table' then
        dumpKeys( v, level + 1 )
      end
    end
  end
end

