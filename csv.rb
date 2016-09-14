require 'csv'

def original_csv
	File.exist?("input_isbn_file.csv")
end	

def new_csv
	File.open("duplicate_isbn_file.csv", 'w')
	File.exist?("duplicate_isbn_file.csv")
end	
