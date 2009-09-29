class SelectLink
  def initialize(options)
    @scene = options[:scene]
    @name = options[:name]
    @id = options[:id]
  end
  
  def select
    @scene.find_by_name(@name).each { |link| link.style.remove_extension(@scene.styles['selected_toc_item']) }

    toc_link = @scene.find(@id)
    toc_link.style.add_extension(@scene.styles['selected_toc_item'])    
  end
end