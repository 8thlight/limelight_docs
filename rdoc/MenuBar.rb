class_name :text => 'ClassName: Limelight::DSL::MenuBar'
class_description :text => 'A class used to build menu bars using a DSL.'
line_break
codeblock do
code :text => '  MenuBar.build(self) do'
code :text => '    menu("File") do'
code :text => '      item("Open", :open_chosen_scene)'
code :text => '      item("Refresh", :reload)'
code :text => '    end'
code :text => '  end'
end
line_break
class_description :text => 'This example created one menu named 'File' with two menu items: 'Open' and 'Refresh'. The seconds parameter of the menu items is the symbol of a method on the context that will be invoked when the menu item is selected.'
line_break
public_methods_header :text => 'Public Methods'
method do
method_name :text => 'build'
method_parameters :text => '(context, &prop)'
end
method do
method_name :text => 'new'
method_parameters :text => '(context)'
method_description :text => 'This builder must be provided with a context.  All menu item actions will be invoked on the context.'
line_break
end
method do
method_name :text => 'item'
method_parameters :text => '(name, symbol)'
method_description :text => 'Created a new menu item with the provided name.  The symbols paramter is the name of a method on the context that will be invoked when the item is selected.'
line_break
end
method do
method_name :text => 'menu'
method_parameters :text => '(name)'
method_description :text => 'Creates a new menu with the provided name'
line_break
end
