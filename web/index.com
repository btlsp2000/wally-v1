<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WallyCAD | Speed of Thought Drafting</title>
    <style>
        body {
            background-color: #e0e0e0;
            font-family: 'Courier New', Courier, monospace;
            color: #000;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .tier {
            width: 100%;
            max-width: 900px;
            background: #fff;
            border: 3px solid #000;
            margin-top: 20px;
            padding: 30px;
            box-sizing: border-box;
            box-shadow: 8px 8px 0px #000;
        }
        /* TIER 1 STYLES */
        h1 { margin: 0; font-size: 2.5em; letter-spacing: 2px; text-transform: uppercase; }
        .subtitle { font-weight: bold; color: #555; margin-top: 5px; font-size: 1.2em; }
        .philosophy { margin-top: 15px; font-size: 1em; line-height: 1.4; border-left: 4px solid #000; padding-left: 15px;}
        
        /* TIER 2 STYLES */
        .viewport-box { background: #1a1a1a; width: 100%; height: 300px; border: 2px solid #000; display: flex; justify-content: center; align-items: center; color: #0f0; margin-bottom: 15px; }
        textarea { width: 100%; height: 100px; background: #f4f4f4; border: 2px solid #000; padding: 10px; font-family: inherit; resize: vertical; }
        
        /* TIER 3 STYLES */
        .action-grid { display: flex; gap: 20px; margin-top: 10px; }
        .btn { flex: 1; background: #000; color: #fff; text-align: center; padding: 20px; text-decoration: none; font-size: 1.2em; font-weight: bold; text-transform: uppercase; border: 2px solid #000; transition: 0.2s;}
        .btn:hover { background: #fff; color: #000; cursor: pointer; }
        .btn-doc { background: #f4f4f4; color: #000; }
        .btn-doc:hover { background: #ddd; }

        footer { margin: 40px 0; text-align: center; font-size: 0.85em; font-weight: bold; }
    </style>
</head>
<body>

    <!-- TIER 1: THE HOOK -->
    <div class="tier">
        <h1>WALLYCAD</h1>
        <div class="subtitle">V1.0.10 GOLD MASTER // DEPLOYED 04.01.2026</div>
        <div class="philosophy">
            <strong>SPEED OF THOUGHT DRAFTING.</strong><br>
            Sever the dependency on the QWERTY keyboard. A pure, Cartesian web engine designed for mobile field deployment. Output universal ASCII DXF and PDF plots directly from the browser.
        </div>
    </div>

    <!-- TIER 2: THE PROOF (LIVE ENGINE PLACEHOLDER) -->
    <div class="tier">
        <h2 style="margin-top:0;">LIVE ENGINE DEMO</h2>
        <div class="viewport-box">
            [ V1.3 ZOOM EXTENTS CANVAS GOES HERE ]
        </div>
        <textarea placeholder="Wally Box 0,0 / 10,10&#10;Wally Circle 5,5 / 2.5"></textarea>
    </div>

    <!-- TIER 3: THE PAYLOAD (ACTION) -->
    <div class="tier">
        <h2 style="margin-top:0;">DISTRIBUTION</h2>
        <div class="action-grid">
            <a href="#" class="btn">PURCHASE COMMERCIAL LICENSE (GUMROAD)</a>
            <a href="#" class="btn btn-doc">READ OFFICIAL DOCUMENTATION (GITHUB)</a>
        </div>
    </div>

    <footer>
        WALLY CAD ENGINE // LKA ENTERPRISE // ROOM 113
    </footer>

</body>
</html>
