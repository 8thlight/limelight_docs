class_name :text => 'ClassName: Limelight::DSL::MenuBar'
class_description :text => 'A class used to build menu bars using a DSL.

  MenuBar.build(self) do
    menu("File") do
      item("Open", :open_chosen_scene)
      item("Refresh", :reload)
    end
  end

 This example created one menu named 'File' with two menu items: 'Open' and 'Refresh'. The seconds parameter of the
 menu items is the symbol of a method on the context that will be invoked when the menu item is selected.'
public_methods_header :text => 'Public Methods'
method_name :text => 'build'
method_description :text => ''
method_name :text => 'new'
method_description :text => '# This builder must be provided with a context.  All menu item actions will be invoked on the context.
#
'
method_name :text => 'item'
method_description :text => '# Created a new menu item with the provided name.  The symbols paramter is the name of a method on the context
# that will be invoked when the item is selected.
#
'
method_name :text => 'menu'
method_description :text => '# Creates a new menu with the provided name
#
'
