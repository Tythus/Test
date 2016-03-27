view_wview[0] = display_get_width();
view_hview[0] = display_get_height();
view_wport[0] = display_get_width();
view_hport[0] = display_get_height();
window_set_size(display_get_width(),display_get_height())
surface_resize(application_surface, display_get_width(), display_get_height());
