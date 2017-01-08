require 'lfs'
require 'torch' 
require 'gnuplot'


DIR_SEP='/' --should be "/" for Unix platforms (Linux and Mac)
function find(root, includePattern, type_, callback)  
  -- starting at root, traverse all children directories, 
  -- when find a directory/file of type_, 
  -- that match includePattern, 
  -- call callback with this path
  for entity in lfs.dir(root) do
      if entity~="." and entity~=".." then
          local fullPath=root..DIR_SEP..entity
          local mode=lfs.attributes(fullPath,"mode")
          if mode=="file" and type_=="F" and fullPath:match( includePattern ) then
            callback( fullPath )
          elseif mode=="directory" then
            if type_=='D' and fullPath:match( includePattern ) then
              callback( fullPath )
            end
            browseFolder(fullPath);
          end
      end
  end
end



--[[command line arguments]]--

cmd = torch.CmdLine()
cmd:text()
cmd:text('Plot multiple directories worth of report*.dat files')
cmd:text('Example:')
cmd:text('$> th plotDir.lua --baseDir /root/save/ --includePattern "/032/" ')
cmd:text('Options:')
cmd:option('--baseDir', '.', 'base directory to start searching for report.dat files')
cmd:option('--includePattern', '.', 'lua string matching pattern of files to include')
cmd:option('--variable', 'loss', 'variable to plot;  optimizer, validator or loss')
cmd:option('--title', '', 'Title to put on plot')
cmd:option('--outFile', './comparision.png', 'name of output file')
cmd:option('--silent', false, 'dont print anything to stdout')
cmd:text()
opt = cmd:parse(arg or {})
if not opt.silent then
   table.print(opt)
  print('readin files starting at  ' .. opt.baseDir)
  print('plotting to ' .. opt.outFile)
end

local plotData={}
local maxEpoch=0

find( opt.baseDir, '/Torch.-%:%d$', 'D', processExperimentDirectory )

function processExperimentDirectory (dirName )
  local key=dirName:match("E%d+/"):match("[^/]*") .. "Size:" .. dirName:match("/%d+/"):match("%d*") 
  find( dirName, '/Report_%d+%.dat$', 'F', processReportFile )
end
function processReportFile ( filename )
  local dat=torch.load( filename )
  local epoch=filename.match("Report_(%d+)%.dat")+0
  if epoch > maxEpoch then
    epoch = maxEpoch
  end
  if opt.variable ==  'loss' then
    plotData[ key ][ epoch ] = dat.optimizer[opt.v3]
  elseif opt.variable ==  'optimizer' then
    plotData[ key ][ epoch ] = dat[ opt.v1 ].feedback.confusion.accuracy
  elseif opt.variable ==  'validator' then
    plotData[ key ][ epoch ] = dat[ opt.v2 ].feedback.confusion.accuracy
  end
end

if (opt.outFile ~= '' ) then 
  gnuplot.pngfigure( opt.outFile )
  if opt.title ~= '' then
    gnuplot.title(opt.title)
  end
  plotStruct = {}
  for key,data in pairs(plotData) do
     plotStruct[ key ] = { key, 1..maxEpoch, data }
  end
  gnuplot.plot(  plotStruct )
  gnuplot.plotflush()
end 


