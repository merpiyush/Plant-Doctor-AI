Add-Type -AssemblyName System.Drawing

$assetsDir = "D:\Flutter.Project\Plant-Doctor-AI\assets\images"
if (-not (Test-Path $assetsDir)) {
    New-Item -ItemType Directory -Force -Path $assetsDir | Out-Null
}

function Create-Canvas([int]$size) {
    $bmp = New-Object System.Drawing.Bitmap($size, $size, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $g.Clear([System.Drawing.Color]::Transparent)
    return @{ Bitmap = $bmp; Graphics = $g }
}

# 1. ROSE (Red / Pink Rose Flower)
$c = Create-Canvas 512
$g = $c.Graphics
# Leaves
$leafBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 76, 175, 80))
$leafBrushDark = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 46, 125, 50))
$g.FillEllipse($leafBrushDark, 120, 310, 130, 80)
$g.FillEllipse($leafBrush, 270, 310, 130, 80)
# Stem
$stemPen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(255, 46, 125, 50), 16)
$g.DrawBezier($stemPen, 256, 300, 240, 380, 270, 430, 256, 480)
# Rose Outer Petals
$petalOuter = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 229, 57, 53))
$petalMid = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 239, 83, 80))
$petalInner = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 138, 128))
$petalCenter = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 211, 47, 47))
$g.FillEllipse($petalOuter, 128, 100, 256, 230)
$g.FillEllipse($petalMid, 150, 120, 212, 190)
$g.FillEllipse($petalCenter, 180, 140, 152, 150)
$g.FillEllipse($petalInner, 205, 165, 102, 100)
$g.FillEllipse($petalCenter, 225, 185, 62, 60)
$c.Bitmap.Save("$assetsDir\rose.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 2. TULIP (Coral / Magenta Tulip)
$c = Create-Canvas 512
$g = $c.Graphics
# Stem
$g.DrawBezier($stemPen, 256, 280, 256, 360, 256, 420, 256, 480)
# Tulip Leaves
$g.FillPolygon($leafBrush, [System.Drawing.PointF[]]@(
    (New-Object System.Drawing.PointF(256, 460)),
    (New-Object System.Drawing.PointF(150, 320)),
    (New-Object System.Drawing.PointF(230, 300))
))
$g.FillPolygon($leafBrushDark, [System.Drawing.PointF[]]@(
    (New-Object System.Drawing.PointF(256, 460)),
    (New-Object System.Drawing.PointF(362, 320)),
    (New-Object System.Drawing.PointF(282, 300))
))
# Tulip Petals
$tulipBase = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 236, 64, 122))
$tulipMid = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 240, 98, 146))
$tulipTop = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 244, 143, 177))
$g.FillPie($tulipBase, 156, 120, 200, 220, 0, 180)
$g.FillEllipse($tulipMid, 156, 110, 80, 160)
$g.FillEllipse($tulipMid, 276, 110, 80, 160)
$g.FillEllipse($tulipTop, 206, 100, 100, 170)
$c.Bitmap.Save("$assetsDir\tulip.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 3. SUNFLOWER (Golden Sunflower)
$c = Create-Canvas 512
$g = $c.Graphics
$g.DrawLine($stemPen, 256, 300, 256, 480)
$sunPetal = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 179, 0))
$sunPetalDark = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 143, 0))
$sunDisc = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 93, 64, 55))
$sunDiscInner = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 62, 39, 35))
# 16 Petals
for ($i = 0; $i -lt 16; $i++) {
    $angle = $i * (360 / 16)
    $state = $g.Save()
    $g.TranslateTransform(256, 230)
    $g.RotateTransform($angle)
    $g.FillEllipse($sunPetalDark, -22, -140, 44, 100)
    $g.FillEllipse($sunPetal, -16, -135, 32, 90)
    $g.Restore($state)
}
$g.FillEllipse($sunDisc, 186, 160, 140, 140)
$g.FillEllipse($sunDiscInner, 206, 180, 100, 100)
$c.Bitmap.Save("$assetsDir\sunflower.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 4. LAVENDER (Purple Floral Spikes)
$c = Create-Canvas 512
$g = $c.Graphics
$g.DrawLine($stemPen, 256, 200, 256, 480)
$lav1 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 126, 87, 194))
$lav2 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 149, 117, 205))
$lav3 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 179, 157, 219))
for ($y = 80; $y -lt 320; $y += 32) {
    $g.FillEllipse($lav1, 210, $y, 36, 30)
    $g.FillEllipse($lav2, 266, $y, 36, 30)
    $g.FillEllipse($lav3, 238, $y - 12, 36, 30)
}
$g.FillEllipse($lav3, 238, 55, 36, 36)
$c.Bitmap.Save("$assetsDir\lavender.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 5. ORCHID (Pink & Violet Orchid)
$c = Create-Canvas 512
$g = $c.Graphics
$g.DrawLine($stemPen, 256, 280, 256, 480)
$orch1 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 186, 104, 200))
$orch2 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 142, 36, 170))
$orchCenter = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 238, 88))
# 5 large petals
$g.FillEllipse($orch1, 206, 90, 100, 110)
$g.FillEllipse($orch1, 120, 160, 110, 100)
$g.FillEllipse($orch1, 282, 160, 110, 100)
$g.FillEllipse($orch2, 166, 220, 85, 90)
$g.FillEllipse($orch2, 261, 220, 85, 90)
$g.FillEllipse($orchCenter, 236, 195, 40, 40)
$c.Bitmap.Save("$assetsDir\orchid.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 6. LOTUS (Serene Pink Lotus)
$c = Create-Canvas 512
$g = $c.Graphics
$lotusOuter = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 240, 98, 146))
$lotusMid = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 244, 143, 177))
$lotusInner = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 248, 187, 208))
$lotusCenter = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 241, 118))
# Base pad
$g.FillEllipse($leafBrushDark, 100, 330, 312, 80)
# Petals
$g.FillEllipse($lotusOuter, 140, 200, 100, 140)
$g.FillEllipse($lotusOuter, 272, 200, 100, 140)
$g.FillEllipse($lotusMid, 176, 180, 80, 150)
$g.FillEllipse($lotusMid, 256, 180, 80, 150)
$g.FillEllipse($lotusInner, 216, 160, 80, 160)
$g.FillEllipse($lotusCenter, 236, 230, 40, 40)
$c.Bitmap.Save("$assetsDir\lotus.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 7. HIBISCUS (Tropical Crimson Hibiscus)
$c = Create-Canvas 512
$g = $c.Graphics
$hibBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 216, 27, 96))
$hibCenter = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 136, 14, 79))
$hibStamen = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 253, 216, 53))
for ($i = 0; $i -lt 5; $i++) {
    $angle = $i * 72
    $state = $g.Save()
    $g.TranslateTransform(256, 256)
    $g.RotateTransform($angle)
    $g.FillEllipse($hibBrush, -55, -160, 110, 140)
    $g.Restore($state)
}
$g.FillEllipse($hibCenter, 206, 206, 100, 100)
$g.DrawLine((New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(255, 253, 216, 53), 10)), 256, 256, 256, 140)
$g.FillEllipse($hibStamen, 244, 125, 24, 24)
$c.Bitmap.Save("$assetsDir\hibiscus.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 8. DAISY (White Daisy)
$c = Create-Canvas 512
$g = $c.Graphics
$g.DrawLine($stemPen, 256, 280, 256, 480)
$daisyPetal = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 250, 250, 250))
$daisyPetalBorder = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(255, 224, 224, 224), 2)
$daisyCenter = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 214, 0))
for ($i = 0; $i -lt 12; $i++) {
    $angle = $i * 30
    $state = $g.Save()
    $g.TranslateTransform(256, 230)
    $g.RotateTransform($angle)
    $g.FillEllipse($daisyPetal, -18, -130, 36, 100)
    $g.DrawEllipse($daisyPetalBorder, -18, -130, 36, 100)
    $g.Restore($state)
}
$g.FillEllipse($daisyCenter, 206, 180, 100, 100)
$c.Bitmap.Save("$assetsDir\daisy.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 9. MARIGOLD (Bright Orange Marigold)
$c = Create-Canvas 512
$g = $c.Graphics
$mari1 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 245, 124, 0))
$mari2 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 167, 38))
$mari3 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 202, 40))
$g.DrawLine($stemPen, 256, 280, 256, 480)
$g.FillEllipse($mari1, 146, 120, 220, 220)
$g.FillEllipse($mari2, 176, 150, 160, 160)
$g.FillEllipse($mari3, 206, 180, 100, 100)
$c.Bitmap.Save("$assetsDir\marigold.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 10. JASMINE (Fragrant White Jasmine)
$c = Create-Canvas 512
$g = $c.Graphics
$jasBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 255, 255))
$jasPen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(255, 200, 230, 201), 2)
$jasCenter = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 245, 157))
$g.FillEllipse($leafBrushDark, 160, 280, 192, 100)
for ($i = 0; $i -lt 5; $i++) {
    $angle = $i * 72
    $state = $g.Save()
    $g.TranslateTransform(256, 230)
    $g.RotateTransform($angle)
    $g.FillEllipse($jasBrush, -25, -130, 50, 120)
    $g.DrawEllipse($jasPen, -25, -130, 50, 120)
    $g.Restore($state)
}
$g.FillEllipse($jasCenter, 236, 210, 40, 40)
$c.Bitmap.Save("$assetsDir\jasmine.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 11. SNAKE PLANT (Upright Variegated Leaves)
$c = Create-Canvas 512
$g = $c.Graphics
$potBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 215, 122, 97))
$g.FillPolygon($potBrush, [System.Drawing.PointF[]]@(
    (New-Object System.Drawing.PointF(180, 360)),
    (New-Object System.Drawing.PointF(332, 360)),
    (New-Object System.Drawing.PointF(300, 470)),
    (New-Object System.Drawing.PointF(212, 470))
))
$snakeBorder = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 235, 59))
$g.FillEllipse($snakeBorder, 230, 80, 52, 290)
$g.FillEllipse($leafBrushDark, 238, 90, 36, 270)
$g.FillEllipse($snakeBorder, 180, 120, 48, 250)
$g.FillEllipse($leafBrush, 186, 130, 36, 230)
$g.FillEllipse($snakeBorder, 284, 120, 48, 250)
$g.FillEllipse($leafBrush, 290, 130, 36, 230)
$c.Bitmap.Save("$assetsDir\snake_plant.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 12. ALOE VERA (Succulent Rosette)
$c = Create-Canvas 512
$g = $c.Graphics
$g.FillPolygon($potBrush, [System.Drawing.PointF[]]@(
    (New-Object System.Drawing.PointF(180, 360)),
    (New-Object System.Drawing.PointF(332, 360)),
    (New-Object System.Drawing.PointF(300, 470)),
    (New-Object System.Drawing.PointF(212, 470))
))
$aloeBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 129, 199, 132))
$aloeBrushDark = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 56, 142, 60))
$g.FillEllipse($aloeBrushDark, 236, 120, 40, 250)
$g.FillEllipse($aloeBrush, 170, 180, 50, 190)
$g.FillEllipse($aloeBrush, 292, 180, 50, 190)
$g.FillEllipse($aloeBrushDark, 130, 240, 60, 130)
$g.FillEllipse($aloeBrushDark, 322, 240, 60, 130)
$c.Bitmap.Save("$assetsDir\aloe_vera.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 13. BASIL (Culinary Green Herb)
$c = Create-Canvas 512
$g = $c.Graphics
$g.DrawLine($stemPen, 256, 240, 256, 480)
$g.FillEllipse($leafBrushDark, 170, 160, 90, 70)
$g.FillEllipse($leafBrushDark, 252, 160, 90, 70)
$g.FillEllipse($leafBrush, 150, 230, 100, 80)
$g.FillEllipse($leafBrush, 262, 230, 100, 80)
$g.FillEllipse($leafBrush, 216, 110, 80, 70)
$c.Bitmap.Save("$assetsDir\basil.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 14. PEACE LILY (Emerald Foliage with White Spathe)
$c = Create-Canvas 512
$g = $c.Graphics
$g.FillEllipse($leafBrushDark, 140, 240, 110, 140)
$g.FillEllipse($leafBrushDark, 262, 240, 110, 140)
$g.DrawLine($stemPen, 256, 200, 256, 480)
$spatheBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 255, 255))
$spatheBorder = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(255, 200, 230, 201), 2)
$spadixBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 238, 88))
$g.FillEllipse($spatheBrush, 216, 90, 80, 150)
$g.DrawEllipse($spatheBorder, 216, 90, 80, 150)
$g.FillEllipse($spadixBrush, 248, 140, 16, 70)
$c.Bitmap.Save("$assetsDir\peace_lily.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 15. JADE PLANT (Money Succulent)
$c = Create-Canvas 512
$g = $c.Graphics
$trunkPen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(255, 121, 85, 72), 20)
$g.DrawLine($trunkPen, 256, 300, 256, 480)
$g.DrawLine($trunkPen, 256, 340, 200, 260)
$g.DrawLine($trunkPen, 256, 340, 312, 260)
$jadeBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 46, 125, 50))
$jadeBrushLight = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 102, 187, 106))
$g.FillEllipse($jadeBrush, 170, 210, 60, 50)
$g.FillEllipse($jadeBrushLight, 282, 210, 60, 50)
$g.FillEllipse($jadeBrush, 226, 170, 60, 50)
$c.Bitmap.Save("$assetsDir\jade_plant.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 16. TOMATO (Fresh Red Tomato)
$c = Create-Canvas 512
$g = $c.Graphics
$tomBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 229, 57, 53))
$tomHighlight = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 239, 83, 80))
$g.FillEllipse($tomBrush, 136, 150, 240, 230)
$g.FillEllipse($tomHighlight, 166, 180, 80, 70)
# Calyx
$g.FillPolygon($leafBrushDark, [System.Drawing.PointF[]]@(
    (New-Object System.Drawing.PointF(256, 160)),
    (New-Object System.Drawing.PointF(210, 110)),
    (New-Object System.Drawing.PointF(240, 150)),
    (New-Object System.Drawing.PointF(256, 90)),
    (New-Object System.Drawing.PointF(272, 150)),
    (New-Object System.Drawing.PointF(302, 110))
))
$c.Bitmap.Save("$assetsDir\tomato.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 17. ROSE DISEASE (Rose with Black Spots)
$c = Create-Canvas 512
$g = $c.Graphics
$g.FillEllipse($petalOuter, 128, 100, 256, 230)
$g.FillEllipse($petalMid, 150, 120, 212, 190)
$g.FillEllipse($petalCenter, 180, 140, 152, 150)
$g.FillEllipse($petalInner, 205, 165, 102, 100)
# Black spot lesions
$spotBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(220, 33, 33, 33))
$yellowRing = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(180, 255, 235, 59))
$g.FillEllipse($yellowRing, 160, 150, 50, 50)
$g.FillEllipse($spotBrush, 170, 160, 30, 30)
$g.FillEllipse($yellowRing, 280, 210, 60, 60)
$g.FillEllipse($spotBrush, 290, 220, 40, 40)
$g.FillEllipse($yellowRing, 210, 260, 45, 45)
$g.FillEllipse($spotBrush, 220, 270, 25, 25)
$c.Bitmap.Save("$assetsDir\rose_disease.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 18. APP LOGO (Plant Doctor AI Emerald Shield / Leaf Emblem)
$c = Create-Canvas 512
$g = $c.Graphics
$logoBg = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 46, 125, 50))
$logoLeaf = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 255, 255))
$logoAccent = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 200, 230, 201))
$g.FillEllipse($logoBg, 56, 56, 400, 400)
$g.FillEllipse($logoLeaf, 176, 136, 160, 240)
$g.FillEllipse($logoBg, 236, 136, 140, 240)
$g.DrawLine((New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(255, 255, 255, 255), 12)), 256, 190, 256, 340)
$c.Bitmap.Save("$assetsDir\app_logo.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

# 19. AVATAR (User Alex Johnson Avatar)
$c = Create-Canvas 512
$g = $c.Graphics
$avatarBg = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 232, 245, 233))
$avatarBorder = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(255, 46, 125, 50), 16)
$g.FillEllipse($avatarBg, 24, 24, 464, 464)
$g.DrawEllipse($avatarBorder, 24, 24, 464, 464)
$font = New-Object System.Drawing.Font("Arial", 180, [System.Drawing.FontStyle]::Bold)
$textBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 46, 125, 50))
$format = New-Object System.Drawing.StringFormat
$format.Alignment = [System.Drawing.StringAlignment]::Center
$format.LineAlignment = [System.Drawing.StringAlignment]::Center
$g.DrawString("A", $font, $textBrush, (New-Object System.Drawing.RectangleF(0, 0, 512, 512)), $format)
$c.Bitmap.Save("$assetsDir\avatar.png", [System.Drawing.Imaging.ImageFormat]::Png)
$c.Bitmap.Dispose(); $g.Dispose()

Write-Host "All flower and plant PNG assets successfully generated!"
