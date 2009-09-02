@height ||= 200
canvas :id => "canvas", :height => @height do
  __install @props if @props
end
