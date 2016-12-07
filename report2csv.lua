require 'torch' 
require 'lfs' 

--[[command line arguments]]--

cmd = torch.CmdLine()
cmd:text()
cmd:text('Convert data from a report.dat file to csv.  First value is file name ')
cmd:text('Example:')
cmd:text('$> th report2csv.lua --dir /root/save/9f9d4d47696f:1480488006:1/ ')
cmd:text('Options:')
cmd:option('--dir', '', 'directory to dump report files to csv')
cmd:option('--v1', 'optimizer', 'v1 to plot')
cmd:option('--v2', 'validator', 'v2 to plot')
cmd:option('--dump', false , 'dump all variables in files')
opt = cmd:parse(arg or {})

if opt.dir== "" then
  print("I need a directory to convert")
  return
end
for file in lfs.dir(opt.dir) do
    if file:match( '^report_[0-9]*%.dat$') then
        local f = opt.dir .. '/' .. file
        --print ("\t "..f)
        local dat=torch.load( f )
        --print( opt.v1 )
        --print(dat[ 'optimizer' ])
        if opt.dump then 
          print( dat )
        end
        print( string.format('"%s",%f,%f', f, dat[ opt.v1 ].feedback.confusion.accuracy, dat[ opt.v2 ].feedback.confusion.accuracy))
    end
end



