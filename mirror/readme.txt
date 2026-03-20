Here is a clean, structured instruction manual for the Mirror HTML implementation. You can use this as your internal developer documentation or include it in a technical guide for Wally users who want to understand the engine under the hood.
________________
WALLYCAD Developer Guide: The Mirror Command
This document breaks down the HTML and JavaScript architecture of Wally's Mirror command. The logic is divided into three core systems: the Studio (HTML/CSS UI), the Compiler (Mathematical Engine), and the Renderer (Canvas Graphics).
1. The Studio (HTML UI & Canvas)
The structural foundation of the viewport is built using standard HTML5 and CSS.
* <canvas id="wallyCanvas">: This is the digital glass where geometry is rendered. It acts as a standard Cartesian coordinate system where (0,0) is the top-left corner.
* The Legend: A simple HTML <div> styled with CSS to provide a visual key for the user, differentiating the original geometry (black), the mirror axis (red), and the new reflected geometry (blue).
2. The Compiler Engine (Mathematics)
The Compiler handles the mathematical heavy lifting before any new pixels are drawn to the screen. It relies on standard linear algebra to calculate the reflection.
The Core Formula
Given a mirror line defined by two points $(x_1, y_1)$ and $(x_2, y_2)$, we first find the standard line equation coefficients $A$, $B$, and $C$:
* $A = y_2 - y_1$
* $B = x_1 - x_2$
* $C = (x_2 \cdot y_1) - (x_1 \cdot y_2)$
To find the new mirrored coordinates $(x', y')$ for any vertex $(x, y)$, the Compiler runs this reflection equation:


$$x' = x - \frac{2A(Ax + By + C)}{A^2 + B^2}$$


$$y' = y - \frac{2B(Ax + By + C)}{A^2 + B^2}$$
The JavaScript Functions
* mirrorPoint(x, y, x1, y1, x2, y2): This function ingests the coordinates of a single point and the two points defining the axis line, applies the math above, and returns an object containing the new { x, y }. It includes a safety check to ensure the denominator is not zero (which would happen if the user clicked the exact same point twice for the axis).
* mirrorPolyline(vertices, axisX1, axisY1, axisX2, axisY2): Since CAD geometry is rarely a single point, this wrapper function iterates (maps) the mirrorPoint logic over an entire array of vertices, returning a brand new array of mirrored coordinates.
3. The Rendering Logic (Canvas Graphics)
Once the Compiler calculates the new coordinate array, the Rendering functions instruct the HTML5 Canvas API on how to draw the lines.
* drawPolyline(ctx, vertices, color, lineWidth): This function takes the array of coordinates and connects them. It uses ctx.moveTo for the first coordinate to establish the starting point, and then loops through the remaining array using ctx.lineTo to trace the shape. Finally, ctx.stroke() paints the path to the glass.
* drawAxis(ctx, x1, y1, x2, y2): A distinct visual aid that draws the mirror line. It uses ctx.setLineDash([8, 4]) to create a drafting-style dashed line so the user knows it is a reference axis, not physical geometry.
4. Initialization & Execution Flow
The final script block represents how Wally processes a command from start to finish.
1. Define State: The original geometry (originalPolyline) and the mirror axis coordinates are established in memory.
2. Compile: mirrorPolyline is called, feeding the original state into the math engine. The result is stored as mirroredPolyline.
3. Render: The drawPolyline and drawAxis functions are called in sequence, painting the original state, the reference line, and the new compiled state to the canvas.
________________
With the launch on April 1 approaching rapidly, documenting these core functions is a great way to keep the codebase organized.
Would you like to draft a similar manual for the Zoom Extents logic, or should we go back to outlining that sample floorplan file for your download package?