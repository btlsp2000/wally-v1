WALLY CAD ENGINE: SYNTAX & USER MANUAL
======================================

The Wally engine relies on absolute Cartesian geometry. It takes human-readable, parametric text strings and compiles them into standard machine-routing vectors (DXF). 

All coordinates operate on a standard X,Y grid. The system is unitless (1 unit can represent 1 inch, 1 millimeter, or 1 pixel depending on your final output software).

--------------------------------------
1. WALLY ELEMENTS (THE PRIMITIVES)
--------------------------------------

Currently, the web compiler at wallycad.com/converter is programmed to recognize and translate two structural macros:

A. WALLY LINE
The fundamental continuous vector. It draws a single, unbroken straight line between two absolute coordinate points.

Syntax: Wally Line X1,Y1 / X2,Y2
Variables:
- X1,Y1: The starting coordinate.
- X2,Y2: The ending coordinate.
- /: The structural separator (must be included).

Example: Wally Line 0,0 / 10,10 
(Draws a diagonal line from the origin point up to 10,10)


B. WALLY BOX
The Cartesian perimeter macro. It generates a perfect closed rectangle based on a single bottom-left anchor point and precise width/height dimensions. The compiler automatically shatters this macro into four separate, continuous LINE entities for the CNC toolpath.

Syntax: Wally Box X,Y / W,H
Variables:
- X,Y: The bottom-left origin anchor of the box.
- W: The total width along the X-axis.
- H: The total height along the Y-axis.
- /: The structural separator.

Example: Wally Box 5,5 / 25,10 
(Anchors a box at 5,5 that spans 25 units right and 10 units up)

(Note: Concept modules for Wally Circle and Wally Text exist in our drafting notes, but require JS implementation to pass through the current DXF compiler).

--------------------------------------
2. INSTRUCTIONS FOR USE
--------------------------------------

The deployment pipeline is designed to be entirely serverless and browser-based.

STEP 1: DRAFT THE MATRIX
Write your parametric code sequence in any standard text editor (Notepad, Word, or right in the browser). Group your elements logically. The compiler ignores blank lines and any text that does not strictly begin with "Wally Line" or "Wally Box", meaning you can add your own text notes/comments between the code blocks safely.

STEP 2: ACCESS THE COMPILER
Navigate to your live cloud node: wallycad.com/converter

STEP 3: LOAD THE PAYLOAD
Paste your entire text block into the main input area. 

STEP 4: COMPILE
Click the "COMPILE TO DXF" button. The JavaScript engine will locally parse the syntax, translate the X/Y coordinates into standard R12 DXF group codes, and package the file.

STEP 5: RETRIEVE & DEPLOY
- Check the Status Log on the screen. It will indicate "SUCCESS" and confirm the exact number of vectors translated.
- A file named "Wally_Export_V1.dxf" will instantly download to your machine.
- This .dxf file is now ready to be opened in standard CAD software (like AutoCAD) or fed directly into a laser cutter or CNC router.
