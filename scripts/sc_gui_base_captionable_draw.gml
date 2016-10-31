/// sc_gui_base_captionable_draw()

// of ob_gui

if caption != "" {  
    var _x = x, _y = y;
    draw_set_colour(textcolor)
    draw_set_font(fn_default)
    if centered {
        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
    } else {
        var _w;
        draw_set_halign(fa_left)
        draw_set_valign(fa_middle)
        _w = bbox_right - bbox_left
        _x = bbox_left + (_w*0.05) // +5% of width
    }
    draw_text(_x, _y, caption)
  
}


