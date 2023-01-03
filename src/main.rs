#[cfg(feature = "windows-gui")]
pub mod windows_gui;

#[cfg(feature = "gtk-gui")]
pub mod gtk_gui;

fn main () {
	println!("init program");
	
	#[cfg(feature = "windows-gui")]
	windows_gui::init_windows_gui();
	
	println!("exit program");
}