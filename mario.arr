use context essentials2021
include color

# The scene/primary canvas
scene-height = 250
scene-width = (scene-height / 2) * 5
canvas = empty-scene(scene-width, scene-height)

#|
  Mario is drawn from https://www.deviantart.com/danyyer/art/Mario-Pixel-Art-758281710  
|#

# Mario's canvas
height = scene-height * 0.8
width = 0.8125 * height
pixel = height / 16

# The building blocks/pixels
#bg = empty-scene(width + pixel, height + pixel)
bg = rectangle(width + pixel, height + pixel, "solid", color(0,0,0,0))
w = square(pixel, "solid", color(0,0,0,0))
r = square(pixel, "solid", "red")
s = square(pixel,"solid", "saddle-brown")
p = square(pixel, "solid", "peach-puff")
k = square(pixel, "solid", "black")
b = square(pixel, "solid", "blue")
y = square(pixel, "solid", "yellow")
d = square(pixel, "solid", "brown")


# Various functions
# Function to put together a row
fun create-row(row-list):
  if row-list.length() > 0:
    beside(row-list.first, create-row(row-list.rest))
  else:
    square(10,"solid", color(0,0,0,0))
  end
end

# Data structures for rows
data LineRow:
    line-row(img, xp, yp)
end

# Function to place rows of Mario
fun place-images(list-of-rows):
  if list-of-rows.length() > 0:
    place-image(list-of-rows.first.img, list-of-rows.first.xp, list-of-rows.first.yp,
      place-images(list-of-rows.rest))
  else:
    bg
  end
end


# Image rows
# Row-lists
row01-list = [list: w, w, w, r, r, r, r, r, r, w, w, w, w]
row02-list = [list: w, w, r, r, r, r, r, r, r, r, r, r, w]
row03-list = [list: w, w, s, s, s, p, p, p, k, p, w, w, w]
row04-list = [list: w, s, p, s, p, p, p, p, k, p, p, p, w]
row05-list = [list: w, s, p, s, s, p, p, p, p, k, p, p, p]
row06-list = [list: w, s, s, p, p, p, p, p, k, k, k, k, w]
row07-list = [list: w, w, w, p, p, p, p, p, p, p, p, w, w]
row08-list = [list: w, w, r, r, b, r, r, r, r, w, w, w, w]
row09-list = [list: w, r, r, r, b, r, r, b, r, r, r, w, w]
row10-list = [list: r, r, r, r, b, b, b, b, r, r, r, r, w]
row11-list = [list: p, p, r, b, y, b, b, y, b, r, p, p, w]
row12-list = [list: p, p, p, b, b, b, b, b, b, p, p, p, w]
row13-list = [list: p, p, b, b, b, b, b, b, b, b, p, p, w]
row14-list = [list: w, w, b, b, b, w, w, b, b, b, w, w, w]
row15-list = [list: w, d, d, d, w, w, w, w, d, d, d, w, w]
row16-list = [list: d, d, d, d, w, w, w, w, d, d, d, d, w]


# Actual rows
xpos = (height / 2) - pixel
row01 = line-row(create-row(row01-list), xpos, pixel / 2)
row02 = line-row(create-row(row02-list), xpos, (pixel / 2) + pixel)
row03 = line-row(create-row(row03-list), xpos, (pixel / 2) + (2 * pixel))
row04 = line-row(create-row(row04-list), xpos, (pixel / 2) + (3 * pixel))
row05 = line-row(create-row(row05-list), xpos, (pixel / 2) + (4 * pixel))
row06 = line-row(create-row(row06-list), xpos, (pixel / 2) + (5 * pixel))
row07 = line-row(create-row(row07-list), xpos, (pixel / 2) + (6 * pixel))
row08 = line-row(create-row(row08-list), xpos, (pixel / 2) + (7 * pixel))
row09 = line-row(create-row(row09-list), xpos, (pixel / 2) + (8 * pixel))
row10 = line-row(create-row(row10-list), xpos, (pixel / 2) + (9 * pixel))
row11 = line-row(create-row(row11-list), xpos, (pixel / 2) + (10 * pixel))
row12 = line-row(create-row(row12-list), xpos, (pixel / 2) + (11 * pixel))
row13 = line-row(create-row(row13-list), xpos, (pixel / 2) + (12 * pixel))
row14 = line-row(create-row(row14-list), xpos, (pixel / 2) + (13 * pixel))
row15 = line-row(create-row(row15-list), xpos, (pixel / 2) + (14 * pixel))
row16 = line-row(create-row(row16-list), xpos, (pixel / 2) + (15 * pixel))

# List of rows to combine
rows = [list: row01, row02, row03, row04, row05, row06, row07, row08, row09, row10, row11, row12, row13, row14, row15, row16]

# Constructing the image
place-images(rows)