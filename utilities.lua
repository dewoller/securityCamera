local M = {}
local function M.getFile(dir, pattern )  --  return the list of file that match this pattern
  rv={}
  --scan the directory's files
  for file in lfs.dir(dir) do
      --> look for any files ending with .jpg
      if file:match( pattern ) then
        rv[ #rv + 1 ] = dir .. '/' .. file
      end
  end
  return(rv)
end 

return(M)

