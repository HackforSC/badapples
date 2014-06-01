class ZipCodeDataImporter
  # http://www.psc.isr.umich.edu/dis/census/Features/tract2zip/index.html
  # http://railscasts.com/episodes/396-importing-csv-and-excel?view=asciicast

  # def self.import(file)
  #   spreadsheet = open_spreadsheet(file)
  #   header = spreadsheet.row(1)
  #   (2..spreadsheet.last_row).each do |i|
  #     row = Hash[[header, spreadsheet.row(i)].transpose]
  #     product = find_by_id(row["id"]) || new
  #     product.attributes = row.to_hash.slice(*accessible_attributes)
  #     product.save!
  #   end
  # end
end