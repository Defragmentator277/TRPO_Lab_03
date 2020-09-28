lgi = require('lgi');
gtk = lgi.Gtk;
gdk = lgi.Gdk;
gtk.init();

bld = gtk.Builder();
bld:add_from_file('Lab_03.glade');

ui = bld.objects;
ui.Main_Window.title = 'Binary';
ui.Main_Window.on_destroy = gtk.main_quit();
--Load style.css
prov = gtk.CssProvider();
prov:load_from_path('style.css');
ctx = gtk.StyleContext();
scr = gdk.Screen.get_default();
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)
--
radio_butns = {ui.Radio_A, ui.Radio_B, ui.Radio_C, ui.Radio_D};
function update()
  x = 0;
  y = 0;
  if(ui.Check_X.active) then
    x = 1;
  end
  --
  if(ui.Check_Y.active) then
    y = 1;
  end
  result = x + y * 2;
  ui.Label_Out.label = result;
  radio_butns[result + 1].active = true;
end
function ui.Check_X.on_clicked()
  update();
end
function ui.Check_Y.on_clicked()
  update();
end
--
ui.Main_Window:show_all();
gtk.main()
