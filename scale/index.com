<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WallyCAD - Moon Scale Engine</title>
    <style>
        body { margin: 0; background: #1a1a1a; color: #fff; overflow: hidden; font-family: sans-serif; }
        /* Placeholder for your SquareFont */
        @font-face { font-family: 'SquareFont'; src: url('path/to/squarefont.woff2'); }
        
        #wally-container { position: relative; width: 100vw; height: 100vh; }
        canvas { display: block; background: #fdfdfd; cursor: crosshair; }
        
        #qc-overlay {
            position: absolute; bottom: 20px; left: 20px;
            background: rgba(0,0,0,0.8); padding: 10px; border-radius: 4px;
        }
        input { background: #333; color: #0f0; border: 1px solid #555; padding: 5px; width: 300px; }
    </style>
</head>
<body>

<div id="wally-container">
    <canvas id="wallyCanvas"></canvas>
    
    <div id="qc-overlay">
        <input type="text" id="qc-command" placeholder="Type data... (e.g. Moon_Center 0 0)" autocomplete="off">
    </div>
</div>

<script>
    const canvas = document.getElementById('wallyCanvas');
    const ctx = canvas.getContext('2d');
    const input = document.getElementById('qc-command');

    // Initial Viewport Settings
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    // The Wally Scale Object
    const wally = {
        zoom: 0.000005, // High zoom-out for millions of feet
        originX: canvas.width / 2,
        originY: canvas.height / 2,

        drawPoint: function(x, y, label) {
            const screenX = this.originX + (x * this.zoom);
            const screenY = this.originY - (y * this.zoom); // Flip Y for standard drafting coords

            // Draw Crosshair
            ctx.beginPath();
            ctx.moveTo(screenX - 5, screenY); ctx.lineTo(screenX + 5, screenY);
            ctx.moveTo(screenX, screenY - 5); ctx.lineTo(screenX, screenY + 5);
            ctx.strokeStyle = '#000';
            ctx.stroke();

            // Annotation
            ctx.fillStyle = '#333';
            ctx.font = '12px Arial'; // Replace with SquareFont once loaded
            ctx.fillText(label, screenX + 8, screenY - 8);
        },

        clear: function() {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
        }
    };

    // Bulk Insertion Logic
    function insertMapPoints(data) {
        wally.clear();
        const lines = data.trim().split('\n');
        lines.forEach(line => {
            const [name, x, y] = line.split(' ');
            wally.drawPoint(parseFloat(x), parseFloat(y), name.replace('_', ' '));
        });
    }

    // Listen for QuickClick (Enter key)
    input.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            insertMapPoints(input.value);
            input.value = ''; // Reset input
        }
    });

    // Resize handler
    window.onresize = () => {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
        wally.originX = canvas.width / 2;
        wally.originY = canvas.height / 2;
    };
</script>

</body>
</html>
