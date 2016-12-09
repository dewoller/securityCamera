require 'lfs'
require 'torch' 
require 'gnuplot'


DIR_SEP='/' --should be "/" for Unix platforms (Linux and Mac)
function browseFolder(root, includePattern, callback)  
  -- starting at root, traverse all children directories that match includePattern, when find a directory, call callback with this path
	for entity in lfs.dir(root) do
		if entity~="." and entity~=".." then
			local fullPath=root..DIR_SEP..entity
			--print("root: "..root..", entity: "..entity..", mode: "..(lfs.attributes(fullPath,"mode")or "-")..", full path: "..fullPath)
			local mode=lfs.attributes(fullPath,"mode")
			if mode=="file" then
				--this is where the processing happens. I print the name of the file and its path but it can be any code
				print(root.." > "..entity)
			elseif mode=="directory" then
				browseFolder(fullPath);
			end
		end
	end
end

--this is a sample call
browseFolder(".")


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
cmd:option('--outFile', '', 'name of output file')
cmd:option('--outFileLoss', '', 'name of loss output file')
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

if (opt.outFile ~= '' ) then 
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
end 

if (opt.outFileLoss ~= '' ) then 
  gnuplot.pngfigure( opt.outFileLoss )
  if opt.title ~= '' then
    gnuplot.title(opt.title)
  end
  gnuplot.plot( 
    {opt.v3, torch.Tensor(v3), '-' }
  )

  gnuplot.plotflush()
end  

