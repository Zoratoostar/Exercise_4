
require_relative 'train'
require_relative 'wagon'
require_relative 'station'
require_relative 'route'
require_relative 'text_interface'

interface = TextInterface.new
interface.start_menu
