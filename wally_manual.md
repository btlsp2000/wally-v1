=================================================================
WALLY V1.0.3 | COMMERCIAL STABLE
ENTERPRISE: LKA / Last Known Address
=================================================================

Welcome to Wally. 
You have bypassed the bloated, subscription-trapped CAD industry. 
This is a pure, frictionless 2D drafting engine driven by Cartesian math.
Buy it once. Own it forever. Run it completely offline.

=================================================================
1. INITIAL SETUP (OFFLINE MODE)
=================================================================
Wally does not require an installation or an internet connection.
1. Keep the 'wally_engine.html' and 'jspdf.umd.min.js' files in the same folder.
2. Double-click 'wally_engine.html'.
3. It will open and run instantly in your default web browser (Chrome, Edge, Safari, Fire OS).

=================================================================
2. THE COMMAND LINE (CLI)
=================================================================
Wally is driven primarily by the Command Line at the bottom of the screen.

LINE   : Spawns a standard 0-thickness geometric path.
WALL   : Spawns a thickened polyline structure (default thickness 5.0).
CIRCLE : Spawns a native circle. (Width = Radius, Depth = Wall Thickness).
DIM    : Spawns a dimension measurement tool.
TEXT   : Spawns a text annotation label.
STAIR  : Spawns a parametric stair tread array.
X,Y    : Type a coordinate (e.g., 15,25) to append a point to the active entity.
ERASE  : Deletes the currently selected entity.
ZOOM E : Zoom Extents. Auto-centers your geometry.
DXF    : Compiles visible layers into a 2D AutoCAD file for CNC/Laser.
HAL    : Toggles the high-contrast presentation view.

=================================================================
3. PROPERTIES & ENTITIES
=================================================================
When you select an entity on the canvas, the Properties Panel inputs change:
* WALL   - Width: Start thickness. Depth: End thickness (for tapers).
* CIRCLE - Width: Radius. Depth: Tube Wall Thickness (0 for a thin line).
* DIM    - Width: Offset distance (+/-). N/Text: Overrides the calculated measurement.
* TEXT   - Width: Font size in world units. N/Text: The text string.
* STAIR  - Width: Tread lateral width. Depth: Tread run/depth. N/Text: Total treads.

=================================================================
4. PLOTTING & PRINTING
=================================================================
Wally generates true-scale physical blueprints.
1. Select your Paper Size and Orientation in Plot Settings.
2. Type a standard scale (e.g., 1/4" = 1'-0" or 1:50) OR click 'AUTO FIT'.
3. Click 'PDF PLOT'. 
Wally will generate a professional PDF with mitered corners, a title block, and a 1-inch reference check.

=================================================================
5. THE FABRICATOR SUITE (wally_cam.py)
=================================================================
If you purchased the Fabricator Suite, you have access to the Python CAM script.
1. Draw your profile in Wally and click 'SAVE' to download your 'wally_dwg.json' file.
2. Place the json file in the same folder as 'wally_cam.py'.
3. Run the python script in your terminal: `python wally_cam.py`
4. The script will instantly translate your vector arrays into a raw '.gcode' toolpath file ready for your CNC machine or 3D printer.

Copyright (c) 2026 | Last Known Address