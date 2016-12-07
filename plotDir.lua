require 'lfs'
require 'torch' 
require 'gnuplot'

--[[command line arguments]]--

cmd = torch.CmdLine()
cmd:text()
cmd:text('Plot a directory worth of report*.dat files')
cmd:text('Example:')
cmd:text('$> th plotDir.lua --dir /root/save/9f9d4d47696f:1480488006:1/ ')
cmd:text('Options:')
cmd:option('--dir', '.', 'directory for files')
cmd:option('--v1', 'optimizer', 'v1 to plot')
cmd:option('--v2', 'validator', 'v2 to plot')
cmd:option('--v3', 'loss', 'v3 to plot')
cmd:option('--title', '', 'Title to put on plot')
cmd:option('--outFile', './plot.png', 'name of output file')
opt = cmd:parse(arg or {})

if opt.dir ~= "." and opt.outFile == './plot.png' then
  print('plotting to default position' .. opt.dir .. "/plot.png")
   opt.outFile= opt.dir .. "/plot.png"   
end
print('readin files from ' .. opt.dir)
print('plotting to ' .. opt.outFile)

v1={}
v2={}
v3={}
for file in lfs.dir(opt.dir) do
    if file:match( '^report_[0-9]*%.dat$') then
        local f = opt.dir .. '/' .. file
        --print ("\t "..f)
        local dat=torch.load( f )
        --print( opt.v1 )
        --print(dat[ 'optimizer' ])
        v1[ dat.epoch ] = dat[ opt.v1 ].feedback.confusion.accuracy
        v2[ dat.epoch ] = dat[ opt.v2 ].feedback.confusion.accuracy
        v3[ dat.epoch ] = dat.optimizer[opt.v3]
    end
end
gnuplot.pngfigure( opt.outFile )
if opt.title ~= '' then
  gnuplot.title(opt.title)
end
gnuplot.plot( 
  {opt.v1, torch.Tensor(v1), '-' },
  {opt.v2, torch.Tensor(v2), '~' },
  {opt.v3, torch.Tensor(v3), '|' }
)

gnuplot.plotflush()
  


