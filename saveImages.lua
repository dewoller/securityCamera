__=require('image')
function saveImages( images , expected, got)
  for i,picture in ipairs( images:split(1,1) ) do 
    image.save( string.format( '/root/save/tmp/expected_%i_got_%i_%i.jpg', expected[i], got[i], i), picture:squeeze()) 
  end
end

saveImages( a[1], a[2], a[3] )
