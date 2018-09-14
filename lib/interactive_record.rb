require_relative "../config/environment.rb"
require 'active_support/inflector'

require 'pry'
class InteractiveRecord
  
  def self.table_name
    self.to_s.downcase.pluralize
  end
  
  def self.column_names
    hash = DB[:conn].execute("PRAGMA table_info('#{self.table_name}')")
    columns_array = []
    hash.each {|column| columns_array << column["name"]}
    columns_array.compact
  end
  
  
  def initialize(hash = {})
    hash.each {|key, value| self.send("#{key}=", value)}
  end
  
  def table_name_for_insert
    self.class.table_name
  end
  
  def col_name_for_insert
    self.class.column_names.map.delete_if {|col_name| col_name == "id"} 
  end
  
  def values_for_insert
    self.class.column_name_for_insert.each do |col_name|
      
    
  end
end