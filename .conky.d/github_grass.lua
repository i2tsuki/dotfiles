#!/usr/bin/lua

local https = require 'ssl.https'

require 'os'
require 'rsvg'
require 'cairo'

user = "kizkoh"
start_match = "          <svg width=\"676\" height=\"104\" class=\"js-calendar-graph-svg\">"
end_match = "</svg>"
after_date = os.date("%Y.%m.%d",  os.time() - 60 * 60 * 24 * (175 + tonumber(os.date("%u", os.time()), 10) - 1))
today_date = os.date("%Y.%m.%d")
alert_color = "#D104D1"

rsvg_handle = nil
cairo_surface = nil
cairo = nil

function conky_get_github_grass()
   local resp = {}
   tmpfile = io.open("/dev/shm/grass.tmp", "w")
   local one, code, headers, status = https.request{
      url = "http://github.com/" .. user,
      sink = ltn12.sink.file(tmpfile),
      protocol = "tlsv1"
   }

   tmpfile = io.open("/dev/shm/grass.tmp", "r")
   svgfile = io.open("/dev/shm/grass.svg", "w")
   local in_svg = false
   local in_exclude = false
   local in_week = false
   for line in tmpfile:lines() do
      if not in_svg and line == start_match then
   	 in_svg = true
      end
      if in_svg then
	 if not in_exclude then
	    -- if line == "      <g transform=\"translate(0, 0)\">" then
	    if line:find("<g transform=\"translate.0, 0.\">") ~= nil then
	       in_exclude = true
	    else
	       if string.find(line, "Sun") ~= nil then
		  in_week = true
               elseif string.find(line, "Sat") ~= nil then
		  line = ""
		  in_week = false
	       end
	       if in_week then
		  line = ""
	       end
	       if string.find(line, today_date) ~= nil then
		  line = string.gsub(line,  "#ebedf0", alert_color)
	       end
	       line = string.gsub(line,  "<text ", "<text fill=\"white\" ")
	       svgfile:write(line .. "\n")
	    end
	 else
	    if string.find(line, after_date) ~= nil then
	       svgfile:write("      <g transform=\"translate(0, 0)\">" .. "\n")
	       svgfile:write(line .. "\n")
	       in_exclude = false
	    end
	 end
	 if in_svg and line == end_match then
	    break
	 end
      end
   end
   tmpfile:close()
   svgfile:close()
end

function conky_draw_github_grass_pre()
   if conky_window == nil then
      return
   end

   rsvg_handle = rsvg_handle_new_from_file("/dev/shm/grass.svg")
   cairo_surface = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
   cairo = cairo_create(cairo_surface)

   -- cairo_translate(cairo, -574, 792)
   cairo_translate(cairo, -574, 892)
   cairo_scale(cairo, 1.6, 1.6)
   rsvg_handle_render_cairo(rsvg_handle, cairo)
   cairo_stroke(cairo)
end

function conky_draw_github_grass_post()
   cairo_destroy(cairo)
   cairo = nil
   cairo_surface_destroy(cairo_surface)
   cairo_surface = nil
   rsvg_destroy_handle(rsvg_handle)
   rsvg_handle= nil
end

conky_get_github_grass()
