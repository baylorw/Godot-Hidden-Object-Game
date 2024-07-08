Getting things to scale was a fucking nightmare.

Here's what finally worked:

Play Area
- PanelContainer
- H=Fill, V=Fill+Expand
- Stretch Ratio=0.9

LevelData
- LevelData = MarginContainer or PanelContainer (not Center)

Background
- Expand Mode  = Ignore Size
- Stretch Mode = Keep Aspect Centered
- Container Sizing = Fill/Fill

Hidden Objects container
- MarginContainer = MarginContainer or PanelContainer (not Center)
- Container Sizing = Fill/Fill

Hidden Object buttons
- Image is the same size as Background (tons of empty space)
- Ignore Texture = On
- Stretch Mode = Keep Aspect Centered
- Container Sizing = Fill/Fill
