class ZipCodeDataImporter
  # http://www.psc.isr.umich.edu/dis/census/Features/tract2zip/index.html
  # http://railscasts.com/episodes/396-importing-csv-and-excel?view=asciicast

  class << self
    def import(file_name)
      spreadsheet = open_spreadsheet(file_name)
 
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        create_zip_code_model(row)
      end 
    end

    private
    def open_spreadsheet(file_name)
      case File.extname(file_name)
      when '.xls' then Roo::Excel.new(file_name)
      when '.xlsx' then Roo::Excelx.new(file_name)
      else raise "Unknown file type for: #{file_name}"
      end
    end

    def create_zip_code_model(row)
      ZipCode.new.tap do |z|
        z.zip_code = row["Zip"].round.to_s
        z.median_income = row["Median"].round(2).to_d
        z.population = row["Pop"].round.to_i
        z.save!
      end
    end
  end
end