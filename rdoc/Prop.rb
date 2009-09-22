class_name :text => 'ClassName: Limelight::Prop'
class_description :text => 'Prop is the fundamental building block of a scene.  A prop represents a rectangular area in the scene, of almost any dimension. It may have borders, backgrounds, margin, padding, and it may contain other props or text.  However it is the props' Styles that determine their size and appearance.'
line_break
class_description :text => 'A Prop may have one parent and many children.  Hense, when put together, they form a tree structure.  The Scene is the root Prop of a tree.'
line_break
public_methods_header :text => 'Public Methods'
method do
method_name :text => 'event'
method_parameters :text => '(event_symbol)'
end
method do
method_name :text => 'event2'
method_parameters :text => '(event_symbol)'
end
method do
method_name :text => 'events'
method_parameters :text => '()'
end
method do
method_name :text => 'new'
method_parameters :text => '(hash = {})'
method_description :text => 'When creating a Prop, an optional Hash is accepted. These are called initialization options. The key/value pairs in the initialiaztion options will be used to set properties on the Prop, it Style, or included Player properties. These properties are not set until the prop is added to a Prop tree with a Scene.'
line_break
end
method do
method_name :text => '<<'
method_parameters :text => '(child)'
method_description :text => 'Same as add.  Returns self so adding may be chained.'
line_break
codeblock do
code :text => '   prop << child1 << child2 << child3'
end
line_break
end
method do
method_name :text => 'add'
method_parameters :text => '(child)'
method_description :text => 'Add a Prop as a child of this Prop.'
line_break
end
method do
method_name :text => 'add_options'
method_parameters :text => '(more_options)'
method_description :text => 'Allows the addition of extra initialization options.  Will raise an exception if the Prop has already been illuminated (added to a scene).'
line_break
end
method do
method_name :text => 'after_painting'
method_parameters :text => '(flag = true, &block)'
method_description :text => 'A hook to invoke behavior after a Prop is painted.'
line_break
end
method do
method_name :text => 'animate'
method_parameters :text => '(options={}, &block)'
method_description :text => 'Initiate an animation loop.  Options may include :name (string), :updates_per_second (int: defaults to 60) An Animation object is returned. The provided block will be invoked :updates_per_second times per second until the Animation is stopped.'
line_break
codeblock do
code :text => '    @animation = prop.animate(:updates_per_second => 20) do'
code :text => '      prop.style.border_width = (prop.style.top_border_width.to_i + 1).to_s'
code :text => '      @animation.stop if prop.style.top_border_width.to_i > 60'
code :text => '    end'
end
line_break
method_description :text => 'This above example will cause the Prop's border to grow until it is 60 pixels wide.'
line_break
end
method do
method_name :text => 'apply_options'
method_parameters :text => '()'
end
method do
method_name :text => 'area'
method_parameters :text => '()'
method_description :text => 'Returns a Box representing the relative bounds of the Prop. Is useful with usign the Pen.'
line_break
codeblock do
code :text => '   box = prop.area'
code :text => '   box.x, box.y  represents the Prop's location within its parent Prop'
code :text => '   box.width, box.height  represents the Prop's dimensions'
end
line_break
end
method do
method_name :text => 'bordered_area'
method_parameters :text => '()'
method_description :text => 'Returns a Box representing the bounds inside the borders of the prop.  If the Prop's style has no margin or border_width, then this will be equivalant to area.'
line_break
end
method do
method_name :text => 'build'
method_parameters :text => '(options = {}, &block)'
method_description :text => 'Allows the adding of child Props using the PropBuilder DSL.'
line_break
codeblock do
code :text => '    prop.build do'
code :text => '      child1 do'
code :text => '        grand_child'
code :text => '      end'
code :text => '      child2'
code :text => '    end'
end
line_break
end
method do
method_name :text => 'child_area'
method_parameters :text => '()'
method_description :text => 'Returns a Box representing the bounds inside the padding of the prop.  This is the area where child props may be located'
line_break
end
method do
method_name :text => 'define_event'
method_parameters :text => '(symbol, value)'
end
method do
method_name :text => 'find_by_name'
method_parameters :text => '(name, results = [])'
method_description :text => 'Searches all children for Props with the specified name.  Returns an Array of matching Props. Returns an empty Array is none are found.'
line_break
end
method do
method_name :text => 'include_player'
method_parameters :text => '(player_module)'
method_description :text => 'Injects the behavior of the specified Player into the Prop.  The Player must be a Module.'
line_break
end
method do
method_name :text => 'inherit_styles'
method_parameters :text => '()'
end
method do
method_name :text => 'is_event_setter'
method_parameters :text => '(symbol)'
end
method do
method_name :text => 'launch'
method_parameters :text => '(url)'
method_description :text => 'Luanches the spcified URL using the OS's default handlers. For example, opening a URL in a browser:'
line_break
codeblock do
code :text => '   launch('http://www.google.com')'
end
line_break
method_description :text => 'To create a link prop add an accessor on the player (say url) and use that in the prop definition Ex:'
line_break
codeblock do
code :text => '   link :text => "I am a link", :url => "http://www.8thlight.com"'
end
end
method do
method_name :text => 'loader'
method_parameters :text => '()'
method_description :text => 'TODO get rid of me.... The Java Prop interface declares this method.'
end
method do
method_name :text => 'pen'
method_parameters :text => '()'
method_description :text => 'Returns a Pen object. Pen objects allow to you to draw directly on the screen, withing to bounds of this Prop.'
line_break
end
method do
method_name :text => 'play_sound'
method_parameters :text => '(filename)'
method_description :text => 'Plays a sound on the computers audio output.  The parameter is the filename of a .au sound file. This filename should relative to the root directory of the current Production, or an absolute path.'
line_break
end
method do
method_name :text => 'production'
method_parameters :text => '()'
method_description :text => 'Returns the current Production this Prop lives in.'
line_break
end
method do
method_name :text => 'remove'
method_parameters :text => '(child)'
method_description :text => 'Removes a child Prop.  The child Prop will be parentless after removal.'
line_break
end
method do
method_name :text => 'remove_all'
method_parameters :text => '()'
method_description :text => 'Removes all child Props.'
line_break
end
method do
method_name :text => 'scene'
method_parameters :text => '()'
method_description :text => 'Returns the scene to which this prop belongs to.'
line_break
end
method do
method_name :text => 'set_id'
method_parameters :text => '(id)'
end
method do
method_name :text => 'text'
method_parameters :text => '()'
method_description :text => 'Returns the text of the Prop.'
line_break
end
method do
method_name :text => 'text='
method_parameters :text => '(value)'
method_description :text => 'Sets the text of this Prop.  If a prop is given text, it will become sterilized (it may not have any more children). Some Players such as text_box, will cause the text to appear in the text_box.'
line_break
end
