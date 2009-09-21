class_name :text => 'ClassName: Limelight::Pen'
class_description :text => 'The Pen is acquired from Prop.pen.  It is used to draw directly on the screen withing the bounds of the prop
 from which the Pen was acquired.

 All points used by the Pen are relative to the bounds of the Prop.  The top left corner of the Prop is represented
 by the point (0, 0).  If a Prop has margin, border, or padding, the point (0, 0) may appear to be outside the Prop.'
public_methods_header :text => 'Public Methods'
method_name :text => 'new'
method_description :text => '# It is constructed with a context which is essentially a java.awt.Graphic2D object.  Defaults are set:
# * color = "black"
# * width = 1
# * smooth = false
#
'
method_name :text => 'color='
method_description :text => '# Sets the color of the Pen.  The passed value should be a string that either names a known color or specifies
# a hex color value.
#
'
method_name :text => 'draw_line'
method_description :text => '# Draws a line from the point (x1, y1) to the point (x2, y2)
#
'
method_name :text => 'draw_oval'
method_description :text => '# Draws the largest oval that will fit in the specified rectangle.  The top left corner of the bounding
# rectangle is at (x, y).  The center of the oval will be at (x + width/2, y + height/2).
#
'
method_name :text => 'draw_rectangle'
method_description :text => '# Draws a rectangle with the top left corner at (x, y).
#
'
method_name :text => 'fill_oval'
method_description :text => '# Fills an oval specified by the bounding rectangle.  See draw_oval.  
#
'
method_name :text => 'fill_rectangle'
method_description :text => '# Fills a rectangle with the current color of the Pen.  The top left corner of the rectangle is (x, y).
#
'
method_name :text => 'smooth='
method_description :text => '# Specifies whether the pen will use anti-aliasing to draw smooth shapes or not.  Shapes will appear pixilated when
# smooth is set to false.
#
'
method_name :text => 'width='
method_description :text => '# Sets the width, in pixels, of the pen.
#
'
