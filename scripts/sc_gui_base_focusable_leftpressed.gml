/// sc_gui_base_focusable_leftpressed()

// of ob_gui

if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) {
    focused = true
    image_alpha = 1
} else {
    focused = false
    image_alpha = 0.75
}

