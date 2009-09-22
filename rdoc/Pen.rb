class_name :text => 'ClassName: Limelight::Pen'
class_description :text => 'The Pen is acquired from Prop.pen.  It is used to draw directly on the screen withing the bounds of the prop from which the Pen was acquired.'
class_description :text => 'All points used by the Pen are relative to the bounds of the Prop.  The top left corner of the Prop is represented by the point (0, 0).  If a Prop has margin, border, or padding, the point (0, 0) may appear to be outside the Prop.'
attributes_header :text => 'Attributes'
attributes do
attribute_header do
attributes_name :text => 'context'
attributes_read_write :text => '[RW]'
end
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'new'
method_parameters :text => '(context)'
end
method_description :text => 'It is constructed with a context which is essentially a java.awt.Graphic2D object.  Defaults are set: * color = "black" * width = 1 * smooth = false'
end
method do
method_header do
method_name :text => 'color='
method_parameters :text => '(value)'
end
method_description :text => 'Sets the color of the Pen.  The passed value should be a string that either names a known color or specifies a hex color value.'
end
method do
method_header do
method_name :text => 'draw_line'
method_parameters :text => '(x1, y1, x2, y2)'
end
method_description :text => 'Draws a line from the point (x1, y1) to the point (x2, y2)'
end
method do
method_header do
method_name :text => 'draw_oval'
method_parameters :text => '(x, y, width, height)'
end
method_description :text => 'Draws the largest oval that will fit in the specified rectangle.  The top left corner of the bounding rectangle is at (x, y).  The center of the oval will be at (x + width/2, y + height/2).'
end
method do
method_header do
method_name :text => 'draw_rectangle'
method_parameters :text => '(x, y, width, height)'
end
method_description :text => 'Draws a rectangle with the top left corner at (x, y).'
end
method do
method_header do
method_name :text => 'fill_oval'
method_parameters :text => '(x, y, width, height)'
end
method_description :text => 'Fills an oval specified by the bounding rectangle.  See draw_oval.'
end
method do
method_header do
method_name :text => 'fill_rectangle'
method_parameters :text => '(x, y, width, height)'
end
method_description :text => 'Fills a rectangle with the current color of the Pen.  The top left corner of the rectangle is (x, y).'
end
method do
method_header do
method_name :text => 'smooth='
method_parameters :text => '(value)'
end
method_description :text => 'Specifies whether the pen will use anti-aliasing to draw smooth shapes or not.  Shapes will appear pixilated when smooth is set to false.'
end
method do
method_header do
method_name :text => 'width='
method_parameters :text => '(value)'
end
method_description :text => 'Sets the width, in pixels, of the pen.'
end
